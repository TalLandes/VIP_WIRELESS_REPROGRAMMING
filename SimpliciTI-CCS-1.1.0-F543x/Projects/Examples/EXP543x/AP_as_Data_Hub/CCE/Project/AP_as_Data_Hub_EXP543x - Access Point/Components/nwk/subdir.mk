################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk/nwk.c \
C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk/nwk_QMgmt.c \
C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk/nwk_api.c \
C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk/nwk_frame.c \
C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk/nwk_globals.c 

OBJS += \
./Components/nwk/nwk.obj \
./Components/nwk/nwk_QMgmt.obj \
./Components/nwk/nwk_api.obj \
./Components/nwk/nwk_frame.obj \
./Components/nwk/nwk_globals.obj 

C_DEPS += \
./Components/nwk/nwk.pp \
./Components/nwk/nwk_QMgmt.pp \
./Components/nwk/nwk_api.pp \
./Components/nwk/nwk_frame.pp \
./Components/nwk/nwk_globals.pp 

OBJS__QTD += \
".\Components\nwk\nwk.obj" \
".\Components\nwk\nwk_QMgmt.obj" \
".\Components\nwk\nwk_api.obj" \
".\Components\nwk\nwk_frame.obj" \
".\Components\nwk\nwk_globals.obj" 

C_DEPS__QTD += \
".\Components\nwk\nwk.pp" \
".\Components\nwk\nwk_QMgmt.pp" \
".\Components\nwk\nwk_api.pp" \
".\Components\nwk\nwk_frame.pp" \
".\Components\nwk\nwk_globals.pp" 

C_SRCS_QUOTED += \
"C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk/nwk.c" \
"C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk/nwk_QMgmt.c" \
"C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk/nwk_api.c" \
"C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk/nwk_frame.c" \
"C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk/nwk_globals.c" 


# Each subdirectory must supply rules for building sources it contributes
Components/nwk/nwk.obj: C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk/nwk.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/smpl_nwk_config.dat" --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/Access_Point/smpl_config.dat" > "Components/nwk/nwk_ccsCompiler.opt")
	$(shell echo --silicon_version=mspx >> "Components/nwk/nwk_ccsCompiler.opt")
	$(shell echo -g >> "Components/nwk/nwk_ccsCompiler.opt")
	$(shell echo -O2 >> "Components/nwk/nwk_ccsCompiler.opt")
	$(shell echo --define=MRFI_CC2520 --define=__MSP430F5438__ >> "Components/nwk/nwk_ccsCompiler.opt")
	$(shell echo --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/usb" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/boards/EXP543x" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/drivers" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/mrfi" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk_applications" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" >> "Components/nwk/nwk_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "Components/nwk/nwk_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "Components/nwk/nwk_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "Components/nwk/nwk_ccsCompiler.opt")
	$(shell echo --preproc_dependency="Components/nwk/nwk.pp" >> "Components/nwk/nwk_ccsCompiler.opt")
	$(shell echo --obj_directory="Components/nwk" >> "Components/nwk/nwk_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "Components/nwk/nwk_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "Components/nwk/nwk_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"Components/nwk/nwk_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

Components/nwk/nwk_QMgmt.obj: C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk/nwk_QMgmt.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/smpl_nwk_config.dat" --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/Access_Point/smpl_config.dat" > "Components/nwk/nwk_QMgmt_ccsCompiler.opt")
	$(shell echo --silicon_version=mspx >> "Components/nwk/nwk_QMgmt_ccsCompiler.opt")
	$(shell echo -g >> "Components/nwk/nwk_QMgmt_ccsCompiler.opt")
	$(shell echo -O2 >> "Components/nwk/nwk_QMgmt_ccsCompiler.opt")
	$(shell echo --define=MRFI_CC2520 --define=__MSP430F5438__ >> "Components/nwk/nwk_QMgmt_ccsCompiler.opt")
	$(shell echo --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/usb" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/boards/EXP543x" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/drivers" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/mrfi" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk_applications" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" >> "Components/nwk/nwk_QMgmt_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "Components/nwk/nwk_QMgmt_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "Components/nwk/nwk_QMgmt_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "Components/nwk/nwk_QMgmt_ccsCompiler.opt")
	$(shell echo --preproc_dependency="Components/nwk/nwk_QMgmt.pp" >> "Components/nwk/nwk_QMgmt_ccsCompiler.opt")
	$(shell echo --obj_directory="Components/nwk" >> "Components/nwk/nwk_QMgmt_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "Components/nwk/nwk_QMgmt_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "Components/nwk/nwk_QMgmt_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"Components/nwk/nwk_QMgmt_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

Components/nwk/nwk_api.obj: C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk/nwk_api.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/smpl_nwk_config.dat" --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/Access_Point/smpl_config.dat" > "Components/nwk/nwk_api_ccsCompiler.opt")
	$(shell echo --silicon_version=mspx >> "Components/nwk/nwk_api_ccsCompiler.opt")
	$(shell echo -g >> "Components/nwk/nwk_api_ccsCompiler.opt")
	$(shell echo -O2 >> "Components/nwk/nwk_api_ccsCompiler.opt")
	$(shell echo --define=MRFI_CC2520 --define=__MSP430F5438__ >> "Components/nwk/nwk_api_ccsCompiler.opt")
	$(shell echo --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/usb" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/boards/EXP543x" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/drivers" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/mrfi" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk_applications" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" >> "Components/nwk/nwk_api_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "Components/nwk/nwk_api_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "Components/nwk/nwk_api_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "Components/nwk/nwk_api_ccsCompiler.opt")
	$(shell echo --preproc_dependency="Components/nwk/nwk_api.pp" >> "Components/nwk/nwk_api_ccsCompiler.opt")
	$(shell echo --obj_directory="Components/nwk" >> "Components/nwk/nwk_api_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "Components/nwk/nwk_api_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "Components/nwk/nwk_api_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"Components/nwk/nwk_api_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

Components/nwk/nwk_frame.obj: C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk/nwk_frame.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/smpl_nwk_config.dat" --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/Access_Point/smpl_config.dat" > "Components/nwk/nwk_frame_ccsCompiler.opt")
	$(shell echo --silicon_version=mspx >> "Components/nwk/nwk_frame_ccsCompiler.opt")
	$(shell echo -g >> "Components/nwk/nwk_frame_ccsCompiler.opt")
	$(shell echo -O2 >> "Components/nwk/nwk_frame_ccsCompiler.opt")
	$(shell echo --define=MRFI_CC2520 --define=__MSP430F5438__ >> "Components/nwk/nwk_frame_ccsCompiler.opt")
	$(shell echo --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/usb" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/boards/EXP543x" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/drivers" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/mrfi" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk_applications" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" >> "Components/nwk/nwk_frame_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "Components/nwk/nwk_frame_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "Components/nwk/nwk_frame_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "Components/nwk/nwk_frame_ccsCompiler.opt")
	$(shell echo --preproc_dependency="Components/nwk/nwk_frame.pp" >> "Components/nwk/nwk_frame_ccsCompiler.opt")
	$(shell echo --obj_directory="Components/nwk" >> "Components/nwk/nwk_frame_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "Components/nwk/nwk_frame_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "Components/nwk/nwk_frame_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"Components/nwk/nwk_frame_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '

Components/nwk/nwk_globals.obj: C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Components/simpliciti/nwk/nwk_globals.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/smpl_nwk_config.dat" --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/Access_Point/smpl_config.dat" > "Components/nwk/nwk_globals_ccsCompiler.opt")
	$(shell echo --silicon_version=mspx >> "Components/nwk/nwk_globals_ccsCompiler.opt")
	$(shell echo -g >> "Components/nwk/nwk_globals_ccsCompiler.opt")
	$(shell echo -O2 >> "Components/nwk/nwk_globals_ccsCompiler.opt")
	$(shell echo --define=MRFI_CC2520 --define=__MSP430F5438__ >> "Components/nwk/nwk_globals_ccsCompiler.opt")
	$(shell echo --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/usb" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/boards/EXP543x" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/drivers" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/mrfi" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk_applications" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" >> "Components/nwk/nwk_globals_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "Components/nwk/nwk_globals_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "Components/nwk/nwk_globals_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "Components/nwk/nwk_globals_ccsCompiler.opt")
	$(shell echo --preproc_dependency="Components/nwk/nwk_globals.pp" >> "Components/nwk/nwk_globals_ccsCompiler.opt")
	$(shell echo --obj_directory="Components/nwk" >> "Components/nwk/nwk_globals_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "Components/nwk/nwk_globals_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "Components/nwk/nwk_globals_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"Components/nwk/nwk_globals_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '


