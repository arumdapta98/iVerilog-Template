#IFLAGS = -I/core -I/soc
dir_rtl = rtl
dir_sim = sim
dir_tb  = tb
dir_syn = syn

# define top level module will be tested here!
top_level = addsub

top_level_tb = $(top_level)_tb
simulation_tb = $(dir_sim)/$(top_level_tb)
simulation_tb_vvp = $(simulation_tb).vvp
simulation_tb_vcd = $(simulation_tb).vcd

vvp:
	iverilog -o $(simulation_tb_vvp)  $(dir_tb)/$(top_level_tb).v

vcd:
	vvp $(simulation_tb_vvp) -o $(simulation_tb_vcd)

gtk:
	gtkwave -f $(simulation_tb_vcd)

all:
	iverilog -o $(simulation_tb_vvp)  tb/$(top_level_tb).v
	vvp $(simulation_tb_vvp) -o $(simulation_tb_vcd)
	
clean:
	cd $(dir_sim) &	del *.vvp *.vcd

