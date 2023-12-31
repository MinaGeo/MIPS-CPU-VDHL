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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *WORK_P_4053066488;
char *IEEE_P_1242562249;
char *IEEE_P_0774719531;
char *IEEE_P_3499444699;
char *IEEE_P_3564397177;
char *STD_TEXTIO;
char *IEEE_P_3620187407;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    ieee_p_0774719531_init();
    std_textio_init();
    ieee_p_3564397177_init();
    work_p_4053066488_init();
    work_a_3222946569_3212880686_init();
    work_a_4106131694_3212880686_init();
    work_a_1215300100_3212880686_init();
    work_a_0763730103_3212880686_init();
    work_a_2750190074_3212880686_init();
    work_a_0832606739_3212880686_init();
    work_a_1991350011_3212880686_init();
    work_a_1715127761_3212880686_init();
    work_a_2077859724_3212880686_init();
    work_a_2532473584_3212880686_init();
    work_a_2263464102_3212880686_init();
    work_a_2023191012_3212880686_init();
    work_a_2278322344_3212880686_init();
    work_a_2166523021_3212880686_init();
    work_a_1492497583_3212880686_init();
    work_a_1016387942_3212880686_init();
    work_a_0737135909_3212880686_init();
    work_a_0308474336_3212880686_init();
    work_a_0085583267_3212880686_init();
    work_a_0431830435_3212880686_init();
    work_a_2645237537_2372691052_init();


    xsi_register_tops("work_a_2645237537_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    WORK_P_4053066488 = xsi_get_engine_memory("work_p_4053066488");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_0774719531 = xsi_get_engine_memory("ieee_p_0774719531");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_3564397177 = xsi_get_engine_memory("ieee_p_3564397177");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");

    return xsi_run_simulation(argc, argv);

}
