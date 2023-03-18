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
23:MOV,r451,564 # # store proc1 start loc
24:MOV,r461,564 # # store proc1 last loc  
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
210:MOV,r15,0 # 
211:MOV,r18,0 # 
212:MOV,r19,0 # 
213:MOV,r38,0 # 
214:MOV,r33,0 # 
215:MOV,r480,784 # 
216:LLSHIFT,r480,r480,16 # 
217:OR,r33,r33,r480 # 
218:MOV,r480,0 # # start STORE_TO_MEMORY 
219:STORE,r33,r480 # # end STORE_TO_MEMORY - write data to address
220:MOV,r0,64 # 
221:MOV,r23,8 # 
222:MOV,r33,1 # 
223:MOV,r40,1017 # 
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
237:MOV,r9,32 # 
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
255:MOV,r9,32 # 
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
268:MOV,r2,0 # 
269:MOV,r33,16777215 # 
270:MOV,r480,8224 ## Start SET_HORSPLIT_REG
271:OR,r480,r480,r492 # 
272:LOAD,r480,r481 ##load split_group_reg 
273:OR,r481,r481,r2 # 
274:STORE,r480,r481 ## End SET_HORSPLIT_REG 
275:MOV,r14,0 # 
276:MOV,r33,0 # 
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
289:MOV,r26,32 # 
290:MOV,r33,64 # 
291:MOV,r11,1 # 
292:MOV,r47,9216 # 
293:MOV,r2,0 # 
294:MOV,r14,0 # 
295:OR,r47,r480,r492 ## Start SET_OUT_XBAR_REGS 
296:ADDI,r480,r481,20 # 
297:ADDI,r30,r482,0 # 
298:LLSHIFT,r14,r483,16 # 
299:OR,r482,r482,r483 # 
300:STORE,r481,r482 # #write to mac blk mb_config_reg
301:ADDI,r480,r485,0 # 
302:LLSHIFT,r11,r481,16 # 
303:OR,r26,r481,r481 # 
304:STORE,r485,r481 ## write to mac blk bt_size_reg 
305:ADDI,r480,r481,28 # 
306:LLSHIFT,r36,r482,31 # 
307:OR,r33,r482,r482 # 
308:STORE,r481,r482 # # End SET_OUT_XBAR_REGS - write to mac blk row_step_reg
309:MOV,r14,9216 # 
310:MOV,r47,13312 # 
311:MOV,r2,0 # 
312:SUBI,r2,r2,0 # 
313:BRAZ,6 # 
314:ADDI,r14,r14,128 # 
315:ADDI,r47,r47,128 # 
316:SUBI,r2,r2,1 # 
317:BRALEZ,2 # 
318:BRAUNCOND,-4 # 
319:MOV,r33,0 # 
320:MOV,r11,1 # 
321:MOV,r59,0 # 
322:MOV,r37,65535 # 
323:MOV,r480,255 # 
324:LLSHIFT,r480,r480,16 # 
325:OR,r37,r37,r480 # 
326:MOV,r35,0 # 
327:MOV,r3,8 # 
328:NOP # # Instruction not used in Assembly Generation
329:MOV,r17,0 # 
330:ADDI,r14,r24,0 # 
331:MOV,r27,0 # 
332:MOV,r10,0 # 
333:ADDI,r47,r34,0 # 
334:MOV,r22,2 # 
335:MOV,r31,0 # 
336:MOV,r12,0 # 
337:MOV,r5,0 # 
338:MOV,r41,256 # 
339:MOV,r480,32976 ##Start READ_FROM_SCRATCH
340:MOV,r481,208 # 
341:OR,r481,r481,r492 # 
342:STORE,r481,r480 # write process_memory_addr
343:MOV,r481,212 # 
344:OR,r481,r481,r492 # 
345:LOAD,r481,r38 ## End READ_FROM_SCRATCH - read from process_memory_loc 
346:MOV,r18,65535 # 
347:MOV,r480,3 # 
348:LLSHIFT,r480,r480,16 # 
349:OR,r18,r18,r480 # 
350:MOV,r8,0 # 
351:MOV,r28,0 # 
352:MOV,r52,1 # 
353:SUBI,r52,r52,0 # 
354:BRAZ,3 # 
355:MOV,r33,0 # 
356:NOP # # Instruction not used in Assembly Generation
357:MOV,r52,0 # 
358:SUBI,r52,r52,0 # 
359:BRAZ,72 # 
360:MOV,r10,0 # 
361:MOV,r29,0 # 
362:MOV,r6,0 # 
363:NOP # # Instruction not used in Assembly Generation
364:MOV,r21,1 # 
365:ADDI,r24,r480,0 # 
366:OR,r480,r480,r492 # 
367:ADDI,r480,r485,32 # 
368:ADDI,r29,r481,0 # 
369:LLSHIFT,r481,r481,16 # 
370:ORI,r481,r481,1 # 
371:STORE,r485,r481 # #write to cmd_wd0_reg
372:ADD,r1,r481,r17 # 
373:AND,r481,r481,r46 # 
374:ADDI,r485,r485,4 # 
375:STORE,r485,r481 # # end SET_XBAR_WIDTH_SPLIT_REG - write to cmd_wd1_reg
376:MOV,r486,1 # 
377:LLSHIFTREG,r486,r486,r10 # 
378:LOAD,r493,r482 ## read output_dma_cmd_lst_enable_reg 
379:NOT,r486,r484 # 
380:AND,r484,r485,r482 # 
381:STORE,r493,r485 ## write to output_dma_cmd_lst_enable_reg 
382:OR,r486,r482,r482 # 
383:STORE,r493,r482 ## write to output_dma_cmd_lst_enable_reg - End ADD_XBAR_TO_STARTQ  
384:STOREI,r53,r38 # #Start SET_SIMD_BASE- write to simd_base_addr_reg
385:ADDI,r53,r480,4 # 
386:STOREI,r480,r18 # #write to simd_addr_mask_reg - End SET_SIMD_BASE 
387:ADD,r1,r1,r29 # 
388:MOV,r486,33554431 # 
389:AND,r1,r1,r486 # 
390:NOP # # Instruction not used in Assembly Generation
391:MOV,r460,357 # # Start FORCED_CONTEXT SWITCH  
392:MOV,r449,1 # 
393:MOV,r480,960 # 
394:OR,r480,r480,r492 # 
395:MOV,r481,398 # 
396:STORE,r480,r481 # #write to wake_vec_reg 
397:BRAUNCOND,-334 # # End FORCED_CONTEXT SWITCH
398:MOV,r480,960 # 
399:OR,r480,r480,r492 # 
400:MOV,r482,409 # 
401:STORE,r480,r482 # # write to wake_vec_reg 
402:LOAD,r480,r482 ##End SET_UP_WAKE_VEC - read wake_vec_reg
403:MOV,r460,362 #  # start CHECK_XBAR_LAYER 
404:MOV,r449,0 # 
405:NOP # 
406:NOP # 
407:HALT # 
408:NOP # 
409:MOV,r480,48 # 
410:LOADI,r480,r484 # # read simd_lyr_cntrl_reg
411:MOV,r480,4 # 
412:LOADI,r480,r472 # # read mac_cmd_reg
413:LRSHIFT,r472,r480,24 # 
414:ANDI,r480,r13,255 # 
415:ADDI,r13,r13,1 # 
416:LLSHIFT,r13,r29,3 # 
417:AND,r472,r32,r37 # 
418:LRSHIFT,r484,r484,4 # 
419:ANDI,r484,r16,8191 # 
420:LRSHIFT,r16,r20,9 # # End CHECK_XBAR_LAYER 
421:MOV,r480,44 # 
422:LLSHIFT,r40,r481,13 # 
423:OR,r16,r481,r481 # 
424:STOREI,r480,r481 ## write simd_cmd2_reg 
425:MOV,r480,0 # 
426:ADD,r472,r482,r31 # 
427:ADD,r482,r482,r33 # 
428:STOREI,r480,r482 # # End Set_SIMD_MAC - write simd_cmd1_reg 
429:SUBI,r29,r29,64 # 
430:BRAGEZ,129 # 
431:ADDI,r47,r52,0 # 
432:MOV,r6,0 # 
433:MOV,r16,1 # 
434:MOV,r13,1 # 
435:MOV,r21,1 # 
436:SUBI,r35,r35,0 # 
437:BRANZ,51 # 
438:MOV,r20,0 # 
439:MOV,r2,0 # 
440:MOV,r29,64 # 
441:MOV,r9,32 # 
442:NOP # # Instruction not used in Assembly Generation
443:SUBI,r15,r15,0 # 
444:BRAZ,19 # 
445:MOV,r25,64 # 
446:NOP # # Instruction not used in Assembly Generation
447:LOAD,r496,r481 # 
448:AND,r481,r481,r4 # 
449:BRAZ,2 # 
450:BRAUNCOND,-3 # #Check for prefetch_dma_busy
451:ADDI,r34,r480,0 # 
452:OR,r480,r480,r492 # 
453:ADDI,r480,r480,32 # 
454:ADDI,r29,r482,0 # 
455:LLSHIFT,r482,r482,16 # 
456:ORI,r482,r482,1 # 
457:STORE,r480,r482 # # write to cmd_wd0_reg 
458:ADD,r1,r481,r17 # 
459:AND,r481,r481,r61 # 
460:ADDI,r480,r480,4 # 
461:STORE,r480,r481 # # End PREFETCH - write to cmd_wd1_reg
462:ADDI,r34,r34,128 # 
463:MOV,r25,0 # 
464:ADDI,r24,r480,0 # 
465:OR,r480,r480,r492 # 
466:ADDI,r480,r485,32 # 
467:ADDI,r29,r481,0 # 
468:LLSHIFT,r481,r481,16 # 
469:ORI,r481,r481,1 # 
470:STORE,r485,r481 # #write to cmd_wd0_reg
471:ADD,r1,r481,r17 # 
472:AND,r481,r481,r46 # 
473:ADDI,r485,r485,4 # 
474:STORE,r485,r481 # # end SET_XBAR_WIDTH_SPLIT_REG - write to cmd_wd1_reg
475:ADDI,r10,r10,1 # 
476:ADDI,r20,r20,1 # 
477:MOV,r25,1 # 
478:ADDI,r24,r24,128 # 
479:ADDI,r6,r6,512 # 
480:SUBI,r25,r25,1 # 
481:BRALEZ,2 # 
482:BRAUNCOND,-4 # 
483:SUBI,r2,r2,1 # 
484:BRAGEZ,-9 # 
485:SUBI,r13,r13,1 # 
486:BRALEZ,2 # 
487:BRAUNCOND,-12 # 
488:SUBI,r15,r15,0 # 
489:BRAZ,7 # 
490:LOAD,r495,r482 # # Start ADD_PREFETCH_TO_STARTQ - read cmd_lst_enable_reg
491:NOT,r4,r484 # 
492:AND,r484,r485,r482 # 
493:STORE,r495,r485 # #write to cmd_lst_enable_reg
494:OR,r4,r482,r482 # 
495:STORE,r495,r482 ## write to cmd_lst_enable_reg - End ADD_PREFETCH_TO_STARTQ  
496:LOAD,r494,r481 # 
497:AND,r481,r481,r4 # 
498:BRAZ,2 # 
499:BRAUNCOND,-3 # 
500:LOAD,r493,r482 # 
501:NOT,r4,r484 # # read op_dma_cmd_lst_enable_reg
502:AND,r484,r485,r482 # 
503:STORE,r493,r485 ## write op_dma_cmd_lst_enable_reg 
504:OR,r4,r482,r482 # 
505:STORE,r493,r482 # # End ADD_TO_STARTQ_ALL_XBARS - write op_dma_cmd_lst_enable_reg
506:STOREI,r53,r38 # #Start SET_SIMD_BASE- write to simd_base_addr_reg
507:ADDI,r53,r480,4 # 
508:STOREI,r480,r18 # #write to simd_addr_mask_reg - End SET_SIMD_BASE 
509:NOP # # Instruction not used in Assembly Generation
510:MOV,r460,476 # # Start FORCED_CONTEXT SWITCH  
511:MOV,r449,1 # 
512:MOV,r480,960 # 
513:OR,r480,r480,r492 # 
514:MOV,r481,517 # 
515:STORE,r480,r481 # #write to wake_vec_reg 
516:BRAUNCOND,-453 # # End FORCED_CONTEXT SWITCH
517:MOV,r480,960 # 
518:OR,r480,r480,r492 # 
519:MOV,r482,531 # 
520:STORE,r480,r482 # # write to wake_vec_reg 
521:LOAD,r480,r482 ##End SET_UP_WAKE_VEC - read wake_vec_reg
522:MOV,r17,0 # 
523:MOV,r25,1 # 
524:MOV,r6,8 # 
525:MOV,r460,484 #  # start CHECK_XBAR_LAYER 
526:MOV,r449,0 # 
527:NOP # 
528:NOP # 
529:HALT # 
530:NOP # 
531:MOV,r480,48 # 
532:LOADI,r480,r484 # # read simd_lyr_cntrl_reg
533:MOV,r480,4 # 
534:LOADI,r480,r472 # # read mac_cmd_reg
535:LRSHIFT,r472,r480,24 # 
536:ANDI,r480,r21,255 # 
537:ADDI,r21,r21,1 # 
538:LLSHIFT,r21,r20,3 # 
539:AND,r472,r39,r37 # 
540:LRSHIFT,r484,r484,4 # 
541:ANDI,r484,r32,8191 # 
542:LRSHIFT,r32,r10,9 # # End CHECK_XBAR_LAYER 
543:MOV,r480,44 # 
544:LLSHIFT,r40,r481,13 # 
545:OR,r32,r481,r481 # 
546:STOREI,r480,r481 ## write simd_cmd2_reg 
547:MOV,r480,0 # 
548:ADD,r472,r482,r31 # 
549:ADD,r482,r482,r33 # 
550:STOREI,r480,r482 # # End Set_SIMD_MAC - write simd_cmd1_reg 
551:ADD,r17,r17,r20 # 
552:SUB,r6,r6,r21 # 
553:BRALEZ,2 # 
554:BRAUNCOND,-29 # 
555:ADDI,r27,r27,2 # 
556:ADDI,r1,r1,64 # 
557:MOV,r486,33554431 # 
558:AND,r1,r1,r486 # 
559:ADDI,r42,r42,64 # 
560:MOV,r6,9453568 # 
561:ADDI,r43,r43,64 # 
562:MOV,r6,17039360 # 
563:MOV,r25,1 # 
564:MOV,r20,1 # 
565:LOAD,r496,r481 # # start CHECK_PREFETCH_DONE - read prefetch_dma_busy_reg 
566:AND,r481,r481,r4 # 
567:BRAZ,2 # 
568:BRAUNCOND,-3 # #end CHECK_XBAR_DONE
569:MOV,r480,12 # 
570:LOADI,r480,r481 # #read simd_wbuf_addr_status_reg 
571:ANDI,r481,r481,1 # 
572:BRANZ,2 # 
573:BRAUNCOND,-3 # End END_BLOCK 
574:MOV,r480,1044 # 
575:OR,r480,r480,r492 # 
576:STORE,r480,r25 # # End INCREMENT_OBUF_COUNTER  
577:MOV,r482,1048 ## Start SEND_SYNC_NEXT 
578:OR,r482,r482,r492 # 
579:STORE,r482,r25 # # End SEND_SYNC_NEXT
580:SUBI,r20,r20,1 # 
581:BRALEZ,2 # 
582:BRAUNCOND,-13 # 
583:ADDI,r35,r35,0 # 
584:SUBI,r3,r3,1 # 
585:BRALEZ,2 # 
586:BRAUNCOND,-258 # 
587:MOV,r28,1 # 
588:MOV,r29,0 # 
589:MOV,r30,1192 # 
590:MOV,r31,0 # 
591:MOV,r32,1 # 
592:MOV,r33,0 # 
593:MOV,r480,784 # 
594:LLSHIFT,r480,r480,16 # 
595:OR,r33,r33,r480 # 
596:NOP ##Start SET_UP_NEXT 
597:NOP # 
598:NOP # 
599:MOV,r460,169 # 
600:MOV,r449,0 # 
601:BRAUNCOND,-538 # #Branch to the same layer, instruction start location
602:NOP # 
603:NOP # 
604:NOP # 
605:NOP # 
606:HALT # 
607:NOP ##End SET_UP_NEXT 
608:MOV,r65,0 # 
609:MOV,r106,0 # 
610:MOV,r112,0 # 
611:MOV,r118,0 # 
612:MOV,r480,0 # 
613:LLSHIFT,r480,r480,16 # 
614:OR,r118,r118,r480 # 
615:MOV,r107,0 # 
616:MOV,r113,0 # 
617:MOV,r119,0 # 
618:MOV,r480,0 # 
619:LLSHIFT,r480,r480,16 # 
620:OR,r119,r119,r480 # 
621:MOV,r108,0 # 
622:MOV,r114,0 # 
623:MOV,r120,0 # 
624:MOV,r480,0 # 
625:LLSHIFT,r480,r480,16 # 
626:OR,r120,r120,r480 # 
627:MOV,r109,0 # 
628:MOV,r115,0 # 
629:MOV,r121,0 # 
630:MOV,r480,0 # 
631:LLSHIFT,r480,r480,16 # 
632:OR,r121,r121,r480 # 
633:MOV,r480,33184 ##Start READ_FROM_SCRATCH
634:MOV,r481,208 # 
635:OR,r481,r481,r492 # 
636:STORE,r481,r480 # write process_memory_addr
637:MOV,r481,212 # 
638:OR,r481,r481,r492 # 
639:LOAD,r481,r106 ## End READ_FROM_SCRATCH - read from process_memory_loc 
640:MOV,r480,33188 ##Start READ_FROM_SCRATCH
641:MOV,r481,208 # 
642:OR,r481,r481,r492 # 
643:STORE,r481,r480 # write process_memory_addr
644:MOV,r481,212 # 
645:OR,r481,r481,r492 # 
646:LOAD,r481,r112 ## End READ_FROM_SCRATCH - read from process_memory_loc 
647:MOV,r480,33192 ##Start READ_FROM_SCRATCH
648:MOV,r481,208 # 
649:OR,r481,r481,r492 # 
650:STORE,r481,r480 # write process_memory_addr
651:MOV,r481,212 # 
652:OR,r481,r481,r492 # 
653:LOAD,r481,r118 ## End READ_FROM_SCRATCH - read from process_memory_loc 
654:MOV,r69,1 # 
655:MOV,r86,1 # 
656:MOV,r105,320 # 
657:MOV,r89,0 # 
658:MOV,r91,0 # 
659:ADDI,r86,r484,0 # # Start SET_MULTICAST_ADDR
660:SUBI,r484,r484,1 # 
661:BRALEZ,69 # 
662:ADDI,r105,r480,0 # 
663:OR,r480,r480,r492 # 
664:ADDI,r86,r484,1 # 
665:SUBI,r91,r485,0 # 
666:BRALEZ,8 # # Jump to first dest_detail
667:SUBI,r91,r485,1 # 
668:BRALEZ,19 # # Jump to second dest detail 
669:SUBI,r91,r485,2 # 
670:BRALEZ,31 # # Jump to third dest detail 
671:SUBI,r91,r485,3 # 
672:BRALEZ,43 # # Jumpt to fourth dest detail 
673:BRAUNCOND,57 # 
674:AND,r112,r481,r106 # 
675:ADDI,r118,r481,0 # 
676:SUBI,r484,r484,1 # 
677:BRALEZ,4 # 
678:ORI,r481,r481,1 # 
679:ADDI,r484,r484,0 # 
680:BRAUNCOND,2 # 
681:MOV,r481,0 # 
682:STORE,r480,r481 # 
683:ADDI,r480,r481,4 # 
684:STORE,r481,r112 # 
685:ADDI,r480,r481,8 # 
686:STORE,r481,r106 # 
687:ADDI,r480,r486,16 # 
688:AND,r113,r481,r107 # 
689:ADDI,r119,r481,0 # 
690:SUBI,r484,r484,1 # 
691:BRALEZ,4 # 
692:ORI,r481,r481,1 # 
693:ADDI,r484,r484,0 # 
694:BRAUNCOND,2 # 
695:MOV,r481,0 # 
696:STORE,r486,r481 # 
697:ADDI,r486,r481,4 # 
698:STORE,r481,r113 # 
699:ADDI,r486,r481,8 # 
700:STORE,r481,r107 # 
701:ADDI,r480,r486,32 # 
702:AND,r114,r481,r108 # 
703:ADDI,r120,r481,0 # 
704:SUBI,r484,r484,1 # 
705:BRALEZ,4 # 
706:ORI,r481,r481,1 # 
707:ADDI,r484,r484,0 # 
708:BRAUNCOND,2 # 
709:MOV,r481,0 # 
710:STORE,r486,r481 # 
711:ADDI,r486,r481,4 # 
712:STORE,r481,r114 # 
713:ADDI,r486,r481,8 # 
714:STORE,r481,r108 # 
715:ADDI,r480,r486,48 # 
716:AND,r115,r481,r109 # 
717:ADDI,r121,r481,0 # 
718:SUBI,r484,r484,1 # 
719:BRALEZ,4 # 
720:ORI,r481,r481,1 # 
721:ADDI,r484,r484,0 # 
722:BRAUNCOND,2 # 
723:MOV,r481,0 # 
724:STORE,r486,r481 # 
725:ADDI,r486,r481,4 # 
726:STORE,r481,r115 # 
727:ADDI,r486,r481,8 # 
728:STORE,r481,r109 # 
729:NOP # # End SET_MULTICAST_ADDR
730:MOV,r79,0 # 
731:MOV,r82,0 # 
732:MOV,r83,0 # 
733:MOV,r102,0 # 
734:MOV,r97,0 # 
735:MOV,r480,784 # 
736:LLSHIFT,r480,r480,16 # 
737:OR,r97,r97,r480 # 
738:MOV,r480,0 # # start STORE_TO_MEMORY 
739:STORE,r97,r480 # # end STORE_TO_MEMORY - write data to address
740:MOV,r64,64 # 
741:MOV,r87,8 # 
742:MOV,r97,1 # 
743:MOV,r104,1017 # 
744:MOV,r94,1 # 
745:MOV,r66,0 # 
746:MOV,r122,0 # 
747:MOV,r480,0 # 
748:LLSHIFT,r480,r480,16 # 
749:OR,r122,r122,r480 # 
750:MOV,r110,65535 # 
751:MOV,r480,511 # 
752:LLSHIFT,r480,r480,16 # 
753:OR,r110,r110,r480 # 
754:MOV,r117,80 # 
755:MOV,r100,1 # 
756:MOV,r68,8976 # 
757:MOV,r73,64 # 
758:MOV,r83,0 # 
759:MOV,r97,0 # 
760:ADDI,r68,r480,0 ## Start SET_LYR_REG 
761:OR,r480,r480,r492 # 
762:STORE,r480,r83 # # write to addr_mask_reg
763:ADDI,r480,r483,4 # 
764:STORE,r483,r83 # # write to base_addr_reg
765:LLSHIFT,r83,r482,16 # 
766:OR,r482,r482,r73 # 
767:ADDI,r480,r483,8 # 
768:STORE,r483,r482 # #wite to addr_stp_reg
769:MOV,r480,8228 # 
770:OR,r480,r480,r492 # 
771:LOAD,r480,r481 # 
772:OR,r481,r481,r97 # 
773:STORE,r480,r481 # # end SET_OUTPUT_LYR_REG - write to xbar_grp_reg
774:MOV,r68,13072 # 
775:MOV,r73,64 # 
776:ADDI,r68,r480,0 ## Start SET_LYR_REG 
777:OR,r480,r480,r492 # 
778:LLSHIFT,r83,r482,16 # 
779:OR,r482,r482,r73 # 
780:ADDI,r480,r483,8 # 
781:STORE,r483,r482 # #write to address_step_reg 
782:MOV,r480,12324 # 
783:OR,r480,r480,r492 # 
784:LOAD,r480,r481 # 
785:OR,r481,r481,r97 # 
786:STORE,r480,r481 ## end SET_PREFETCH_LYR_REGS - write to prefetch_grp_reg
787:MOV,r68,2 # 
788:MOV,r66,0 # 
789:MOV,r97,16777215 # 
790:MOV,r480,8224 ## Start SET_HORSPLIT_REG
791:OR,r480,r480,r492 # 
792:LOAD,r480,r481 ##load split_group_reg 
793:OR,r481,r481,r66 # 
794:STORE,r480,r481 ## End SET_HORSPLIT_REG 
795:MOV,r78,0 # 
796:MOV,r97,0 # 
797:MOV,r66,0 # 
798:MOV,r480,0 # 
799:LLSHIFT,r480,r480,16 # 
800:OR,r66,r66,r480 # 
801:MOV,r67,528 # 
802:ADDI,r67,r480,0 # 
803:OR,r480,r480,r492 # 
804:STORE,r480,r78 # #write to colgrp_reg 
805:ADDI,r480,r480,4 # 
806:STORE,r480,r97 # # write to colsign_reg 
807:ADDI,r480,r480,4 # 
808:STORE,r480,r66 # # End SET_COL_GRP_REGS - write to colshift_reg
809:MOV,r90,64 # 
810:MOV,r97,64 # 
811:MOV,r75,1 # 
812:MOV,r111,9344 # 
813:MOV,r66,1 # 
814:MOV,r78,512 # 
815:OR,r111,r480,r492 ## Start SET_OUT_XBAR_REGS 
816:ADDI,r480,r481,20 # 
817:ADDI,r94,r482,0 # 
818:LLSHIFT,r78,r483,16 # 
819:OR,r482,r482,r483 # 
820:STORE,r481,r482 # #write to mac blk mb_config_reg
821:ADDI,r480,r485,0 # 
822:LLSHIFT,r75,r481,16 # 
823:OR,r90,r481,r481 # 
824:STORE,r485,r481 ## write to mac blk bt_size_reg 
825:ADDI,r480,r481,28 # 
826:LLSHIFT,r100,r482,31 # 
827:OR,r97,r482,r482 # 
828:STORE,r481,r482 # # End SET_OUT_XBAR_REGS - write to mac blk row_step_reg
829:MOV,r78,9216 # 
830:MOV,r111,13312 # 
831:MOV,r66,1 # 
832:SUBI,r66,r66,0 # 
833:BRAZ,6 # 
834:ADDI,r78,r78,128 # 
835:ADDI,r111,r111,128 # 
836:SUBI,r66,r66,1 # 
837:BRALEZ,2 # 
838:BRAUNCOND,-4 # 
839:MOV,r97,0 # 
840:MOV,r75,2 # 
841:MOV,r123,1 # 
842:MOV,r101,65535 # 
843:MOV,r480,255 # 
844:LLSHIFT,r480,r480,16 # 
845:OR,r101,r101,r480 # 
846:MOV,r99,0 # 
847:MOV,r67,8 # 
848:NOP # # Instruction not used in Assembly Generation
849:MOV,r81,0 # 
850:ADDI,r78,r88,0 # 
851:MOV,r91,64 # 
852:MOV,r74,1 # 
853:ADDI,r111,r98,0 # 
854:MOV,r86,1 # 
855:MOV,r95,9469952 # 
856:MOV,r76,0 # 
857:MOV,r69,1 # 
858:MOV,r105,320 # 
859:MOV,r480,32992 ##Start READ_FROM_SCRATCH
860:MOV,r481,208 # 
861:OR,r481,r481,r492 # 
862:STORE,r481,r480 # write process_memory_addr
863:MOV,r481,212 # 
864:OR,r481,r481,r492 # 
865:LOAD,r481,r102 ## End READ_FROM_SCRATCH - read from process_memory_loc 
866:MOV,r82,16383 # 
867:MOV,r480,0 # 
868:LLSHIFT,r480,r480,16 # 
869:OR,r82,r82,r480 # 
870:MOV,r72,0 # 
871:MOV,r92,0 # 
872:MOV,r116,0 # 
873:SUBI,r116,r116,0 # 
874:BRAZ,3 # 
875:MOV,r97,0 # 
876:NOP # # Instruction not used in Assembly Generation
877:MOV,r116,0 # 
878:SUBI,r116,r116,0 # 
879:BRAZ,72 # 
880:MOV,r74,0 # 
881:MOV,r93,0 # 
882:MOV,r70,0 # 
883:NOP # # Instruction not used in Assembly Generation
884:MOV,r85,1 # 
885:ADDI,r88,r480,0 # 
886:OR,r480,r480,r492 # 
887:ADDI,r480,r485,32 # 
888:ADDI,r93,r481,0 # 
889:LLSHIFT,r481,r481,16 # 
890:ORI,r481,r481,1 # 
891:STORE,r485,r481 # #write to cmd_wd0_reg
892:ADD,r65,r481,r81 # 
893:AND,r481,r481,r110 # 
894:ADDI,r485,r485,4 # 
895:STORE,r485,r481 # # end SET_XBAR_WIDTH_SPLIT_REG - write to cmd_wd1_reg
896:MOV,r486,1 # 
897:LLSHIFTREG,r486,r486,r74 # 
898:LOAD,r493,r482 ## read output_dma_cmd_lst_enable_reg 
899:NOT,r486,r484 # 
900:AND,r484,r485,r482 # 
901:STORE,r493,r485 ## write to output_dma_cmd_lst_enable_reg 
902:OR,r486,r482,r482 # 
903:STORE,r493,r482 ## write to output_dma_cmd_lst_enable_reg - End ADD_XBAR_TO_STARTQ  
904:STOREI,r117,r102 # #Start SET_SIMD_BASE- write to simd_base_addr_reg
905:ADDI,r117,r480,4 # 
906:STOREI,r480,r82 # #write to simd_addr_mask_reg - End SET_SIMD_BASE 
907:ADD,r65,r65,r93 # 
908:MOV,r486,33554431 # 
909:AND,r65,r65,r486 # 
910:NOP # # Instruction not used in Assembly Generation
911:MOV,r461,874 # # Start FORCED_CONTEXT SWITCH  
912:MOV,r449,2 # 
913:MOV,r480,964 # 
914:OR,r480,r480,r492 # 
915:MOV,r481,918 # 
916:STORE,r480,r481 # #write to wake_vec_reg 
917:BRAUNCOND,-854 # # End FORCED_CONTEXT SWITCH
918:MOV,r480,964 # 
919:OR,r480,r480,r492 # 
920:MOV,r482,929 # 
921:STORE,r480,r482 # # write to wake_vec_reg 
922:LOAD,r480,r482 ##End SET_UP_WAKE_VEC - read wake_vec_reg
923:MOV,r461,879 #  # start CHECK_XBAR_LAYER 
924:MOV,r449,1 # 
925:NOP # 
926:NOP # 
927:HALT # 
928:NOP # 
929:MOV,r480,48 # 
930:LOADI,r480,r484 # # read simd_lyr_cntrl_reg
931:MOV,r480,4 # 
932:LOADI,r480,r472 # # read mac_cmd_reg
933:LRSHIFT,r472,r480,24 # 
934:ANDI,r480,r77,255 # 
935:ADDI,r77,r77,1 # 
936:LLSHIFT,r77,r93,3 # 
937:AND,r472,r96,r101 # 
938:LRSHIFT,r484,r484,4 # 
939:ANDI,r484,r80,8191 # 
940:LRSHIFT,r80,r84,9 # # End CHECK_XBAR_LAYER 
941:MOV,r480,44 # 
942:LLSHIFT,r104,r481,13 # 
943:OR,r80,r481,r481 # 
944:STOREI,r480,r481 ## write simd_cmd2_reg 
945:MOV,r480,0 # 
946:ADD,r472,r482,r95 # 
947:ADD,r482,r482,r97 # 
948:STOREI,r480,r482 # # End Set_SIMD_MAC - write simd_cmd1_reg 
949:SUBI,r93,r93,64 # 
950:BRAGEZ,129 # 
951:ADDI,r111,r116,0 # 
952:MOV,r70,512 # 
953:MOV,r80,1 # 
954:MOV,r77,1 # 
955:MOV,r85,1 # 
956:SUBI,r99,r99,0 # 
957:BRANZ,51 # 
958:MOV,r84,0 # 
959:MOV,r66,0 # 
960:MOV,r93,64 # 
961:MOV,r73,64 # 
962:NOP # # Instruction not used in Assembly Generation
963:SUBI,r79,r79,0 # 
964:BRAZ,19 # 
965:MOV,r89,64 # 
966:NOP # # Instruction not used in Assembly Generation
967:LOAD,r496,r481 # 
968:AND,r481,r481,r68 # 
969:BRAZ,2 # 
970:BRAUNCOND,-3 # #Check for prefetch_dma_busy
971:ADDI,r98,r480,0 # 
972:OR,r480,r480,r492 # 
973:ADDI,r480,r480,32 # 
974:ADDI,r93,r482,0 # 
975:LLSHIFT,r482,r482,16 # 
976:ORI,r482,r482,1 # 
977:STORE,r480,r482 # # write to cmd_wd0_reg 
978:ADD,r65,r481,r81 # 
979:AND,r481,r481,r125 # 
980:ADDI,r480,r480,4 # 
981:STORE,r480,r481 # # End PREFETCH - write to cmd_wd1_reg
982:ADDI,r98,r98,128 # 
983:MOV,r89,0 # 
984:ADDI,r88,r480,0 # 
985:OR,r480,r480,r492 # 
986:ADDI,r480,r485,32 # 
987:ADDI,r93,r481,0 # 
988:LLSHIFT,r481,r481,16 # 
989:ORI,r481,r481,1 # 
990:STORE,r485,r481 # #write to cmd_wd0_reg
991:ADD,r65,r481,r81 # 
992:AND,r481,r481,r110 # 
993:ADDI,r485,r485,4 # 
994:STORE,r485,r481 # # end SET_XBAR_WIDTH_SPLIT_REG - write to cmd_wd1_reg
995:ADDI,r74,r74,1 # 
996:ADDI,r84,r84,1 # 
997:MOV,r89,1 # 
998:ADDI,r88,r88,128 # 
999:ADDI,r70,r70,512 # 
1000:SUBI,r89,r89,1 # 
1001:BRALEZ,2 # 
1002:BRAUNCOND,-4 # 
1003:SUBI,r66,r66,1 # 
1004:BRAGEZ,-9 # 
1005:SUBI,r77,r77,1 # 
1006:BRALEZ,2 # 
1007:BRAUNCOND,-12 # 
1008:SUBI,r79,r79,0 # 
1009:BRAZ,7 # 
1010:LOAD,r495,r482 # # Start ADD_PREFETCH_TO_STARTQ - read cmd_lst_enable_reg
1011:NOT,r68,r484 # 
1012:AND,r484,r485,r482 # 
1013:STORE,r495,r485 # #write to cmd_lst_enable_reg
1014:OR,r68,r482,r482 # 
1015:STORE,r495,r482 ## write to cmd_lst_enable_reg - End ADD_PREFETCH_TO_STARTQ  
1016:LOAD,r494,r481 # 
1017:AND,r481,r481,r68 # 
1018:BRAZ,2 # 
1019:BRAUNCOND,-3 # 
1020:LOAD,r493,r482 # 
1021:NOT,r68,r484 # # read op_dma_cmd_lst_enable_reg
1022:AND,r484,r485,r482 # 
1023:STORE,r493,r485 ## write op_dma_cmd_lst_enable_reg 
1024:OR,r68,r482,r482 # 
1025:STORE,r493,r482 # # End ADD_TO_STARTQ_ALL_XBARS - write op_dma_cmd_lst_enable_reg
1026:STOREI,r117,r102 # #Start SET_SIMD_BASE- write to simd_base_addr_reg
1027:ADDI,r117,r480,4 # 
1028:STOREI,r480,r82 # #write to simd_addr_mask_reg - End SET_SIMD_BASE 
1029:NOP # # Instruction not used in Assembly Generation
1030:MOV,r461,993 # # Start FORCED_CONTEXT SWITCH  
1031:MOV,r449,2 # 
1032:MOV,r480,964 # 
1033:OR,r480,r480,r492 # 
1034:MOV,r481,1037 # 
1035:STORE,r480,r481 # #write to wake_vec_reg 
1036:BRAUNCOND,-973 # # End FORCED_CONTEXT SWITCH
1037:MOV,r480,964 # 
1038:OR,r480,r480,r492 # 
1039:MOV,r482,1051 # 
1040:STORE,r480,r482 # # write to wake_vec_reg 
1041:LOAD,r480,r482 ##End SET_UP_WAKE_VEC - read wake_vec_reg
1042:MOV,r81,0 # 
1043:MOV,r89,1 # 
1044:MOV,r70,8 # 
1045:MOV,r461,1001 #  # start CHECK_XBAR_LAYER 
1046:MOV,r449,1 # 
1047:NOP # 
1048:NOP # 
1049:HALT # 
1050:NOP # 
1051:MOV,r480,48 # 
1052:LOADI,r480,r484 # # read simd_lyr_cntrl_reg
1053:MOV,r480,4 # 
1054:LOADI,r480,r472 # # read mac_cmd_reg
1055:LRSHIFT,r472,r480,24 # 
1056:ANDI,r480,r85,255 # 
1057:ADDI,r85,r85,1 # 
1058:LLSHIFT,r85,r84,3 # 
1059:AND,r472,r103,r101 # 
1060:LRSHIFT,r484,r484,4 # 
1061:ANDI,r484,r96,8191 # 
1062:LRSHIFT,r96,r74,9 # # End CHECK_XBAR_LAYER 
1063:MOV,r480,44 # 
1064:LLSHIFT,r104,r481,13 # 
1065:OR,r96,r481,r481 # 
1066:STOREI,r480,r481 ## write simd_cmd2_reg 
1067:MOV,r480,0 # 
1068:ADD,r472,r482,r95 # 
1069:ADD,r482,r482,r97 # 
1070:STOREI,r480,r482 # # End Set_SIMD_MAC - write simd_cmd1_reg 
1071:ADD,r81,r81,r84 # 
1072:SUB,r70,r70,r85 # 
1073:BRALEZ,2 # 
1074:BRAUNCOND,-29 # 
1075:ADDI,r91,r91,1 # 
1076:ADDI,r65,r65,64 # 
1077:MOV,r486,33554431 # 
1078:AND,r65,r65,r486 # 
1079:ADDI,r106,r106,64 # 
1080:MOV,r70,0 # 
1081:MOV,r89,2 # 
1082:MOV,r84,1 # 
1083:LOAD,r496,r481 # # start CHECK_PREFETCH_DONE - read prefetch_dma_busy_reg 
1084:AND,r481,r481,r68 # 
1085:BRAZ,2 # 
1086:BRAUNCOND,-3 # #end CHECK_XBAR_DONE
1087:MOV,r480,12 # 
1088:LOADI,r480,r481 # #read simd_wbuf_addr_status_reg 
1089:ANDI,r481,r481,1 # 
1090:BRANZ,2 # 
1091:BRAUNCOND,-3 # End END_BLOCK 
1092:MOV,r480,1044 # 
1093:OR,r480,r480,r492 # 
1094:STORE,r480,r89 # # End INCREMENT_OBUF_COUNTER  
1095:MOV,r482,1048 ## Start SEND_SYNC_NEXT 
1096:OR,r482,r482,r492 # 
1097:STORE,r482,r89 # # End SEND_SYNC_NEXT
1098:SUBI,r84,r84,1 # 
1099:BRALEZ,2 # 
1100:BRAUNCOND,-13 # 
1101:ADDI,r99,r99,1 # 
1102:SUBI,r67,r67,1 # 
1103:BRALEZ,2 # 
1104:BRAUNCOND,-256 # 
1105:MOV,r92,2 # 
1106:MOV,r93,1 # 
1107:MOV,r94,1304 # 
1108:MOV,r95,1 # 
1109:MOV,r96,1 # 
1110:MOV,r97,0 # 
1111:MOV,r480,784 # 
1112:LLSHIFT,r480,r480,16 # 
1113:OR,r97,r97,r480 # 
1114:NOP ##Start SET_UP_NEXT 
1115:NOP # 
1116:NOP # 
1117:MOV,r461,686 # 
1118:MOV,r449,1 # 
1119:BRAUNCOND,-1056 # #Branch to the same layer, instruction start location
1120:NOP # 
1121:NOP # 
1122:NOP # 
1123:NOP # 
1124:HALT # 
1125:NOP ##End SET_UP_NEXT 
