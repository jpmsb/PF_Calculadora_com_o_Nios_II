#include <stdio.h>

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

int main(){
    int estado = 0, operando1 = 0, operando2 = 0, enter = 0, operacao = 0;

    while (1){
        switch (estado) {
            case idle:
               printf("Digite a operação: ");
               scanf("%d", &operacao);

               printf("(idle) Pressione enter: ");
               scanf("%d", &enter);
    
               if (enter) {
                  if (operacao == 0 | operacao == 1) estado = op2_ent;
                  else estado = op1_ent;
               }
               break;

            case op1_ent:
               printf("(op1_ent) Digite um operando: ");
               scanf("%d", &operando1);

               printf("(op1_ent) Pressione enter: ");
               scanf("%d", &enter);
 
               if (enter) estado = resultado;
               enter = 0;
               break;

            case op2_ent:
               printf("(op2_ent) Digite um operando: ");
               scanf("%d", &operando1);

               printf("(op2_ent) Pressione enter: ");
               scanf("%d", &enter);

               if (enter) estado = op_2;
               enter = 0;
               break;

            case op_2:
               printf("(op_2) Digite o segundo operando: ");
               scanf("%d", &operando2);

               printf("(op_2) Pressione enter: ");
               scanf("%d", &enter);

               if (enter) estado = resultado;
               break;

            case resultado:
               printf("(resultado) Resultado: %d\n", calcula(operacao, operando1, operando2));
               printf("(resultado) Pressione enter: ");
               scanf("%d", &enter);

               if (enter) estado = idle;
               enter = 0;
               break;
            default:
               estado = idle;
        }
    }

    printf("Algo");
}
