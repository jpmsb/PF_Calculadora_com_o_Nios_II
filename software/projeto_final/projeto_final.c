#include "alt_types.h"
#include "altera_avalon_pio_regs.h"
#include "altera_up_avalon_character_lcd.h"
#include "system.h"
#include <stdio.h>
#include <unistd.h>
#include <string.h>

#define somar 0
#define subtrair 1
#define incrementar 2
#define decrementar 3

#define idle 4
#define op1_ent 5
#define op2_ent 6
#define op_2 7
#define resultado 8

int calcula(int operacao, int operando1, int operando2){
    if (operacao == somar) return operando1 + operando2;
    else if (operacao == subtrair) return operando1 - operando2;
    else if (operacao == incrementar) return ++operando1;
    else if (operacao == decrementar) return --operando1;
    else return 0;
}

void limpa_lcd(alt_up_character_lcd_dev * lcd){
	// Apagar escrevendo espa�os
//	alt_up_character_lcd_set_cursor_pos(lcd, 0, 0);
//	alt_up_character_lcd_string(lcd, "                ");
//	alt_up_character_lcd_set_cursor_pos(lcd, 0, 1);
//	alt_up_character_lcd_string(lcd, "                ");

	// Apagar inserindo espa�o em cada posi��o
	for (int y = 0; y < 2; y++){
		alt_up_character_lcd_set_cursor_pos(lcd, 0, y);
		for (int x = 0; x < 16; x++){
			alt_up_character_lcd_string(lcd, " ");
		}
	}
}

void limpa_linha(alt_up_character_lcd_dev * lcd, int linha){
	alt_up_character_lcd_set_cursor_pos(lcd, 0, linha);
	alt_up_character_lcd_string(lcd, "                ");
}

void limpa_linha_atual(alt_up_character_lcd_dev * lcd, int pos_inicial){
	alt_up_character_lcd_shift_cursor(lcd, -pos_inicial);
	alt_up_character_lcd_string(lcd, "                ");
}

int ler_operando(){
	int entrada = IORD(ENTRADA_PIO_BASE,0);
	return (int) entrada & 65535;
}

int ler_operacao(){
	int entrada = IORD(ENTRADA_PIO_BASE,0);
	int valor_lido = (int) entrada & 196608;
	return valor_lido >> 16;
}

int ler_enter(){
	int entrada = IORD(ENTRADA_PIO_BASE,0);
	int valor_lido = (int) entrada & 262144;
	return 1 - (valor_lido >> 18);
}

void traduz_operador(int operacao, char * operador_resultante){
	if (operacao == somar) sprintf(operador_resultante, "+");
	else if (operacao == subtrair) sprintf(operador_resultante, "-");
	else if (operacao == incrementar) sprintf(operador_resultante, "++");
	else if (operacao == decrementar) sprintf(operador_resultante, "--");
	else sprintf(operador_resultante, "desconhecido");
}

void traduz_operador_extenso(int operacao, char * operador_resultante){
	if (operacao == somar) sprintf(operador_resultante, "Somar");
	else if (operacao == subtrair) sprintf(operador_resultante, "Subtrair");
	else if (operacao == incrementar) sprintf(operador_resultante, "Incrementar");
	else if (operacao == decrementar) sprintf(operador_resultante, "Decrementar");
	else sprintf(operador_resultante, "Desconhecido");
}

int main(void) {
	alt_up_character_lcd_dev * dispositivo_LCD;

	// open the Character LCD port
	dispositivo_LCD = alt_up_character_lcd_open_dev ("/dev/lcd_16x2");
	if (dispositivo_LCD == NULL) alt_printf ("Error: could not open character LCD device\n");
	else alt_printf ("Opened character LCD device\n");

	/* Initialize the character display */
//	alt_up_character_lcd_init (dispositivo_LCD);

//	alt_up_character_lcd_cursor_off(dispositivo_LCD);

	int estado = 0, operacao = 0, operando1 = 0, operando2 = 0, enter = 0, resultado_final = 0;
	char primeira_linha[16], segunda_linha[16], operador[2], conta[8], pos_x = 0;

	while (1){

		limpa_linha_atual(dispositivo_LCD, pos_x);
//		limpa_linha(dispositivo_LCD, linha_atual);
//		limpa_lcd(dispositivo_LCD);
//		alt_up_character_lcd_set_cursor_pos(dispositivo_LCD, 0, 0);
//		alt_up_character_lcd_string(dispositivo_LCD, primeira_linha);

		switch (estado) {
			case idle:
			   operacao = ler_operacao();
			   traduz_operador(operacao, operador);

			   sprintf(primeira_linha, "Operador: %s", operador);

			   alt_up_character_lcd_set_cursor_pos(dispositivo_LCD, 0, 0);
			   alt_up_character_lcd_string(dispositivo_LCD, primeira_linha);

			   enter = ler_enter();

			   if (enter) {
				  if ((operacao == 0) | (operacao == 1)) estado = op2_ent;
				  else estado = op1_ent;

				  traduz_operador_extenso(operacao, primeira_linha);
				  alt_up_character_lcd_set_cursor_pos(dispositivo_LCD, 0, 0);
				  alt_up_character_lcd_string(dispositivo_LCD, primeira_linha);
			   }
			   break;

			case op1_ent:
//			   alt_up_character_lcd_set_cursor_pos(dispositivo_LCD, 0, 0);
//			   traduz_operador_extenso(operacao, primeira_linha);
//			   alt_up_character_lcd_string(dispositivo_LCD, primeira_linha);

			   operando1 = ler_operando();
			   IOWR_ALTERA_AVALON_PIO_DATA(LED_PIO_BASE,operando1);

			   sprintf(conta, "%s%d", operador, operando1);
			   alt_up_character_lcd_set_cursor_pos(dispositivo_LCD, 0, 1);
			   alt_up_character_lcd_string(dispositivo_LCD, conta);

			   // Obt�m a posi��o x atual do cursor
			   pos_x = strlen(conta);

			   enter = ler_enter();

			   if (enter) estado = resultado;
			   enter = 0;
			   break;

			case op2_ent:
//			   traduz_operador_extenso(operacao, primeira_linha);
//			   alt_up_character_lcd_set_cursor_pos(dispositivo_LCD, 0, 0);
//			   alt_up_character_lcd_string(dispositivo_LCD, primeira_linha);

			   operando1 = ler_operando();
			   IOWR_ALTERA_AVALON_PIO_DATA(LED_PIO_BASE,operando1);

			   sprintf(conta, "%d %s", operando1, operador);
			   alt_up_character_lcd_set_cursor_pos(dispositivo_LCD, 0, 1);
			   alt_up_character_lcd_string(dispositivo_LCD, conta);

			   // Desloca o cursor para a esquerda
			   alt_up_character_lcd_shift_cursor(dispositivo_LCD, -3);

			   enter = ler_enter();

			   if (enter) estado = op_2;
			   enter = 0;
			   break;

			case op_2:
//			   alt_up_character_lcd_set_cursor_pos(dispositivo_LCD, 0, 0);
//			   alt_up_character_lcd_string(dispositivo_LCD, primeira_linha);

			   operando2 = ler_operando();
			   IOWR_ALTERA_AVALON_PIO_DATA(LED_PIO_BASE,operando2);

			   sprintf(conta, "%d %s %d", operando1, operador, operando2);
			   alt_up_character_lcd_set_cursor_pos(dispositivo_LCD, 0, 1);
			   alt_up_character_lcd_string(dispositivo_LCD, conta);
			   enter = ler_enter();

			   if (enter) estado = resultado;
			   break;

			case resultado:
//			   alt_up_character_lcd_set_cursor_pos(dispositivo_LCD, 0, 0);
//			   alt_up_character_lcd_string(dispositivo_LCD, primeira_linha);

			   resultado_final = calcula(operacao, operando1, operando2);
			   IOWR_ALTERA_AVALON_PIO_DATA(LED_PIO_BASE,resultado_final);

			   alt_up_character_lcd_set_cursor_pos(dispositivo_LCD, 0, 1);
			   sprintf(segunda_linha, "%s = %d", conta, resultado_final);
			   alt_up_character_lcd_string(dispositivo_LCD, segunda_linha);

			   enter = ler_enter();

			   if (enter) estado = idle;
			   enter = 0;
			   break;
			default:
			   estado = idle;
		}
		usleep(200000);
	}
}
