#include "alt_types.h"
#include "altera_avalon_pio_regs.h"
#include "system.h"
#include <stdio.h>
#include <unistd.h>

static alt_u8 count;
static void initial_message()
{
    printf("\n\n**************************\n");
    printf("* Hello from Nios II!    *\n");
    printf("* Counting from 00 to ff *\n");
    printf("**************************\n");
}

int main(void)
{

    count = 0;

    /* Initialize the button pio. */

//#ifdef BUTTON_PIO_BASE
//    init_button_pio();
//#endif

/* Initial message to output. */

    initial_message();

    printf("Counting: ");
    while( 1 ){
    	(*(alt_u8 *)(0x00011020)) = count;

//        IOWR_ALTERA_AVALON_PIO_DATA(LED_PIO_BASE,count);
    	printf("%02x,  ", count);
    	count++;
        usleep(100000); /* Sleep for 0.1s. */
    }
    return 0;
}
