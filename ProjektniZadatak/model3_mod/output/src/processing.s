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
	.public _init
	.public _lfo
	.extern _load_tremolo
	.public _processBlock
	.public _processing
	.public _resetIterators
	.extern __mul_sat_laccum
	.extern __laccum_sat_accum
X_samples	.xdata_ovly
S_samples_0	.struct
_sampleLeftIterator	.dw (0x0)
_sampleRightIterator	.dw (0x0)
_sampleCenterIterator	.dw (0x0)
_sampleLSIterator	.dw (0x0)
_sampleRSIterator	.dw (0x0)
	.endstruct

Y_dataRight	.ydata_ovly
S_dataRight_0	.struct
_numChannels	.dw (0x0)
_LFO_frequency	.dw (0x0)
_depth	.dw (0x0)
_waveform	.dw (0x0)
_lfoPhase	.dw (0x0)
_inverseSampleRate	.dw (0x0)
	.endstruct

X__extractedConst_0_9	.xdata_ovly
__extractedConst_0_9
	.dw  (0x7fffffff)
X__extractedConst_1_2	.xdata_ovly
__extractedConst_1_2
	.dw  (0x3d70a3d7)
X__extractedConst_2_2	.xdata_ovly
__extractedConst_2_2
	.dw  (0x7d70a3d7)
Y_dataLeft	.ydata_ovly
_dataLeft S_dataRight_0

Y_dataRight	.ydata_ovly
_dataRight S_dataRight_0

Y_enabled	.ydata_ovly
_enabled
	.dw  (0x1)
X_headroom	.xdata_ovly
_headroom
	.bss (0x1)
Y_headroom_gain	.ydata_ovly
_headroom_gain
	.bss (0x1)
Y_input_gain	.ydata_ovly
_input_gain
	.bss (0x1)
Y_output_gain	.ydata_ovly
_output_gain
	.bss (0x1)
X_sampleBuffer	.xdata_ovly
_sampleBuffer
	.bss (0x80)
X_samples	.xdata_ovly
_samples S_samples_0

Y_selected_mode	.ydata_ovly
_selected_mode
	.dw  (0x1)
Y_tremoloBuffer	.ydata_ovly
_tremoloBuffer
	.bss (0x20)
Y_tremoloLeftIterator	.ydata_ovly
_tremoloLeftIterator
	.dw _tremoloBuffer
Y_tremoloRightIterator	.ydata_ovly
_tremoloRightIterator
	.dw _tremoloBuffer+16
	.code_ovly



_init:			/* LN: 37 | CYCLE: 0 | RULES: () */ 
	i1 = i0			# LN: 41 | 
	a0 = xmem[__extractedConst_0_9 + 0]			# LN: 41 | 
	i1 += 1; a1 = 0			# LN: 41, 44 | 
	i4 = i0			# LN: 42 | 
	ymem[i1] = a0h			# LN: 41 | 
	i4 += 2			# LN: 42 | 
	a0 = xmem[__extractedConst_0_9 + 0]			# LN: 42 | 
	ymem[i4] = a0h			# LN: 42 | 
	i1 = i0 + (0x3)			# LN: 43 | 
	uhalfword(a0) = (0x1)			# LN: 43 | 
	ymem[i1] = a0h			# LN: 43 | 
	i1 = i0 + (0x4)			# LN: 44 | 
	ymem[i1] = a1h			# LN: 44 | 
	i0 = i0 + (0x5)			# LN: 45 | 
	uhalfword(a0) = (0xaec3)			# LN: 45 | 
	ymem[i0] = a0h			# LN: 45 | 
	ret			# LN: 46 | 



_lfo:			/* LN: 49 | CYCLE: 0 | RULES: () */ 
	uhalfword(b0) = (0x2)			# LN: 53 | 
	a1 - b0			# LN: 53 | 
	if (a == 0) jmp (case_0)			# LN: 53 | 
	uhalfword(b0) = (0x3)			# LN: 53 | 
	a1 - b0			# LN: 53 | 
	if (a == 0) jmp (case_1)			# LN: 53 | 
	uhalfword(b0) = (0x4)			# LN: 53 | 
	a1 - b0			# LN: 53 | 
	if (a == 0) jmp (case_2)			# LN: 53 | 
	a0 = a0 << 1			# LN: 104 | 
	call (_cl_sin)			# LN: 104 | 
	a1 =+ a0			# LN: 104 | 
	b0 = (0x4000)			# LN: 104 | 
	a0 =+ b0			# LN: 104 | 
	call (__mul_sat_laccum)			# LN: 104 | 
	call (__laccum_sat_accum)			# LN: 104 | 
	a0 = a0 + b0			# LN: 104 | 
	a0 = a0			# LN: 104 | 
	jmp (__epilogue_266)			# LN: 104 | 
case_0:			/* LN: 57 | CYCLE: 0 | RULES: () */ 
	a1 = (0x2000)			# LN: 59 | 
	a0 - a1			# LN: 59 | 
	if (a >= 0) jmp (else_0)			# LN: 59 | 
	uhalfword(x0) = (0x2)			# LN: 61 | 
	x1 = a0h			# LN: 61 | 
	a0 = x0 * x1			# LN: 61 | 
	a0 = a0 >> 1			# LN: 61 | 
	AnyReg(a0h, a0l)			# LN: 61 | 
	a0l = (0x0)			# LN: 61 | 
	a1 = (0x4000)			# LN: 61 | 
	a0 = a1 + a0			# LN: 61 | 
	jmp (__epilogue_266)			# LN: 61 | 
else_0:			/* LN: 59 | CYCLE: 0 | RULES: () */ 
	a1 = (0x6000)			# LN: 63 | 
	a0 - a1			# LN: 63 | 
	if (a >= 0) jmp (else_1)			# LN: 63 | 
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
else_1:			/* LN: 63 | CYCLE: 0 | RULES: () */ 
	a1 = (0x6000)			# LN: 69 | 
	a0 = a0 - a1			# LN: 69 | 
	x0 = a0h			# LN: 69 | 
	uhalfword(x1) = (0x2)			# LN: 69 | 
	a0 = x1 * x0			# LN: 69 | 
	a0 = a0 >> 1			# LN: 69 | 
	AnyReg(a0h, a0l)			# LN: 69 | 
	a0l = (0x0)			# LN: 69 | 
	jmp (__epilogue_266)			# LN: 69 | 
case_1:			/* LN: 71 | CYCLE: 0 | RULES: () */ 
	a1 = (0x4000)			# LN: 73 | 
	a0 - a1			# LN: 73 | 
	if (a >= 0) jmp (else_2)			# LN: 73 | 
	a0 = xmem[__extractedConst_0_9 + 0]			# LN: 75 | 
	jmp (__epilogue_266)			# LN: 75 | 
else_2:			/* LN: 73 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 79 | 
	jmp (__epilogue_266)			# LN: 79 | 
case_2:			/* LN: 81 | CYCLE: 0 | RULES: () */ 
	a1 = xmem[__extractedConst_1_2 + 0]			# LN: 83 | 
	a0 - a1			# LN: 83 | 
	if (a >= 0) jmp (else_3)			# LN: 83 | 
	a0 = xmem[__extractedConst_0_9 + 0]			# LN: 85 | 
	jmp (__epilogue_266)			# LN: 85 | 
else_3:			/* LN: 83 | CYCLE: 0 | RULES: () */ 
	a1 = (0x4000)			# LN: 87 | 
	a0 - a1			# LN: 87 | 
	if (a >= 0) jmp (else_4)			# LN: 87 | 
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
else_4:			/* LN: 87 | CYCLE: 0 | RULES: () */ 
	a1 = xmem[__extractedConst_2_2 + 0]			# LN: 91 | 
	a0 - a1			# LN: 91 | 
	if (a >= 0) jmp (else_5)			# LN: 91 | 
	a0 = 0			# LN: 93 | 
	jmp (__epilogue_266)			# LN: 93 | 
else_5:			/* LN: 91 | CYCLE: 0 | RULES: () */ 
	a1 = xmem[__extractedConst_2_2 + 0]			# LN: 97 | 
	a0 = a0 - a1			# LN: 97 | 
	x0 = a0h			# LN: 97 | 
	uhalfword(x1) = (0x32)			# LN: 97 | 
	a0 = x1 * x0			# LN: 97 | 
	a0 = a0 >> 1			# LN: 97 | 
	AnyReg(a0h, a0l)			# LN: 97 | 
	a0l = (0x0)			# LN: 97 | 
__epilogue_266:			/* LN: 108 | CYCLE: 0 | RULES: () */ 
	ret			# LN: 108 | 



_processBlock:			/* LN: 113 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = a2g; i7 += 1			# LN: 113, 113 | 
	xmem[i7] = a2h; i7 += 1			# LN: 113, 113 | 
	xmem[i7] = a2l; i7 += 1			# LN: 113, 113 | 
	xmem[i7] = i2; i7 += 1			# LN: 113, 113 | 
	xmem[i7] = a3g; i7 += 1			# LN: 113, 113 | 
	xmem[i7] = a3h; i7 += 1			# LN: 113, 113 | 
	xmem[i7] = a3l; i7 += 1			# LN: 113, 113 | 
	xmem[i7] = i3; i7 += 1			# LN: 113, 113 | 
	i5 = i0			# LN: 113 | 
	i0 = i4 + (0x4)			# LN: 131 | 
	a0 = ymem[i0]; a2 = 0			# LN: 131, 135 | 
	do (0x10), label_end_92			# LN: 135 | 
label_begin_92:			/* LN: 135 | CYCLE: 0 | RULES: () */ 
	a1 = i1; a3 =+ a0			# LN: 141, 145 | 
	b0 = i5; a1 = a1 + a2			# LN: 141, 141 | 
	b0 = b0 + a2			# LN: 141 | 
	AnyReg(i0, b0h)			# LN: 141 | 
	AnyReg(i2, a1h)			# LN: 141 | 
	y0 = ymem[i0]			# LN: 141 | 
	i0 = i4			# LN: 141 | 
	i3 = i4 + (0x3)			# LN: 141 | 
	a1 = ymem[i3]			# LN: 141 | 
	i0 += 2			# LN: 141 | 
	y1 = ymem[i0]			# LN: 141 | 
	call (_lfo)			# LN: 141 | 
	a1 = xmem[__extractedConst_0_9 + 0]			# LN: 141 | 
	x0 = a0h; a0 =+ a1			# LN: 141, 141 | 
	a0 -= y1 * x0			# LN: 141 | 
	x0 = a0			# LN: 141 | 
	a0 = y0 * x0			# LN: 141 | 
	i0 = i4			# LN: 145 | 
	ymem[i2] = a0			# LN: 141 | 
	i0 += 1			# LN: 145 | 
	x0 = ymem[i0]			# LN: 145 | 
	i0 = i4 + (0x5)			# LN: 145 | 
	x1 = ymem[i0]			# LN: 145 | 
	a3 += x0 * x1			# LN: 145 | 
	a0 = a3			# LN: 145 | 
	a0 = a0 << 1			# LN: 146 | 
	a1 = xmem[__extractedConst_0_9 + 0]			# LN: 148 | 
	a0 - a1			# LN: 148 | 
	if (a < 0) jmp (else_6)			# LN: 148 | 
	a1 = xmem[__extractedConst_0_9 + 0]			# LN: 150 | 
	a0 = a0 - a1			# LN: 150 | 
init_latch_label_0:			/* LN: 152 | CYCLE: 0 | RULES: () */ 
endif_6:			/* LN: 148 | CYCLE: 0 | RULES: () */ 
else_6:			/* LN: 148 | CYCLE: 0 | RULES: () */ 
	uhalfword(a1) = (0x1)			# LN: 135 | 
label_end_92:			# LN: 135 | CYCLE: 1 | RULES: ()
	a2 = a2 + a1			# LN: 135 | 
for_end_0:			/* LN: 135 | CYCLE: 0 | RULES: () */ 
	i0 = i4 + (0x4)			# LN: 161 | 
	ymem[i0] = a0h			# LN: 161 | 
	i7 -= 1			# LN: 163 | 
	i3 = xmem[i7]; i7 -= 1			# LN: 163, 163 | 
	a3l = xmem[i7]; i7 -= 1			# LN: 163, 163 | 
	a3h = xmem[i7]; i7 -= 1			# LN: 163, 163 | 
	a3g = xmem[i7]; i7 -= 1			# LN: 163, 163 | 
	i2 = xmem[i7]; i7 -= 1			# LN: 163, 163 | 
	a2l = xmem[i7]; i7 -= 1			# LN: 163, 163 | 
	a2h = xmem[i7]; i7 -= 1			# LN: 163, 163 | 
	a2g = xmem[i7]			# LN: 163 | 
	ret			# LN: 163 | 



_processing:			/* LN: 13 | CYCLE: 0 | RULES: () */ 
	call (_load_tremolo)			# LN: 15 | 
	call (_calculate_gain)			# LN: 17 | 
	ret			# LN: 19 | 



_resetIterators:			/* LN: 3 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_sampleBuffer + 0)			# LN: 5 | 
	xmem[_samples + 0] = i0			# LN: 5 | 
	i0 = (0) + (_sampleBuffer + 16)			# LN: 6 | 
	xmem[_samples + 1] = i0			# LN: 6 | 
	i0 = (0) + (_sampleBuffer + 32)			# LN: 7 | 
	xmem[_samples + 2] = i0			# LN: 7 | 
	i0 = (0) + (_sampleBuffer + 48)			# LN: 8 | 
	xmem[_samples + 3] = i0			# LN: 8 | 
	i0 = (0) + (_sampleBuffer + 64)			# LN: 9 | 
	xmem[_samples + 4] = i0			# LN: 9 | 
	ret			# LN: 10 | 
