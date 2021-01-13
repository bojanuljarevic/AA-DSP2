	.extern ___C_STACK_BG
	.extern ___C_STACK_FG
	.extern ___X_BL_TEMPBUFF
	.extern ___X_BL_TEMPBUFF0
	.extern ___X_BL_TEMPBUFF1
	.extern ___X_BL_TEMPBUFF10
	.extern ___X_BL_TEMPBUFF11
	.extern ___X_BL_TEMPBUFF12
	.extern ___X_BL_TEMPBUFF13
	.extern ___X_BL_TEMPBUFF14
	.extern ___X_BL_TEMPBUFF15
	.extern ___X_BL_TEMPBUFF2
	.extern ___X_BL_TEMPBUFF3
	.extern ___X_BL_TEMPBUFF4
	.extern ___X_BL_TEMPBUFF5
	.extern ___X_BL_TEMPBUFF6
	.extern ___X_BL_TEMPBUFF7
	.extern ___X_BL_TEMPBUFF8
	.extern ___X_BL_TEMPBUFF9
	.extern ___X_BX_TEMPBUFF
	.extern ___X_BX_TEMPBUFF0
	.extern ___X_BX_TEMPBUFF1
	.extern ___X_BX_TEMPBUFF10
	.extern ___X_BX_TEMPBUFF11
	.extern ___X_BX_TEMPBUFF12
	.extern ___X_BX_TEMPBUFF13
	.extern ___X_BX_TEMPBUFF14
	.extern ___X_BX_TEMPBUFF15
	.extern ___X_BX_TEMPBUFF2
	.extern ___X_BX_TEMPBUFF3
	.extern ___X_BX_TEMPBUFF4
	.extern ___X_BX_TEMPBUFF5
	.extern ___X_BX_TEMPBUFF6
	.extern ___X_BX_TEMPBUFF7
	.extern ___X_BX_TEMPBUFF8
	.extern ___X_BX_TEMPBUFF9
	.extern ___X_BY_IOBUFFER_PTRS
	.extern ___X_BY_TEMPBUFF
	.extern ___X_BY_TEMPBUFF0
	.extern ___X_BY_TEMPBUFF1
	.extern ___X_BY_TEMPBUFF10
	.extern ___X_BY_TEMPBUFF11
	.extern ___X_BY_TEMPBUFF12
	.extern ___X_BY_TEMPBUFF13
	.extern ___X_BY_TEMPBUFF14
	.extern ___X_BY_TEMPBUFF15
	.extern ___X_BY_TEMPBUFF2
	.extern ___X_BY_TEMPBUFF3
	.extern ___X_BY_TEMPBUFF4
	.extern ___X_BY_TEMPBUFF5
	.extern ___X_BY_TEMPBUFF6
	.extern ___X_BY_TEMPBUFF7
	.extern ___X_BY_TEMPBUFF8
	.extern ___X_BY_TEMPBUFF9
	.extern ___X_VX_NEXTFRM_REINIT_REQ
	.extern ___X_VX_PPM_INPUTMODE
	.extern ___X_VX_PPM_INPUT_CHANNELS
	.extern ___X_VX_PPM_OUTPUTMODE
	.extern ___X_VX_PPM_OUTPUT_CHANNELS
	.extern ___X_VX_PPM_SAMPLERATE
	.extern ___X_VX_PPM_VALID_CHANNELS
	.extern ___X_VX_REINIT
	.extern ___X_VX_UNDERFLOW
	.extern _model3_mod_mcv
	.extern _model3_mod_mcv_HOST
	.public _model3_mod_mif
	.extern _model3_mod_background
	.extern _model3_mod_brick
	.extern _model3_mod_frame
	.extern _model3_mod_postKickstart
	.extern _model3_mod_postMallocInit
	.extern _model3_mod_preKickstart
	.extern _model3_mod_preMallocInit
	.extern _model3_mod_timer
Y_model3_mod_mif	.ydata_ovly
S_model3_mod_mif_0	.struct
_mcv_ptr	.dw (0x0)
_mct_ptr	.dw (0x0)
_reserved1	.dw (0x0)
_reserved2	.dw (0x0)
_reserved3	.dw (0x0)
_reserved4	.dw (0x0)
_reserved5	.dw (0x0)
_reserved6	.dw (0x0)
	.endstruct

Y_model3_mod_mct	.ydata_ovly
S_model3_mod_mct_0	.struct
_prekick_func_ptr	.dw (0x0)
_postkick_func_ptr	.dw (0x0)
_timer_func_ptr	.dw (0x0)
_frame_func_ptr	.dw (0x0)
_block_func_ptr	.dw (0x0)
_reserved1	.dw (0x0)
_background_func_ptr	.dw (0x0)
_postmalloc_func_ptr	.dw (0x0)
_premalloc_func_ptr	.dw (0x0)
	.endstruct

Y_model3_mod_mct	.ydata_ovly
_model3_mod_mct S_model3_mod_mct_0 (
 _model3_mod_preKickstart,
 _model3_mod_postKickstart,
 _model3_mod_timer,
 _model3_mod_frame,
 _model3_mod_brick,
 0x0,
 _model3_mod_background,
 _model3_mod_postMallocInit,
 _model3_mod_preMallocInit
)

Y_model3_mod_mif	.ydata_ovly
_model3_mod_mif S_model3_mod_mif_0 (
 _model3_mod_mcv_HOST,
 _model3_mod_mct,
 0x0,
 0x0,
 0x0,
 0x0,
 0x0,
 0x0
)

	.code_ovly
