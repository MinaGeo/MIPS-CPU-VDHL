/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/HP/Desktop/Phase2FV/ShiftLeft2Jump.vhd";
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_2045698577_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_4004982826_1035706684(char *, char *, char *, char *, int );


static void work_a_2532473584_3212880686_p_0(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    xsi_set_current_line(15, ng0);

LAB3:    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 4884U);
    t4 = ieee_p_1242562249_sub_2045698577_1035706684(IEEE_P_1242562249, t1, t3, t2, 28);
    t5 = (t0 + 3176);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t4, 28U);
    xsi_driver_first_trans_fast(t5);

LAB2:    t10 = (t0 + 3080);
    *((int *)t10) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2532473584_3212880686_p_1(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    xsi_set_current_line(16, ng0);

LAB3:    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t2 = (t0 + 4916U);
    t4 = ieee_p_1242562249_sub_4004982826_1035706684(IEEE_P_1242562249, t1, t3, t2, 2);
    t5 = (t0 + 3240);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t4, 28U);
    xsi_driver_first_trans_fast_port(t5);

LAB2:    t10 = (t0 + 3096);
    *((int *)t10) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_2532473584_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2532473584_3212880686_p_0,(void *)work_a_2532473584_3212880686_p_1};
	xsi_register_didat("work_a_2532473584_3212880686", "isim/testbenchmain_isim_beh.exe.sim/work/a_2532473584_3212880686.didat");
	xsi_register_executes(pe);
}
