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
199:MOV,r0,7168 # 
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
216:MOV,r9,256 # 
217:MOV,r19,0 # 
218:MOV,r33,233 # 
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
234:MOV,r9,256 # 
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
268:MOV,r26,256 # 
269:MOV,r33,7168 # 
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
288:MOV,r47,9344 # 
289:MOV,r2,1 # 
290:MOV,r14,512 # 
291:OR,r47,r480,r492 ## Start SET_OUT_XBAR_REGS 
292:ADDI,r480,r481,20 # 
293:ADDI,r30,r482,0 # 
294:LLSHIFT,r14,r483,16 # 
295:OR,r482,r482,r483 # 
296:STORE,r481,r482 # #write to mac blk mb_config_reg
297:ADDI,r480,r485,0 # 
298:LLSHIFT,r11,r481,16 # 
299:OR,r26,r481,r481 # 
300:STORE,r485,r481 ## write to mac blk bt_size_reg 
301:ADDI,r480,r481,28 # 
302:LLSHIFT,r36,r482,31 # 
303:OR,r33,r482,r482 # 
304:STORE,r481,r482 # # End SET_OUT_XBAR_REGS - write to mac blk row_step_reg
305:MOV,r47,9472 # 
306:MOV,r2,2 # 
307:MOV,r14,1024 # 
308:OR,r47,r480,r492 ## Start SET_OUT_XBAR_REGS 
309:ADDI,r480,r481,20 # 
310:ADDI,r30,r482,0 # 
311:LLSHIFT,r14,r483,16 # 
312:OR,r482,r482,r483 # 
313:STORE,r481,r482 # #write to mac blk mb_config_reg
314:ADDI,r480,r485,0 # 
315:LLSHIFT,r11,r481,16 # 
316:OR,r26,r481,r481 # 
317:STORE,r485,r481 ## write to mac blk bt_size_reg 
318:ADDI,r480,r481,28 # 
319:LLSHIFT,r36,r482,31 # 
320:OR,r33,r482,r482 # 
321:STORE,r481,r482 # # End SET_OUT_XBAR_REGS - write to mac blk row_step_reg
322:MOV,r47,9600 # 
323:MOV,r2,3 # 
324:MOV,r14,1536 # 
325:OR,r47,r480,r492 ## Start SET_OUT_XBAR_REGS 
326:ADDI,r480,r481,20 # 
327:ADDI,r30,r482,0 # 
328:LLSHIFT,r14,r483,16 # 
329:OR,r482,r482,r483 # 
330:STORE,r481,r482 # #write to mac blk mb_config_reg
331:ADDI,r480,r485,0 # 
332:LLSHIFT,r11,r481,16 # 
333:OR,r26,r481,r481 # 
334:STORE,r485,r481 ## write to mac blk bt_size_reg 
335:ADDI,r480,r481,28 # 
336:LLSHIFT,r36,r482,31 # 
337:OR,r33,r482,r482 # 
338:STORE,r481,r482 # # End SET_OUT_XBAR_REGS - write to mac blk row_step_reg
339:MOV,r14,9216 # 
340:MOV,r47,13312 # 
341:MOV,r2,0 # 
342:SUBI,r2,r2,0 # 
343:BRAZ,6 # 
344:ADDI,r14,r14,128 # 
345:ADDI,r47,r47,128 # 
346:SUBI,r2,r2,1 # 
347:BRALEZ,2 # 
348:BRAUNCOND,-4 # 
349:MOV,r33,0 # 
350:MOV,r11,1 # 
351:MOV,r59,0 # 
352:MOV,r37,65535 # 
353:MOV,r480,255 # 
354:LLSHIFT,r480,r480,16 # 
355:OR,r37,r37,r480 # 
356:MOV,r35,0 # 
357:MOV,r3,112 # 
358:NOP # # Instruction not used in Assembly Generation
359:MOV,r17,0 # 
360:ADDI,r14,r24,0 # 
361:MOV,r27,0 # 
362:MOV,r10,0 # 
363:ADDI,r47,r34,0 # 
364:MOV,r22,1 # 
365:MOV,r31,0 # 
366:MOV,r12,0 # 
367:MOV,r5,0 # 
368:MOV,r41,256 # 
369:MOV,r480,32976 ##Start READ_FROM_SCRATCH
370:MOV,r481,208 # 
371:OR,r481,r481,r492 # 
372:STORE,r481,r480 # write process_memory_addr
373:MOV,r481,212 # 
374:OR,r481,r481,r492 # 
375:LOAD,r481,r38 ## End READ_FROM_SCRATCH - read from process_memory_loc 
376:MOV,r18,32767 # 
377:MOV,r480,0 # 
378:LLSHIFT,r480,r480,16 # 
379:OR,r18,r18,r480 # 
380:MOV,r8,0 # 
381:MOV,r28,0 # 
382:MOV,r52,0 # 
383:SUBI,r52,r52,0 # 
384:BRAZ,3 # 
385:MOV,r33,0 # 
386:NOP # # Instruction not used in Assembly Generation
387:MOV,r52,0 # 
388:SUBI,r52,r52,0 # 
389:BRAZ,73 # 
390:MOV,r10,0 # 
391:MOV,r29,0 # 
392:MOV,r6,0 # 
393:NOP # # Instruction not used in Assembly Generation
394:MOV,r21,1 # 
395:ADDI,r24,r480,0 # 
396:OR,r480,r480,r492 # 
397:ADDI,r480,r485,32 # 
398:ADDI,r29,r481,0 # 
399:LLSHIFT,r481,r481,16 # 
400:ORI,r481,r481,1 # 
401:STORE,r485,r481 # #write to cmd_wd0_reg
402:ADD,r1,r481,r17 # 
403:AND,r481,r481,r46 # 
404:ADDI,r485,r485,4 # 
405:STORE,r485,r481 # # end SET_XBAR_WIDTH_SPLIT_REG - write to cmd_wd1_reg
406:MOV,r486,1 # 
407:LLSHIFTREG,r486,r486,r10 # 
408:LOAD,r493,r482 ## read output_dma_cmd_lst_enable_reg 
409:NOT,r486,r484 # 
410:AND,r484,r485,r482 # 
411:STORE,r493,r485 ## write to output_dma_cmd_lst_enable_reg 
412:OR,r486,r482,r482 # 
413:STORE,r493,r482 ## write to output_dma_cmd_lst_enable_reg - End ADD_XBAR_TO_STARTQ  
414:STOREI,r53,r38 # #Start SET_SIMD_BASE- write to simd_base_addr_reg
415:ADDI,r53,r480,4 # 
416:STOREI,r480,r18 # #write to simd_addr_mask_reg - End SET_SIMD_BASE 
417:ADD,r1,r1,r29 # 
418:MOV,r486,33554431 # 
419:AND,r1,r1,r486 # 
420:NOP # # Instruction not used in Assembly Generation
421:MOV,r460,387 # # Start FORCED_CONTEXT SWITCH  
422:MOV,r449,1 # 
423:MOV,r480,960 # 
424:OR,r480,r480,r492 # 
425:MOV,r481,428 # 
426:STORE,r480,r481 # #write to wake_vec_reg 
427:BRAUNCOND,-364 # # End FORCED_CONTEXT SWITCH
428:MOV,r480,960 # 
429:OR,r480,r480,r492 # 
430:MOV,r482,439 # 
431:STORE,r480,r482 # # write to wake_vec_reg 
432:LOAD,r480,r482 ##End SET_UP_WAKE_VEC - read wake_vec_reg
433:MOV,r460,392 #  # start CHECK_XBAR_LAYER 
434:MOV,r449,0 # 
435:NOP # 
436:NOP # 
437:HALT # 
438:NOP # 
439:MOV,r480,48 # 
440:LOADI,r480,r484 # # read simd_lyr_cntrl_reg
441:MOV,r480,4 # 
442:LOADI,r480,r472 # # read mac_cmd_reg
443:LRSHIFT,r472,r480,24 # 
444:ANDI,r480,r13,255 # 
445:ADDI,r13,r13,1 # 
446:LLSHIFT,r13,r29,3 # 
447:AND,r472,r32,r37 # 
448:LRSHIFT,r484,r484,4 # 
449:ANDI,r484,r16,8191 # 
450:LRSHIFT,r16,r20,9 # # End CHECK_XBAR_LAYER 
451:MOV,r480,44 # 
452:LLSHIFT,r40,r481,13 # 
453:OR,r16,r481,r481 # 
454:STOREI,r480,r481 ## write simd_cmd2_reg 
455:MOV,r480,0 # 
456:ADD,r472,r482,r31 # 
457:ADD,r482,r482,r33 # 
458:STOREI,r480,r482 # # End Set_SIMD_MAC - write simd_cmd1_reg 
459:MOV,r486,7168 # 
460:SUB,r29,r29,r486 # 
461:BRAGEZ,130 # 
462:ADDI,r47,r52,0 # 
463:MOV,r6,0 # 
464:MOV,r16,4 # 
465:MOV,r13,4 # 
466:MOV,r21,1 # 
467:SUBI,r35,r35,0 # 
468:BRANZ,51 # 
469:MOV,r20,0 # 
470:MOV,r2,0 # 
471:MOV,r29,7168 # 
472:MOV,r9,256 # 
473:NOP # # Instruction not used in Assembly Generation
474:SUBI,r15,r15,0 # 
475:BRAZ,19 # 
476:MOV,r25,7168 # 
477:NOP # # Instruction not used in Assembly Generation
478:LOAD,r496,r481 # 
479:AND,r481,r481,r4 # 
480:BRAZ,2 # 
481:BRAUNCOND,-3 # #Check for prefetch_dma_busy
482:ADDI,r34,r480,0 # 
483:OR,r480,r480,r492 # 
484:ADDI,r480,r480,32 # 
485:ADDI,r29,r482,0 # 
486:LLSHIFT,r482,r482,16 # 
487:ORI,r482,r482,1 # 
488:STORE,r480,r482 # # write to cmd_wd0_reg 
489:ADD,r1,r481,r17 # 
490:AND,r481,r481,r61 # 
491:ADDI,r480,r480,4 # 
492:STORE,r480,r481 # # End PREFETCH - write to cmd_wd1_reg
493:ADDI,r34,r34,128 # 
494:MOV,r25,0 # 
495:ADDI,r24,r480,0 # 
496:OR,r480,r480,r492 # 
497:ADDI,r480,r485,32 # 
498:ADDI,r29,r481,0 # 
499:LLSHIFT,r481,r481,16 # 
500:ORI,r481,r481,1 # 
501:STORE,r485,r481 # #write to cmd_wd0_reg
502:ADD,r1,r481,r17 # 
503:AND,r481,r481,r46 # 
504:ADDI,r485,r485,4 # 
505:STORE,r485,r481 # # end SET_XBAR_WIDTH_SPLIT_REG - write to cmd_wd1_reg
506:ADDI,r10,r10,1 # 
507:ADDI,r20,r20,1 # 
508:MOV,r25,1 # 
509:ADDI,r24,r24,128 # 
510:ADDI,r6,r6,512 # 
511:SUBI,r25,r25,1 # 
512:BRALEZ,2 # 
513:BRAUNCOND,-4 # 
514:SUBI,r2,r2,1 # 
515:BRAGEZ,-9 # 
516:SUBI,r13,r13,1 # 
517:BRALEZ,2 # 
518:BRAUNCOND,-12 # 
519:SUBI,r15,r15,0 # 
520:BRAZ,7 # 
521:LOAD,r495,r482 # # Start ADD_PREFETCH_TO_STARTQ - read cmd_lst_enable_reg
522:NOT,r4,r484 # 
523:AND,r484,r485,r482 # 
524:STORE,r495,r485 # #write to cmd_lst_enable_reg
525:OR,r4,r482,r482 # 
526:STORE,r495,r482 ## write to cmd_lst_enable_reg - End ADD_PREFETCH_TO_STARTQ  
527:LOAD,r494,r481 # 
528:AND,r481,r481,r4 # 
529:BRAZ,2 # 
530:BRAUNCOND,-3 # 
531:LOAD,r493,r482 # 
532:NOT,r4,r484 # # read op_dma_cmd_lst_enable_reg
533:AND,r484,r485,r482 # 
534:STORE,r493,r485 ## write op_dma_cmd_lst_enable_reg 
535:OR,r4,r482,r482 # 
536:STORE,r493,r482 # # End ADD_TO_STARTQ_ALL_XBARS - write op_dma_cmd_lst_enable_reg
537:STOREI,r53,r38 # #Start SET_SIMD_BASE- write to simd_base_addr_reg
538:ADDI,r53,r480,4 # 
539:STOREI,r480,r18 # #write to simd_addr_mask_reg - End SET_SIMD_BASE 
540:NOP # # Instruction not used in Assembly Generation
541:MOV,r460,507 # # Start FORCED_CONTEXT SWITCH  
542:MOV,r449,1 # 
543:MOV,r480,960 # 
544:OR,r480,r480,r492 # 
545:MOV,r481,548 # 
546:STORE,r480,r481 # #write to wake_vec_reg 
547:BRAUNCOND,-484 # # End FORCED_CONTEXT SWITCH
548:MOV,r480,960 # 
549:OR,r480,r480,r492 # 
550:MOV,r482,562 # 
551:STORE,r480,r482 # # write to wake_vec_reg 
552:LOAD,r480,r482 ##End SET_UP_WAKE_VEC - read wake_vec_reg
553:MOV,r17,0 # 
554:MOV,r25,1 # 
555:MOV,r6,896 # 
556:MOV,r460,515 #  # start CHECK_XBAR_LAYER 
557:MOV,r449,0 # 
558:NOP # 
559:NOP # 
560:HALT # 
561:NOP # 
562:MOV,r480,48 # 
563:LOADI,r480,r484 # # read simd_lyr_cntrl_reg
564:MOV,r480,4 # 
565:LOADI,r480,r472 # # read mac_cmd_reg
566:LRSHIFT,r472,r480,24 # 
567:ANDI,r480,r21,255 # 
568:ADDI,r21,r21,1 # 
569:LLSHIFT,r21,r20,3 # 
570:AND,r472,r39,r37 # 
571:LRSHIFT,r484,r484,4 # 
572:ANDI,r484,r32,8191 # 
573:LRSHIFT,r32,r10,9 # # End CHECK_XBAR_LAYER 
574:MOV,r480,44 # 
575:LLSHIFT,r40,r481,13 # 
576:OR,r32,r481,r481 # 
577:STOREI,r480,r481 ## write simd_cmd2_reg 
578:MOV,r480,0 # 
579:ADD,r472,r482,r31 # 
580:ADD,r482,r482,r33 # 
581:STOREI,r480,r482 # # End Set_SIMD_MAC - write simd_cmd1_reg 
582:ADD,r17,r17,r20 # 
583:SUB,r6,r6,r21 # 
584:BRALEZ,2 # 
585:BRAUNCOND,-29 # 
586:ADDI,r27,r27,1 # 
587:MOV,r486,7168 # 
588:ADD,r1,r1,r486 # 
589:MOV,r486,33554431 # 
590:AND,r1,r1,r486 # 
591:MOV,r486,7168 # 
592:ADD,r42,r42,r486 # 
593:MOV,r6,0 # 
594:MOV,r25,1 # 
595:MOV,r20,1 # 
596:LOAD,r496,r481 # # start CHECK_PREFETCH_DONE - read prefetch_dma_busy_reg 
597:AND,r481,r481,r4 # 
598:BRAZ,2 # 
599:BRAUNCOND,-3 # #end CHECK_XBAR_DONE
600:MOV,r480,12 # 
601:LOADI,r480,r481 # #read simd_wbuf_addr_status_reg 
602:ANDI,r481,r481,1 # 
603:BRANZ,2 # 
604:BRAUNCOND,-3 # End END_BLOCK 
605:MOV,r480,1044 # 
606:OR,r480,r480,r492 # 
607:STORE,r480,r25 # # End INCREMENT_OBUF_COUNTER  
608:MOV,r482,1048 ## Start SEND_SYNC_NEXT 
609:OR,r482,r482,r492 # 
610:STORE,r482,r25 # # End SEND_SYNC_NEXT
611:SUBI,r20,r20,1 # 
612:BRALEZ,2 # 
613:BRAUNCOND,-13 # 
614:ADDI,r35,r35,1 # 
615:SUBI,r3,r3,1 # 
616:BRALEZ,2 # 
617:BRAUNCOND,-259 # 
618:MOV,r28,1 # 
619:MOV,r29,0 # 
620:MOV,r30,1192 # 
621:MOV,r31,0 # 
622:MOV,r32,4 # 
623:MOV,r33,0 # 
624:MOV,r480,784 # 
625:LLSHIFT,r480,r480,16 # 
626:OR,r33,r33,r480 # 
627:NOP ##Start SET_UP_NEXT 
628:NOP # 
629:NOP # 
630:MOV,r460,148 # 
631:MOV,r449,0 # 
632:BRAUNCOND,-569 # #Branch to the same layer, instruction start location
633:NOP # 
634:NOP # 
635:NOP # 
636:NOP # 
637:HALT # 
638:NOP ##End SET_UP_NEXT 
