#include <gb/gb.h>
#include <stdio.h>

void main(){

    NR52_REG = 0x80;
    NR50_REG = 0x77;
    NR51_REG =  0xff;

    while(1) {
        UBYTE joypad_state = joypad();

        if(joypad_state){
            NR10_REG =0x16;
            NR11_REG = 0x40;
            NR12_REG = 0x73;
            NR13_REG = 0x00;
            NR14_REG = 0xc3;

            wait_vbl_done();
        }
    }
}