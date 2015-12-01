################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

EMPTY := 
SPACE := $(EMPTY) $(EMPTY)
CG_TOOL_ROOT := C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430

ORDERED_OBJS += \
$(GEN_CMDS_QUOTED) \
"./Applications/application/Reprogrammer/reprogrammer.obj" \
"./Applications/application/Reprogrammer/interrupt proxy.obj" \
"./Components/bsp/bsp.obj" \
"./Components/mrfi/mrfi.obj" \
"./Components/nwk/nwk_globals.obj" \
"./Components/nwk/nwk_frame.obj" \
"./Components/nwk/nwk_api.obj" \
"./Components/nwk/nwk_QMgmt.obj" \
"./Components/nwk/nwk.obj" \
"./Components/nwk_applications/nwk_security.obj" \
"./Components/nwk_applications/nwk_ping.obj" \
"./Components/nwk_applications/nwk_mgmt.obj" \
"./Components/nwk_applications/nwk_link.obj" \
"./Components/nwk_applications/nwk_join.obj" \
"./Components/nwk_applications/nwk_ioctl.obj" \
"./Components/nwk_applications/nwk_freq.obj" \
-l"libc.a" \
"../lnk_msp430f5438a_reprogrammer.cmd" \

-include ../makefile.init

RM := DEL /F
RMDIR := RMDIR /S/Q

# All of the sources participating in the build are defined here
-include sources.mk
-include subdir_vars.mk
-include Components/nwk_applications/subdir_vars.mk
-include Components/nwk/subdir_vars.mk
-include Components/mrfi/subdir_vars.mk
-include Components/bsp/subdir_vars.mk
-include Applications/application/Reprogrammer/subdir_vars.mk
-include subdir_rules.mk
-include Components/nwk_applications/subdir_rules.mk
-include Components/nwk/subdir_rules.mk
-include Components/mrfi/subdir_rules.mk
-include Components/bsp/subdir_rules.mk
-include Applications/application/Reprogrammer/subdir_rules.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S62_DEPS)),)
-include $(S62_DEPS)
endif
ifneq ($(strip $(ASM_DEPS)),)
-include $(ASM_DEPS)
endif
ifneq ($(strip $(C55_DEPS)),)
-include $(C55_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(CPP_DEPS)),)
-include $(CPP_DEPS)
endif
ifneq ($(strip $(C64_DEPS)),)
-include $(C64_DEPS)
endif
ifneq ($(strip $(C43_DEPS)),)
-include $(C43_DEPS)
endif
ifneq ($(strip $(C62_DEPS)),)
-include $(C62_DEPS)
endif
ifneq ($(strip $(C??_DEPS)),)
-include $(C??_DEPS)
endif
ifneq ($(strip $(S??_DEPS)),)
-include $(S??_DEPS)
endif
ifneq ($(strip $(S55_DEPS)),)
-include $(S55_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(C_UPPER_DEPS)),)
-include $(C_UPPER_DEPS)
endif
ifneq ($(strip $(SA_DEPS)),)
-include $(SA_DEPS)
endif
ifneq ($(strip $(C++_DEPS)),)
-include $(C++_DEPS)
endif
ifneq ($(strip $(K_DEPS)),)
-include $(K_DEPS)
endif
ifneq ($(strip $(CC_DEPS)),)
-include $(CC_DEPS)
endif
ifneq ($(strip $(S64_DEPS)),)
-include $(S64_DEPS)
endif
ifneq ($(strip $(CXX_DEPS)),)
-include $(CXX_DEPS)
endif
ifneq ($(strip $(S43_DEPS)),)
-include $(S43_DEPS)
endif
ifneq ($(strip $(S67_DEPS)),)
-include $(S67_DEPS)
endif
ifneq ($(strip $(C67_DEPS)),)
-include $(C67_DEPS)
endif
ifneq ($(strip $(ASM_UPPER_DEPS)),)
-include $(ASM_UPPER_DEPS)
endif
ifneq ($(strip $(OPT_DEPS)),)
-include $(OPT_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: Project.out

# Tool invocations
Project.out: $(OBJS) $(CMD_SRCS) $(GEN_CMDS)
	@echo 'Building target: $@'
	@echo 'Invoking: Linker'
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" --cmd_file="C:/cygwin64/home/blico3/Wireless-Reprogramming/Reprogrammer/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/smpl_nwk_config.dat" --cmd_file="C:/cygwin64/home/blico3/Wireless-Reprogramming/Reprogrammer/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/End_Device/smpl_config.dat"  -vmspx -g -O0 --define=MRFI_CC2520 --define=__MSP430F5438A__ --diag_warning=225 --silicon_errata=CPU22 --silicon_errata=CPU21 --silicon_errata=CPU23 --silicon_errata=CPU40 --printf_support=minimal -z -m"Project.map" --stack_size=160 --heap_size=160 --use_hw_mpy=F5 --warn_sections -i"C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" -i"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/lib" -i"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" -i"C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --reread_libs --rom_model -o "Project.out" $(ORDERED_OBJS)
	@echo 'Finished building target: $@'
	@echo ' '
	$(MAKE) --no-print-directory post-build

# Other Targets
clean:
	-$(RM) $(MSP430_EXECUTABLE_OUTPUTS__QTD) "Project.out"
	-$(RM) ".\Components\nwk_applications\nwk_freq.obj" ".\Components\nwk_applications\nwk_ioctl.obj" ".\Components\nwk_applications\nwk_join.obj" ".\Components\nwk_applications\nwk_link.obj" ".\Components\nwk_applications\nwk_mgmt.obj" ".\Components\nwk_applications\nwk_ping.obj" ".\Components\nwk_applications\nwk_security.obj" ".\Components\nwk\nwk.obj" ".\Components\nwk\nwk_QMgmt.obj" ".\Components\nwk\nwk_api.obj" ".\Components\nwk\nwk_frame.obj" ".\Components\nwk\nwk_globals.obj" ".\Components\mrfi\mrfi.obj" ".\Components\bsp\bsp.obj" ".\Applications\application\Reprogrammer\interrupt proxy.obj" ".\Applications\application\Reprogrammer\reprogrammer.obj" 
	-$(RM) ".\Applications\application\Reprogrammer\interrupt proxy.pp" 
	-$(RM) ".\Components\nwk_applications\nwk_freq.pp" ".\Components\nwk_applications\nwk_ioctl.pp" ".\Components\nwk_applications\nwk_join.pp" ".\Components\nwk_applications\nwk_link.pp" ".\Components\nwk_applications\nwk_mgmt.pp" ".\Components\nwk_applications\nwk_ping.pp" ".\Components\nwk_applications\nwk_security.pp" ".\Components\nwk\nwk.pp" ".\Components\nwk\nwk_QMgmt.pp" ".\Components\nwk\nwk_api.pp" ".\Components\nwk\nwk_frame.pp" ".\Components\nwk\nwk_globals.pp" ".\Components\mrfi\mrfi.pp" ".\Components\bsp\bsp.pp" ".\Applications\application\Reprogrammer\reprogrammer.pp" 
	-@echo ' '

post-build:
	-@echo 'Create flash image: TI-TXT'
	-"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/hex430.exe" --ti_txt "Project.out" -o "Project.txt" -order MS -romwidth 16
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY: post-build

-include ../makefile.targets
