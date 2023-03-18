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
113:MOV,r480,33136 ##Start READ_FROM_SCRATCH
114:MOV,r481,208 # 
115:OR,r481,r481,r492 # 
116:STORE,r481,r480 # write process_memory_addr
117:MOV,r481,212 # 
118:OR,r481,r481,r492 # 
119:LOAD,r481,r43 ## End READ_FROM_SCRATCH - read from process_memory_loc 
120:MOV,r480,33140 ##Start READ_FROM_SCRATCH
121:MOV,r481,208 # 
122:OR,r481,r481,r492 # 
123:STORE,r481,r480 # write process_memory_addr
124:MOV,r481,212 # 
125:OR,r481,r481,r492 # 
126:LOAD,r481,r49 ## End READ_FROM_SCRATCH - read from process_memory_loc 
127:MOV,r480,33144 ##Start READ_FROM_SCRATCH
128:MOV,r481,208 # 
129:OR,r481,r481,r492 # 
130:STORE,r481,r480 # write process_memory_addr
131:MOV,r481,212 # 
132:OR,r481,r481,r492 # 
133:LOAD,r481,r55 ## End READ_FROM_SCRATCH - read from process_memory_loc 
134:MOV,r5,0 # 
135:MOV,r22,2 # 
136:MOV,r41,256 # 
137:MOV,r25,0 # 
138:MOV,r27,0 # 
139:ADDI,r22,r484,0 # # Start SET_MULTICAST_ADDR
140:SUBI,r484,r484,1 # 
141:BRALEZ,69 # 
142:ADDI,r41,r480,0 # 
143:OR,r480,r480,r492 # 
144:ADDI,r22,r484,1 # 
145:SUBI,r27,r485,0 # 
146:BRALEZ,8 # # Jump to first dest_detail
147:SUBI,r27,r485,1 # 
148:BRALEZ,19 # # Jump to second dest detail 
149:SUBI,r27,r485,2 # 
150:BRALEZ,31 # # Jump to third dest detail 
151:SUBI,r27,r485,3 # 
152:BRALEZ,43 # # Jumpt to fourth dest detail 
153:BRAUNCOND,57 # 
154:AND,r48,r481,r42 # 
155:ADDI,r54,r481,0 # 
156:SUBI,r484,r484,1 # 
157:BRALEZ,4 # 
158:ORI,r481,r481,1 # 
159:ADDI,r484,r484,0 # 
160:BRAUNCOND,2 # 
161:MOV,r481,0 # 
162:STORE,r480,r481 # 
163:ADDI,r480,r481,4 # 
164:STORE,r481,r48 # 
165:ADDI,r480,r481,8 # 
166:STORE,r481,r42 # 
167:ADDI,r480,r486,16 # 
168:AND,r49,r481,r43 # 
169:ADDI,r55,r481,0 # 
170:SUBI,r484,r484,1 # 
171:BRALEZ,4 # 
172:ORI,r481,r481,1 # 
173:ADDI,r484,r484,0 # 
174:BRAUNCOND,2 # 
175:MOV,r481,0 # 
176:STORE,r486,r481 # 
177:ADDI,r486,r481,4 # 
178:STORE,r481,r49 # 
179:ADDI,r486,r481,8 # 
180:STORE,r481,r43 # 
181:ADDI,r480,r486,32 # 
182:AND,r50,r481,r44 # 
183:ADDI,r56,r481,0 # 
184:SUBI,r484,r484,1 # 
185:BRALEZ,4 # 
186:ORI,r481,r481,1 # 
187:ADDI,r484,r484,0 # 
188:BRAUNCOND,2 # 
189:MOV,r481,0 # 
190:STORE,r486,r481 # 
191:ADDI,r486,r481,4 # 
192:STORE,r481,r50 # 
193:ADDI,r486,r481,8 # 
194:STORE,r481,r44 # 
195:ADDI,r480,r486,48 # 
196:AND,r51,r481,r45 # 
197:ADDI,r57,r481,0 # 
198:SUBI,r484,r484,1 # 
199:BRALEZ,4 # 
200:ORI,r481,r481,1 # 
201:ADDI,r484,r484,0 # 
202:BRAUNCOND,2 # 
203:MOV,r481,0 # 
204:STORE,r486,r481 # 
205:ADDI,r486,r481,4 # 
206:STORE,r481,r51 # 
207:ADDI,r486,r481,8 # 
208:STORE,r481,r45 # 
209:NOP # # End SET_MULTICAST_ADDR
210:MOV,r15,1 # 
211:MOV,r18,1 # 
212:MOV,r19,0 # 
213:MOV,r38,0 # 
214:MOV,r33,20 # 
215:MOV,r480,784 # 
216:LLSHIFT,r480,r480,16 # 
217:OR,r33,r33,r480 # 
218:MOV,r480,0 # # start STORE_TO_MEMORY 
219:STORE,r33,r480 # # end STORE_TO_MEMORY - write data to address
220:MOV,r0,3584 # 
221:MOV,r23,8 # 
222:MOV,r33,1 # 
223:MOV,r40,2113 # 
224:MOV,r30,0 # 
225:MOV,r2,0 # 
226:MOV,r58,0 # 
227:MOV,r480,0 # 
228:LLSHIFT,r480,r480,16 # 
229:OR,r58,r58,r480 # 
230:MOV,r46,65535 # 
231:MOV,r480,511 # 
232:LLSHIFT,r480,r480,16 # 
233:OR,r46,r46,r480 # 
234:MOV,r53,64 # 
235:MOV,r36,0 # 
236:MOV,r4,8960 # 
237:MOV,r9,256 # 
238:MOV,r19,0 # 
239:MOV,r33,0 # 
240:ADDI,r4,r480,0 ## Start SET_LYR_REG 
241:OR,r480,r480,r492 # 
242:STORE,r480,r19 # # write to addr_mask_reg
243:ADDI,r480,r483,4 # 
244:STORE,r483,r19 # # write to base_addr_reg
245:LLSHIFT,r19,r482,16 # 
246:OR,r482,r482,r9 # 
247:ADDI,r480,r483,8 # 
248:STORE,r483,r482 # #wite to addr_stp_reg
249:MOV,r480,8228 # 
250:OR,r480,r480,r492 # 
251:LOAD,r480,r481 # 
252:OR,r481,r481,r33 # 
253:STORE,r480,r481 # # end SET_OUTPUT_LYR_REG - write to xbar_grp_reg
254:MOV,r4,13056 # 
255:MOV,r9,256 # 
256:ADDI,r4,r480,0 ## Start SET_LYR_REG 
257:OR,r480,r480,r492 # 
258:LLSHIFT,r19,r482,16 # 
259:OR,r482,r482,r9 # 
260:ADDI,r480,r483,8 # 
261:STORE,r483,r482 # #write to address_step_reg 
262:MOV,r480,12324 # 
263:OR,r480,r480,r492 # 
264:LOAD,r480,r481 # 
265:OR,r481,r481,r33 # 
266:STORE,r480,r481 ## end SET_PREFETCH_LYR_REGS - write to prefetch_grp_reg
267:MOV,r4,1 # 
268:MOV,r2,57 # 
269:MOV,r33,1 # 
270:MOV,r480,8224 ## Start SET_HORSPLIT_REG
271:OR,r480,r480,r492 # 
272:LOAD,r480,r481 ##load split_group_reg 
273:OR,r481,r481,r2 # 
274:STORE,r480,r481 ## End SET_HORSPLIT_REG 
275:MOV,r14,1 # 
276:MOV,r33,170 # 
277:MOV,r2,0 # 
278:MOV,r480,0 # 
279:LLSHIFT,r480,r480,16 # 
280:OR,r2,r2,r480 # 
281:MOV,r3,512 # 
282:ADDI,r3,r480,0 # 
283:OR,r480,r480,r492 # 
284:STORE,r480,r14 # #write to colgrp_reg 
285:ADDI,r480,r480,4 # 
286:STORE,r480,r33 # # write to colsign_reg 
287:ADDI,r480,r480,4 # 
288:STORE,r480,r2 # # End SET_COL_GRP_REGS - write to colshift_reg
289:MOV,r26,256 # 
290:MOV,r33,3584 # 
291:MOV,r11,1 # 
292:MOV,r60,0 # 
293:MOV,r480,525 # 
294:LLSHIFT,r480,r480,16 # 
295:OR,r60,r60,r480 # 
296:MOV,r61,65535 # 
297:MOV,r480,0 # 
298:LLSHIFT,r480,r480,16 # 
299:OR,r61,r61,r480 # 
300:MOV,r62,13056 # 
301:ADDI,r62,r480,0 ## Start SET_PREFETCH_REGS
302:OR,r480,r480,r492 # 
303:STORE,r480,r61 # # write to addr_mask_reg
304:ADDI,r480,r483,4 # 
305:STORE,r483,r60 # # end SET_PRFETCH_LYR_REG- write to base_addr_reg
306:MOV,r47,9216 # 
307:MOV,r2,0 # 
308:MOV,r14,0 # 
309:OR,r47,r480,r492 ## Start SET_OUT_XBAR_REGS 
310:ADDI,r480,r481,20 # 
311:ADDI,r30,r482,0 # 
312:LLSHIFT,r14,r483,16 # 
313:OR,r482,r482,r483 # 
314:STORE,r481,r482 # #write to mac blk mb_config_reg
315:ADDI,r480,r485,0 # 
316:LLSHIFT,r11,r481,16 # 
317:OR,r26,r481,r481 # 
318:STORE,r485,r481 ## write to mac blk bt_size_reg 
319:ADDI,r480,r481,28 # 
320:LLSHIFT,r36,r482,31 # 
321:OR,r33,r482,r482 # 
322:STORE,r481,r482 # # End SET_OUT_XBAR_REGS - write to mac blk row_step_reg
323:MOV,r47,13312 # 
324:OR,r47,r480,r492 # 
325:ADDI,r480,r481,20 # 
326:MOV,r482,0 # 
327:LLSHIFT,r482,r482,4 # 
328:OR,r30,r482,r482 # 
329:STORE,r481,r482 # # write to mb_config_reg
330:ADDI,r480,r485,0 # 
331:ADDI,r26,r481,0 # 
332:STORE,r485,r481 # #write to mb_bt_size_reg
333:ADDI,r480,r481,28 # 
334:LLSHIFT,r36,r482,31 # 
335:OR,r482,r482,r33 # 
336:STORE,r481,r482 ## End SET_OUT_PREFETCH_REGS - write to mb_row_step_reg 
337:MOV,r14,9216 # 
338:MOV,r47,13312 # 
339:MOV,r2,0 # 
340:SUBI,r2,r2,0 # 
341:BRAZ,6 # 
342:ADDI,r14,r14,128 # 
343:ADDI,r47,r47,128 # 
344:SUBI,r2,r2,1 # 
345:BRALEZ,2 # 
346:BRAUNCOND,-4 # 
347:MOV,r33,0 # 
348:MOV,r11,1 # 
349:MOV,r59,0 # 
350:MOV,r37,65535 # 
351:MOV,r480,255 # 
352:LLSHIFT,r480,r480,16 # 
353:OR,r37,r37,r480 # 
354:MOV,r35,0 # 
355:MOV,r3,14 # 
356:NOP # # Instruction not used in Assembly Generation
357:MOV,r17,0 # 
358:ADDI,r14,r24,0 # 
359:MOV,r27,0 # 
360:MOV,r10,0 # 
361:ADDI,r47,r34,0 # 
362:MOV,r22,2 # 
363:MOV,r31,0 # 
364:MOV,r12,0 # 
365:MOV,r5,0 # 
366:MOV,r41,256 # 
367:MOV,r480,32976 ##Start READ_FROM_SCRATCH
368:MOV,r481,208 # 
369:OR,r481,r481,r492 # 
370:STORE,r481,r480 # write process_memory_addr
371:MOV,r481,212 # 
372:OR,r481,r481,r492 # 
373:LOAD,r481,r38 ## End READ_FROM_SCRATCH - read from process_memory_loc 
374:MOV,r18,65535 # 
375:MOV,r480,3 # 
376:LLSHIFT,r480,r480,16 # 
377:OR,r18,r18,r480 # 
378:MOV,r8,0 # 
379:MOV,r28,0 # 
380:MOV,r52,1 # 
381:SUBI,r52,r52,0 # 
382:BRAZ,3 # 
383:MOV,r33,0 # 
384:NOP # # Instruction not used in Assembly Generation
385:MOV,r52,0 # 
386:SUBI,r52,r52,0 # 
387:BRAZ,73 # 
388:MOV,r10,0 # 
389:MOV,r29,0 # 
390:MOV,r6,0 # 
391:NOP # # Instruction not used in Assembly Generation
392:MOV,r21,1 # 
393:ADDI,r24,r480,0 # 
394:OR,r480,r480,r492 # 
395:ADDI,r480,r485,32 # 
396:ADDI,r29,r481,0 # 
397:LLSHIFT,r481,r481,16 # 
398:ORI,r481,r481,1 # 
399:STORE,r485,r481 # #write to cmd_wd0_reg
400:ADD,r1,r481,r17 # 
401:AND,r481,r481,r46 # 
402:ADDI,r485,r485,4 # 
403:STORE,r485,r481 # # end SET_XBAR_WIDTH_SPLIT_REG - write to cmd_wd1_reg
404:MOV,r486,1 # 
405:LLSHIFTREG,r486,r486,r10 # 
406:LOAD,r493,r482 ## read output_dma_cmd_lst_enable_reg 
407:NOT,r486,r484 # 
408:AND,r484,r485,r482 # 
409:STORE,r493,r485 ## write to output_dma_cmd_lst_enable_reg 
410:OR,r486,r482,r482 # 
411:STORE,r493,r482 ## write to output_dma_cmd_lst_enable_reg - End ADD_XBAR_TO_STARTQ  
412:STOREI,r53,r38 # #Start SET_SIMD_BASE- write to simd_base_addr_reg
413:ADDI,r53,r480,4 # 
414:STOREI,r480,r18 # #write to simd_addr_mask_reg - End SET_SIMD_BASE 
415:ADD,r1,r1,r29 # 
416:MOV,r486,33554431 # 
417:AND,r1,r1,r486 # 
418:NOP # # Instruction not used in Assembly Generation
419:MOV,r460,385 # # Start FORCED_CONTEXT SWITCH  
420:MOV,r449,1 # 
421:MOV,r480,960 # 
422:OR,r480,r480,r492 # 
423:MOV,r481,426 # 
424:STORE,r480,r481 # #write to wake_vec_reg 
425:BRAUNCOND,-362 # # End FORCED_CONTEXT SWITCH
426:MOV,r480,960 # 
427:OR,r480,r480,r492 # 
428:MOV,r482,437 # 
429:STORE,r480,r482 # # write to wake_vec_reg 
430:LOAD,r480,r482 ##End SET_UP_WAKE_VEC - read wake_vec_reg
431:MOV,r460,390 #  # start CHECK_XBAR_LAYER 
432:MOV,r449,0 # 
433:NOP # 
434:NOP # 
435:HALT # 
436:NOP # 
437:MOV,r480,48 # 
438:LOADI,r480,r484 # # read simd_lyr_cntrl_reg
439:MOV,r480,4 # 
440:LOADI,r480,r472 # # read mac_cmd_reg
441:LRSHIFT,r472,r480,24 # 
442:ANDI,r480,r13,255 # 
443:ADDI,r13,r13,1 # 
444:LLSHIFT,r13,r29,3 # 
445:AND,r472,r32,r37 # 
446:LRSHIFT,r484,r484,4 # 
447:ANDI,r484,r16,8191 # 
448:LRSHIFT,r16,r20,9 # # End CHECK_XBAR_LAYER 
449:MOV,r480,44 # 
450:LLSHIFT,r40,r481,13 # 
451:OR,r16,r481,r481 # 
452:STOREI,r480,r481 ## write simd_cmd2_reg 
453:MOV,r480,0 # 
454:ADD,r472,r482,r31 # 
455:ADD,r482,r482,r33 # 
456:STOREI,r480,r482 # # End Set_SIMD_MAC - write simd_cmd1_reg 
457:MOV,r486,3584 # 
458:SUB,r29,r29,r486 # 
459:BRAGEZ,130 # 
460:ADDI,r47,r52,0 # 
461:MOV,r6,0 # 
462:MOV,r16,3 # 
463:MOV,r13,1 # 
464:MOV,r21,3 # 
465:SUBI,r35,r35,0 # 
466:BRANZ,51 # 
467:MOV,r20,0 # 
468:MOV,r2,0 # 
469:MOV,r29,3584 # 
470:MOV,r9,256 # 
471:NOP # # Instruction not used in Assembly Generation
472:SUBI,r15,r15,0 # 
473:BRAZ,19 # 
474:MOV,r25,3584 # 
475:NOP # # Instruction not used in Assembly Generation
476:LOAD,r496,r481 # 
477:AND,r481,r481,r4 # 
478:BRAZ,2 # 
479:BRAUNCOND,-3 # #Check for prefetch_dma_busy
480:ADDI,r34,r480,0 # 
481:OR,r480,r480,r492 # 
482:ADDI,r480,r480,32 # 
483:ADDI,r29,r482,0 # 
484:LLSHIFT,r482,r482,16 # 
485:ORI,r482,r482,1 # 
486:STORE,r480,r482 # # write to cmd_wd0_reg 
487:ADD,r1,r481,r17 # 
488:AND,r481,r481,r61 # 
489:ADDI,r480,r480,4 # 
490:STORE,r480,r481 # # End PREFETCH - write to cmd_wd1_reg
491:ADDI,r34,r34,128 # 
492:MOV,r25,0 # 
493:ADDI,r24,r480,0 # 
494:OR,r480,r480,r492 # 
495:ADDI,r480,r485,32 # 
496:ADDI,r29,r481,0 # 
497:LLSHIFT,r481,r481,16 # 
498:ORI,r481,r481,1 # 
499:STORE,r485,r481 # #write to cmd_wd0_reg
500:ADD,r1,r481,r17 # 
501:AND,r481,r481,r46 # 
502:ADDI,r485,r485,4 # 
503:STORE,r485,r481 # # end SET_XBAR_WIDTH_SPLIT_REG - write to cmd_wd1_reg
504:ADDI,r10,r10,3 # 
505:ADDI,r20,r20,3 # 
506:MOV,r25,3 # 
507:ADDI,r24,r24,128 # 
508:ADDI,r6,r6,512 # 
509:SUBI,r25,r25,1 # 
510:BRALEZ,2 # 
511:BRAUNCOND,-4 # 
512:SUBI,r2,r2,1 # 
513:BRAGEZ,-44 # 
514:SUBI,r13,r13,1 # 
515:BRALEZ,2 # 
516:BRAUNCOND,-48 # 
517:SUBI,r15,r15,0 # 
518:BRAZ,7 # 
519:LOAD,r495,r482 # # Start ADD_PREFETCH_TO_STARTQ - read cmd_lst_enable_reg
520:NOT,r4,r484 # 
521:AND,r484,r485,r482 # 
522:STORE,r495,r485 # #write to cmd_lst_enable_reg
523:OR,r4,r482,r482 # 
524:STORE,r495,r482 ## write to cmd_lst_enable_reg - End ADD_PREFETCH_TO_STARTQ  
525:LOAD,r494,r481 # 
526:AND,r481,r481,r4 # 
527:BRAZ,2 # 
528:BRAUNCOND,-3 # 
529:LOAD,r493,r482 # 
530:NOT,r4,r484 # # read op_dma_cmd_lst_enable_reg
531:AND,r484,r485,r482 # 
532:STORE,r493,r485 ## write op_dma_cmd_lst_enable_reg 
533:OR,r4,r482,r482 # 
534:STORE,r493,r482 # # End ADD_TO_STARTQ_ALL_XBARS - write op_dma_cmd_lst_enable_reg
535:STOREI,r53,r38 # #Start SET_SIMD_BASE- write to simd_base_addr_reg
536:ADDI,r53,r480,4 # 
537:STOREI,r480,r18 # #write to simd_addr_mask_reg - End SET_SIMD_BASE 
538:NOP # # Instruction not used in Assembly Generation
539:MOV,r460,505 # # Start FORCED_CONTEXT SWITCH  
540:MOV,r449,1 # 
541:MOV,r480,960 # 
542:OR,r480,r480,r492 # 
543:MOV,r481,546 # 
544:STORE,r480,r481 # #write to wake_vec_reg 
545:BRAUNCOND,-482 # # End FORCED_CONTEXT SWITCH
546:MOV,r480,960 # 
547:OR,r480,r480,r492 # 
548:MOV,r482,560 # 
549:STORE,r480,r482 # # write to wake_vec_reg 
550:LOAD,r480,r482 ##End SET_UP_WAKE_VEC - read wake_vec_reg
551:MOV,r17,0 # 
552:MOV,r25,1 # 
553:MOV,r6,448 # 
554:MOV,r460,513 #  # start CHECK_XBAR_LAYER 
555:MOV,r449,0 # 
556:NOP # 
557:NOP # 
558:HALT # 
559:NOP # 
560:MOV,r480,48 # 
561:LOADI,r480,r484 # # read simd_lyr_cntrl_reg
562:MOV,r480,4 # 
563:LOADI,r480,r472 # # read mac_cmd_reg
564:LRSHIFT,r472,r480,24 # 
565:ANDI,r480,r21,255 # 
566:ADDI,r21,r21,1 # 
567:LLSHIFT,r21,r20,3 # 
568:AND,r472,r39,r37 # 
569:LRSHIFT,r484,r484,4 # 
570:ANDI,r484,r32,8191 # 
571:LRSHIFT,r32,r10,9 # # End CHECK_XBAR_LAYER 
572:MOV,r480,44 # 
573:LLSHIFT,r40,r481,13 # 
574:OR,r32,r481,r481 # 
575:STOREI,r480,r481 ## write simd_cmd2_reg 
576:MOV,r480,0 # 
577:ADD,r472,r482,r31 # 
578:ADD,r482,r482,r33 # 
579:STOREI,r480,r482 # # End Set_SIMD_MAC - write simd_cmd1_reg 
580:ADD,r17,r17,r20 # 
581:SUB,r6,r6,r21 # 
582:BRALEZ,2 # 
583:BRAUNCOND,-29 # 
584:ADDI,r27,r27,2 # 
585:MOV,r486,3584 # 
586:ADD,r1,r1,r486 # 
587:MOV,r486,33554431 # 
588:AND,r1,r1,r486 # 
589:MOV,r486,3584 # 
590:ADD,r42,r42,r486 # 
591:MOV,r6,18350080 # 
592:MOV,r486,3584 # 
593:ADD,r43,r43,r486 # 
594:MOV,r6,18644992 # 
595:MOV,r486,3584 # 
596:ADD,r60,r60,r486 # 
597:MOV,r25,1 # 
598:MOV,r20,1 # 
599:LOAD,r496,r481 # # start CHECK_PREFETCH_DONE - read prefetch_dma_busy_reg 
600:AND,r481,r481,r4 # 
601:BRAZ,2 # 
602:BRAUNCOND,-3 # #end CHECK_XBAR_DONE
603:MOV,r480,12 # 
604:LOADI,r480,r481 # #read simd_wbuf_addr_status_reg 
605:ANDI,r481,r481,1 # 
606:BRANZ,2 # 
607:BRAUNCOND,-3 # End END_BLOCK 
608:MOV,r480,1044 # 
609:OR,r480,r480,r492 # 
610:STORE,r480,r25 # # End INCREMENT_OBUF_COUNTER  
611:MOV,r482,1048 ## Start SEND_SYNC_NEXT 
612:OR,r482,r482,r492 # 
613:STORE,r482,r25 # # End SEND_SYNC_NEXT
614:SUBI,r20,r20,1 # 
615:BRALEZ,2 # 
616:BRAUNCOND,-13 # 
617:ADDI,r35,r35,0 # 
618:SUBI,r3,r3,1 # 
619:BRALEZ,2 # 
620:BRAUNCOND,-264 # 
621:MOV,r28,1 # 
622:MOV,r29,0 # 
623:MOV,r30,1192 # 
624:MOV,r31,0 # 
625:MOV,r32,3 # 
626:MOV,r33,20 # 
627:MOV,r480,784 # 
628:LLSHIFT,r480,r480,16 # 
629:OR,r33,r33,r480 # 
630:NOP ##Start SET_UP_NEXT 
631:NOP # 
632:NOP # 
633:MOV,r460,169 # 
634:MOV,r449,0 # 
635:BRAUNCOND,-572 # #Branch to the same layer, instruction start location
636:NOP # 
637:NOP # 
638:NOP # 
639:NOP # 
640:HALT # 
641:NOP ##End SET_UP_NEXT 
