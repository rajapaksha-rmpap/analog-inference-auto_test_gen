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
23:MOV,r451,544 # # store proc1 start loc
24:MOV,r461,544 # # store proc1 last loc  
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
193:MOV,r33,28 # 
194:MOV,r480,784 # 
195:LLSHIFT,r480,r480,16 # 
196:OR,r33,r33,r480 # 
197:MOV,r480,0 # # start STORE_TO_MEMORY 
198:STORE,r33,r480 # # end STORE_TO_MEMORY - write data to address
199:MOV,r0,3584 # 
200:MOV,r23,8 # 
201:MOV,r33,1 # 
202:MOV,r40,249 # 
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
256:MOV,r2,4369 # 
257:MOV,r480,4369 # 
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
325:MOV,r18,32767 # 
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
338:BRAZ,73 # 
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
408:MOV,r486,3584 # 
409:SUB,r29,r29,r486 # 
410:BRAGEZ,130 # 
411:ADDI,r47,r52,0 # 
412:MOV,r6,0 # 
413:MOV,r16,3 # 
414:MOV,r13,1 # 
415:MOV,r21,3 # 
416:SUBI,r35,r35,0 # 
417:BRANZ,51 # 
418:MOV,r20,0 # 
419:MOV,r2,0 # 
420:MOV,r29,3584 # 
421:MOV,r9,512 # 
422:NOP # # Instruction not used in Assembly Generation
423:SUBI,r15,r15,0 # 
424:BRAZ,19 # 
425:MOV,r25,3584 # 
426:NOP # # Instruction not used in Assembly Generation
427:LOAD,r496,r481 # 
428:AND,r481,r481,r4 # 
429:BRAZ,2 # 
430:BRAUNCOND,-3 # #Check for prefetch_dma_busy
431:ADDI,r34,r480,0 # 
432:OR,r480,r480,r492 # 
433:ADDI,r480,r480,32 # 
434:ADDI,r29,r482,0 # 
435:LLSHIFT,r482,r482,16 # 
436:ORI,r482,r482,1 # 
437:STORE,r480,r482 # # write to cmd_wd0_reg 
438:ADD,r1,r481,r17 # 
439:AND,r481,r481,r61 # 
440:ADDI,r480,r480,4 # 
441:STORE,r480,r481 # # End PREFETCH - write to cmd_wd1_reg
442:ADDI,r34,r34,128 # 
443:MOV,r25,0 # 
444:ADDI,r24,r480,0 # 
445:OR,r480,r480,r492 # 
446:ADDI,r480,r485,32 # 
447:ADDI,r29,r481,0 # 
448:LLSHIFT,r481,r481,16 # 
449:ORI,r481,r481,1 # 
450:STORE,r485,r481 # #write to cmd_wd0_reg
451:ADD,r1,r481,r17 # 
452:AND,r481,r481,r46 # 
453:ADDI,r485,r485,4 # 
454:STORE,r485,r481 # # end SET_XBAR_WIDTH_SPLIT_REG - write to cmd_wd1_reg
455:ADDI,r10,r10,3 # 
456:ADDI,r20,r20,3 # 
457:MOV,r25,3 # 
458:ADDI,r24,r24,128 # 
459:ADDI,r6,r6,512 # 
460:SUBI,r25,r25,1 # 
461:BRALEZ,2 # 
462:BRAUNCOND,-4 # 
463:SUBI,r2,r2,1 # 
464:BRAGEZ,-44 # 
465:SUBI,r13,r13,1 # 
466:BRALEZ,2 # 
467:BRAUNCOND,-48 # 
468:SUBI,r15,r15,0 # 
469:BRAZ,7 # 
470:LOAD,r495,r482 # # Start ADD_PREFETCH_TO_STARTQ - read cmd_lst_enable_reg
471:NOT,r4,r484 # 
472:AND,r484,r485,r482 # 
473:STORE,r495,r485 # #write to cmd_lst_enable_reg
474:OR,r4,r482,r482 # 
475:STORE,r495,r482 ## write to cmd_lst_enable_reg - End ADD_PREFETCH_TO_STARTQ  
476:LOAD,r494,r481 # 
477:AND,r481,r481,r4 # 
478:BRAZ,2 # 
479:BRAUNCOND,-3 # 
480:LOAD,r493,r482 # 
481:NOT,r4,r484 # # read op_dma_cmd_lst_enable_reg
482:AND,r484,r485,r482 # 
483:STORE,r493,r485 ## write op_dma_cmd_lst_enable_reg 
484:OR,r4,r482,r482 # 
485:STORE,r493,r482 # # End ADD_TO_STARTQ_ALL_XBARS - write op_dma_cmd_lst_enable_reg
486:STOREI,r53,r38 # #Start SET_SIMD_BASE- write to simd_base_addr_reg
487:ADDI,r53,r480,4 # 
488:STOREI,r480,r18 # #write to simd_addr_mask_reg - End SET_SIMD_BASE 
489:NOP # # Instruction not used in Assembly Generation
490:MOV,r460,456 # # Start FORCED_CONTEXT SWITCH  
491:MOV,r449,1 # 
492:MOV,r480,960 # 
493:OR,r480,r480,r492 # 
494:MOV,r481,497 # 
495:STORE,r480,r481 # #write to wake_vec_reg 
496:BRAUNCOND,-433 # # End FORCED_CONTEXT SWITCH
497:MOV,r480,960 # 
498:OR,r480,r480,r492 # 
499:MOV,r482,511 # 
500:STORE,r480,r482 # # write to wake_vec_reg 
501:LOAD,r480,r482 ##End SET_UP_WAKE_VEC - read wake_vec_reg
502:MOV,r17,0 # 
503:MOV,r25,1 # 
504:MOV,r6,448 # 
505:MOV,r460,464 #  # start CHECK_XBAR_LAYER 
506:MOV,r449,0 # 
507:NOP # 
508:NOP # 
509:HALT # 
510:NOP # 
511:MOV,r480,48 # 
512:LOADI,r480,r484 # # read simd_lyr_cntrl_reg
513:MOV,r480,4 # 
514:LOADI,r480,r472 # # read mac_cmd_reg
515:LRSHIFT,r472,r480,24 # 
516:ANDI,r480,r21,255 # 
517:ADDI,r21,r21,1 # 
518:LLSHIFT,r21,r20,3 # 
519:AND,r472,r39,r37 # 
520:LRSHIFT,r484,r484,4 # 
521:ANDI,r484,r32,8191 # 
522:LRSHIFT,r32,r10,9 # # End CHECK_XBAR_LAYER 
523:MOV,r480,44 # 
524:LLSHIFT,r40,r481,13 # 
525:OR,r32,r481,r481 # 
526:STOREI,r480,r481 ## write simd_cmd2_reg 
527:MOV,r480,0 # 
528:ADD,r472,r482,r31 # 
529:ADD,r482,r482,r33 # 
530:STOREI,r480,r482 # # End Set_SIMD_MAC - write simd_cmd1_reg 
531:ADD,r17,r17,r20 # 
532:SUB,r6,r6,r21 # 
533:BRALEZ,2 # 
534:BRAUNCOND,-29 # 
535:ADDI,r27,r27,1 # 
536:MOV,r486,3584 # 
537:ADD,r1,r1,r486 # 
538:MOV,r486,33554431 # 
539:AND,r1,r1,r486 # 
540:MOV,r486,3584 # 
541:ADD,r42,r42,r486 # 
542:MOV,r6,0 # 
543:MOV,r25,1 # 
544:MOV,r20,2 # 
545:LOAD,r496,r481 # # start CHECK_PREFETCH_DONE - read prefetch_dma_busy_reg 
546:AND,r481,r481,r4 # 
547:BRAZ,2 # 
548:BRAUNCOND,-3 # #end CHECK_XBAR_DONE
549:MOV,r480,12 # 
550:LOADI,r480,r481 # #read simd_wbuf_addr_status_reg 
551:ANDI,r481,r481,1 # 
552:BRANZ,2 # 
553:BRAUNCOND,-3 # End END_BLOCK 
554:MOV,r480,1044 # 
555:OR,r480,r480,r492 # 
556:STORE,r480,r25 # # End INCREMENT_OBUF_COUNTER  
557:MOV,r482,1048 ## Start SEND_SYNC_NEXT 
558:OR,r482,r482,r492 # 
559:STORE,r482,r25 # # End SEND_SYNC_NEXT
560:SUBI,r20,r20,1 # 
561:BRALEZ,2 # 
562:BRAUNCOND,-13 # 
563:ADDI,r35,r35,1 # 
564:SUBI,r3,r3,1 # 
565:BRALEZ,2 # 
566:BRAUNCOND,-259 # 
567:MOV,r28,1 # 
568:MOV,r29,0 # 
569:MOV,r30,1192 # 
570:MOV,r31,0 # 
571:MOV,r32,3 # 
572:MOV,r33,28 # 
573:MOV,r480,784 # 
574:LLSHIFT,r480,r480,16 # 
575:OR,r33,r33,r480 # 
576:NOP ##Start SET_UP_NEXT 
577:NOP # 
578:NOP # 
579:MOV,r460,148 # 
580:MOV,r449,0 # 
581:BRAUNCOND,-518 # #Branch to the same layer, instruction start location
582:NOP # 
583:NOP # 
584:NOP # 
585:NOP # 
586:HALT # 
587:NOP ##End SET_UP_NEXT 
588:MOV,r65,0 # 
589:MOV,r106,0 # 
590:MOV,r112,0 # 
591:MOV,r118,0 # 
592:MOV,r480,0 # 
593:LLSHIFT,r480,r480,16 # 
594:OR,r118,r118,r480 # 
595:MOV,r107,0 # 
596:MOV,r113,0 # 
597:MOV,r119,0 # 
598:MOV,r480,0 # 
599:LLSHIFT,r480,r480,16 # 
600:OR,r119,r119,r480 # 
601:MOV,r108,0 # 
602:MOV,r114,0 # 
603:MOV,r120,0 # 
604:MOV,r480,0 # 
605:LLSHIFT,r480,r480,16 # 
606:OR,r120,r120,r480 # 
607:MOV,r109,0 # 
608:MOV,r115,0 # 
609:MOV,r121,0 # 
610:MOV,r480,0 # 
611:LLSHIFT,r480,r480,16 # 
612:OR,r121,r121,r480 # 
613:MOV,r480,33184 ##Start READ_FROM_SCRATCH
614:MOV,r481,208 # 
615:OR,r481,r481,r492 # 
616:STORE,r481,r480 # write process_memory_addr
617:MOV,r481,212 # 
618:OR,r481,r481,r492 # 
619:LOAD,r481,r106 ## End READ_FROM_SCRATCH - read from process_memory_loc 
620:MOV,r480,33188 ##Start READ_FROM_SCRATCH
621:MOV,r481,208 # 
622:OR,r481,r481,r492 # 
623:STORE,r481,r480 # write process_memory_addr
624:MOV,r481,212 # 
625:OR,r481,r481,r492 # 
626:LOAD,r481,r112 ## End READ_FROM_SCRATCH - read from process_memory_loc 
627:MOV,r480,33192 ##Start READ_FROM_SCRATCH
628:MOV,r481,208 # 
629:OR,r481,r481,r492 # 
630:STORE,r481,r480 # write process_memory_addr
631:MOV,r481,212 # 
632:OR,r481,r481,r492 # 
633:LOAD,r481,r118 ## End READ_FROM_SCRATCH - read from process_memory_loc 
634:MOV,r480,33200 ##Start READ_FROM_SCRATCH
635:MOV,r481,208 # 
636:OR,r481,r481,r492 # 
637:STORE,r481,r480 # write process_memory_addr
638:MOV,r481,212 # 
639:OR,r481,r481,r492 # 
640:LOAD,r481,r107 ## End READ_FROM_SCRATCH - read from process_memory_loc 
641:MOV,r480,33204 ##Start READ_FROM_SCRATCH
642:MOV,r481,208 # 
643:OR,r481,r481,r492 # 
644:STORE,r481,r480 # write process_memory_addr
645:MOV,r481,212 # 
646:OR,r481,r481,r492 # 
647:LOAD,r481,r113 ## End READ_FROM_SCRATCH - read from process_memory_loc 
648:MOV,r480,33208 ##Start READ_FROM_SCRATCH
649:MOV,r481,208 # 
650:OR,r481,r481,r492 # 
651:STORE,r481,r480 # write process_memory_addr
652:MOV,r481,212 # 
653:OR,r481,r481,r492 # 
654:LOAD,r481,r119 ## End READ_FROM_SCRATCH - read from process_memory_loc 
655:MOV,r69,0 # 
656:MOV,r86,2 # 
657:MOV,r105,256 # 
658:MOV,r89,0 # 
659:MOV,r91,0 # 
660:ADDI,r86,r484,0 # # Start SET_MULTICAST_ADDR
661:SUBI,r484,r484,1 # 
662:BRALEZ,69 # 
663:ADDI,r105,r480,0 # 
664:OR,r480,r480,r492 # 
665:ADDI,r86,r484,1 # 
666:SUBI,r91,r485,0 # 
667:BRALEZ,8 # # Jump to first dest_detail
668:SUBI,r91,r485,1 # 
669:BRALEZ,19 # # Jump to second dest detail 
670:SUBI,r91,r485,2 # 
671:BRALEZ,31 # # Jump to third dest detail 
672:SUBI,r91,r485,3 # 
673:BRALEZ,43 # # Jumpt to fourth dest detail 
674:BRAUNCOND,57 # 
675:AND,r112,r481,r106 # 
676:ADDI,r118,r481,0 # 
677:SUBI,r484,r484,1 # 
678:BRALEZ,4 # 
679:ORI,r481,r481,1 # 
680:ADDI,r484,r484,0 # 
681:BRAUNCOND,2 # 
682:MOV,r481,0 # 
683:STORE,r480,r481 # 
684:ADDI,r480,r481,4 # 
685:STORE,r481,r112 # 
686:ADDI,r480,r481,8 # 
687:STORE,r481,r106 # 
688:ADDI,r480,r486,16 # 
689:AND,r113,r481,r107 # 
690:ADDI,r119,r481,0 # 
691:SUBI,r484,r484,1 # 
692:BRALEZ,4 # 
693:ORI,r481,r481,1 # 
694:ADDI,r484,r484,0 # 
695:BRAUNCOND,2 # 
696:MOV,r481,0 # 
697:STORE,r486,r481 # 
698:ADDI,r486,r481,4 # 
699:STORE,r481,r113 # 
700:ADDI,r486,r481,8 # 
701:STORE,r481,r107 # 
702:ADDI,r480,r486,32 # 
703:AND,r114,r481,r108 # 
704:ADDI,r120,r481,0 # 
705:SUBI,r484,r484,1 # 
706:BRALEZ,4 # 
707:ORI,r481,r481,1 # 
708:ADDI,r484,r484,0 # 
709:BRAUNCOND,2 # 
710:MOV,r481,0 # 
711:STORE,r486,r481 # 
712:ADDI,r486,r481,4 # 
713:STORE,r481,r114 # 
714:ADDI,r486,r481,8 # 
715:STORE,r481,r108 # 
716:ADDI,r480,r486,48 # 
717:AND,r115,r481,r109 # 
718:ADDI,r121,r481,0 # 
719:SUBI,r484,r484,1 # 
720:BRALEZ,4 # 
721:ORI,r481,r481,1 # 
722:ADDI,r484,r484,0 # 
723:BRAUNCOND,2 # 
724:MOV,r481,0 # 
725:STORE,r486,r481 # 
726:ADDI,r486,r481,4 # 
727:STORE,r481,r115 # 
728:ADDI,r486,r481,8 # 
729:STORE,r481,r109 # 
730:NOP # # End SET_MULTICAST_ADDR
731:MOV,r79,1 # 
732:MOV,r82,1 # 
733:MOV,r83,0 # 
734:MOV,r102,0 # 
735:MOV,r97,28 # 
736:MOV,r480,784 # 
737:LLSHIFT,r480,r480,16 # 
738:OR,r97,r97,r480 # 
739:MOV,r480,0 # # start STORE_TO_MEMORY 
740:STORE,r97,r480 # # end STORE_TO_MEMORY - write data to address
741:MOV,r64,3584 # 
742:MOV,r87,8 # 
743:MOV,r97,1 # 
744:MOV,r104,2113 # 
745:MOV,r94,1 # 
746:MOV,r66,0 # 
747:MOV,r122,0 # 
748:MOV,r480,0 # 
749:LLSHIFT,r480,r480,16 # 
750:OR,r122,r122,r480 # 
751:MOV,r110,65535 # 
752:MOV,r480,511 # 
753:LLSHIFT,r480,r480,16 # 
754:OR,r110,r110,r480 # 
755:MOV,r117,80 # 
756:MOV,r100,0 # 
757:MOV,r68,8976 # 
758:MOV,r73,512 # 
759:MOV,r83,0 # 
760:MOV,r97,0 # 
761:ADDI,r68,r480,0 ## Start SET_LYR_REG 
762:OR,r480,r480,r492 # 
763:STORE,r480,r83 # # write to addr_mask_reg
764:ADDI,r480,r483,4 # 
765:STORE,r483,r83 # # write to base_addr_reg
766:LLSHIFT,r83,r482,16 # 
767:OR,r482,r482,r73 # 
768:ADDI,r480,r483,8 # 
769:STORE,r483,r482 # #wite to addr_stp_reg
770:MOV,r480,8228 # 
771:OR,r480,r480,r492 # 
772:LOAD,r480,r481 # 
773:OR,r481,r481,r97 # 
774:STORE,r480,r481 # # end SET_OUTPUT_LYR_REG - write to xbar_grp_reg
775:MOV,r68,13072 # 
776:MOV,r73,512 # 
777:ADDI,r68,r480,0 ## Start SET_LYR_REG 
778:OR,r480,r480,r492 # 
779:LLSHIFT,r83,r482,16 # 
780:OR,r482,r482,r73 # 
781:ADDI,r480,r483,8 # 
782:STORE,r483,r482 # #write to address_step_reg 
783:MOV,r480,12324 # 
784:OR,r480,r480,r492 # 
785:LOAD,r480,r481 # 
786:OR,r481,r481,r97 # 
787:STORE,r480,r481 ## end SET_PREFETCH_LYR_REGS - write to prefetch_grp_reg
788:MOV,r68,8 # 
789:MOV,r66,0 # 
790:MOV,r97,16777215 # 
791:MOV,r480,8224 ## Start SET_HORSPLIT_REG
792:OR,r480,r480,r492 # 
793:LOAD,r480,r481 ##load split_group_reg 
794:OR,r481,r481,r66 # 
795:STORE,r480,r481 ## End SET_HORSPLIT_REG 
796:MOV,r78,1 # 
797:MOV,r97,170 # 
798:MOV,r66,0 # 
799:MOV,r480,0 # 
800:LLSHIFT,r480,r480,16 # 
801:OR,r66,r66,r480 # 
802:MOV,r67,528 # 
803:ADDI,r67,r480,0 # 
804:OR,r480,r480,r492 # 
805:STORE,r480,r78 # #write to colgrp_reg 
806:ADDI,r480,r480,4 # 
807:STORE,r480,r97 # # write to colsign_reg 
808:ADDI,r480,r480,4 # 
809:STORE,r480,r66 # # End SET_COL_GRP_REGS - write to colshift_reg
810:MOV,r90,512 # 
811:MOV,r97,3584 # 
812:MOV,r75,1 # 
813:MOV,r124,0 # 
814:MOV,r480,540 # 
815:LLSHIFT,r480,r480,16 # 
816:OR,r124,r124,r480 # 
817:MOV,r125,32767 # 
818:MOV,r480,0 # 
819:LLSHIFT,r480,r480,16 # 
820:OR,r125,r125,r480 # 
821:MOV,r126,13072 # 
822:ADDI,r126,r480,0 ## Start SET_PREFETCH_REGS
823:OR,r480,r480,r492 # 
824:STORE,r480,r125 # # write to addr_mask_reg
825:ADDI,r480,r483,4 # 
826:STORE,r483,r124 # # end SET_PRFETCH_LYR_REG- write to base_addr_reg
827:MOV,r111,9600 # 
828:MOV,r66,3 # 
829:MOV,r78,1536 # 
830:OR,r111,r480,r492 ## Start SET_OUT_XBAR_REGS 
831:ADDI,r480,r481,20 # 
832:ADDI,r94,r482,0 # 
833:LLSHIFT,r78,r483,16 # 
834:OR,r482,r482,r483 # 
835:STORE,r481,r482 # #write to mac blk mb_config_reg
836:ADDI,r480,r485,0 # 
837:LLSHIFT,r75,r481,16 # 
838:OR,r90,r481,r481 # 
839:STORE,r485,r481 ## write to mac blk bt_size_reg 
840:ADDI,r480,r481,28 # 
841:LLSHIFT,r100,r482,31 # 
842:OR,r97,r482,r482 # 
843:STORE,r481,r482 # # End SET_OUT_XBAR_REGS - write to mac blk row_step_reg
844:MOV,r111,13696 # 
845:OR,r111,r480,r492 # 
846:ADDI,r480,r481,20 # 
847:MOV,r482,0 # 
848:LLSHIFT,r482,r482,4 # 
849:OR,r94,r482,r482 # 
850:STORE,r481,r482 # # write to mb_config_reg
851:ADDI,r480,r485,0 # 
852:ADDI,r90,r481,0 # 
853:STORE,r485,r481 # #write to mb_bt_size_reg
854:ADDI,r480,r481,28 # 
855:LLSHIFT,r100,r482,31 # 
856:OR,r482,r482,r97 # 
857:STORE,r481,r482 ## End SET_OUT_PREFETCH_REGS - write to mb_row_step_reg 
858:MOV,r78,9216 # 
859:MOV,r111,13312 # 
860:MOV,r66,3 # 
861:SUBI,r66,r66,0 # 
862:BRAZ,6 # 
863:ADDI,r78,r78,128 # 
864:ADDI,r111,r111,128 # 
865:SUBI,r66,r66,1 # 
866:BRALEZ,2 # 
867:BRAUNCOND,-4 # 
868:MOV,r97,0 # 
869:MOV,r75,2 # 
870:MOV,r123,3 # 
871:MOV,r101,65535 # 
872:MOV,r480,255 # 
873:LLSHIFT,r480,r480,16 # 
874:OR,r101,r101,r480 # 
875:MOV,r99,0 # 
876:MOV,r67,7 # 
877:NOP # # Instruction not used in Assembly Generation
878:MOV,r81,0 # 
879:ADDI,r78,r88,0 # 
880:MOV,r91,64 # 
881:MOV,r74,3 # 
882:ADDI,r111,r98,0 # 
883:MOV,r86,2 # 
884:MOV,r95,0 # 
885:MOV,r76,0 # 
886:MOV,r69,0 # 
887:MOV,r105,256 # 
888:MOV,r480,32992 ##Start READ_FROM_SCRATCH
889:MOV,r481,208 # 
890:OR,r481,r481,r492 # 
891:STORE,r481,r480 # write process_memory_addr
892:MOV,r481,212 # 
893:OR,r481,r481,r492 # 
894:LOAD,r481,r102 ## End READ_FROM_SCRATCH - read from process_memory_loc 
895:MOV,r82,65535 # 
896:MOV,r480,3 # 
897:LLSHIFT,r480,r480,16 # 
898:OR,r82,r82,r480 # 
899:MOV,r72,0 # 
900:MOV,r92,0 # 
901:MOV,r116,1 # 
902:SUBI,r116,r116,0 # 
903:BRAZ,3 # 
904:MOV,r97,0 # 
905:NOP # # Instruction not used in Assembly Generation
906:MOV,r116,0 # 
907:SUBI,r116,r116,0 # 
908:BRAZ,73 # 
909:MOV,r74,0 # 
910:MOV,r93,0 # 
911:MOV,r70,0 # 
912:NOP # # Instruction not used in Assembly Generation
913:MOV,r85,1 # 
914:ADDI,r88,r480,0 # 
915:OR,r480,r480,r492 # 
916:ADDI,r480,r485,32 # 
917:ADDI,r93,r481,0 # 
918:LLSHIFT,r481,r481,16 # 
919:ORI,r481,r481,1 # 
920:STORE,r485,r481 # #write to cmd_wd0_reg
921:ADD,r65,r481,r81 # 
922:AND,r481,r481,r110 # 
923:ADDI,r485,r485,4 # 
924:STORE,r485,r481 # # end SET_XBAR_WIDTH_SPLIT_REG - write to cmd_wd1_reg
925:MOV,r486,1 # 
926:LLSHIFTREG,r486,r486,r74 # 
927:LOAD,r493,r482 ## read output_dma_cmd_lst_enable_reg 
928:NOT,r486,r484 # 
929:AND,r484,r485,r482 # 
930:STORE,r493,r485 ## write to output_dma_cmd_lst_enable_reg 
931:OR,r486,r482,r482 # 
932:STORE,r493,r482 ## write to output_dma_cmd_lst_enable_reg - End ADD_XBAR_TO_STARTQ  
933:STOREI,r117,r102 # #Start SET_SIMD_BASE- write to simd_base_addr_reg
934:ADDI,r117,r480,4 # 
935:STOREI,r480,r82 # #write to simd_addr_mask_reg - End SET_SIMD_BASE 
936:ADD,r65,r65,r93 # 
937:MOV,r486,33554431 # 
938:AND,r65,r65,r486 # 
939:NOP # # Instruction not used in Assembly Generation
940:MOV,r461,903 # # Start FORCED_CONTEXT SWITCH  
941:MOV,r449,2 # 
942:MOV,r480,964 # 
943:OR,r480,r480,r492 # 
944:MOV,r481,947 # 
945:STORE,r480,r481 # #write to wake_vec_reg 
946:BRAUNCOND,-883 # # End FORCED_CONTEXT SWITCH
947:MOV,r480,964 # 
948:OR,r480,r480,r492 # 
949:MOV,r482,958 # 
950:STORE,r480,r482 # # write to wake_vec_reg 
951:LOAD,r480,r482 ##End SET_UP_WAKE_VEC - read wake_vec_reg
952:MOV,r461,908 #  # start CHECK_XBAR_LAYER 
953:MOV,r449,1 # 
954:NOP # 
955:NOP # 
956:HALT # 
957:NOP # 
958:MOV,r480,48 # 
959:LOADI,r480,r484 # # read simd_lyr_cntrl_reg
960:MOV,r480,4 # 
961:LOADI,r480,r472 # # read mac_cmd_reg
962:LRSHIFT,r472,r480,24 # 
963:ANDI,r480,r77,255 # 
964:ADDI,r77,r77,1 # 
965:LLSHIFT,r77,r93,3 # 
966:AND,r472,r96,r101 # 
967:LRSHIFT,r484,r484,4 # 
968:ANDI,r484,r80,8191 # 
969:LRSHIFT,r80,r84,9 # # End CHECK_XBAR_LAYER 
970:MOV,r480,44 # 
971:LLSHIFT,r104,r481,13 # 
972:OR,r80,r481,r481 # 
973:STOREI,r480,r481 ## write simd_cmd2_reg 
974:MOV,r480,0 # 
975:ADD,r472,r482,r95 # 
976:ADD,r482,r482,r97 # 
977:STOREI,r480,r482 # # End Set_SIMD_MAC - write simd_cmd1_reg 
978:MOV,r486,3584 # 
979:SUB,r93,r93,r486 # 
980:BRAGEZ,130 # 
981:ADDI,r111,r116,0 # 
982:MOV,r70,1536 # 
983:MOV,r80,1 # 
984:MOV,r77,1 # 
985:MOV,r85,1 # 
986:SUBI,r99,r99,0 # 
987:BRANZ,51 # 
988:MOV,r84,0 # 
989:MOV,r66,0 # 
990:MOV,r93,3584 # 
991:MOV,r73,512 # 
992:NOP # # Instruction not used in Assembly Generation
993:SUBI,r79,r79,0 # 
994:BRAZ,19 # 
995:MOV,r89,3584 # 
996:NOP # # Instruction not used in Assembly Generation
997:LOAD,r496,r481 # 
998:AND,r481,r481,r68 # 
999:BRAZ,2 # 
1000:BRAUNCOND,-3 # #Check for prefetch_dma_busy
1001:ADDI,r98,r480,0 # 
1002:OR,r480,r480,r492 # 
1003:ADDI,r480,r480,32 # 
1004:ADDI,r93,r482,0 # 
1005:LLSHIFT,r482,r482,16 # 
1006:ORI,r482,r482,1 # 
1007:STORE,r480,r482 # # write to cmd_wd0_reg 
1008:ADD,r65,r481,r81 # 
1009:AND,r481,r481,r125 # 
1010:ADDI,r480,r480,4 # 
1011:STORE,r480,r481 # # End PREFETCH - write to cmd_wd1_reg
1012:ADDI,r98,r98,128 # 
1013:MOV,r89,0 # 
1014:ADDI,r88,r480,0 # 
1015:OR,r480,r480,r492 # 
1016:ADDI,r480,r485,32 # 
1017:ADDI,r93,r481,0 # 
1018:LLSHIFT,r481,r481,16 # 
1019:ORI,r481,r481,1 # 
1020:STORE,r485,r481 # #write to cmd_wd0_reg
1021:ADD,r65,r481,r81 # 
1022:AND,r481,r481,r110 # 
1023:ADDI,r485,r485,4 # 
1024:STORE,r485,r481 # # end SET_XBAR_WIDTH_SPLIT_REG - write to cmd_wd1_reg
1025:ADDI,r74,r74,1 # 
1026:ADDI,r84,r84,1 # 
1027:MOV,r89,1 # 
1028:ADDI,r88,r88,128 # 
1029:ADDI,r70,r70,512 # 
1030:SUBI,r89,r89,1 # 
1031:BRALEZ,2 # 
1032:BRAUNCOND,-4 # 
1033:SUBI,r66,r66,1 # 
1034:BRAGEZ,-9 # 
1035:SUBI,r77,r77,1 # 
1036:BRALEZ,2 # 
1037:BRAUNCOND,-12 # 
1038:SUBI,r79,r79,0 # 
1039:BRAZ,7 # 
1040:LOAD,r495,r482 # # Start ADD_PREFETCH_TO_STARTQ - read cmd_lst_enable_reg
1041:NOT,r68,r484 # 
1042:AND,r484,r485,r482 # 
1043:STORE,r495,r485 # #write to cmd_lst_enable_reg
1044:OR,r68,r482,r482 # 
1045:STORE,r495,r482 ## write to cmd_lst_enable_reg - End ADD_PREFETCH_TO_STARTQ  
1046:LOAD,r494,r481 # 
1047:AND,r481,r481,r68 # 
1048:BRAZ,2 # 
1049:BRAUNCOND,-3 # 
1050:LOAD,r493,r482 # 
1051:NOT,r68,r484 # # read op_dma_cmd_lst_enable_reg
1052:AND,r484,r485,r482 # 
1053:STORE,r493,r485 ## write op_dma_cmd_lst_enable_reg 
1054:OR,r68,r482,r482 # 
1055:STORE,r493,r482 # # End ADD_TO_STARTQ_ALL_XBARS - write op_dma_cmd_lst_enable_reg
1056:STOREI,r117,r102 # #Start SET_SIMD_BASE- write to simd_base_addr_reg
1057:ADDI,r117,r480,4 # 
1058:STOREI,r480,r82 # #write to simd_addr_mask_reg - End SET_SIMD_BASE 
1059:NOP # # Instruction not used in Assembly Generation
1060:MOV,r461,1023 # # Start FORCED_CONTEXT SWITCH  
1061:MOV,r449,2 # 
1062:MOV,r480,964 # 
1063:OR,r480,r480,r492 # 
1064:MOV,r481,1067 # 
1065:STORE,r480,r481 # #write to wake_vec_reg 
1066:BRAUNCOND,-1003 # # End FORCED_CONTEXT SWITCH
1067:MOV,r480,964 # 
1068:OR,r480,r480,r492 # 
1069:MOV,r482,1081 # 
1070:STORE,r480,r482 # # write to wake_vec_reg 
1071:LOAD,r480,r482 ##End SET_UP_WAKE_VEC - read wake_vec_reg
1072:MOV,r81,0 # 
1073:MOV,r89,1 # 
1074:MOV,r70,448 # 
1075:MOV,r461,1031 #  # start CHECK_XBAR_LAYER 
1076:MOV,r449,1 # 
1077:NOP # 
1078:NOP # 
1079:HALT # 
1080:NOP # 
1081:MOV,r480,48 # 
1082:LOADI,r480,r484 # # read simd_lyr_cntrl_reg
1083:MOV,r480,4 # 
1084:LOADI,r480,r472 # # read mac_cmd_reg
1085:LRSHIFT,r472,r480,24 # 
1086:ANDI,r480,r85,255 # 
1087:ADDI,r85,r85,1 # 
1088:LLSHIFT,r85,r84,3 # 
1089:AND,r472,r103,r101 # 
1090:LRSHIFT,r484,r484,4 # 
1091:ANDI,r484,r96,8191 # 
1092:LRSHIFT,r96,r74,9 # # End CHECK_XBAR_LAYER 
1093:MOV,r480,44 # 
1094:LLSHIFT,r104,r481,13 # 
1095:OR,r96,r481,r481 # 
1096:STOREI,r480,r481 ## write simd_cmd2_reg 
1097:MOV,r480,0 # 
1098:ADD,r472,r482,r95 # 
1099:ADD,r482,r482,r97 # 
1100:STOREI,r480,r482 # # End Set_SIMD_MAC - write simd_cmd1_reg 
1101:ADD,r81,r81,r84 # 
1102:SUB,r70,r70,r85 # 
1103:BRALEZ,2 # 
1104:BRAUNCOND,-29 # 
1105:ADDI,r91,r91,2 # 
1106:MOV,r486,3584 # 
1107:ADD,r65,r65,r486 # 
1108:MOV,r486,33554431 # 
1109:AND,r65,r65,r486 # 
1110:MOV,r486,3584 # 
1111:ADD,r106,r106,r486 # 
1112:MOV,r70,18874368 # 
1113:MOV,r486,3584 # 
1114:ADD,r107,r107,r486 # 
1115:MOV,r70,34471936 # 
1116:MOV,r486,3584 # 
1117:ADD,r124,r124,r486 # 
1118:MOV,r89,2 # 
1119:MOV,r84,1 # 
1120:LOAD,r496,r481 # # start CHECK_PREFETCH_DONE - read prefetch_dma_busy_reg 
1121:AND,r481,r481,r68 # 
1122:BRAZ,2 # 
1123:BRAUNCOND,-3 # #end CHECK_XBAR_DONE
1124:MOV,r480,12 # 
1125:LOADI,r480,r481 # #read simd_wbuf_addr_status_reg 
1126:ANDI,r481,r481,1 # 
1127:BRANZ,2 # 
1128:BRAUNCOND,-3 # End END_BLOCK 
1129:MOV,r480,1044 # 
1130:OR,r480,r480,r492 # 
1131:STORE,r480,r89 # # End INCREMENT_OBUF_COUNTER  
1132:MOV,r482,1048 ## Start SEND_SYNC_NEXT 
1133:OR,r482,r482,r492 # 
1134:STORE,r482,r89 # # End SEND_SYNC_NEXT
1135:SUBI,r84,r84,1 # 
1136:BRALEZ,2 # 
1137:BRAUNCOND,-13 # 
1138:ADDI,r99,r99,0 # 
1139:SUBI,r67,r67,1 # 
1140:BRALEZ,2 # 
1141:BRAUNCOND,-264 # 
1142:MOV,r92,2 # 
1143:MOV,r93,1 # 
1144:MOV,r94,1304 # 
1145:MOV,r95,3 # 
1146:MOV,r96,1 # 
1147:MOV,r97,28 # 
1148:MOV,r480,784 # 
1149:LLSHIFT,r480,r480,16 # 
1150:OR,r97,r97,r480 # 
1151:NOP ##Start SET_UP_NEXT 
1152:NOP # 
1153:NOP # 
1154:MOV,r461,687 # 
1155:MOV,r449,1 # 
1156:BRAUNCOND,-1093 # #Branch to the same layer, instruction start location
1157:NOP # 
1158:NOP # 
1159:NOP # 
1160:NOP # 
1161:HALT # 
1162:NOP ##End SET_UP_NEXT 
