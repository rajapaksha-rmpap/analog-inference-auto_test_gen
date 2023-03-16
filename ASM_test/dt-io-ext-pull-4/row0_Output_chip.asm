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
189:MOV,r15,0 # 
190:MOV,r18,0 # 
191:MOV,r19,0 # 
192:MOV,r38,0 # 
193:MOV,r33,0 # 
194:MOV,r480,784 # 
195:LLSHIFT,r480,r480,16 # 
196:OR,r33,r33,r480 # 
197:MOV,r480,0 # # start STORE_TO_MEMORY 
198:STORE,r33,r480 # # end STORE_TO_MEMORY - write data to address
199:MOV,r0,96 # 
200:MOV,r23,8 # 
201:MOV,r33,1 # 
202:MOV,r40,1017 # 
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
216:MOV,r9,96 # 
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
234:MOV,r9,96 # 
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
247:MOV,r2,0 # 
248:MOV,r33,16777215 # 
249:MOV,r480,8224 ## Start SET_HORSPLIT_REG
250:OR,r480,r480,r492 # 
251:LOAD,r480,r481 ##load split_group_reg 
252:OR,r481,r481,r2 # 
253:STORE,r480,r481 ## End SET_HORSPLIT_REG 
254:MOV,r14,0 # 
255:MOV,r33,0 # 
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
268:MOV,r26,96 # 
269:MOV,r33,96 # 
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
306:MOV,r3,6 # 
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
408:SUBI,r29,r29,96 # 
409:BRAGEZ,129 # 
410:ADDI,r47,r52,0 # 
411:MOV,r6,0 # 
412:MOV,r16,1 # 
413:MOV,r13,1 # 
414:MOV,r21,1 # 
415:SUBI,r35,r35,0 # 
416:BRANZ,51 # 
417:MOV,r20,0 # 
418:MOV,r2,0 # 
419:MOV,r29,96 # 
420:MOV,r9,96 # 
421:NOP # # Instruction not used in Assembly Generation
422:SUBI,r15,r15,0 # 
423:BRAZ,19 # 
424:MOV,r25,96 # 
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
454:ADDI,r10,r10,1 # 
455:ADDI,r20,r20,1 # 
456:MOV,r25,1 # 
457:ADDI,r24,r24,128 # 
458:ADDI,r6,r6,512 # 
459:SUBI,r25,r25,1 # 
460:BRALEZ,2 # 
461:BRAUNCOND,-4 # 
462:SUBI,r2,r2,1 # 
463:BRAGEZ,-9 # 
464:SUBI,r13,r13,1 # 
465:BRALEZ,2 # 
466:BRAUNCOND,-12 # 
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
503:MOV,r6,12 # 
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
535:ADDI,r1,r1,96 # 
536:MOV,r486,33554431 # 
537:AND,r1,r1,r486 # 
538:ADDI,r42,r42,96 # 
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
568:MOV,r32,1 # 
569:MOV,r33,0 # 
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
