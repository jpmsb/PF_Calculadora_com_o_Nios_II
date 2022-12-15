transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlib system
vmap system system
vlog -vlog01compat -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/altera_reset_controller.v}
vlog -vlog01compat -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/altera_reset_synchronizer.v}
vlog -vlog01compat -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/system_cpu.v}
vlog -vlog01compat -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/system_cpu_cpu.v}
vlog -vlog01compat -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/system_cpu_cpu_debug_slave_sysclk.v}
vlog -vlog01compat -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/system_cpu_cpu_debug_slave_tck.v}
vlog -vlog01compat -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/system_cpu_cpu_debug_slave_wrapper.v}
vlog -vlog01compat -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/system_cpu_cpu_mult_cell.v}
vlog -vlog01compat -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/system_cpu_cpu_test_bench.v}
vlog -vlog01compat -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/system_jtag.v}
vlog -vlog01compat -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/system_led_pio.v}
vlog -vlog01compat -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/system_mm_interconnect_0.v}
vlog -vlog01compat -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/system_mm_interconnect_0_avalon_st_adapter.v}
vlog -vlog01compat -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/system_onchip_mem.v}
vlog -vlog01compat -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/system_sysid_qsys_0.v}
vlog -vlog01compat -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/system_timer_0.v}
vlog -vlog01compat -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/system.v}
vlog -vlog01compat -work work +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/altera_mult_add_vkp2.v}
vlog -vlog01compat -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/altera_avalon_sc_fifo.v}
vlog -sv -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/altera_merlin_arbitrator.sv}
vlog -sv -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/altera_merlin_burst_uncompressor.sv}
vlog -sv -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/altera_merlin_master_agent.sv}
vlog -sv -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/altera_merlin_master_translator.sv}
vlog -sv -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/altera_merlin_slave_agent.sv}
vlog -sv -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/altera_merlin_slave_translator.sv}
vlog -sv -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/altera_merlin_traffic_limiter.sv}
vlog -sv -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/system_irq_mapper.sv}
vlog -sv -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/system_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv}
vlog -sv -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/system_mm_interconnect_0_cmd_demux.sv}
vlog -sv -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/system_mm_interconnect_0_cmd_demux_001.sv}
vlog -sv -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/system_mm_interconnect_0_cmd_mux.sv}
vlog -sv -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/system_mm_interconnect_0_cmd_mux_002.sv}
vlog -sv -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/system_mm_interconnect_0_router.sv}
vlog -sv -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/system_mm_interconnect_0_router_001.sv}
vlog -sv -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/system_mm_interconnect_0_router_002.sv}
vlog -sv -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/system_mm_interconnect_0_router_004.sv}
vlog -sv -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/system_mm_interconnect_0_rsp_demux.sv}
vlog -sv -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/system_mm_interconnect_0_rsp_demux_002.sv}
vlog -sv -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/system_mm_interconnect_0_rsp_mux.sv}
vlog -sv -work system +incdir+/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/db/ip/system/submodules/system_mm_interconnect_0_rsp_mux_001.sv}
vcom -93 -work work {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/system/synthesis/system.vhd}
vcom -93 -work work {/home/joaopedro/Documentos/DLP29007/NIOS/aula01/topo.vhd}

