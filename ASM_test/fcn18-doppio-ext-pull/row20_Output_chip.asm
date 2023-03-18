# Assembler for Chip - Output Processor 
# Output uP Assembly Code 
0:NOP # 
1:MOV,r448,1 # # Init process count 
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
23:NOP #
24:NOP #
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
189:MOV,r15,1 # 
190:MOV,r18,1 # 
191:MOV,r19,0 # 
192:MOV,r38,0 # 
193:MOV,r33,80 # 
194:MOV,r480,784 # 
195:LLSHIFT,r480,r480,16 # 
196:OR,r33,r33,r480 # 
197:MOV,r480,0 # # start STORE_TO_MEMORY 
198:STORE,r33,r480 # # end STORE_TO_MEMORY - write data to address
199:MOV,r0,3584 # 
200:MOV,r23,8 # 
201:MOV,r33,1 # 
202:MOV,r40,2113 # 
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
216:MOV,r9,512 # 
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
234:MOV,r9,512 # 
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
268:MOV,r26,512 # 
269:MOV,r33,3584 # 
270:MOV,r11,1 # 
271:MOV,r60,0 # 
272:MOV,r480,576 # 
273:LLSHIFT,r480,r480,16 # 
274:OR,r60,r60,r480 # 
275:MOV,r61,32767 # 
276:MOV,r480,0 # 
277:LLSHIFT,r480,r480,16 # 
278:OR,r61,r61,r480 # 
279:MOV,r62,13056 # 
280:ADDI,r62,r480,0 ## Start SET_PREFETCH_REGS
281:OR,r480,r480,r492 # 
282:STORE,r480,r61 # # write to addr_mask_reg
283:ADDI,r480,r483,4 # 
284:STORE,r483,r60 # # end SET_PRFETCH_LYR_REG- write to base_addr_reg
285:MOV,r47,9216 # 
286:MOV,r2,0 # 
287:MOV,r14,0 # 
288:OR,r47,r480,r492 ## Start SET_OUT_XBAR_REGS 
289:ADDI,r480,r481,20 # 
290:ADDI,r30,r482,0 # 
291:LLSHIFT,r14,r483,16 # 
292:OR,r482,r482,r483 # 
293:STORE,r481,r482 # #write to mac blk mb_config_reg
294:ADDI,r480,r485,0 # 
295:LLSHIFT,r11,r481,16 # 
296:OR,r26,r481,r481 # 
297:STORE,r485,r481 ## write to mac blk bt_size_reg 
298:ADDI,r480,r481,28 # 
299:LLSHIFT,r36,r482,31 # 
300:OR,r33,r482,r482 # 
301:STORE,r481,r482 # # End SET_OUT_XBAR_REGS - write to mac blk row_step_reg
302:MOV,r47,13312 # 
303:OR,r47,r480,r492 # 
304:ADDI,r480,r481,20 # 
305:MOV,r482,0 # 
306:LLSHIFT,r482,r482,4 # 
307:OR,r30,r482,r482 # 
308:STORE,r481,r482 # # write to mb_config_reg
309:ADDI,r480,r485,0 # 
310:ADDI,r26,r481,0 # 
311:STORE,r485,r481 # #write to mb_bt_size_reg
312:ADDI,r480,r481,28 # 
313:LLSHIFT,r36,r482,31 # 
314:OR,r482,r482,r33 # 
315:STORE,r481,r482 ## End SET_OUT_PREFETCH_REGS - write to mb_row_step_reg 
316:MOV,r14,9216 # 
317:MOV,r47,13312 # 
318:MOV,r2,0 # 
319:SUBI,r2,r2,0 # 
320:BRAZ,6 # 
321:ADDI,r14,r14,128 # 
322:ADDI,r47,r47,128 # 
323:SUBI,r2,r2,1 # 
324:BRALEZ,2 # 
325:BRAUNCOND,-4 # 
326:MOV,r33,0 # 
327:MOV,r11,1 # 
328:MOV,r59,0 # 
329:MOV,r37,65535 # 
330:MOV,r480,255 # 
331:LLSHIFT,r480,r480,16 # 
332:OR,r37,r37,r480 # 
333:MOV,r35,0 # 
334:MOV,r3,7 # 
335:NOP # # Instruction not used in Assembly Generation
336:MOV,r17,0 # 
337:ADDI,r14,r24,0 # 
338:MOV,r27,0 # 
339:MOV,r10,0 # 
340:ADDI,r47,r34,0 # 
341:MOV,r22,1 # 
342:MOV,r31,0 # 
343:MOV,r12,0 # 
344:MOV,r5,0 # 
345:MOV,r41,256 # 
346:MOV,r480,32976 ##Start READ_FROM_SCRATCH
347:MOV,r481,208 # 
348:OR,r481,r481,r492 # 
349:STORE,r481,r480 # write process_memory_addr
350:MOV,r481,212 # 
351:OR,r481,r481,r492 # 
352:LOAD,r481,r38 ## End READ_FROM_SCRATCH - read from process_memory_loc 
353:MOV,r18,32767 # 
354:MOV,r480,0 # 
355:LLSHIFT,r480,r480,16 # 
356:OR,r18,r18,r480 # 
357:MOV,r8,0 # 
358:MOV,r28,0 # 
359:MOV,r52,0 # 
360:SUBI,r52,r52,0 # 
361:BRAZ,3 # 
362:MOV,r33,0 # 
363:NOP # # Instruction not used in Assembly Generation
364:MOV,r52,0 # 
365:SUBI,r52,r52,0 # 
366:BRAZ,73 # 
367:MOV,r10,0 # 
368:MOV,r29,0 # 
369:MOV,r6,0 # 
370:NOP # # Instruction not used in Assembly Generation
371:MOV,r21,1 # 
372:ADDI,r24,r480,0 # 
373:OR,r480,r480,r492 # 
374:ADDI,r480,r485,32 # 
375:ADDI,r29,r481,0 # 
376:LLSHIFT,r481,r481,16 # 
377:ORI,r481,r481,1 # 
378:STORE,r485,r481 # #write to cmd_wd0_reg
379:ADD,r1,r481,r17 # 
380:AND,r481,r481,r46 # 
381:ADDI,r485,r485,4 # 
382:STORE,r485,r481 # # end SET_XBAR_WIDTH_SPLIT_REG - write to cmd_wd1_reg
383:MOV,r486,1 # 
384:LLSHIFTREG,r486,r486,r10 # 
385:LOAD,r493,r482 ## read output_dma_cmd_lst_enable_reg 
386:NOT,r486,r484 # 
387:AND,r484,r485,r482 # 
388:STORE,r493,r485 ## write to output_dma_cmd_lst_enable_reg 
389:OR,r486,r482,r482 # 
390:STORE,r493,r482 ## write to output_dma_cmd_lst_enable_reg - End ADD_XBAR_TO_STARTQ  
391:STOREI,r53,r38 # #Start SET_SIMD_BASE- write to simd_base_addr_reg
392:ADDI,r53,r480,4 # 
393:STOREI,r480,r18 # #write to simd_addr_mask_reg - End SET_SIMD_BASE 
394:ADD,r1,r1,r29 # 
395:MOV,r486,33554431 # 
396:AND,r1,r1,r486 # 
397:NOP # # Instruction not used in Assembly Generation
398:MOV,r460,364 # # Start FORCED_CONTEXT SWITCH  
399:MOV,r449,1 # 
400:MOV,r480,960 # 
401:OR,r480,r480,r492 # 
402:MOV,r481,405 # 
403:STORE,r480,r481 # #write to wake_vec_reg 
404:BRAUNCOND,-341 # # End FORCED_CONTEXT SWITCH
405:MOV,r480,960 # 
406:OR,r480,r480,r492 # 
407:MOV,r482,416 # 
408:STORE,r480,r482 # # write to wake_vec_reg 
409:LOAD,r480,r482 ##End SET_UP_WAKE_VEC - read wake_vec_reg
410:MOV,r460,369 #  # start CHECK_XBAR_LAYER 
411:MOV,r449,0 # 
412:NOP # 
413:NOP # 
414:HALT # 
415:NOP # 
416:MOV,r480,48 # 
417:LOADI,r480,r484 # # read simd_lyr_cntrl_reg
418:MOV,r480,4 # 
419:LOADI,r480,r472 # # read mac_cmd_reg
420:LRSHIFT,r472,r480,24 # 
421:ANDI,r480,r13,255 # 
422:ADDI,r13,r13,1 # 
423:LLSHIFT,r13,r29,3 # 
424:AND,r472,r32,r37 # 
425:LRSHIFT,r484,r484,4 # 
426:ANDI,r484,r16,8191 # 
427:LRSHIFT,r16,r20,9 # # End CHECK_XBAR_LAYER 
428:MOV,r480,44 # 
429:LLSHIFT,r40,r481,13 # 
430:OR,r16,r481,r481 # 
431:STOREI,r480,r481 ## write simd_cmd2_reg 
432:MOV,r480,0 # 
433:ADD,r472,r482,r31 # 
434:ADD,r482,r482,r33 # 
435:STOREI,r480,r482 # # End Set_SIMD_MAC - write simd_cmd1_reg 
436:MOV,r486,3584 # 
437:SUB,r29,r29,r486 # 
438:BRAGEZ,130 # 
439:ADDI,r47,r52,0 # 
440:MOV,r6,0 # 
441:MOV,r16,3 # 
442:MOV,r13,1 # 
443:MOV,r21,3 # 
444:SUBI,r35,r35,0 # 
445:BRANZ,51 # 
446:MOV,r20,0 # 
447:MOV,r2,0 # 
448:MOV,r29,3584 # 
449:MOV,r9,512 # 
450:NOP # # Instruction not used in Assembly Generation
451:SUBI,r15,r15,0 # 
452:BRAZ,19 # 
453:MOV,r25,3584 # 
454:NOP # # Instruction not used in Assembly Generation
455:LOAD,r496,r481 # 
456:AND,r481,r481,r4 # 
457:BRAZ,2 # 
458:BRAUNCOND,-3 # #Check for prefetch_dma_busy
459:ADDI,r34,r480,0 # 
460:OR,r480,r480,r492 # 
461:ADDI,r480,r480,32 # 
462:ADDI,r29,r482,0 # 
463:LLSHIFT,r482,r482,16 # 
464:ORI,r482,r482,1 # 
465:STORE,r480,r482 # # write to cmd_wd0_reg 
466:ADD,r1,r481,r17 # 
467:AND,r481,r481,r61 # 
468:ADDI,r480,r480,4 # 
469:STORE,r480,r481 # # End PREFETCH - write to cmd_wd1_reg
470:ADDI,r34,r34,128 # 
471:MOV,r25,0 # 
472:ADDI,r24,r480,0 # 
473:OR,r480,r480,r492 # 
474:ADDI,r480,r485,32 # 
475:ADDI,r29,r481,0 # 
476:LLSHIFT,r481,r481,16 # 
477:ORI,r481,r481,1 # 
478:STORE,r485,r481 # #write to cmd_wd0_reg
479:ADD,r1,r481,r17 # 
480:AND,r481,r481,r46 # 
481:ADDI,r485,r485,4 # 
482:STORE,r485,r481 # # end SET_XBAR_WIDTH_SPLIT_REG - write to cmd_wd1_reg
483:ADDI,r10,r10,3 # 
484:ADDI,r20,r20,3 # 
485:MOV,r25,3 # 
486:ADDI,r24,r24,128 # 
487:ADDI,r6,r6,512 # 
488:SUBI,r25,r25,1 # 
489:BRALEZ,2 # 
490:BRAUNCOND,-4 # 
491:SUBI,r2,r2,1 # 
492:BRAGEZ,-44 # 
493:SUBI,r13,r13,1 # 
494:BRALEZ,2 # 
495:BRAUNCOND,-48 # 
496:SUBI,r15,r15,0 # 
497:BRAZ,7 # 
498:LOAD,r495,r482 # # Start ADD_PREFETCH_TO_STARTQ - read cmd_lst_enable_reg
499:NOT,r4,r484 # 
500:AND,r484,r485,r482 # 
501:STORE,r495,r485 # #write to cmd_lst_enable_reg
502:OR,r4,r482,r482 # 
503:STORE,r495,r482 ## write to cmd_lst_enable_reg - End ADD_PREFETCH_TO_STARTQ  
504:LOAD,r494,r481 # 
505:AND,r481,r481,r4 # 
506:BRAZ,2 # 
507:BRAUNCOND,-3 # 
508:LOAD,r493,r482 # 
509:NOT,r4,r484 # # read op_dma_cmd_lst_enable_reg
510:AND,r484,r485,r482 # 
511:STORE,r493,r485 ## write op_dma_cmd_lst_enable_reg 
512:OR,r4,r482,r482 # 
513:STORE,r493,r482 # # End ADD_TO_STARTQ_ALL_XBARS - write op_dma_cmd_lst_enable_reg
514:STOREI,r53,r38 # #Start SET_SIMD_BASE- write to simd_base_addr_reg
515:ADDI,r53,r480,4 # 
516:STOREI,r480,r18 # #write to simd_addr_mask_reg - End SET_SIMD_BASE 
517:NOP # # Instruction not used in Assembly Generation
518:MOV,r460,484 # # Start FORCED_CONTEXT SWITCH  
519:MOV,r449,1 # 
520:MOV,r480,960 # 
521:OR,r480,r480,r492 # 
522:MOV,r481,525 # 
523:STORE,r480,r481 # #write to wake_vec_reg 
524:BRAUNCOND,-461 # # End FORCED_CONTEXT SWITCH
525:MOV,r480,960 # 
526:OR,r480,r480,r492 # 
527:MOV,r482,539 # 
528:STORE,r480,r482 # # write to wake_vec_reg 
529:LOAD,r480,r482 ##End SET_UP_WAKE_VEC - read wake_vec_reg
530:MOV,r17,0 # 
531:MOV,r25,1 # 
532:MOV,r6,448 # 
533:MOV,r460,492 #  # start CHECK_XBAR_LAYER 
534:MOV,r449,0 # 
535:NOP # 
536:NOP # 
537:HALT # 
538:NOP # 
539:MOV,r480,48 # 
540:LOADI,r480,r484 # # read simd_lyr_cntrl_reg
541:MOV,r480,4 # 
542:LOADI,r480,r472 # # read mac_cmd_reg
543:LRSHIFT,r472,r480,24 # 
544:ANDI,r480,r21,255 # 
545:ADDI,r21,r21,1 # 
546:LLSHIFT,r21,r20,3 # 
547:AND,r472,r39,r37 # 
548:LRSHIFT,r484,r484,4 # 
549:ANDI,r484,r32,8191 # 
550:LRSHIFT,r32,r10,9 # # End CHECK_XBAR_LAYER 
551:MOV,r480,44 # 
552:LLSHIFT,r40,r481,13 # 
553:OR,r32,r481,r481 # 
554:STOREI,r480,r481 ## write simd_cmd2_reg 
555:MOV,r480,0 # 
556:ADD,r472,r482,r31 # 
557:ADD,r482,r482,r33 # 
558:STOREI,r480,r482 # # End Set_SIMD_MAC - write simd_cmd1_reg 
559:ADD,r17,r17,r20 # 
560:SUB,r6,r6,r21 # 
561:BRALEZ,2 # 
562:BRAUNCOND,-29 # 
563:ADDI,r27,r27,1 # 
564:MOV,r486,3584 # 
565:ADD,r1,r1,r486 # 
566:MOV,r486,33554431 # 
567:AND,r1,r1,r486 # 
568:MOV,r486,3584 # 
569:ADD,r42,r42,r486 # 
570:MOV,r6,0 # 
571:MOV,r486,3584 # 
572:ADD,r60,r60,r486 # 
573:MOV,r25,1 # 
574:MOV,r20,1 # 
575:LOAD,r496,r481 # # start CHECK_PREFETCH_DONE - read prefetch_dma_busy_reg 
576:AND,r481,r481,r4 # 
577:BRAZ,2 # 
578:BRAUNCOND,-3 # #end CHECK_XBAR_DONE
579:MOV,r480,12 # 
580:LOADI,r480,r481 # #read simd_wbuf_addr_status_reg 
581:ANDI,r481,r481,1 # 
582:BRANZ,2 # 
583:BRAUNCOND,-3 # End END_BLOCK 
584:MOV,r480,1044 # 
585:OR,r480,r480,r492 # 
586:STORE,r480,r25 # # End INCREMENT_OBUF_COUNTER  
587:MOV,r482,1048 ## Start SEND_SYNC_NEXT 
588:OR,r482,r482,r492 # 
589:STORE,r482,r25 # # End SEND_SYNC_NEXT
590:SUBI,r20,r20,1 # 
591:BRALEZ,2 # 
592:BRAUNCOND,-13 # 
593:ADDI,r35,r35,1 # 
594:SUBI,r3,r3,1 # 
595:BRALEZ,2 # 
596:BRAUNCOND,-261 # 
597:MOV,r28,1 # 
598:MOV,r29,0 # 
599:MOV,r30,1192 # 
600:MOV,r31,0 # 
601:MOV,r32,3 # 
602:MOV,r33,80 # 
603:MOV,r480,784 # 
604:LLSHIFT,r480,r480,16 # 
605:OR,r33,r33,r480 # 
606:NOP ##Start SET_UP_NEXT 
607:NOP # 
608:NOP # 
609:MOV,r460,148 # 
610:MOV,r449,0 # 
611:BRAUNCOND,-548 # #Branch to the same layer, instruction start location
612:NOP # 
613:NOP # 
614:NOP # 
615:NOP # 
616:HALT # 
617:NOP ##End SET_UP_NEXT 
