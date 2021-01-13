	.public _dataLeft
	.public _dataRight
	.public _enabled
	.public _headroom
	.public _headroom_gain
	.public _input_gain
	.public _output_gain
	.public _sampleBuffer
	.public _samples
	.public _selected_mode
	.public _tremoloBuffer
	.public _tremoloLeftIterator
	.public _tremoloRightIterator
	.extern _calculate_gain
	.extern _cl_sin
	.extern _cl_wavread_bits_per_sample
	.extern _cl_wavread_close
	.extern _cl_wavread_frame_rate
	.extern _cl_wavread_getnchannels
	.extern _cl_wavread_number_of_frames
	.extern _cl_wavread_open
	.extern _cl_wavread_recvsample
	.extern _cl_wavwrite_close
	.extern _cl_wavwrite_open
	.extern _cl_wavwrite_sendsample
	.public _init
	.public _lfo
	.extern _load_tremolo
	.public _main
	.extern _memset
	.extern _printf
	.public _processBlock
	.public _processing
	.public _resetIterators
	.extern _strcpy
	.extern __mul_sat_laccum
	.extern __laccum_sat_accum
	.extern __div
	.xdata_ovly
__extractedConst_0_9
	.dw  (0x7fffffff)
	.xdata_ovly
__extractedConst_1_2
	.dw  (0x3d70a3d7)
	.xdata_ovly
__extractedConst_2_2
	.dw  (0x7d70a3d7)
	.ydata_ovly
_dataLeft
	.bss (0x6)
	.ydata_ovly
_dataRight
	.bss (0x6)
	.ydata_ovly
_enabled
	.dw  (0x1)
	.xdata_ovly
_headroom
	.bss (0x1)
	.ydata_ovly
_headroom_gain
	.bss (0x1)
	.ydata_ovly
_input_gain
	.bss (0x1)
	.ydata_ovly
_output_gain
	.bss (0x1)
	.xdata_ovly
_sampleBuffer
	.bss (0x80)
	.xdata_ovly
_samples
	.bss (0x5)
	.ydata_ovly
_selected_mode
	.dw  (0x1)
	.xdata_ovly
_string_const_0
	.dw  (0x45)
	.dw  (0x72)
	.dw  (0x72)
	.dw  (0x6f)
	.dw  (0x72)
	.dw  (0x3a)
	.dw  (0x20)
	.dw  (0x43)
	.dw  (0x6f)
	.dw  (0x75)
	.dw  (0x6c)
	.dw  (0x64)
	.dw  (0x20)
	.dw  (0x6e)
	.dw  (0x6f)
	.dw  (0x74)
	.dw  (0x20)
	.dw  (0x6f)
	.dw  (0x70)
	.dw  (0x65)
	.dw  (0x6e)
	.dw  (0x20)
	.dw  (0x77)
	.dw  (0x61)
	.dw  (0x76)
	.dw  (0x65)
	.dw  (0x66)
	.dw  (0x69)
	.dw  (0x6c)
	.dw  (0x65)
	.dw  (0x2e)
	.dw  (0xa)
	.dw  (0x0)
	.xdata_ovly
_string_const_1
	.dw  (0x45)
	.dw  (0x72)
	.dw  (0x72)
	.dw  (0x6f)
	.dw  (0x72)
	.dw  (0x3a)
	.dw  (0x20)
	.dw  (0x43)
	.dw  (0x6f)
	.dw  (0x75)
	.dw  (0x6c)
	.dw  (0x64)
	.dw  (0x20)
	.dw  (0x6e)
	.dw  (0x6f)
	.dw  (0x74)
	.dw  (0x20)
	.dw  (0x6f)
	.dw  (0x70)
	.dw  (0x65)
	.dw  (0x6e)
	.dw  (0x20)
	.dw  (0x77)
	.dw  (0x61)
	.dw  (0x76)
	.dw  (0x65)
	.dw  (0x66)
	.dw  (0x69)
	.dw  (0x6c)
	.dw  (0x65)
	.dw  (0x2e)
	.dw  (0xa)
	.dw  (0x0)
	.ydata_ovly
_tremoloBuffer
	.bss (0x20)
	.ydata_ovly
_tremoloLeftIterator
	.dw _tremoloBuffer
	.ydata_ovly
_tremoloRightIterator
	.dw _tremoloBuffer+16
	.code_ovly



_init:			/* LN: 37 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 37 | 
	i7 += 1			# LN: 37 | 
	i7 = i7 + (0x1)			# LN: 37 | 
	i1 = i7 - (0x1)			# LN: 37 | 
	xmem[i1] = i0			# LN: 37 | 
cline_37_0:			/* LN: 41 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 41 | 
	i0 = xmem[i0]			# LN: 41 | 
	a0 = xmem[__extractedConst_0_9 + 0]			# LN: 41 | 
	i0 += 1			# LN: 41 | 
	ymem[i0] = a0h			# LN: 41 | 
cline_41_0:			/* LN: 42 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 42 | 
	i0 = xmem[i0]			# LN: 42 | 
	a0 = xmem[__extractedConst_0_9 + 0]			# LN: 42 | 
	i0 += 2			# LN: 42 | 
	ymem[i0] = a0h			# LN: 42 | 
cline_42_0:			/* LN: 43 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 43 | 
	i0 = xmem[i0]			# LN: 43 | 
	uhalfword(a0) = (0x1)			# LN: 43 | 
	i0 = i0 + (0x3)			# LN: 43 | 
	ymem[i0] = a0h			# LN: 43 | 
cline_43_0:			/* LN: 44 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 44 | 
	i0 = xmem[i0]			# LN: 44 | 
	a0 = 0			# LN: 44 | 
	i0 = i0 + (0x4)			# LN: 44 | 
	ymem[i0] = a0h			# LN: 44 | 
cline_44_0:			/* LN: 45 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 45 | 
	i0 = xmem[i0]			# LN: 45 | 
	uhalfword(a0) = (0xaec3)			# LN: 45 | 
	i0 = i0 + (0x5)			# LN: 45 | 
	ymem[i0] = a0h			# LN: 45 | 
cline_45_0:			/* LN: 46 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_264)			# LN: 46 | 
__epilogue_264:			/* LN: 46 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x1)			# LN: 46 | 
	i7 -= 1			# LN: 46 | 
	ret			# LN: 46 | 



_lfo:			/* LN: 49 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 49 | 
	i7 += 1			# LN: 49 | 
	i7 = i7 + (0x2)			# LN: 49 | 
	i0 = i7 - (0x1)			# LN: 49 | 
	xmem[i0] = a0h			# LN: 49 | 
	i0 = i7 - (0x2)			# LN: 49 | 
	xmem[i0] = a1h			# LN: 49 | 
cline_49_0:			/* LN: 53 | CYCLE: 0 | RULES: () */ 
switch_0:			/* LN: 53 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 53 | 
	a0 = xmem[i0]			# LN: 53 | 
	uhalfword(a1) = (0x2)			# LN: 53 | 
	a0 - a1			# LN: 53 | 
	if (a == 0) jmp (case_0)			# LN: 53 | 
	i0 = i7 - (0x2)			# LN: 53 | 
	a0 = xmem[i0]			# LN: 53 | 
	uhalfword(a1) = (0x3)			# LN: 53 | 
	a0 - a1			# LN: 53 | 
	if (a == 0) jmp (case_1)			# LN: 53 | 
	i0 = i7 - (0x2)			# LN: 53 | 
	a0 = xmem[i0]			# LN: 53 | 
	uhalfword(a1) = (0x4)			# LN: 53 | 
	a0 - a1			# LN: 53 | 
	if (a == 0) jmp (case_2)			# LN: 53 | 
	jmp (default_0)			# LN: 53 | 
cline_53_0:			/* LN: 59 | CYCLE: 0 | RULES: () */ 
case_0:			/* LN: 57 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 59 | 
	a0 = xmem[i0]			# LN: 59 | 
	a1 = (0x2000)			# LN: 59 | 
	a0 - a1			# LN: 59 | 
	if (a >= 0) jmp (else_0)			# LN: 59 | 
cline_59_0:			/* LN: 61 | CYCLE: 0 | RULES: () */ 
	uhalfword(x0) = (0x2)			# LN: 61 | 
	i0 = i7 - (0x1)			# LN: 61 | 
	x1 = xmem[i0]			# LN: 61 | 
	a0 = x0 * x1			# LN: 61 | 
	a0 = a0 >> 1			# LN: 61 | 
	AnyReg(a0h, a0l)			# LN: 61 | 
	a0l = (0x0)			# LN: 61 | 
	a1 = (0x4000)			# LN: 61 | 
	a0 = a1 + a0			# LN: 61 | 
	jmp (__epilogue_266)			# LN: 61 | 
cline_61_0:			/* LN: 63 | CYCLE: 0 | RULES: () */ 
else_0:			/* LN: 59 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 63 | 
	a0 = xmem[i0]			# LN: 63 | 
	a1 = (0x6000)			# LN: 63 | 
	a0 - a1			# LN: 63 | 
	if (a >= 0) jmp (else_1)			# LN: 63 | 
cline_63_0:			/* LN: 65 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 65 | 
	a0 = xmem[i0]			# LN: 65 | 
	a1 = (0x2000)			# LN: 65 | 
	a0 = a0 - a1			# LN: 65 | 
	x0 = a0h			# LN: 65 | 
	uhalfword(x1) = (0x2)			# LN: 65 | 
	a0 = x1 * x0			# LN: 65 | 
	a0 = a0 >> 1			# LN: 65 | 
	AnyReg(a0h, a0l)			# LN: 65 | 
	a0l = (0x0)			# LN: 65 | 
	a1 = xmem[__extractedConst_0_9 + 0]			# LN: 65 | 
	a0 = a1 - a0			# LN: 65 | 
	jmp (__epilogue_266)			# LN: 65 | 
cline_65_0:			/* LN: 69 | CYCLE: 0 | RULES: () */ 
else_1:			/* LN: 63 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 69 | 
	a0 = xmem[i0]			# LN: 69 | 
	a1 = (0x6000)			# LN: 69 | 
	a0 = a0 - a1			# LN: 69 | 
	x0 = a0h			# LN: 69 | 
	uhalfword(x1) = (0x2)			# LN: 69 | 
	a0 = x1 * x0			# LN: 69 | 
	a0 = a0 >> 1			# LN: 69 | 
	AnyReg(a0h, a0l)			# LN: 69 | 
	a0l = (0x0)			# LN: 69 | 
	jmp (__epilogue_266)			# LN: 69 | 
cline_53_1:			/* LN: 73 | CYCLE: 0 | RULES: () */ 
case_1:			/* LN: 71 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 73 | 
	a0 = xmem[i0]			# LN: 73 | 
	a1 = (0x4000)			# LN: 73 | 
	a0 - a1			# LN: 73 | 
	if (a >= 0) jmp (else_2)			# LN: 73 | 
cline_73_0:			/* LN: 75 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[__extractedConst_0_9 + 0]			# LN: 75 | 
	jmp (__epilogue_266)			# LN: 75 | 
cline_75_0:			/* LN: 79 | CYCLE: 0 | RULES: () */ 
else_2:			/* LN: 73 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 79 | 
	jmp (__epilogue_266)			# LN: 79 | 
cline_53_2:			/* LN: 83 | CYCLE: 0 | RULES: () */ 
case_2:			/* LN: 81 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 83 | 
	a0 = xmem[i0]			# LN: 83 | 
	a1 = xmem[__extractedConst_1_2 + 0]			# LN: 83 | 
	a0 - a1			# LN: 83 | 
	if (a >= 0) jmp (else_3)			# LN: 83 | 
cline_83_0:			/* LN: 85 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[__extractedConst_0_9 + 0]			# LN: 85 | 
	jmp (__epilogue_266)			# LN: 85 | 
cline_85_0:			/* LN: 87 | CYCLE: 0 | RULES: () */ 
else_3:			/* LN: 83 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 87 | 
	a0 = xmem[i0]			# LN: 87 | 
	a1 = (0x4000)			# LN: 87 | 
	a0 - a1			# LN: 87 | 
	if (a >= 0) jmp (else_4)			# LN: 87 | 
cline_87_0:			/* LN: 89 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 89 | 
	a0 = xmem[i0]			# LN: 89 | 
	a1 = xmem[__extractedConst_1_2 + 0]			# LN: 89 | 
	a0 = a0 - a1			# LN: 89 | 
	x0 = a0h			# LN: 89 | 
	uhalfword(x1) = (0x32)			# LN: 89 | 
	a0 = x1 * x0			# LN: 89 | 
	a0 = a0 >> 1			# LN: 89 | 
	AnyReg(a0h, a0l)			# LN: 89 | 
	a0l = (0x0)			# LN: 89 | 
	a1 = xmem[__extractedConst_0_9 + 0]			# LN: 89 | 
	a0 = a1 - a0			# LN: 89 | 
	jmp (__epilogue_266)			# LN: 89 | 
cline_89_0:			/* LN: 91 | CYCLE: 0 | RULES: () */ 
else_4:			/* LN: 87 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 91 | 
	a0 = xmem[i0]			# LN: 91 | 
	a1 = xmem[__extractedConst_2_2 + 0]			# LN: 91 | 
	a0 - a1			# LN: 91 | 
	if (a >= 0) jmp (else_5)			# LN: 91 | 
cline_91_0:			/* LN: 93 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 93 | 
	jmp (__epilogue_266)			# LN: 93 | 
cline_93_0:			/* LN: 97 | CYCLE: 0 | RULES: () */ 
else_5:			/* LN: 91 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 97 | 
	a0 = xmem[i0]			# LN: 97 | 
	a1 = xmem[__extractedConst_2_2 + 0]			# LN: 97 | 
	a0 = a0 - a1			# LN: 97 | 
	x0 = a0h			# LN: 97 | 
	uhalfword(x1) = (0x32)			# LN: 97 | 
	a0 = x1 * x0			# LN: 97 | 
	a0 = a0 >> 1			# LN: 97 | 
	AnyReg(a0h, a0l)			# LN: 97 | 
	a0l = (0x0)			# LN: 97 | 
	jmp (__epilogue_266)			# LN: 97 | 
cline_53_3:			/* LN: 104 | CYCLE: 0 | RULES: () */ 
default_0:			/* LN: 99 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 104 | 
	a0 = xmem[i0]			# LN: 104 | 
	a0 = a0 << 1			# LN: 104 | 
	call (_cl_sin)			# LN: 104 | 
	a1 = (0x4000)			# LN: 104 | 
	call (__mul_sat_laccum)			# LN: 104 | 
	call (__laccum_sat_accum)			# LN: 104 | 
	a0 = a1 + a0			# LN: 104 | 
	a0 = a0			# LN: 104 | 
	jmp (__epilogue_266)			# LN: 104 | 
cline_53_4:			/* LN: 108 | CYCLE: 0 | RULES: () */ 
__epilogue_266:			/* LN: 108 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x2)			# LN: 108 | 
	i7 -= 1			# LN: 108 | 
	ret			# LN: 108 | 



	# This construction should ensure linking of crt0 in case when target is a standalone program without the OS
	.if defined(_OVLY_)
		.if .strcmp('standalone',_OVLY_)=0
		.if .strcmp('crystal32',_TARGET_FAMILY_)=0
			.extern __start         # dummy use of __start to force linkage of crt0
dummy		.equ(__start)
		.else
			.extern __intvec         # dummy use of __intvec to force linkage of intvec
dummy		.equ(__intvec)
		.endif
		.endif
	.endif

_main:			/* LN: 124 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 124 | 
	i7 += 1			# LN: 124 | 
	i7 = i7 + (0x20f)			# LN: 124 | 
	i1 = i7 - (0x1)			# LN: 124 | 
	xmem[i1] = a0h			# LN: 124 | 
	i1 = i7 - (0x2)			# LN: 124 | 
	xmem[i1] = i0			# LN: 124 | 
cline_124_0:			/* LN: 142 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 142 | 
	a0 = 0			# LN: 142 | 
	xmem[i0] = a0h			# LN: 142 | 
	do (0x8), label_end_92			# LN: 142 | 
cline_142_0:			/* LN: 143 | CYCLE: 0 | RULES: () */ 
label_begin_92:			/* LN: 142 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 143 | 
	a1 = xmem[i0]; a0 = 0			# LN: 143, 143 | 
	a1 = a1 << 4			# LN: 143 | 
	i0 = a1			# LN: 143 | 
	uhalfword(a1) = (0x10)			# LN: 143 | 
	i0 = i0 + (_sampleBuffer + 0)			# LN: 143 | 
	call (_memset)			# LN: 143 | 
cline_143_0:			/* LN: 142 | CYCLE: 0 | RULES: () */ 
init_latch_label_1:			/* LN: 143 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 142 | 
	a0 = xmem[i0]			# LN: 142 | 
	uhalfword(a1) = (0x1)			# LN: 142 | 
	a0 = a0 + a1			# LN: 142 | 
	i0 = i7 - (0x3)			# LN: 142 | 
label_end_92:			# LN: 142 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 142 | 
cline_142_1:			/* LN: 147 | CYCLE: 0 | RULES: () */ 
for_end_1:			/* LN: 142 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 147 | 
	i0 = xmem[i0]			# LN: 147 | 
	i1 = i7 - (259 - 0)			# LN: 147 | 
	i4 = xmem[i0]			# LN: 147 | 
	i0 = i1			# LN: 147 | 
	i1 = i4			# LN: 147 | 
	call (_strcpy)			# LN: 147 | 
cline_147_0:			/* LN: 148 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (259 - 0)			# LN: 148 | 
	call (_cl_wavread_open)			# LN: 148 | 
	AnyReg(i0, a0h)			# LN: 148 | 
	i1 = i7 - (0x104)			# LN: 148 | 
	xmem[i1] = i0			# LN: 148 | 
cline_148_1:			/* LN: 149 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x104)			# LN: 149 | 
	a0 = xmem[i0]			# LN: 149 | 
	a0 & a0			# LN: 149 | 
	if (a != 0) jmp (else_7)			# LN: 149 | 
cline_149_0:			/* LN: 151 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_string_const_0)			# LN: 151 | 
	call (_printf)			# LN: 151 | 
cline_151_0:			/* LN: 152 | CYCLE: 0 | RULES: () */ 
	halfword(a0) = (0xffff)			# LN: 152 | 
	jmp (__epilogue_274)			# LN: 152 | 
cline_152_0:			/* LN: 158 | CYCLE: 0 | RULES: () */ 
endif_7:			/* LN: 149 | CYCLE: 0 | RULES: () */ 
else_7:			/* LN: 149 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x104)			# LN: 158 | 
	i0 = xmem[i0]			# LN: 158 | 
	call (_cl_wavread_getnchannels)			# LN: 158 | 
	i0 = i7 - (0x105)			# LN: 158 | 
	xmem[i0] = a0h			# LN: 158 | 
cline_158_0:			/* LN: 159 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x104)			# LN: 159 | 
	i0 = xmem[i0]			# LN: 159 | 
	call (_cl_wavread_bits_per_sample)			# LN: 159 | 
	i0 = i7 - (0x106)			# LN: 159 | 
	xmem[i0] = a0h			# LN: 159 | 
cline_159_0:			/* LN: 160 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x104)			# LN: 160 | 
	i0 = xmem[i0]			# LN: 160 | 
	call (_cl_wavread_frame_rate)			# LN: 160 | 
	i0 = i7 - (0x107)			# LN: 160 | 
	xmem[i0] = a0h			# LN: 160 | 
cline_160_0:			/* LN: 161 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x104)			# LN: 161 | 
	i0 = xmem[i0]			# LN: 161 | 
	call (_cl_wavread_number_of_frames)			# LN: 161 | 
	i0 = i7 - (0x108)			# LN: 161 | 
	xmem[i0] = a0h			# LN: 161 | 
cline_161_1:			/* LN: 164 | CYCLE: 0 | RULES: () */ 
	a0 = ymem[_selected_mode + 0]			# LN: 164 | 
	uhalfword(a1) = (0x2)			# LN: 164 | 
	a0g = (0x0)			# LN: 164 | 
	a1g = (0x0)			# LN: 164 | 
	a0 - a1			# LN: 164 | 
	if (a != 0) jmp (else_8)			# LN: 164 | 
cline_164_0:			/* LN: 165 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x109)			# LN: 165 | 
	uhalfword(a0) = (0x3)			# LN: 165 | 
	xmem[i0] = a0h			# LN: 165 | 
	jmp (endif_8)			# LN: 165 | 
cline_165_0:			/* LN: 167 | CYCLE: 0 | RULES: () */ 
else_8:			/* LN: 164 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x109)			# LN: 167 | 
	a0 = 0			# LN: 167 | 
	xmem[i0] = a0h			# LN: 167 | 
cline_167_0:			/* LN: 169 | CYCLE: 0 | RULES: () */ 
endif_8:			/* LN: 164 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x105)			# LN: 169 | 
	a0 = xmem[i0]			# LN: 169 | 
	i0 = i7 - (0x109)			# LN: 169 | 
	a1 = xmem[i0]			# LN: 169 | 
	a0 = a0 + a1			# LN: 169 | 
	i0 = i7 - (0x105)			# LN: 169 | 
	xmem[i0] = a0h			# LN: 169 | 
cline_169_0:			/* LN: 173 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 173 | 
	i0 = xmem[i0]			# LN: 173 | 
	i1 = i7 - (521 - 0)			# LN: 173 | 
	i0 += 1			# LN: 173 | 
	i4 = xmem[i0]			# LN: 173 | 
	i0 = i1			# LN: 173 | 
	i1 = i4			# LN: 173 | 
	call (_strcpy)			# LN: 173 | 
cline_173_0:			/* LN: 174 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (521 - 0)			# LN: 174 | 
	i1 = i7 - (0x105)			# LN: 174 | 
	a0 = xmem[i1]			# LN: 174 | 
	i1 = i7 - (0x109)			# LN: 174 | 
	a1 = xmem[i1]			# LN: 174 | 
	i1 = i7 - (0x106)			# LN: 174 | 
	a0 = xmem[i1]; a1 = a0 + a1			# LN: 174, 174 | 
	i1 = i7 - (0x107)			# LN: 174 | 
	b0 = xmem[i1]			# LN: 174 | 
	call (_cl_wavwrite_open)			# LN: 174 | 
	AnyReg(i0, a0h)			# LN: 174 | 
	i1 = i7 - (0x20a)			# LN: 174 | 
	xmem[i1] = i0			# LN: 174 | 
cline_174_0:			/* LN: 175 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 175 | 
	a0 = xmem[i0]			# LN: 175 | 
	a0 & a0			# LN: 175 | 
	if (a != 0) jmp (else_9)			# LN: 175 | 
cline_175_0:			/* LN: 177 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_string_const_1)			# LN: 177 | 
	call (_printf)			# LN: 177 | 
cline_177_0:			/* LN: 178 | CYCLE: 0 | RULES: () */ 
	halfword(a0) = (0xffff)			# LN: 178 | 
	jmp (__epilogue_274)			# LN: 178 | 
cline_178_0:			/* LN: 183 | CYCLE: 0 | RULES: () */ 
endif_9:			/* LN: 175 | CYCLE: 0 | RULES: () */ 
else_9:			/* LN: 175 | CYCLE: 0 | RULES: () */ 
	a0 = ymem[_selected_mode + 0]			# LN: 183 | 
	uhalfword(a1) = (0x1)			# LN: 183 | 
	a0g = (0x0)			# LN: 183 | 
	a1g = (0x0)			# LN: 183 | 
	a0 - a1			# LN: 183 | 
	if (a != 0) jmp (else_10)			# LN: 183 | 
cline_183_0:			/* LN: 184 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20b)			# LN: 184 | 
	uhalfword(a0) = (0x3)			# LN: 184 | 
	xmem[i0] = a0h			# LN: 184 | 
	jmp (endif_10)			# LN: 184 | 
cline_184_0:			/* LN: 186 | CYCLE: 0 | RULES: () */ 
else_10:			/* LN: 183 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20b)			# LN: 186 | 
	a0 = 0			# LN: 186 | 
	xmem[i0] = a0h			# LN: 186 | 
cline_186_0:			/* LN: 197 | CYCLE: 0 | RULES: () */ 
endif_10:			/* LN: 183 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 197 | 
	a0 = 0			# LN: 197 | 
	xmem[i0] = a0h			# LN: 197 | 
for_2:			/* LN: 197 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x108)			# LN: 197 | 
	a0 = xmem[i0]			# LN: 197 | 
	uhalfword(a1) = (0x10)			# LN: 197 | 
	call (__div)			# LN: 197 | 
	i0 = i7 - (0x20c)			# LN: 197 | 
	a1 = xmem[i0]			# LN: 197 | 
	a1 - a0			# LN: 197 | 
	if (a >= 0) jmp (for_end_2)			# LN: 197 | 
cline_197_0:			/* LN: 199 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20d)			# LN: 199 | 
	a0 = 0			# LN: 199 | 
	xmem[i0] = a0h			# LN: 199 | 
	do (0x10), label_end_94			# LN: 199 | 
cline_199_0:			/* LN: 201 | CYCLE: 0 | RULES: () */ 
label_begin_94:			/* LN: 199 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20e)			# LN: 201 | 
	a0 = 0			# LN: 201 | 
	xmem[i0] = a0h			# LN: 201 | 
	do (0x2), label_end_93			# LN: 201 | 
cline_201_0:			/* LN: 203 | CYCLE: 0 | RULES: () */ 
label_begin_93:			/* LN: 201 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x104)			# LN: 203 | 
	i0 = xmem[i0]			# LN: 203 | 
	call (_cl_wavread_recvsample)			# LN: 203 | 
	i0 = i7 - (0x20f)			# LN: 203 | 
	xmem[i0] = a0h			# LN: 203 | 
cline_203_0:			/* LN: 204 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20e)			# LN: 204 | 
	a0 = xmem[i0]			# LN: 204 | 
	a0 = a0 << 4			# LN: 204 | 
	i0 = a0			# LN: 204 | 
	i1 = i7 - (0x20d)			# LN: 204 | 
	i0 = i0 + (_sampleBuffer + 0)			# LN: 204 | 
	a0 = xmem[i1]			# LN: 204 | 
	a1 = i0			# LN: 204 | 
	a0 = a1 + a0			# LN: 204 | 
	AnyReg(i0, a0h)			# LN: 204 | 
	i1 = i7 - (0x20f)			# LN: 204 | 
	a0 = xmem[i1]			# LN: 204 | 
	xmem[i0] = a0h			# LN: 204 | 
cline_204_0:			/* LN: 201 | CYCLE: 0 | RULES: () */ 
init_latch_label_2:			/* LN: 205 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20e)			# LN: 201 | 
	a0 = xmem[i0]			# LN: 201 | 
	uhalfword(a1) = (0x1)			# LN: 201 | 
	a0 = a0 + a1			# LN: 201 | 
	i0 = i7 - (0x20e)			# LN: 201 | 
label_end_93:			# LN: 201 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 201 | 
cline_201_1:			/* LN: 199 | CYCLE: 0 | RULES: () */ 
init_latch_label_3:			/* LN: 206 | CYCLE: 0 | RULES: () */ 
for_end_4:			/* LN: 201 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20d)			# LN: 199 | 
	a0 = xmem[i0]			# LN: 199 | 
	uhalfword(a1) = (0x1)			# LN: 199 | 
	a0 = a0 + a1			# LN: 199 | 
	i0 = i7 - (0x20d)			# LN: 199 | 
label_end_94:			# LN: 199 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 199 | 
cline_199_1:			/* LN: 208 | CYCLE: 0 | RULES: () */ 
for_end_3:			/* LN: 199 | CYCLE: 0 | RULES: () */ 
	a0 = ymem[_enabled + 0]			# LN: 208 | 
	a0g = (0x0)			# LN: 208 | 
	a0 & a0			# LN: 208 | 
	if (a == 0) jmp (else_11)			# LN: 208 | 
	call (_processing)			# LN: 208 | 
	jmp (endif_11)			# LN: 208 | 
cline_208_0:			/* LN: 210 | CYCLE: 0 | RULES: () */ 
endif_11:			/* LN: 208 | CYCLE: 0 | RULES: () */ 
else_11:			/* LN: 208 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20d)			# LN: 210 | 
	a0 = 0			# LN: 210 | 
	xmem[i0] = a0h			# LN: 210 | 
	do (0x10), label_end_95			# LN: 210 | 
cline_210_0:			/* LN: 212 | CYCLE: 0 | RULES: () */ 
label_begin_95:			/* LN: 210 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20e)			# LN: 212 | 
	a0 = 0			# LN: 212 | 
	xmem[i0] = a0h			# LN: 212 | 
for_6:			/* LN: 212 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20e)			# LN: 212 | 
	a0 = xmem[i0]			# LN: 212 | 
	i0 = i7 - (0x105)			# LN: 212 | 
	a1 = xmem[i0]			# LN: 212 | 
	a0 - a1			# LN: 212 | 
	if (a >= 0) jmp (for_end_6)			# LN: 212 | 
cline_212_0:			/* LN: 214 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20e)			# LN: 214 | 
	a0 = xmem[i0]			# LN: 214 | 
	i0 = i7 - (0x20b)			# LN: 214 | 
	a1 = xmem[i0]			# LN: 214 | 
	a0 = a0 + a1			# LN: 214 | 
	a0 = a0 << 4			# LN: 214 | 
	i0 = a0			# LN: 214 | 
	i1 = i7 - (0x20d)			# LN: 214 | 
	i0 = i0 + (_sampleBuffer + 0)			# LN: 214 | 
	a0 = xmem[i1]			# LN: 214 | 
	a1 = i0			# LN: 214 | 
	a0 = a1 + a0			# LN: 214 | 
	AnyReg(i0, a0h)			# LN: 214 | 
	i1 = i7 - (0x20f)			# LN: 214 | 
	a0 = xmem[i0]			# LN: 214 | 
	xmem[i1] = a0h			# LN: 214 | 
cline_214_0:			/* LN: 215 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 215 | 
	i1 = i7 - (0x20f)			# LN: 215 | 
	a0 = xmem[i1]			# LN: 215 | 
	i0 = xmem[i0]			# LN: 215 | 
	call (_cl_wavwrite_sendsample)			# LN: 215 | 
cline_215_0:			/* LN: 212 | CYCLE: 0 | RULES: () */ 
init_latch_label_4:			/* LN: 216 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20e)			# LN: 212 | 
	a0 = xmem[i0]			# LN: 212 | 
	uhalfword(a1) = (0x1)			# LN: 212 | 
	a0 = a0 + a1			# LN: 212 | 
	i0 = i7 - (0x20e)			# LN: 212 | 
	xmem[i0] = a0h			# LN: 212 | 
	jmp (for_6)			# LN: 212 | 
cline_212_1:			/* LN: 210 | CYCLE: 0 | RULES: () */ 
init_latch_label_5:			/* LN: 217 | CYCLE: 0 | RULES: () */ 
for_end_6:			/* LN: 212 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20d)			# LN: 210 | 
	a0 = xmem[i0]			# LN: 210 | 
	uhalfword(a1) = (0x1)			# LN: 210 | 
	a0 = a0 + a1			# LN: 210 | 
	i0 = i7 - (0x20d)			# LN: 210 | 
label_end_95:			# LN: 210 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 210 | 
cline_210_1:			/* LN: 197 | CYCLE: 0 | RULES: () */ 
init_latch_label_6:			/* LN: 218 | CYCLE: 0 | RULES: () */ 
for_end_5:			/* LN: 210 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 197 | 
	a0 = xmem[i0]			# LN: 197 | 
	uhalfword(a1) = (0x1)			# LN: 197 | 
	a0 = a0 + a1			# LN: 197 | 
	i0 = i7 - (0x20c)			# LN: 197 | 
	xmem[i0] = a0h			# LN: 197 | 
	jmp (for_2)			# LN: 197 | 
cline_197_1:			/* LN: 223 | CYCLE: 0 | RULES: () */ 
for_end_2:			/* LN: 197 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x104)			# LN: 223 | 
	i0 = xmem[i0]			# LN: 223 | 
	call (_cl_wavread_close)			# LN: 223 | 
cline_223_0:			/* LN: 224 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 224 | 
	i0 = xmem[i0]			# LN: 224 | 
	call (_cl_wavwrite_close)			# LN: 224 | 
cline_224_0:			/* LN: 227 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 227 | 
	jmp (__epilogue_274)			# LN: 227 | 
cline_227_0:			/* LN: 228 | CYCLE: 0 | RULES: () */ 
__epilogue_274:			/* LN: 228 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x20f)			# LN: 228 | 
	i7 -= 1			# LN: 228 | 
	ret			# LN: 228 | 



_processBlock:			/* LN: 113 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 113 | 
	i7 += 1			# LN: 113 | 
	i7 = i7 + (0x5)			# LN: 113 | 
	i5 = i7 - (0x1)			# LN: 113 | 
	xmem[i5] = i0			# LN: 113 | 
	i0 = i7 - (0x2)			# LN: 113 | 
	xmem[i0] = i1			# LN: 113 | 
	i0 = i7 - (0x3)			# LN: 113 | 
	xmem[i0] = i4			# LN: 113 | 
cline_113_0:			/* LN: 131 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 131 | 
	i0 = xmem[i0]			# LN: 131 | 
	i1 = i7 - (0x4)			# LN: 131 | 
	i0 = i0 + (0x4)			# LN: 131 | 
	a0 = ymem[i0]			# LN: 131 | 
	xmem[i1] = a0h			# LN: 131 | 
cline_131_0:			/* LN: 135 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 135 | 
	a0 = 0			# LN: 135 | 
	xmem[i0] = a0h			# LN: 135 | 
	do (0x10), label_end_96			# LN: 135 | 
cline_135_0:			/* LN: 141 | CYCLE: 0 | RULES: () */ 
label_begin_96:			/* LN: 135 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 141 | 
	a0 = xmem[i0]			# LN: 141 | 
	i0 = i7 - (0x2)			# LN: 141 | 
	a1 = xmem[i0]			# LN: 141 | 
	i0 = i7 - (0x5)			# LN: 141 | 
	b0 = xmem[i0]; a0 = a1 + a0			# LN: 141, 141 | 
	i0 = i7 - (0x1)			# LN: 141 | 
	a1 = xmem[i0]			# LN: 141 | 
	a1 = a1 + b0			# LN: 141 | 
	AnyReg(i0, a1h)			# LN: 141 | 
	AnyReg(i1, a0h)			# LN: 141 | 
	y0 = ymem[i0]			# LN: 141 | 
	i0 = i7 - (0x3)			# LN: 141 | 
	i0 = xmem[i0]			# LN: 141 | 
	i4 = i7 - (0x3)			# LN: 141 | 
	i4 = xmem[i4]			# LN: 141 | 
	i0 += 2			# LN: 141 | 
	i4 = i4 + (0x3)			# LN: 141 | 
	a1 = ymem[i4]			# LN: 141 | 
	i4 = i7 - (0x4)			# LN: 141 | 
	a0 = xmem[i4]			# LN: 141 | 
	y1 = ymem[i0]			# LN: 141 | 
	call (_lfo)			# LN: 141 | 
	a1 = xmem[__extractedConst_0_9 + 0]			# LN: 141 | 
	x0 = a0h; a0 =+ a1			# LN: 141, 141 | 
	a0 -= y1 * x0			# LN: 141 | 
	x0 = a0			# LN: 141 | 
	a0 = y0 * x0			# LN: 141 | 
	ymem[i1] = a0			# LN: 141 | 
cline_141_0:			/* LN: 145 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 145 | 
	i0 = xmem[i0]			# LN: 145 | 
	i1 = i7 - (0x3)			# LN: 145 | 
	i0 += 1			# LN: 145 | 
	i1 = xmem[i1]			# LN: 145 | 
	x0 = ymem[i0]			# LN: 145 | 
	i0 = i1 + (0x5)			# LN: 145 | 
	i1 = i7 - (0x4)			# LN: 145 | 
	a0 = xmem[i1]			# LN: 145 | 
	x1 = ymem[i0]			# LN: 145 | 
	a0 += x0 * x1			# LN: 145 | 
	i0 = i7 - (0x4)			# LN: 145 | 
	xmem[i0] = a0h			# LN: 145 | 
cline_145_0:			/* LN: 146 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 146 | 
	a0 = xmem[i0]			# LN: 146 | 
	a0 = a0 << 1			# LN: 146 | 
	i0 = i7 - (0x4)			# LN: 146 | 
	xmem[i0] = a0h			# LN: 146 | 
cline_146_0:			/* LN: 148 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 148 | 
	a0 = xmem[i0]			# LN: 148 | 
	a1 = xmem[__extractedConst_0_9 + 0]			# LN: 148 | 
	a0 - a1			# LN: 148 | 
	if (a < 0) jmp (else_6)			# LN: 148 | 
cline_148_0:			/* LN: 150 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 150 | 
	a0 = xmem[i0]			# LN: 150 | 
	a1 = xmem[__extractedConst_0_9 + 0]			# LN: 150 | 
	a0 = a0 - a1			# LN: 150 | 
	i0 = i7 - (0x4)			# LN: 150 | 
	xmem[i0] = a0h			# LN: 150 | 
	jmp (endif_6)			# LN: 150 | 
cline_150_0:			/* LN: 135 | CYCLE: 0 | RULES: () */ 
init_latch_label_0:			/* LN: 152 | CYCLE: 0 | RULES: () */ 
endif_6:			/* LN: 148 | CYCLE: 0 | RULES: () */ 
else_6:			/* LN: 148 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 135 | 
	a0 = xmem[i0]			# LN: 135 | 
	uhalfword(a1) = (0x1)			# LN: 135 | 
	a0 = a0 + a1			# LN: 135 | 
	i0 = i7 - (0x5)			# LN: 135 | 
label_end_96:			# LN: 135 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 135 | 
cline_135_1:			/* LN: 161 | CYCLE: 0 | RULES: () */ 
for_end_0:			/* LN: 135 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 161 | 
	i0 = xmem[i0]			# LN: 161 | 
	i1 = i7 - (0x4)			# LN: 161 | 
	i0 = i0 + (0x4)			# LN: 161 | 
	a0 = xmem[i1]			# LN: 161 | 
	ymem[i0] = a0h			# LN: 161 | 
cline_161_0:			/* LN: 163 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_268)			# LN: 163 | 
__epilogue_268:			/* LN: 163 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x5)			# LN: 163 | 
	i7 -= 1			# LN: 163 | 
	ret			# LN: 163 | 



_processing:			/* LN: 115 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 115 | 
	i7 += 1			# LN: 115 | 
cline_115_0:			/* LN: 117 | CYCLE: 0 | RULES: () */ 
	call (_load_tremolo)			# LN: 117 | 
cline_117_0:			/* LN: 119 | CYCLE: 0 | RULES: () */ 
	call (_calculate_gain)			# LN: 119 | 
cline_119_0:			/* LN: 121 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_272)			# LN: 121 | 
__epilogue_272:			/* LN: 121 | CYCLE: 0 | RULES: () */ 
	i7 -= 1			# LN: 121 | 
	ret			# LN: 121 | 



_resetIterators:			/* LN: 35 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 35 | 
	i7 += 1			# LN: 35 | 
cline_35_0:			/* LN: 37 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_sampleBuffer + 0)			# LN: 37 | 
	xmem[_samples + 0] = i0			# LN: 37 | 
cline_37_1:			/* LN: 38 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_sampleBuffer + 16)			# LN: 38 | 
	xmem[_samples + 1] = i0			# LN: 38 | 
cline_38_0:			/* LN: 39 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_sampleBuffer + 32)			# LN: 39 | 
	xmem[_samples + 2] = i0			# LN: 39 | 
cline_39_0:			/* LN: 40 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_sampleBuffer + 48)			# LN: 40 | 
	xmem[_samples + 3] = i0			# LN: 40 | 
cline_40_0:			/* LN: 41 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_sampleBuffer + 64)			# LN: 41 | 
	xmem[_samples + 4] = i0			# LN: 41 | 
cline_41_1:			/* LN: 42 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_270)			# LN: 42 | 
__epilogue_270:			/* LN: 42 | CYCLE: 0 | RULES: () */ 
	i7 -= 1			# LN: 42 | 
	ret			# LN: 42 | 
