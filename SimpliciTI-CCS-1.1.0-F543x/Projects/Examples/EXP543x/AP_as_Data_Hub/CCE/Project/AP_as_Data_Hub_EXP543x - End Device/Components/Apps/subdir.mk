################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Components/Apps/Accelo.c 

OBJS += \
./Components/Apps/Accelo.obj 

C_DEPS += \
./Components/Apps/Accelo.pp 

OBJS__QTD += \
".\Components\Apps\Accelo.obj" 

C_DEPS__QTD += \
".\Components\Apps\Accelo.pp" 

C_SRCS_QUOTED += \
"../Components/Apps/Accelo.c" 


# Each subdirectory must supply rules for building sources it contributes
Components/Apps/Accelo.obj: ../Components/Apps/Accelo.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: Compiler'
	$(shell echo --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/smpl_nwk_config.dat" --cmd_file="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../Configuration/End_Device/smpl_config.dat" > "Components/Apps/Accelo_ccsCompiler.opt")
	$(shell echo -vmspx >> "Components/Apps/Accelo_ccsCompiler.opt")
	$(shell echo -g >> "Components/Apps/Accelo_ccsCompiler.opt")
	$(shell echo -O2 >> "Components/Apps/Accelo_ccsCompiler.opt")
	$(shell echo --define=MRFI_CC2520 --define=__MSP430F5438A__ >> "Components/Apps/Accelo_ccsCompiler.opt")
	$(shell echo --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/Components/Apps" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/include" --include_path="C:/Program Files (x86)/Texas Instruments/ccsv4/msp430/include" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/boards/EXP543x" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/bsp/drivers" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/mrfi" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk" --include_path="C:/Users/Ghaith/Desktop/eStadium/Wireless/SimpliciTI-CCS-1.1.0-F543x/Projects/Examples/EXP543x/AP_as_Data_Hub/CCE/Project/../../../../../../Components/simpliciti/nwk_applications" >> "Components/Apps/Accelo_ccsCompiler.opt")
	$(shell echo --diag_warning=225 >> "Components/Apps/Accelo_ccsCompiler.opt")
	$(shell echo --silicon_errata=CPU22 >> "Components/Apps/Accelo_ccsCompiler.opt")
	$(shell echo --silicon_errata=CPU21 >> "Components/Apps/Accelo_ccsCompiler.opt")
	$(shell echo --silicon_errata=CPU23 >> "Components/Apps/Accelo_ccsCompiler.opt")
	$(shell echo --silicon_errata=CPU40 >> "Components/Apps/Accelo_ccsCompiler.opt")
	$(shell echo --printf_support=minimal >> "Components/Apps/Accelo_ccsCompiler.opt")
	$(shell echo --preproc_with_compile >> "Components/Apps/Accelo_ccsCompiler.opt")
	$(shell echo --preproc_dependency="Components/Apps/Accelo.pp" >> "Components/Apps/Accelo_ccsCompiler.opt")
	$(shell echo --obj_directory="Components/Apps" >> "Components/Apps/Accelo_ccsCompiler.opt")
	$(if $(strip $(GEN_OPTS_QUOTED)), $(shell echo $(GEN_OPTS_QUOTED) >> "Components/Apps/Accelo_ccsCompiler.opt"))
	$(if $(strip $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#")), $(shell echo $(subst #,$(wildcard $(subst $(SPACE),\$(SPACE),$<)),"#") >> "Components/Apps/Accelo_ccsCompiler.opt"))
	"C:/Program Files (x86)/Texas Instruments/ccsv4/tools/compiler/msp430/bin/cl430" -@"Components/Apps/Accelo_ccsCompiler.opt"
	@echo 'Finished building: $<'
	@echo ' '


