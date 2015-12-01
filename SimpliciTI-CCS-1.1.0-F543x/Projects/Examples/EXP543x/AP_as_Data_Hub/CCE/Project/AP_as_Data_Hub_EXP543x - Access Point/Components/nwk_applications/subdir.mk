################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk_applications/nwk_freq.c \
C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk_applications/nwk_ioctl.c \
C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk_applications/nwk_join.c \
C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk_applications/nwk_link.c \
C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk_applications/nwk_mgmt.c \
C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk_applications/nwk_ping.c \
C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk_applications/nwk_security.c 

OBJS += \
./Components/nwk_applications/nwk_freq.obj \
./Components/nwk_applications/nwk_ioctl.obj \
./Components/nwk_applications/nwk_join.obj \
./Components/nwk_applications/nwk_link.obj \
./Components/nwk_applications/nwk_mgmt.obj \
./Components/nwk_applications/nwk_ping.obj \
./Components/nwk_applications/nwk_security.obj 

C_DEPS += \
./Components/nwk_applications/nwk_freq.pp \
./Components/nwk_applications/nwk_ioctl.pp \
./Components/nwk_applications/nwk_join.pp \
./Components/nwk_applications/nwk_link.pp \
./Components/nwk_applications/nwk_mgmt.pp \
./Components/nwk_applications/nwk_ping.pp \
./Components/nwk_applications/nwk_security.pp 

OBJS__QTD += \
".\Components\nwk_applications\nwk_freq.obj" \
".\Components\nwk_applications\nwk_ioctl.obj" \
".\Components\nwk_applications\nwk_join.obj" \
".\Components\nwk_applications\nwk_link.obj" \
".\Components\nwk_applications\nwk_mgmt.obj" \
".\Components\nwk_applications\nwk_ping.obj" \
".\Components\nwk_applications\nwk_security.obj" 

C_DEPS__QTD += \
".\Components\nwk_applications\nwk_freq.pp" \
".\Components\nwk_applications\nwk_ioctl.pp" \
".\Components\nwk_applications\nwk_join.pp" \
".\Components\nwk_applications\nwk_link.pp" \
".\Components\nwk_applications\nwk_mgmt.pp" \
".\Components\nwk_applications\nwk_ping.pp" \
".\Components\nwk_applications\nwk_security.pp" 

C_SRCS_QUOTED += \
"C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk_applications/nwk_freq.c" \
"C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk_applications/nwk_ioctl.c" \
"C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk_applications/nwk_join.c" \
"C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk_applications/nwk_link.c" \
"C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk_applications/nwk_mgmt.c" \
"C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk_applications/nwk_ping.c" \
"C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk_applications/nwk_security.c" 


# Each subdirectory must supply rules for building sources it contributes
Components/nwk_applications/nwk_freq.obj: C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk_applications/nwk_freq.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/smpl_nwk_config.dat" --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/Access_Point/smpl_config.dat" > "Components/nwk_applications/nwk_freq_ccsCompiler.opt")
	$(shell echo --silicon_version=mspx >> "Components/nwk_applications/nwk_freq_ccsCompiler.opt")
	$(shell echo -g >> "Components/nwk_applications/nwk_freq_ccsCompiler.opt")
	$(shell echo -O2 >> "Components/nwk_applications/nwk_freq_ccsCompiler.opt")
	$(shell echo --define=MRFI_CC2520 --define=__MSP430F5438__ >> "Components/nwk_applications/nwk_freq_ccsCompiler.opt")
	$(shell echo --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/usb" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/boards/EXP543x" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/drivers" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/mrfi" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk_applications" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" >> "Components/nwk_applications/nwk_freq_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "Components/nwk_applications/nwk_freq_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "Components/nwk_applications/nwk_freq_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "Components/nwk_applications/nwk_freq_ccsCompiler.opt")
	$(shell echo --preproc_dependency="Components/nwk_applications/nwk_freq.pp" >> "Components/nwk_applications/nwk_freq_ccsCompiler.opt")
	$(shell echo --obj_directory="Components/nwk_applications" >> "Components/nwk_applications/nwk_freq_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "Components/nwk_applications/nwk_freq_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "Components/nwk_applications/nwk_freq_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"Components/nwk_applications/nwk_freq_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

Components/nwk_applications/nwk_ioctl.obj: C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk_applications/nwk_ioctl.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/smpl_nwk_config.dat" --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/Access_Point/smpl_config.dat" > "Components/nwk_applications/nwk_ioctl_ccsCompiler.opt")
	$(shell echo --silicon_version=mspx >> "Components/nwk_applications/nwk_ioctl_ccsCompiler.opt")
	$(shell echo -g >> "Components/nwk_applications/nwk_ioctl_ccsCompiler.opt")
	$(shell echo -O2 >> "Components/nwk_applications/nwk_ioctl_ccsCompiler.opt")
	$(shell echo --define=MRFI_CC2520 --define=__MSP430F5438__ >> "Components/nwk_applications/nwk_ioctl_ccsCompiler.opt")
	$(shell echo --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/usb" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/boards/EXP543x" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/drivers" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/mrfi" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk_applications" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" >> "Components/nwk_applications/nwk_ioctl_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "Components/nwk_applications/nwk_ioctl_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "Components/nwk_applications/nwk_ioctl_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "Components/nwk_applications/nwk_ioctl_ccsCompiler.opt")
	$(shell echo --preproc_dependency="Components/nwk_applications/nwk_ioctl.pp" >> "Components/nwk_applications/nwk_ioctl_ccsCompiler.opt")
	$(shell echo --obj_directory="Components/nwk_applications" >> "Components/nwk_applications/nwk_ioctl_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "Components/nwk_applications/nwk_ioctl_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "Components/nwk_applications/nwk_ioctl_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"Components/nwk_applications/nwk_ioctl_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

Components/nwk_applications/nwk_join.obj: C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk_applications/nwk_join.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/smpl_nwk_config.dat" --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/Access_Point/smpl_config.dat" > "Components/nwk_applications/nwk_join_ccsCompiler.opt")
	$(shell echo --silicon_version=mspx >> "Components/nwk_applications/nwk_join_ccsCompiler.opt")
	$(shell echo -g >> "Components/nwk_applications/nwk_join_ccsCompiler.opt")
	$(shell echo -O2 >> "Components/nwk_applications/nwk_join_ccsCompiler.opt")
	$(shell echo --define=MRFI_CC2520 --define=__MSP430F5438__ >> "Components/nwk_applications/nwk_join_ccsCompiler.opt")
	$(shell echo --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/usb" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/boards/EXP543x" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/drivers" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/mrfi" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk_applications" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" >> "Components/nwk_applications/nwk_join_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "Components/nwk_applications/nwk_join_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "Components/nwk_applications/nwk_join_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "Components/nwk_applications/nwk_join_ccsCompiler.opt")
	$(shell echo --preproc_dependency="Components/nwk_applications/nwk_join.pp" >> "Components/nwk_applications/nwk_join_ccsCompiler.opt")
	$(shell echo --obj_directory="Components/nwk_applications" >> "Components/nwk_applications/nwk_join_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "Components/nwk_applications/nwk_join_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "Components/nwk_applications/nwk_join_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"Components/nwk_applications/nwk_join_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

Components/nwk_applications/nwk_link.obj: C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk_applications/nwk_link.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/smpl_nwk_config.dat" --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/Access_Point/smpl_config.dat" > "Components/nwk_applications/nwk_link_ccsCompiler.opt")
	$(shell echo --silicon_version=mspx >> "Components/nwk_applications/nwk_link_ccsCompiler.opt")
	$(shell echo -g >> "Components/nwk_applications/nwk_link_ccsCompiler.opt")
	$(shell echo -O2 >> "Components/nwk_applications/nwk_link_ccsCompiler.opt")
	$(shell echo --define=MRFI_CC2520 --define=__MSP430F5438__ >> "Components/nwk_applications/nwk_link_ccsCompiler.opt")
	$(shell echo --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/usb" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/boards/EXP543x" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/drivers" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/mrfi" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk_applications" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" >> "Components/nwk_applications/nwk_link_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "Components/nwk_applications/nwk_link_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "Components/nwk_applications/nwk_link_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "Components/nwk_applications/nwk_link_ccsCompiler.opt")
	$(shell echo --preproc_dependency="Components/nwk_applications/nwk_link.pp" >> "Components/nwk_applications/nwk_link_ccsCompiler.opt")
	$(shell echo --obj_directory="Components/nwk_applications" >> "Components/nwk_applications/nwk_link_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "Components/nwk_applications/nwk_link_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "Components/nwk_applications/nwk_link_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"Components/nwk_applications/nwk_link_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

Components/nwk_applications/nwk_mgmt.obj: C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk_applications/nwk_mgmt.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/smpl_nwk_config.dat" --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/Access_Point/smpl_config.dat" > "Components/nwk_applications/nwk_mgmt_ccsCompiler.opt")
	$(shell echo --silicon_version=mspx >> "Components/nwk_applications/nwk_mgmt_ccsCompiler.opt")
	$(shell echo -g >> "Components/nwk_applications/nwk_mgmt_ccsCompiler.opt")
	$(shell echo -O2 >> "Components/nwk_applications/nwk_mgmt_ccsCompiler.opt")
	$(shell echo --define=MRFI_CC2520 --define=__MSP430F5438__ >> "Components/nwk_applications/nwk_mgmt_ccsCompiler.opt")
	$(shell echo --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/usb" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/boards/EXP543x" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/drivers" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/mrfi" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk_applications" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" >> "Components/nwk_applications/nwk_mgmt_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "Components/nwk_applications/nwk_mgmt_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "Components/nwk_applications/nwk_mgmt_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "Components/nwk_applications/nwk_mgmt_ccsCompiler.opt")
	$(shell echo --preproc_dependency="Components/nwk_applications/nwk_mgmt.pp" >> "Components/nwk_applications/nwk_mgmt_ccsCompiler.opt")
	$(shell echo --obj_directory="Components/nwk_applications" >> "Components/nwk_applications/nwk_mgmt_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "Components/nwk_applications/nwk_mgmt_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "Components/nwk_applications/nwk_mgmt_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"Components/nwk_applications/nwk_mgmt_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

Components/nwk_applications/nwk_ping.obj: C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk_applications/nwk_ping.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/smpl_nwk_config.dat" --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/Access_Point/smpl_config.dat" > "Components/nwk_applications/nwk_ping_ccsCompiler.opt")
	$(shell echo --silicon_version=mspx >> "Components/nwk_applications/nwk_ping_ccsCompiler.opt")
	$(shell echo -g >> "Components/nwk_applications/nwk_ping_ccsCompiler.opt")
	$(shell echo -O2 >> "Components/nwk_applications/nwk_ping_ccsCompiler.opt")
	$(shell echo --define=MRFI_CC2520 --define=__MSP430F5438__ >> "Components/nwk_applications/nwk_ping_ccsCompiler.opt")
	$(shell echo --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/usb" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/boards/EXP543x" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/drivers" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/mrfi" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk_applications" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" >> "Components/nwk_applications/nwk_ping_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "Components/nwk_applications/nwk_ping_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "Components/nwk_applications/nwk_ping_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "Components/nwk_applications/nwk_ping_ccsCompiler.opt")
	$(shell echo --preproc_dependency="Components/nwk_applications/nwk_ping.pp" >> "Components/nwk_applications/nwk_ping_ccsCompiler.opt")
	$(shell echo --obj_directory="Components/nwk_applications" >> "Components/nwk_applications/nwk_ping_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "Components/nwk_applications/nwk_ping_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "Components/nwk_applications/nwk_ping_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"Components/nwk_applications/nwk_ping_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

Components/nwk_applications/nwk_security.obj: C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk_applications/nwk_security.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/smpl_nwk_config.dat" --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/Access_Point/smpl_config.dat" > "Components/nwk_applications/nwk_security_ccsCompiler.opt")
	$(shell echo --silicon_version=mspx >> "Components/nwk_applications/nwk_security_ccsCompiler.opt")
	$(shell echo -g >> "Components/nwk_applications/nwk_security_ccsCompiler.opt")
	$(shell echo -O2 >> "Components/nwk_applications/nwk_security_ccsCompiler.opt")
	$(shell echo --define=MRFI_CC2520 --define=__MSP430F5438__ >> "Components/nwk_applications/nwk_security_ccsCompiler.opt")
	$(shell echo --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/usb" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/boards/EXP543x" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/drivers" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/mrfi" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk_applications" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" >> "Components/nwk_applications/nwk_security_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "Components/nwk_applications/nwk_security_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "Components/nwk_applications/nwk_security_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "Components/nwk_applications/nwk_security_ccsCompiler.opt")
	$(shell echo --preproc_dependency="Components/nwk_applications/nwk_security.pp" >> "Components/nwk_applications/nwk_security_ccsCompiler.opt")
	$(shell echo --obj_directory="Components/nwk_applications" >> "Components/nwk_applications/nwk_security_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "Components/nwk_applications/nwk_security_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "Components/nwk_applications/nwk_security_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"Components/nwk_applications/nwk_security_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '


