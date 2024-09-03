#include <gb/gb.h>
#include "simplebackground.c"
#include "simplebackgroundmap.c"
#include "windowmap.c"
#include <gbdk/font.h>

void main(){
    font_t min_font;

    font_init();
    min_font = font_load(font_min);
    font_set(min_font);

    set_bkg_data(37, 7, backgroundtiles);
    set_bkg_tiles(0, 0, 40, 18, backgroundmap);

    set_win_tiles(0,0,5,1,windowmap);
    move_win(7,100);


    SHOW_BKG;
    SHOW_WIN;
    DISPLAY_ON;

    while (1){
        scroll_bkg(1,0);
        wait_vbl_done();
    }
    
}