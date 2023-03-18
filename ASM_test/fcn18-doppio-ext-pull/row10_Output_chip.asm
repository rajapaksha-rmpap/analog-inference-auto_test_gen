# Assembler for Chip - Output Processor 
# Output uP Assembly Code 
0:NOP # 
1:MOV,r448,2 # # Init process count 
2:MOV,r449,0 ## Initialize current process id
3:MOV,r492,1 # # Initialize address offset reg
4:LLSHIFT,r492,r492,23 # 
5:MOV,r471,9 # # Initialize base address offset reg
6:LLSHIFT,r471,r471,20 # 
7:MOV,r480,8204 # 
8:OR,r480,r494,r492 # # Initialize Output DMA bsy address reg
9:MOV,r480,8200 # 
10:OR,r480,r493,r492 # # Initialize Output DMA enable address reg
11:MOV,r480,12300 # 
12:OR,r480,r496,r492 # # Initialize Prefetch DMA bsy address reg
13:MOV,r480,12296 # 
14:OR,r480,r495,r492 # # Initialize Prefetch DMA enable address reg
15:MOV,r491,0 ## Initialize grab status reg
16:MOV,r468,0 ## Initialize image end status reg
17:MOV,r470,0 ## Initialize context switch reg
18:MOV,r488,1 ## Initialize current process id
19:LLSHIFTREG,r488,r488,r448 # 
20:SUBI,r488,r488,1 # 
21:MOV,r450,26 # # store proc0 start loc
22:MOV,r460,26 # # store proc0 last loc  
23:MOV,r451,541 # # store proc1 start loc
24:MOV,r461,541 # # store proc1 last loc  
25:NOP #
26:NOP #
27:NOP #
28:NOP #
29:NOP #
30:NOP #
31:NOP #
32:NOP #
33:NOP #
34:NOP #
35:NOP #
36:NOP #
37:MOV,r449,0 ## curr proc id
# Switch to proc id
38:ADDI,r449,r510,0 # 
39:SUBI,r510,r510,0 # 
40:BRANZ,2 # 
41:BRAREG,r460 ## branch to counter proc 0 
42:SUBI,r510,r510,1 # 
43:BRANZ,2 # 
44:BRAREG,r461 ## branch to counter proc 1 
45:SUBI,r510,r510,1 # 
46:BRANZ,2 # 
47:BRAREG,r462 ## branch to counter proc 2 
48:SUBI,r510,r510,1 # 
49:BRANZ,2 # 
50:BRAREG,r463 ## branch to counter proc 3 
51:SUBI,r510,r510,1 # 
52:BRANZ,2 # 
53:BRAREG,r464 ## branch to counter proc 4 
54:SUBI,r510,r510,1 # 
55:BRANZ,2 # 
56:BRAREG,r465 ## branch to counter proc 5 
57:SUBI,r510,r510,1 # 
58:BRANZ,2 # 
59:BRAREG,r466 ## branch to counter proc 6 
60:SUBI,r510,r510,1 # 
61:BRANZ,2 # 
62:BRAREG,r467 ## branch to counter proc 7 
# Entry point for context switch
63:NOP # 
64:SUB,r448,r510,r449 # 
65:BRANZ,-27 # 
66:BRAUNCOND,-29 # 
# Layer Instruction Start
67:MOV,r1,0 # 
68:MOV,r42,0 # 
69:MOV,r48,0 # 
70:MOV,r54,0 # 
71:MOV,r480,0 # 
72:LLSHIFT,r480,r480,16 # 
73:OR,r54,r54,r480 # 
74:MOV,r43,0 # 
75:MOV,r49,0 # 
76:MOV,r55,0 # 
77:MOV,r480,0 # 
78:LLSHIFT,r480,r480,16 # 
79:OR,r55,r55,r480 # 
80:MOV,r44,0 # 
81:MOV,r50,0 # 
82:MOV,r56,0 # 
83:MOV,r480,0 # 
84:LLSHIFT,r480,r480,16 # 
85:OR,r56,r56,r480 # 
86:MOV,r45,0 # 
87:MOV,r51,0 # 
88:MOV,r57,0 # 
89:MOV,r480,0 # 
90:LLSHIFT,r480,r480,16 # 
91:OR,r57,r57,r480 # 
92:MOV,r480,33120 ##Start READ_FROM_SCRATCH
93:MOV,r481,208 # 
94:OR,r481,r481,r492 # 
95:STORE,r481,r480 # write process_memory_addr
96:MOV,r481,212 # 
97:OR,r481,r481,r492 # 
98:LOAD,r481,r42 ## End READ_FROM_SCRATCH - read from process_memory_loc 
99:MOV,r480,33124 ##Start READ_FROM_SCRATCH
100:MOV,r481,208 # 
101:OR,r481,r481,r492 # 
102:STORE,r481,r480 # write process_memory_addr
103:MOV,r481,212 # 
104:OR,r481,r481,r492 # 
105:LOAD,r481,r48 ## End READ_FROM_SCRATCH - read from process_memory_loc 
106:MOV,r480,33128 ##Start READ_FROM_SCRATCH
107:MOV,r481,208 # 
108:OR,r481,r481,r492 # 
109:STORE,r481,r480 # write process_memory_addr
110:MOV,r481,212 # 
111:OR,r481,r481,r492 # 
112:LOAD,r481,r54 ## End READ_FROM_SCRATCH - read from process_memory_loc 
113:MOV,r5,0 # 
114:MOV,r22,1 # 
115:MOV,r41,256 # 
116:MOV,r25,0 # 
117:MOV,r27,0 # 
118:ADDI,r22,r484,0 # # Start SET_MULTICAST_ADDR
119:SUBI,r484,r484,1 # 
120:BRALEZ,69 # 
121:ADDI,r41,r480,0 # 
122:OR,r480,r480,r492 # 
123:ADDI,r22,r484,1 # 
124:SUBI,r27,r485,0 # 
125:BRALEZ,8 # # Jump to first dest_detail
126:SUBI,r27,r485,1 # 
127:BRALEZ,19 # # Jump to second dest detail 
128:SUBI,r27,r485,2 # 
129:BRALEZ,31 # # Jump to third dest detail 
130:SUBI,r27,r485,3 # 
131:BRALEZ,43 # # Jumpt to fourth dest detail 
132:BRAUNCOND,57 # 
133:AND,r48,r481,r42 # 
134:ADDI,r54,r481,0 # 
135:SUBI,r484,r484,1 # 
136:BRALEZ,4 # 
137:ORI,r481,r481,1 # 
138:ADDI,r484,r484,0 # 
139:BRAUNCOND,2 # 
140:MOV,r481,0 # 
141:STORE,r480,r481 # 
142:ADDI,r480,r481,4 # 
143:STORE,r481,r48 # 
144:ADDI,r480,r481,8 # 
145:STORE,r481,r42 # 
146:ADDI,r480,r486,16 # 
147:AND,r49,r481,r43 # 
148:ADDI,r55,r481,0 # 
149:SUBI,r484,r484,1 # 
150:BRALEZ,4 # 
151:ORI,r481,r481,1 # 
152:ADDI,r484,r484,0 # 
153:BRAUNCOND,2 # 
154:MOV,r481,0 # 
155:STORE,r486,r481 # 
156:ADDI,r486,r481,4 # 
157:STORE,r481,r49 # 
158:ADDI,r486,r481,8 # 
159:STORE,r481,r43 # 
160:ADDI,r480,r486,32 # 
161:AND,r50,r481,r44 # 
162:ADDI,r56,r481,0 # 
163:SUBI,r484,r484,1 # 
164:BRALEZ,4 # 
165:ORI,r481,r481,1 # 
166:ADDI,r484,r484,0 # 
167:BRAUNCOND,2 # 
168:MOV,r481,0 # 
169:STORE,r486,r481 # 
170:ADDI,r486,r481,4 # 
171:STORE,r481,r50 # 
172:ADDI,r486,r481,8 # 
173:STORE,r481,r44 # 
174:ADDI,r480,r486,48 # 
175:AND,r51,r481,r45 # 
176:ADDI,r57,r481,0 # 
177:SUBI,r484,r484,1 # 
178:BRALEZ,4 # 
179:ORI,r481,r481,1 # 
180:ADDI,r484,r484,0 # 
181:BRAUNCOND,2 # 
182:MOV,r481,0 # 
183:STORE,r486,r481 # 
184:ADDI,r486,r481,4 # 
185:STORE,r481,r51 # 
186:ADDI,r486,r481,8 # 
187:STORE,r481,r45 # 
188:NOP # # End SET_MULTICAST_ADDR
189:MOV,r15,0 # 
190:MOV,r18,1 # 
191:MOV,r19,0 # 
192:MOV,r38,0 # 
193:MOV,r33,40 # 
194:MOV,r480,784 # 
195:LLSHIFT,r480,r480,16 # 
196:OR,r33,r33,r480 # 
197:MOV,r480,0 # # start STORE_TO_MEMORY 
198:STORE,r33,r480 # # end STORE_TO_MEMORY - write data to address
199:MOV,r0,896 # 
200:MOV,r23,8 # 
201:MOV,r33,1 # 
202:MOV,r40,121 # 
203:MOV,r30,0 # 
204:MOV,r2,0 # 
205:MOV,r58,0 # 
206:MOV,r480,0 # 
207:LLSHIFT,r480,r480,16 # 
208:OR,r58,r58,r480 # 
209:MOV,r46,65535 # 
210:MOV,r480,511 # 
211:LLSHIFT,r480,r480,16 # 
212:OR,r46,r46,r480 # 
213:MOV,r53,64 # 
214:MOV,r36,1 # 
215:MOV,r4,8960 # 
216:MOV,r9,128 # 
217:MOV,r19,0 # 
218:MOV,r33,0 # 
219:ADDI,r4,r480,0 ## Start SET_LYR_REG 
220:OR,r480,r480,r492 # 
221:STORE,r480,r19 # # write to addr_mask_reg
222:ADDI,r480,r483,4 # 
223:STORE,r483,r19 # # write to base_addr_reg
224:LLSHIFT,r19,r482,16 # 
225:OR,r482,r482,r9 # 
226:ADDI,r480,r483,8 # 
227:STORE,r483,r482 # #wite to addr_stp_reg
228:MOV,r480,8228 # 
229:OR,r480,r480,r492 # 
230:LOAD,r480,r481 # 
231:OR,r481,r481,r33 # 
232:STORE,r480,r481 # # end SET_OUTPUT_LYR_REG - write to xbar_grp_reg
233:MOV,r4,13056 # 
234:MOV,r9,128 # 
235:ADDI,r4,r480,0 ## Start SET_LYR_REG 
236:OR,r480,r480,r492 # 
237:LLSHIFT,r19,r482,16 # 
238:OR,r482,r482,r9 # 
239:ADDI,r480,r483,8 # 
240:STORE,r483,r482 # #write to address_step_reg 
241:MOV,r480,12324 # 
242:OR,r480,r480,r492 # 
243:LOAD,r480,r481 # 
244:OR,r481,r481,r33 # 
245:STORE,r480,r481 ## end SET_PREFETCH_LYR_REGS - write to prefetch_grp_reg
246:MOV,r4,1 # 
247:MOV,r2,57 # 
248:MOV,r33,1 # 
249:MOV,r480,8224 ## Start SET_HORSPLIT_REG
250:OR,r480,r480,r492 # 
251:LOAD,r480,r481 ##load split_group_reg 
252:OR,r481,r481,r2 # 
253:STORE,r480,r481 ## End SET_HORSPLIT_REG 
254:MOV,r14,1 # 
255:MOV,r33,170 # 
256:MOV,r2,0 # 
257:MOV,r480,0 # 
258:LLSHIFT,r480,r480,16 # 
259:OR,r2,r2,r480 # 
260:MOV,r3,512 # 
261:ADDI,r3,r480,0 # 
262:OR,r480,r480,r492 # 
263:STORE,r480,r14 # #write to colgrp_reg 
264:ADDI,r480,r480,4 # 
265:STORE,r480,r33 # # write to colsign_reg 
266:ADDI,r480,r480,4 # 
267:STORE,r480,r2 # # End SET_COL_GRP_REGS - write to colshift_reg
268:MOV,r26,128 # 
269:MOV,r33,896 # 
270:MOV,r11,1 # 
271:MOV,r47,9216 # 
272:MOV,r2,0 # 
273:MOV,r14,0 # 
274:OR,r47,r480,r492 ## Start SET_OUT_XBAR_REGS 
275:ADDI,r480,r481,20 # 
276:ADDI,r30,r482,0 # 
277:LLSHIFT,r14,r483,16 # 
278:OR,r482,r482,r483 # 
279:STORE,r481,r482 # #write to mac blk mb_config_reg
280:ADDI,r480,r485,0 # 
281:LLSHIFT,r11,r481,16 # 
282:OR,r26,r481,r481 # 
283:STORE,r485,r481 ## write to mac blk bt_size_reg 
284:ADDI,r480,r481,28 # 
285:LLSHIFT,r36,r482,31 # 
286:OR,r33,r482,r482 # 
287:STORE,r481,r482 # # End SET_OUT_XBAR_REGS - write to mac blk row_step_reg
288:MOV,r14,9216 # 
289:MOV,r47,13312 # 
290:MOV,r2,0 # 
291:SUBI,r2,r2,0 # 
292:BRAZ,6 # 
293:ADDI,r14,r14,128 # 
294:ADDI,r47,r47,128 # 
295:SUBI,r2,r2,1 # 
296:BRALEZ,2 # 
297:BRAUNCOND,-4 # 
298:MOV,r33,0 # 
299:MOV,r11,1 # 
300:MOV,r59,0 # 
301:MOV,r37,65535 # 
302:MOV,r480,255 # 
303:LLSHIFT,r480,r480,16 # 
304:OR,r37,r37,r480 # 
305:MOV,r35,0 # 
306:MOV,r3,7 # 
307:NOP # # Instruction not used in Assembly Generation
308:MOV,r17,0 # 
309:ADDI,r14,r24,0 # 
310:MOV,r27,0 # 
311:MOV,r10,0 # 
312:ADDI,r47,r34,0 # 
313:MOV,r22,1 # 
314:MOV,r31,0 # 
315:MOV,r12,0 # 
316:MOV,r5,0 # 
317:MOV,r41,256 # 
318:MOV,r480,32976 ##Start READ_FROM_SCRATCH
319:MOV,r481,208 # 
320:OR,r481,r481,r492 # 
321:STORE,r481,r480 # write process_memory_addr
322:MOV,r481,212 # 
323:OR,r481,r481,r492 # 
324:LOAD,r481,r38 ## End READ_FROM_SCRATCH - read from process_memory_loc 
325:MOV,r18,16383 # 
326:MOV,r480,0 # 
327:LLSHIFT,r480,r480,16 # 
328:OR,r18,r18,r480 # 
329:MOV,r8,0 # 
330:MOV,r28,0 # 
331:MOV,r52,0 # 
332:SUBI,r52,r52,0 # 
333:BRAZ,3 # 
334:MOV,r33,0 # 
335:NOP # # Instruction not used in Assembly Generation
336:MOV,r52,0 # 
337:SUBI,r52,r52,0 # 
338:BRAZ,72 # 
339:MOV,r10,0 # 
340:MOV,r29,0 # 
341:MOV,r6,0 # 
342:NOP # # Instruction not used in Assembly Generation
343:MOV,r21,1 # 
344:ADDI,r24,r480,0 # 
345:OR,r480,r480,r492 # 
346:ADDI,r480,r485,32 # 
347:ADDI,r29,r481,0 # 
348:LLSHIFT,r481,r481,16 # 
349:ORI,r481,r481,1 # 
350:STORE,r485,r481 # #write to cmd_wd0_reg
351:ADD,r1,r481,r17 # 
352:AND,r481,r481,r46 # 
353:ADDI,r485,r485,4 # 
354:STORE,r485,r481 # # end SET_XBAR_WIDTH_SPLIT_REG - write to cmd_wd1_reg
355:MOV,r486,1 # 
356:LLSHIFTREG,r486,r486,r10 # 
357:LOAD,r493,r482 ## read output_dma_cmd_lst_enable_reg 
358:NOT,r486,r484 # 
359:AND,r484,r485,r482 # 
360:STORE,r493,r485 ## write to output_dma_cmd_lst_enable_reg 
361:OR,r486,r482,r482 # 
362:STORE,r493,r482 ## write to output_dma_cmd_lst_enable_reg - End ADD_XBAR_TO_STARTQ  
363:STOREI,r53,r38 # #Start SET_SIMD_BASE- write to simd_base_addr_reg
364:ADDI,r53,r480,4 # 
365:STOREI,r480,r18 # #write to simd_addr_mask_reg - End SET_SIMD_BASE 
366:ADD,r1,r1,r29 # 
367:MOV,r486,33554431 # 
368:AND,r1,r1,r486 # 
369:NOP # # Instruction not used in Assembly Generation
370:MOV,r460,336 # # Start FORCED_CONTEXT SWITCH  
371:MOV,r449,1 # 
372:MOV,r480,960 # 
373:OR,r480,r480,r492 # 
374:MOV,r481,377 # 
375:STORE,r480,r481 # #write to wake_vec_reg 
376:BRAUNCOND,-313 # # End FORCED_CONTEXT SWITCH
377:MOV,r480,960 # 
378:OR,r480,r480,r492 # 
379:MOV,r482,388 # 
380:STORE,r480,r482 # # write to wake_vec_reg 
381:LOAD,r480,r482 ##End SET_UP_WAKE_VEC - read wake_vec_reg
382:MOV,r460,341 #  # start CHECK_XBAR_LAYER 
383:MOV,r449,0 # 
384:NOP # 
385:NOP # 
386:HALT # 
387:NOP # 
388:MOV,r480,48 # 
389:LOADI,r480,r484 # # read simd_lyr_cntrl_reg
390:MOV,r480,4 # 
391:LOADI,r480,r472 # # read mac_cmd_reg
392:LRSHIFT,r472,r480,24 # 
393:ANDI,r480,r13,255 # 
394:ADDI,r13,r13,1 # 
395:LLSHIFT,r13,r29,3 # 
396:AND,r472,r32,r37 # 
397:LRSHIFT,r484,r484,4 # 
398:ANDI,r484,r16,8191 # 
399:LRSHIFT,r16,r20,9 # # End CHECK_XBAR_LAYER 
400:MOV,r480,44 # 
401:LLSHIFT,r40,r481,13 # 
402:OR,r16,r481,r481 # 
403:STOREI,r480,r481 ## write simd_cmd2_reg 
404:MOV,r480,0 # 
405:ADD,r472,r482,r31 # 
406:ADD,r482,r482,r33 # 
407:STOREI,r480,r482 # # End Set_SIMD_MAC - write simd_cmd1_reg 
408:SUBI,r29,r29,896 # 
409:BRAGEZ,129 # 
410:ADDI,r47,r52,0 # 
411:MOV,r6,0 # 
412:MOV,r16,3 # 
413:MOV,r13,1 # 
414:MOV,r21,3 # 
415:SUBI,r35,r35,0 # 
416:BRANZ,51 # 
417:MOV,r20,0 # 
418:MOV,r2,0 # 
419:MOV,r29,896 # 
420:MOV,r9,128 # 
421:NOP # # Instruction not used in Assembly Generation
422:SUBI,r15,r15,0 # 
423:BRAZ,19 # 
424:MOV,r25,896 # 
425:NOP # # Instruction not used in Assembly Generation
426:LOAD,r496,r481 # 
427:AND,r481,r481,r4 # 
428:BRAZ,2 # 
429:BRAUNCOND,-3 # #Check for prefetch_dma_busy
430:ADDI,r34,r480,0 # 
431:OR,r480,r480,r492 # 
432:ADDI,r480,r480,32 # 
433:ADDI,r29,r482,0 # 
434:LLSHIFT,r482,r482,16 # 
435:ORI,r482,r482,1 # 
436:STORE,r480,r482 # # write to cmd_wd0_reg 
437:ADD,r1,r481,r17 # 
438:AND,r481,r481,r61 # 
439:ADDI,r480,r480,4 # 
440:STORE,r480,r481 # # End PREFETCH - write to cmd_wd1_reg
441:ADDI,r34,r34,128 # 
442:MOV,r25,0 # 
443:ADDI,r24,r480,0 # 
444:OR,r480,r480,r492 # 
445:ADDI,r480,r485,32 # 
446:ADDI,r29,r481,0 # 
447:LLSHIFT,r481,r481,16 # 
448:ORI,r481,r481,1 # 
449:STORE,r485,r481 # #write to cmd_wd0_reg
450:ADD,r1,r481,r17 # 
451:AND,r481,r481,r46 # 
452:ADDI,r485,r485,4 # 
453:STORE,r485,r481 # # end SET_XBAR_WIDTH_SPLIT_REG - write to cmd_wd1_reg
454:ADDI,r10,r10,3 # 
455:ADDI,r20,r20,3 # 
456:MOV,r25,3 # 
457:ADDI,r24,r24,128 # 
458:ADDI,r6,r6,512 # 
459:SUBI,r25,r25,1 # 
460:BRALEZ,2 # 
461:BRAUNCOND,-4 # 
462:SUBI,r2,r2,1 # 
463:BRAGEZ,-44 # 
464:SUBI,r13,r13,1 # 
465:BRALEZ,2 # 
466:BRAUNCOND,-48 # 
467:SUBI,r15,r15,0 # 
468:BRAZ,7 # 
469:LOAD,r495,r482 # # Start ADD_PREFETCH_TO_STARTQ - read cmd_lst_enable_reg
470:NOT,r4,r484 # 
471:AND,r484,r485,r482 # 
472:STORE,r495,r485 # #write to cmd_lst_enable_reg
473:OR,r4,r482,r482 # 
474:STORE,r495,r482 ## write to cmd_lst_enable_reg - End ADD_PREFETCH_TO_STARTQ  
475:LOAD,r494,r481 # 
476:AND,r481,r481,r4 # 
477:BRAZ,2 # 
478:BRAUNCOND,-3 # 
479:LOAD,r493,r482 # 
480:NOT,r4,r484 # # read op_dma_cmd_lst_enable_reg
481:AND,r484,r485,r482 # 
482:STORE,r493,r485 ## write op_dma_cmd_lst_enable_reg 
483:OR,r4,r482,r482 # 
484:STORE,r493,r482 # # End ADD_TO_STARTQ_ALL_XBARS - write op_dma_cmd_lst_enable_reg
485:STOREI,r53,r38 # #Start SET_SIMD_BASE- write to simd_base_addr_reg
486:ADDI,r53,r480,4 # 
487:STOREI,r480,r18 # #write to simd_addr_mask_reg - End SET_SIMD_BASE 
488:NOP # # Instruction not used in Assembly Generation
489:MOV,r460,455 # # Start FORCED_CONTEXT SWITCH  
490:MOV,r449,1 # 
491:MOV,r480,960 # 
492:OR,r480,r480,r492 # 
493:MOV,r481,496 # 
494:STORE,r480,r481 # #write to wake_vec_reg 
495:BRAUNCOND,-432 # # End FORCED_CONTEXT SWITCH
496:MOV,r480,960 # 
497:OR,r480,r480,r492 # 
498:MOV,r482,510 # 
499:STORE,r480,r482 # # write to wake_vec_reg 
500:LOAD,r480,r482 ##End SET_UP_WAKE_VEC - read wake_vec_reg
501:MOV,r17,0 # 
502:MOV,r25,1 # 
503:MOV,r6,112 # 
504:MOV,r460,463 #  # start CHECK_XBAR_LAYER 
505:MOV,r449,0 # 
506:NOP # 
507:NOP # 
508:HALT # 
509:NOP # 
510:MOV,r480,48 # 
511:LOADI,r480,r484 # # read simd_lyr_cntrl_reg
512:MOV,r480,4 # 
513:LOADI,r480,r472 # # read mac_cmd_reg
514:LRSHIFT,r472,r480,24 # 
515:ANDI,r480,r21,255 # 
516:ADDI,r21,r21,1 # 
517:LLSHIFT,r21,r20,3 # 
518:AND,r472,r39,r37 # 
519:LRSHIFT,r484,r484,4 # 
520:ANDI,r484,r32,8191 # 
521:LRSHIFT,r32,r10,9 # # End CHECK_XBAR_LAYER 
522:MOV,r480,44 # 
523:LLSHIFT,r40,r481,13 # 
524:OR,r32,r481,r481 # 
525:STOREI,r480,r481 ## write simd_cmd2_reg 
526:MOV,r480,0 # 
527:ADD,r472,r482,r31 # 
528:ADD,r482,r482,r33 # 
529:STOREI,r480,r482 # # End Set_SIMD_MAC - write simd_cmd1_reg 
530:ADD,r17,r17,r20 # 
531:SUB,r6,r6,r21 # 
532:BRALEZ,2 # 
533:BRAUNCOND,-29 # 
534:ADDI,r27,r27,1 # 
535:ADDI,r1,r1,896 # 
536:MOV,r486,33554431 # 
537:AND,r1,r1,r486 # 
538:ADDI,r42,r42,896 # 
539:MOV,r6,0 # 
540:MOV,r25,1 # 
541:MOV,r20,1 # 
542:LOAD,r496,r481 # # start CHECK_PREFETCH_DONE - read prefetch_dma_busy_reg 
543:AND,r481,r481,r4 # 
544:BRAZ,2 # 
545:BRAUNCOND,-3 # #end CHECK_XBAR_DONE
546:MOV,r480,12 # 
547:LOADI,r480,r481 # #read simd_wbuf_addr_status_reg 
548:ANDI,r481,r481,1 # 
549:BRANZ,2 # 
550:BRAUNCOND,-3 # End END_BLOCK 
551:MOV,r480,1044 # 
552:OR,r480,r480,r492 # 
553:STORE,r480,r25 # # End INCREMENT_OBUF_COUNTER  
554:MOV,r482,1048 ## Start SEND_SYNC_NEXT 
555:OR,r482,r482,r492 # 
556:STORE,r482,r25 # # End SEND_SYNC_NEXT
557:SUBI,r20,r20,1 # 
558:BRALEZ,2 # 
559:BRAUNCOND,-13 # 
560:ADDI,r35,r35,1 # 
561:SUBI,r3,r3,1 # 
562:BRALEZ,2 # 
563:BRAUNCOND,-256 # 
564:MOV,r28,1 # 
565:MOV,r29,0 # 
566:MOV,r30,1192 # 
567:MOV,r31,0 # 
568:MOV,r32,3 # 
569:MOV,r33,40 # 
570:MOV,r480,784 # 
571:LLSHIFT,r480,r480,16 # 
572:OR,r33,r33,r480 # 
573:NOP ##Start SET_UP_NEXT 
574:NOP # 
575:NOP # 
576:MOV,r460,148 # 
577:MOV,r449,0 # 
578:BRAUNCOND,-515 # #Branch to the same layer, instruction start location
579:NOP # 
580:NOP # 
581:NOP # 
582:NOP # 
583:HALT # 
584:NOP ##End SET_UP_NEXT 
585:MOV,r65,0 # 
586:MOV,r106,0 # 
587:MOV,r112,0 # 
588:MOV,r118,0 # 
589:MOV,r480,0 # 
590:LLSHIFT,r480,r480,16 # 
591:OR,r118,r118,r480 # 
592:MOV,r107,0 # 
593:MOV,r113,0 # 
594:MOV,r119,0 # 
595:MOV,r480,0 # 
596:LLSHIFT,r480,r480,16 # 
597:OR,r119,r119,r480 # 
598:MOV,r108,0 # 
599:MOV,r114,0 # 
600:MOV,r120,0 # 
601:MOV,r480,0 # 
602:LLSHIFT,r480,r480,16 # 
603:OR,r120,r120,r480 # 
604:MOV,r109,0 # 
605:MOV,r115,0 # 
606:MOV,r121,0 # 
607:MOV,r480,0 # 
608:LLSHIFT,r480,r480,16 # 
609:OR,r121,r121,r480 # 
610:MOV,r480,33184 ##Start READ_FROM_SCRATCH
611:MOV,r481,208 # 
612:OR,r481,r481,r492 # 
613:STORE,r481,r480 # write process_memory_addr
614:MOV,r481,212 # 
615:OR,r481,r481,r492 # 
616:LOAD,r481,r106 ## End READ_FROM_SCRATCH - read from process_memory_loc 
617:MOV,r480,33188 ##Start READ_FROM_SCRATCH
618:MOV,r481,208 # 
619:OR,r481,r481,r492 # 
620:STORE,r481,r480 # write process_memory_addr
621:MOV,r481,212 # 
622:OR,r481,r481,r492 # 
623:LOAD,r481,r112 ## End READ_FROM_SCRATCH - read from process_memory_loc 
624:MOV,r480,33192 ##Start READ_FROM_SCRATCH
625:MOV,r481,208 # 
626:OR,r481,r481,r492 # 
627:STORE,r481,r480 # write process_memory_addr
628:MOV,r481,212 # 
629:OR,r481,r481,r492 # 
630:LOAD,r481,r118 ## End READ_FROM_SCRATCH - read from process_memory_loc 
631:MOV,r69,0 # 
632:MOV,r86,1 # 
633:MOV,r105,256 # 
634:MOV,r89,0 # 
635:MOV,r91,0 # 
636:ADDI,r86,r484,0 # # Start SET_MULTICAST_ADDR
637:SUBI,r484,r484,1 # 
638:BRALEZ,69 # 
639:ADDI,r105,r480,0 # 
640:OR,r480,r480,r492 # 
641:ADDI,r86,r484,1 # 
642:SUBI,r91,r485,0 # 
643:BRALEZ,8 # # Jump to first dest_detail
644:SUBI,r91,r485,1 # 
645:BRALEZ,19 # # Jump to second dest detail 
646:SUBI,r91,r485,2 # 
647:BRALEZ,31 # # Jump to third dest detail 
648:SUBI,r91,r485,3 # 
649:BRALEZ,43 # # Jumpt to fourth dest detail 
650:BRAUNCOND,57 # 
651:AND,r112,r481,r106 # 
652:ADDI,r118,r481,0 # 
653:SUBI,r484,r484,1 # 
654:BRALEZ,4 # 
655:ORI,r481,r481,1 # 
656:ADDI,r484,r484,0 # 
657:BRAUNCOND,2 # 
658:MOV,r481,0 # 
659:STORE,r480,r481 # 
660:ADDI,r480,r481,4 # 
661:STORE,r481,r112 # 
662:ADDI,r480,r481,8 # 
663:STORE,r481,r106 # 
664:ADDI,r480,r486,16 # 
665:AND,r113,r481,r107 # 
666:ADDI,r119,r481,0 # 
667:SUBI,r484,r484,1 # 
668:BRALEZ,4 # 
669:ORI,r481,r481,1 # 
670:ADDI,r484,r484,0 # 
671:BRAUNCOND,2 # 
672:MOV,r481,0 # 
673:STORE,r486,r481 # 
674:ADDI,r486,r481,4 # 
675:STORE,r481,r113 # 
676:ADDI,r486,r481,8 # 
677:STORE,r481,r107 # 
678:ADDI,r480,r486,32 # 
679:AND,r114,r481,r108 # 
680:ADDI,r120,r481,0 # 
681:SUBI,r484,r484,1 # 
682:BRALEZ,4 # 
683:ORI,r481,r481,1 # 
684:ADDI,r484,r484,0 # 
685:BRAUNCOND,2 # 
686:MOV,r481,0 # 
687:STORE,r486,r481 # 
688:ADDI,r486,r481,4 # 
689:STORE,r481,r114 # 
690:ADDI,r486,r481,8 # 
691:STORE,r481,r108 # 
692:ADDI,r480,r486,48 # 
693:AND,r115,r481,r109 # 
694:ADDI,r121,r481,0 # 
695:SUBI,r484,r484,1 # 
696:BRALEZ,4 # 
697:ORI,r481,r481,1 # 
698:ADDI,r484,r484,0 # 
699:BRAUNCOND,2 # 
700:MOV,r481,0 # 
701:STORE,r486,r481 # 
702:ADDI,r486,r481,4 # 
703:STORE,r481,r115 # 
704:ADDI,r486,r481,8 # 
705:STORE,r481,r109 # 
706:NOP # # End SET_MULTICAST_ADDR
707:MOV,r79,0 # 
708:MOV,r82,0 # 
709:MOV,r83,0 # 
710:MOV,r102,0 # 
711:MOV,r97,40 # 
712:MOV,r480,784 # 
713:LLSHIFT,r480,r480,16 # 
714:OR,r97,r97,r480 # 
715:MOV,r480,0 # # start STORE_TO_MEMORY 
716:STORE,r97,r480 # # end STORE_TO_MEMORY - write data to address
717:MOV,r64,147 # 
718:MOV,r87,8 # 
719:MOV,r97,1 # 
720:MOV,r104,249 # 
721:MOV,r94,1 # 
722:MOV,r66,0 # 
723:MOV,r122,0 # 
724:MOV,r480,0 # 
725:LLSHIFT,r480,r480,16 # 
726:OR,r122,r122,r480 # 
727:MOV,r110,65535 # 
728:MOV,r480,511 # 
729:LLSHIFT,r480,r480,16 # 
730:OR,r110,r110,r480 # 
731:MOV,r117,80 # 
732:MOV,r100,1 # 
733:MOV,r68,8976 # 
734:MOV,r73,84 # 
735:MOV,r83,0 # 
736:MOV,r97,0 # 
737:ADDI,r68,r480,0 ## Start SET_LYR_REG 
738:OR,r480,r480,r492 # 
739:STORE,r480,r83 # # write to addr_mask_reg
740:ADDI,r480,r483,4 # 
741:STORE,r483,r83 # # write to base_addr_reg
742:LLSHIFT,r83,r482,16 # 
743:OR,r482,r482,r73 # 
744:ADDI,r480,r483,8 # 
745:STORE,r483,r482 # #wite to addr_stp_reg
746:MOV,r480,8228 # 
747:OR,r480,r480,r492 # 
748:LOAD,r480,r481 # 
749:OR,r481,r481,r97 # 
750:STORE,r480,r481 # # end SET_OUTPUT_LYR_REG - write to xbar_grp_reg
751:MOV,r68,13072 # 
752:MOV,r73,84 # 
753:ADDI,r68,r480,0 ## Start SET_LYR_REG 
754:OR,r480,r480,r492 # 
755:LLSHIFT,r83,r482,16 # 
756:OR,r482,r482,r73 # 
757:ADDI,r480,r483,8 # 
758:STORE,r483,r482 # #write to address_step_reg 
759:MOV,r480,12324 # 
760:OR,r480,r480,r492 # 
761:LOAD,r480,r481 # 
762:OR,r481,r481,r97 # 
763:STORE,r480,r481 ## end SET_PREFETCH_LYR_REGS - write to prefetch_grp_reg
764:MOV,r68,8 # 
765:MOV,r66,0 # 
766:MOV,r97,16777215 # 
767:MOV,r480,8224 ## Start SET_HORSPLIT_REG
768:OR,r480,r480,r492 # 
769:LOAD,r480,r481 ##load split_group_reg 
770:OR,r481,r481,r66 # 
771:STORE,r480,r481 ## End SET_HORSPLIT_REG 
772:MOV,r78,1 # 
773:MOV,r97,170 # 
774:MOV,r66,0 # 
775:MOV,r480,0 # 
776:LLSHIFT,r480,r480,16 # 
777:OR,r66,r66,r480 # 
778:MOV,r67,528 # 
779:ADDI,r67,r480,0 # 
780:OR,r480,r480,r492 # 
781:STORE,r480,r78 # #write to colgrp_reg 
782:ADDI,r480,r480,4 # 
783:STORE,r480,r97 # # write to colsign_reg 
784:ADDI,r480,r480,4 # 
785:STORE,r480,r66 # # End SET_COL_GRP_REGS - write to colshift_reg
786:MOV,r90,84 # 
787:MOV,r97,147 # 
788:MOV,r75,1 # 
789:MOV,r111,9600 # 
790:MOV,r66,3 # 
791:MOV,r78,1536 # 
792:OR,r111,r480,r492 ## Start SET_OUT_XBAR_REGS 
793:ADDI,r480,r481,20 # 
794:ADDI,r94,r482,0 # 
795:LLSHIFT,r78,r483,16 # 
796:OR,r482,r482,r483 # 
797:STORE,r481,r482 # #write to mac blk mb_config_reg
798:ADDI,r480,r485,0 # 
799:LLSHIFT,r75,r481,16 # 
800:OR,r90,r481,r481 # 
801:STORE,r485,r481 ## write to mac blk bt_size_reg 
802:ADDI,r480,r481,28 # 
803:LLSHIFT,r100,r482,31 # 
804:OR,r97,r482,r482 # 
805:STORE,r481,r482 # # End SET_OUT_XBAR_REGS - write to mac blk row_step_reg
806:MOV,r78,9216 # 
807:MOV,r111,13312 # 
808:MOV,r66,3 # 
809:SUBI,r66,r66,0 # 
810:BRAZ,6 # 
811:ADDI,r78,r78,128 # 
812:ADDI,r111,r111,128 # 
813:SUBI,r66,r66,1 # 
814:BRALEZ,2 # 
815:BRAUNCOND,-4 # 
816:MOV,r97,0 # 
817:MOV,r75,2 # 
818:MOV,r123,3 # 
819:MOV,r101,65535 # 
820:MOV,r480,255 # 
821:LLSHIFT,r480,r480,16 # 
822:OR,r101,r101,r480 # 
823:MOV,r99,0 # 
824:MOV,r67,7 # 
825:NOP # # Instruction not used in Assembly Generation
826:MOV,r81,0 # 
827:ADDI,r78,r88,0 # 
828:MOV,r91,64 # 
829:MOV,r74,3 # 
830:ADDI,r111,r98,0 # 
831:MOV,r86,1 # 
832:MOV,r95,0 # 
833:MOV,r76,0 # 
834:MOV,r69,0 # 
835:MOV,r105,256 # 
836:MOV,r480,32992 ##Start READ_FROM_SCRATCH
837:MOV,r481,208 # 
838:OR,r481,r481,r492 # 
839:STORE,r481,r480 # write process_memory_addr
840:MOV,r481,212 # 
841:OR,r481,r481,r492 # 
842:LOAD,r481,r102 ## End READ_FROM_SCRATCH - read from process_memory_loc 
843:MOV,r82,16383 # 
844:MOV,r480,0 # 
845:LLSHIFT,r480,r480,16 # 
846:OR,r82,r82,r480 # 
847:MOV,r72,0 # 
848:MOV,r92,0 # 
849:MOV,r116,0 # 
850:SUBI,r116,r116,0 # 
851:BRAZ,3 # 
852:MOV,r97,0 # 
853:NOP # # Instruction not used in Assembly Generation
854:MOV,r116,0 # 
855:SUBI,r116,r116,0 # 
856:BRAZ,72 # 
857:MOV,r74,0 # 
858:MOV,r93,0 # 
859:MOV,r70,0 # 
860:NOP # # Instruction not used in Assembly Generation
861:MOV,r85,1 # 
862:ADDI,r88,r480,0 # 
863:OR,r480,r480,r492 # 
864:ADDI,r480,r485,32 # 
865:ADDI,r93,r481,0 # 
866:LLSHIFT,r481,r481,16 # 
867:ORI,r481,r481,1 # 
868:STORE,r485,r481 # #write to cmd_wd0_reg
869:ADD,r65,r481,r81 # 
870:AND,r481,r481,r110 # 
871:ADDI,r485,r485,4 # 
872:STORE,r485,r481 # # end SET_XBAR_WIDTH_SPLIT_REG - write to cmd_wd1_reg
873:MOV,r486,1 # 
874:LLSHIFTREG,r486,r486,r74 # 
875:LOAD,r493,r482 ## read output_dma_cmd_lst_enable_reg 
876:NOT,r486,r484 # 
877:AND,r484,r485,r482 # 
878:STORE,r493,r485 ## write to output_dma_cmd_lst_enable_reg 
879:OR,r486,r482,r482 # 
880:STORE,r493,r482 ## write to output_dma_cmd_lst_enable_reg - End ADD_XBAR_TO_STARTQ  
881:STOREI,r117,r102 # #Start SET_SIMD_BASE- write to simd_base_addr_reg
882:ADDI,r117,r480,4 # 
883:STOREI,r480,r82 # #write to simd_addr_mask_reg - End SET_SIMD_BASE 
884:ADD,r65,r65,r93 # 
885:MOV,r486,33554431 # 
886:AND,r65,r65,r486 # 
887:NOP # # Instruction not used in Assembly Generation
888:MOV,r461,851 # # Start FORCED_CONTEXT SWITCH  
889:MOV,r449,2 # 
890:MOV,r480,964 # 
891:OR,r480,r480,r492 # 
892:MOV,r481,895 # 
893:STORE,r480,r481 # #write to wake_vec_reg 
894:BRAUNCOND,-831 # # End FORCED_CONTEXT SWITCH
895:MOV,r480,964 # 
896:OR,r480,r480,r492 # 
897:MOV,r482,906 # 
898:STORE,r480,r482 # # write to wake_vec_reg 
899:LOAD,r480,r482 ##End SET_UP_WAKE_VEC - read wake_vec_reg
900:MOV,r461,856 #  # start CHECK_XBAR_LAYER 
901:MOV,r449,1 # 
902:NOP # 
903:NOP # 
904:HALT # 
905:NOP # 
906:MOV,r480,48 # 
907:LOADI,r480,r484 # # read simd_lyr_cntrl_reg
908:MOV,r480,4 # 
909:LOADI,r480,r472 # # read mac_cmd_reg
910:LRSHIFT,r472,r480,24 # 
911:ANDI,r480,r77,255 # 
912:ADDI,r77,r77,1 # 
913:LLSHIFT,r77,r93,3 # 
914:AND,r472,r96,r101 # 
915:LRSHIFT,r484,r484,4 # 
916:ANDI,r484,r80,8191 # 
917:LRSHIFT,r80,r84,9 # # End CHECK_XBAR_LAYER 
918:MOV,r480,44 # 
919:LLSHIFT,r104,r481,13 # 
920:OR,r80,r481,r481 # 
921:STOREI,r480,r481 ## write simd_cmd2_reg 
922:MOV,r480,0 # 
923:ADD,r472,r482,r95 # 
924:ADD,r482,r482,r97 # 
925:STOREI,r480,r482 # # End Set_SIMD_MAC - write simd_cmd1_reg 
926:SUBI,r93,r93,147 # 
927:BRAGEZ,129 # 
928:ADDI,r111,r116,0 # 
929:MOV,r70,1536 # 
930:MOV,r80,1 # 
931:MOV,r77,1 # 
932:MOV,r85,1 # 
933:SUBI,r99,r99,0 # 
934:BRANZ,51 # 
935:MOV,r84,0 # 
936:MOV,r66,0 # 
937:MOV,r93,147 # 
938:MOV,r73,84 # 
939:NOP # # Instruction not used in Assembly Generation
940:SUBI,r79,r79,0 # 
941:BRAZ,19 # 
942:MOV,r89,147 # 
943:NOP # # Instruction not used in Assembly Generation
944:LOAD,r496,r481 # 
945:AND,r481,r481,r68 # 
946:BRAZ,2 # 
947:BRAUNCOND,-3 # #Check for prefetch_dma_busy
948:ADDI,r98,r480,0 # 
949:OR,r480,r480,r492 # 
950:ADDI,r480,r480,32 # 
951:ADDI,r93,r482,0 # 
952:LLSHIFT,r482,r482,16 # 
953:ORI,r482,r482,1 # 
954:STORE,r480,r482 # # write to cmd_wd0_reg 
955:ADD,r65,r481,r81 # 
956:AND,r481,r481,r125 # 
957:ADDI,r480,r480,4 # 
958:STORE,r480,r481 # # End PREFETCH - write to cmd_wd1_reg
959:ADDI,r98,r98,128 # 
960:MOV,r89,0 # 
961:ADDI,r88,r480,0 # 
962:OR,r480,r480,r492 # 
963:ADDI,r480,r485,32 # 
964:ADDI,r93,r481,0 # 
965:LLSHIFT,r481,r481,16 # 
966:ORI,r481,r481,1 # 
967:STORE,r485,r481 # #write to cmd_wd0_reg
968:ADD,r65,r481,r81 # 
969:AND,r481,r481,r110 # 
970:ADDI,r485,r485,4 # 
971:STORE,r485,r481 # # end SET_XBAR_WIDTH_SPLIT_REG - write to cmd_wd1_reg
972:ADDI,r74,r74,1 # 
973:ADDI,r84,r84,1 # 
974:MOV,r89,1 # 
975:ADDI,r88,r88,128 # 
976:ADDI,r70,r70,512 # 
977:SUBI,r89,r89,1 # 
978:BRALEZ,2 # 
979:BRAUNCOND,-4 # 
980:SUBI,r66,r66,1 # 
981:BRAGEZ,-9 # 
982:SUBI,r77,r77,1 # 
983:BRALEZ,2 # 
984:BRAUNCOND,-12 # 
985:SUBI,r79,r79,0 # 
986:BRAZ,7 # 
987:LOAD,r495,r482 # # Start ADD_PREFETCH_TO_STARTQ - read cmd_lst_enable_reg
988:NOT,r68,r484 # 
989:AND,r484,r485,r482 # 
990:STORE,r495,r485 # #write to cmd_lst_enable_reg
991:OR,r68,r482,r482 # 
992:STORE,r495,r482 ## write to cmd_lst_enable_reg - End ADD_PREFETCH_TO_STARTQ  
993:LOAD,r494,r481 # 
994:AND,r481,r481,r68 # 
995:BRAZ,2 # 
996:BRAUNCOND,-3 # 
997:LOAD,r493,r482 # 
998:NOT,r68,r484 # # read op_dma_cmd_lst_enable_reg
999:AND,r484,r485,r482 # 
1000:STORE,r493,r485 ## write op_dma_cmd_lst_enable_reg 
1001:OR,r68,r482,r482 # 
1002:STORE,r493,r482 # # End ADD_TO_STARTQ_ALL_XBARS - write op_dma_cmd_lst_enable_reg
1003:STOREI,r117,r102 # #Start SET_SIMD_BASE- write to simd_base_addr_reg
1004:ADDI,r117,r480,4 # 
1005:STOREI,r480,r82 # #write to simd_addr_mask_reg - End SET_SIMD_BASE 
1006:NOP # # Instruction not used in Assembly Generation
1007:MOV,r461,970 # # Start FORCED_CONTEXT SWITCH  
1008:MOV,r449,2 # 
1009:MOV,r480,964 # 
1010:OR,r480,r480,r492 # 
1011:MOV,r481,1014 # 
1012:STORE,r480,r481 # #write to wake_vec_reg 
1013:BRAUNCOND,-950 # # End FORCED_CONTEXT SWITCH
1014:MOV,r480,964 # 
1015:OR,r480,r480,r492 # 
1016:MOV,r482,1028 # 
1017:STORE,r480,r482 # # write to wake_vec_reg 
1018:LOAD,r480,r482 ##End SET_UP_WAKE_VEC - read wake_vec_reg
1019:MOV,r81,0 # 
1020:MOV,r89,1 # 
1021:MOV,r70,19 # 
1022:MOV,r461,978 #  # start CHECK_XBAR_LAYER 
1023:MOV,r449,1 # 
1024:NOP # 
1025:NOP # 
1026:HALT # 
1027:NOP # 
1028:MOV,r480,48 # 
1029:LOADI,r480,r484 # # read simd_lyr_cntrl_reg
1030:MOV,r480,4 # 
1031:LOADI,r480,r472 # # read mac_cmd_reg
1032:LRSHIFT,r472,r480,24 # 
1033:ANDI,r480,r85,255 # 
1034:ADDI,r85,r85,1 # 
1035:LLSHIFT,r85,r84,3 # 
1036:AND,r472,r103,r101 # 
1037:LRSHIFT,r484,r484,4 # 
1038:ANDI,r484,r96,8191 # 
1039:LRSHIFT,r96,r74,9 # # End CHECK_XBAR_LAYER 
1040:MOV,r480,44 # 
1041:LLSHIFT,r104,r481,13 # 
1042:OR,r96,r481,r481 # 
1043:STOREI,r480,r481 ## write simd_cmd2_reg 
1044:MOV,r480,0 # 
1045:ADD,r472,r482,r95 # 
1046:ADD,r482,r482,r97 # 
1047:STOREI,r480,r482 # # End Set_SIMD_MAC - write simd_cmd1_reg 
1048:ADD,r81,r81,r84 # 
1049:SUB,r70,r70,r85 # 
1050:BRALEZ,2 # 
1051:BRAUNCOND,-29 # 
1052:ADDI,r91,r91,1 # 
1053:ADDI,r65,r65,147 # 
1054:MOV,r486,33554431 # 
1055:AND,r65,r65,r486 # 
1056:ADDI,r106,r106,147 # 
1057:MOV,r70,0 # 
1058:MOV,r89,2 # 
1059:MOV,r84,1 # 
1060:LOAD,r496,r481 # # start CHECK_PREFETCH_DONE - read prefetch_dma_busy_reg 
1061:AND,r481,r481,r68 # 
1062:BRAZ,2 # 
1063:BRAUNCOND,-3 # #end CHECK_XBAR_DONE
1064:MOV,r480,12 # 
1065:LOADI,r480,r481 # #read simd_wbuf_addr_status_reg 
1066:ANDI,r481,r481,1 # 
1067:BRANZ,2 # 
1068:BRAUNCOND,-3 # End END_BLOCK 
1069:MOV,r480,1044 # 
1070:OR,r480,r480,r492 # 
1071:STORE,r480,r89 # # End INCREMENT_OBUF_COUNTER  
1072:MOV,r482,1048 ## Start SEND_SYNC_NEXT 
1073:OR,r482,r482,r492 # 
1074:STORE,r482,r89 # # End SEND_SYNC_NEXT
1075:SUBI,r84,r84,1 # 
1076:BRALEZ,2 # 
1077:BRAUNCOND,-13 # 
1078:ADDI,r99,r99,1 # 
1079:SUBI,r67,r67,1 # 
1080:BRALEZ,2 # 
1081:BRAUNCOND,-256 # 
1082:MOV,r92,2 # 
1083:MOV,r93,1 # 
1084:MOV,r94,1304 # 
1085:MOV,r95,3 # 
1086:MOV,r96,1 # 
1087:MOV,r97,40 # 
1088:MOV,r480,784 # 
1089:LLSHIFT,r480,r480,16 # 
1090:OR,r97,r97,r480 # 
1091:NOP ##Start SET_UP_NEXT 
1092:NOP # 
1093:NOP # 
1094:MOV,r461,663 # 
1095:MOV,r449,1 # 
1096:BRAUNCOND,-1033 # #Branch to the same layer, instruction start location
1097:NOP # 
1098:NOP # 
1099:NOP # 
1100:NOP # 
1101:HALT # 
1102:NOP ##End SET_UP_NEXT 
