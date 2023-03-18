# Assembler for Chip - Input Processor 
# Input uP Assembly Code 
0:MOV,r448,4 # # Init process count 
1:MOV,r449,0 ## Initialize current process id
2:MOV,r492,1 # 
3:LLSHIFT,r492,r492,23 # 
4:MOV,r471,9 # # Initialize base address offset reg
5:MOV,r480,1040 # 
6:OR,r480,r476,r492 # # Initialize Output Buffer status reg
7:MOV,r480,1024 # 
8:OR,r480,r475,r492 # # Initialize Input buffer status address reg
9:MOV,r480,4108 # 
10:OR,r480,r478,r492 # # Initialize Input dma busy address reg
11:MOV,r480,4104 # 
12:OR,r480,r479,r492 # # Initialize Input DMA enable address reg
13:MOV,r468,0 ## Initialize image end status reg
14:MOV,r470,0 ## Initialize context switch reg
15:MOV,r450,25 # # store proc0 start loc
16:MOV,r460,25 # # store proc0 last loc  
17:MOV,r451,373 # # store proc1 start loc
18:MOV,r461,373 # # store proc1 last loc  
19:MOV,r452,721 # # store proc2 start loc
20:MOV,r462,721 # # store proc2 last loc  
21:MOV,r453,1069 # # store proc3 start loc
22:MOV,r463,1069 # # store proc3 last loc  
23:NOP #
24:NOP #
25:NOP #
26:NOP #
27:NOP #
28:NOP #
29:NOP #
30:NOP #
31:MOV,r449,0 ## curr proc id
# Switch to proc id
32:ADDI,r449,r510,0 # 
33:SUBI,r510,r510,0 # 
34:BRANZ,2 # 
35:BRAREG,r460 ## branch to counter proc 0 
36:SUBI,r510,r510,1 # 
37:BRANZ,2 # 
38:BRAREG,r461 ## branch to counter proc 1 
39:SUBI,r510,r510,1 # 
40:BRANZ,2 # 
41:BRAREG,r462 ## branch to counter proc 2 
42:SUBI,r510,r510,1 # 
43:BRANZ,2 # 
44:BRAREG,r463 ## branch to counter proc 3 
45:SUBI,r510,r510,1 # 
46:BRANZ,2 # 
47:BRAREG,r464 ## branch to counter proc 4 
48:SUBI,r510,r510,1 # 
49:BRANZ,2 # 
50:BRAREG,r465 ## branch to counter proc 5 
51:SUBI,r510,r510,1 # 
52:BRANZ,2 # 
53:BRAREG,r466 ## branch to counter proc 6 
54:SUBI,r510,r510,1 # 
55:BRANZ,2 # 
56:BRAREG,r467 ## branch to counter proc 7 
# Entry point for context switch
57:SUB,r448,r510,r449 # 
58:BRANZ,-26 # 
59:BRAUNCOND,-28 # 
# Layer Instruction Start
60:MOV,r8,0 # 
61:MOV,r480,0 # 
62:LLSHIFT,r480,r480,16 # 
63:OR,r8,r8,r480 # 
64:ADDI,r8,r1,0 # 
65:MOV,r486,3584 # 
66:SUB,r1,r1,r486 # 
67:MOV,r48,0 # 
68:MOV,r480,144 # 
69:LLSHIFT,r480,r480,16 # 
70:OR,r48,r48,r480 # 
71:MOV,r0,-1 # 
72:MOV,r37,0 # 
73:MOV,r477,4104 # 
74:MOV,r480,128 # 
75:LLSHIFT,r480,r480,16 # 
76:OR,r477,r477,r480 # 
77:MOV,r40,5120 # 
78:MOV,r480,128 # 
79:LLSHIFT,r480,r480,16 # 
80:OR,r40,r40,r480 # 
81:MOV,r49,32767 # 
82:MOV,r50,0 # 
83:MOV,r2,0 # 
84:MOV,r56,4864 # 
85:MOV,r480,128 # 
86:LLSHIFT,r480,r480,16 # 
87:OR,r56,r56,r480 # 
88:MOV,r59,0 # 
89:MOV,r60,64 # 
90:MOV,r58,1 # 
91:MOV,r52,0 # 
92:MOV,r480,0 # 
93:LLSHIFT,r480,r480,16 # 
94:OR,r52,r52,r480 # 
95:ADDI,r56,r480,0 ## Start SET_LYR_REG 
96:ADDI,r49,r482,0 # 
97:ADDI,r480,r483,0 # 
98:LLSHIFT,r482,r482,0 # 
99:STORE,r483,r482 # 
100:LLSHIFT,r48,r482,0 # 
101:ADDI,r480,r483,4 # 
102:STORE,r483,r482 # 
103:ADDI,r52,r482,0 # 
104:ADDI,r480,r483,12 # 
105:STORE,r483,r482 # 
106:LLSHIFT,r59,r482,16 # 
107:OR,r482,r482,r60 # 
108:ADDI,r480,r483,8 # 
109:STORE,r483,r482 ## end SET_LYR_REG 
110:SUBI,r2,r2,0 # 
111:BRAZ,5 # 
112:ADDI,r40,r40,128 # 
113:SUBI,r2,r2,1 # 
114:BRALEZ,2 # 
115:BRAUNCOND,-3 # 
116:MOV,r58,192 # 
117:MOV,r10,0 # 
118:MOV,r6,0 # 
119:MOV,r7,1 # 
120:MOV,r53,1 # 
121:MOV,r34,3584 # 
122:MOV,r26,1 # 
123:MOV,r480,4128 # 
124:OR,r480,r480,r492 # 
125:LOAD,r480,r481 # #read  split_grp_reg
126:OR,r481,r481,r10 # 
127:STORE,r480,r481 # #write to split_grp_reg
128:ADDI,r40,r480,0 # 
129:ADDI,r7,r485,0 # 
130:ADDI,r480,r481,0 # 
131:MOV,r482,1 # 
132:LLSHIFT,r482,r482,16 # 
133:ADDI,r58,r483,0 # 
134:OR,r482,r482,r483 # 
135:STORE,r481,r482 ##write to bt_size_reg 
136:ADDI,r480,r481,20 # 
137:ADDI,r6,r482,0 # 
138:STORE,r481,r482 # #write to mb_config_reg
139:ADDI,r480,r481,28 # 
140:LLSHIFT,r26,r482,31 # 
141:OR,r482,r482,r34 # 
142:STORE,r481,r482 # #write to row_step_reg
143:ADDI,r480,r480,128 # 
144:SUBI,r485,r485,1 # 
145:BRALEZ,2 # 
146:BRAUNCOND,-16 # #End SET_NXBARS_REG
147:MOV,r26,0 # 
148:MOV,r13,64 # 
149:MOV,r12,1 # 
150:MOV,r23,1 # 
151:MOV,r24,1088 # 
152:MOV,r44,2 # 
153:MOV,r57,1172 # 
154:MOV,r27,0 # 
155:MOV,r2,0 # 
156:MOV,r30,1 # 
157:MOV,r25,1 # 
158:MOV,r3,0 # 
159:ADDI,r0,r4,0 # 
160:ADDI,r4,r4,3 # 
161:ADDI,r4,r5,0 # 
162:SUBI,r5,r5,56 # 
163:BRALEZ,2 # 
164:MOV,r4,56 # 
165:ADDI,r4,r6,0 # 
166:SUB,r6,r6,r2 # 
167:OR,r24,r482,r492 #  # Start START_TFR_REG_XBARS 
168:ADDI,r482,r480,80 # 
169:STORE,r480,r6 # # End START_TFR_REG_XBARS
170:MOV,r32,-64 # 
171:ADDI,r40,r41,0 # 
172:MOV,r29,64 # 
173:MOV,r52,3 # 
174:MOV,r35,0 # 
175:MOV,r36,3584 # 
176:MOV,r21,64 # 
177:MOV,r9,0 # 
178:ADDI,r9,r14,0 # 
179:MOV,r31,0 # 
180:SUBI,r25,r25,0 # 
181:BRAZ,69 # 
182:SUBI,r14,r14,1 # 
183:BRAGEZ,2 # 
184:BRAUNCOND,25 # 
185:SUBI,r14,r14,1 # 
186:BRAGEZ,2 # 
187:BRAUNCOND,28 # 
188:SUBI,r14,r14,1 # 
189:BRAGEZ,2 # 
190:BRAUNCOND,31 # 
191:SUBI,r14,r14,1 # 
192:BRAGEZ,2 # 
193:BRAUNCOND,34 # 
194:SUBI,r14,r14,1 # 
195:BRAGEZ,2 # 
196:BRAUNCOND,37 # 
197:SUBI,r14,r14,1 # 
198:BRAGEZ,2 # 
199:BRAUNCOND,40 # 
200:SUBI,r14,r14,1 # 
201:BRAGEZ,2 # 
202:BRAUNCOND,43 # 
203:MOV,r29,0 # 
204:MOV,r52,0 # 
205:MOV,r35,0 # 
206:MOV,r36,0 # 
207:MOV,r21,0 # 
208:BRAUNCOND,42 # 
209:MOV,r29,64 # 
210:MOV,r52,3 # 
211:MOV,r35,0 # 
212:MOV,r36,3584 # 
213:MOV,r21,64 # 
214:BRAUNCOND,36 # 
215:MOV,r29,0 # 
216:MOV,r52,0 # 
217:MOV,r35,0 # 
218:MOV,r36,0 # 
219:MOV,r21,0 # 
220:BRAUNCOND,30 # 
221:MOV,r29,0 # 
222:MOV,r52,0 # 
223:MOV,r35,0 # 
224:MOV,r36,0 # 
225:MOV,r21,0 # 
226:BRAUNCOND,24 # 
227:MOV,r29,0 # 
228:MOV,r52,0 # 
229:MOV,r35,0 # 
230:MOV,r36,0 # 
231:MOV,r21,0 # 
232:BRAUNCOND,18 # 
233:MOV,r29,64 # 
234:MOV,r52,0 # 
235:MOV,r35,3584 # 
236:MOV,r36,275615856 # 
237:MOV,r21,3 # 
238:BRAUNCOND,12 # 
239:MOV,r29,0 # 
240:MOV,r52,0 # 
241:MOV,r35,0 # 
242:MOV,r36,32766 # 
243:MOV,r21,0 # 
244:BRAUNCOND,6 # 
245:MOV,r29,0 # 
246:MOV,r52,0 # 
247:MOV,r35,0 # 
248:MOV,r36,10 # 
249:MOV,r21,0 # 
250:MOV,r16,0 # 
251:ADDI,r1,r19,0 # 
252:ADD,r19,r19,r35 # 
253:MOV,r43,0 # 
254:MOV,r20,0 # 
255:MOV,r33,0 # 
256:ADDI,r0,r22,0 # 
257:ADD,r22,r22,r33 # 
258:BRAGEZ,2 # 
259:BRAUNCOND,3 # 
260:SUBI,r22,r22,55 # 
261:BRALEZ,4 # 
262:MOV,r54,1 # 
263:MOV,r25,1 # 
264:BRAUNCOND,5 # 
265:SUBI,r30,r30,0 # 
266:BRAZ,27 # 
267:MOV,r54,0 # 
268:ADDI,r31,r31,1 # 
269:ADDI,r16,r55,0 # 
270:ADDI,r55,r55,31 # 
271:LRSHIFT,r55,r55,5 # 
272:ADDI,r41,r480,0 # # Start MOV_TO_XBARS_BLK 
273:ADDI,r480,r481,32 # 
274:ADD,r481,r481,r43 # 
275:LLSHIFT,r54,r484,1 # 
276:ORI,r484,r484,1 # 
277:LLSHIFT,r52,r482,2 # 
278:OR,r484,r485,r482 # 
279:LLSHIFT,r21,r483,4 # 
280:OR,r485,r485,r483 # 
281:LLSHIFT,r36,r484,16 # 
282:OR,r485,r474,r484 # 
283:STORE,r481,r474 ##write to cmd_wd0_reg 
284:ADDI,r19,r485,0 # 
285:BRAGEZ,2 # 
286:MOV,r485,0 # 
287:AND,r48,r484,r49 # 
288:ADD,r485,r485,r484 # 
289:LLSHIFT,r55,r482,25 # 
290:OR,r485,r485,r482 # 
291:ADDI,r481,r481,4 # 
292:STORE,r481,r485 ## write to cmd_wd1_reg - End MOV_TO_XBARS_BLK 
293:ADDI,r43,r43,8 # 
294:MOV,r486,3584 # 
295:ADD,r19,r19,r486 # 
296:ADDI,r16,r16,192 # 
297:ADDI,r33,r33,1 # 
298:ADDI,r20,r20,1 # 
299:MOV,r4,3 # 
300:SUB,r4,r4,r20 # 
301:BRALEZ,2 # 
302:BRAUNCOND,-46 # 
303:ADDI,r41,r41,128 # 
304:ADD,r32,r32,r13 # 
305:ADDI,r9,r9,1 # 
306:ADDI,r7,r4,0 # 
307:SUB,r4,r4,r9 # 
308:BRALEZ,2 # 
309:BRAUNCOND,-131 # 
310:LOAD,r479,r482 ## Start MULTI_END_BLOCK - Read input_cmd_list_en_reg
311:NOT,r53,r483 # 
312:AND,r483,r483,r482 # 
313:STORE,r479,r483 ## Write to input_cmd_list_en_reg 
314:OR,r53,r481,r482 # 
315:STORE,r479,r481 ## Write to input_cmd_list_en_reg - End MULTI_END_BLOCK 
316:NOP # # Start MULTI_END_SYNC
317:NOP # 
318:NOP # 
319:NOP # 
320:HALT # 
321:NOP # 
322:LOAD,r478,r483 # # read input_dma_busy_reg 
323:AND,r483,r483,r53 # 
324:BRAZ,4 # 
325:MOV,r460,281 # 
326:MOV,r449,1 # 
327:BRAUNCOND,-270 ##  End MULTI_END_SYNC 
328:SUBI,r30,r30,0 # 
329:BRAZ,10 # 
330:SUBI,r0,r0,0 # 
331:BRAGEZ,2 # 
332:BRAUNCOND,7 # 
333:MOV,r22,3 # 
334:SUB,r22,r22,r31 # 
335:BRALEZ,2 # 
336:BRAUNCOND,3 # 
337:MOV,r25,0 # 
338:MOV,r30,0 # 
339:SUB,r4,r4,r5 # 
340:ADDI,r0,r0,1 # 
341:BRALEZ,26 # 
342:ADDI,r0,r27,0 # 
343:ADDI,r0,r4,0 # 
344:SUBI,r4,r4,1 # 
345:BRALEZ,2 # 
346:MOV,r27,1 # 
347:ADDI,r24,r480,88 ## Start CHECK_FIFO_REG 
348:OR,r480,r480,r492 # 
349:LOAD,r480,r481 ##read in_buf_cntr_reg 
350:SUB,r481,r481,r27 # 
351:BRAGEZ,2 # 
352:BRAUNCOND,-3 # # End CHECK_FIFO_REG 
353:ADDI,r27,r4,0 # 
354:MOV,r20,1 # 
355:OR,r57,r480,r492 ## Start  POP_REG 
356:MOV,r481,1 # 
357:STORE,r480,r481 ## write to asq_send_reg 
358:MOV,r481,1028 # 
359:OR,r481,r481,r492 # 
360:STORE,r481,r23 ## write to in_buf_decr_reg- End POP_REG 
361:MOV,r481,1032 ## Start SEND_SYNC_PREV 
362:OR,r481,r481,r492 # 
363:STORE,r481,r23 # # End SEND_SYNC_PREV
364:SUBI,r4,r4,1 # 
365:BRALEZ,2 # 
366:BRAUNCOND,-11 # 
367:ADD,r2,r2,r27 # 
368:MOV,r486,3584 # 
369:ADD,r1,r1,r486 # 
370:ADDI,r3,r3,1 # 
371:MOV,r4,56 # 
372:SUB,r4,r4,r3 # 
373:BRALEZ,2 # 
374:BRAUNCOND,-215 # 
375:MOV,r2,1 # 
376:MOV,r9,4096 # 
377:MOV,r480,3 # 
378:LLSHIFT,r480,r480,16 # 
379:OR,r9,r9,r480 # 
380:ADD,r8,r8,r9 # 
381:MOV,r30,1192 # 
382:MOV,r31,1176 # 
383:NOP #  # Start SET_UP_NEXT 
384:SUBI,r2,r486,0 # 
385:BRAZ,16 # 
386:OR,r31,r480,r492 # 
387:LOAD,r480,r481 ##read input_buf_cnt_reg 
388:SUB,r481,r481,r2 # 
389:BRAGEZ,4 # 
390:MOV,r460,351 # 
391:MOV,r449,1 # 
392:BRAUNCOND,-335 # 
393:MOV,r481,1032 # 
394:OR,r481,r481,r492 # 
395:MOV,r483,1028 # 
396:OR,r483,r483,r492 # 
397:STORE,r481,r23 ## write to asq_send_reg 
398:STORE,r483,r23 ## write to ib_decr_reg 
399:SUBI,r2,r2,1 # 
400:BRANZ,-3 # 
401:MOV,r460,29 # 
402:MOV,r449,0 # 
403:BRAUNCOND,-346 # #Branch to the same layer, instruction start location
404:NOP # 
405:NOP # 
406:NOP # 
407:NOP # 
408:NOP # 
409:HALT # 
410:NOP ##End SET_UP_NEXT 
411:MOV,r72,0 # 
412:MOV,r480,0 # 
413:LLSHIFT,r480,r480,16 # 
414:OR,r72,r72,r480 # 
415:ADDI,r72,r65,0 # 
416:MOV,r486,3584 # 
417:SUB,r65,r65,r486 # 
418:MOV,r112,32768 # 
419:MOV,r480,144 # 
420:LLSHIFT,r480,r480,16 # 
421:OR,r112,r112,r480 # 
422:MOV,r64,-1 # 
423:MOV,r101,1 # 
424:MOV,r477,4104 # 
425:MOV,r480,128 # 
426:LLSHIFT,r480,r480,16 # 
427:OR,r477,r477,r480 # 
428:MOV,r104,5120 # 
429:MOV,r480,128 # 
430:LLSHIFT,r480,r480,16 # 
431:OR,r104,r104,r480 # 
432:MOV,r113,32767 # 
433:MOV,r114,0 # 
434:MOV,r66,1 # 
435:MOV,r120,4880 # 
436:MOV,r480,128 # 
437:LLSHIFT,r480,r480,16 # 
438:OR,r120,r120,r480 # 
439:MOV,r123,0 # 
440:MOV,r124,64 # 
441:MOV,r122,1 # 
442:MOV,r116,0 # 
443:MOV,r480,0 # 
444:LLSHIFT,r480,r480,16 # 
445:OR,r116,r116,r480 # 
446:ADDI,r120,r480,0 ## Start SET_LYR_REG 
447:ADDI,r113,r482,0 # 
448:ADDI,r480,r483,0 # 
449:LLSHIFT,r482,r482,0 # 
450:STORE,r483,r482 # 
451:LLSHIFT,r112,r482,0 # 
452:ADDI,r480,r483,4 # 
453:STORE,r483,r482 # 
454:ADDI,r116,r482,0 # 
455:ADDI,r480,r483,12 # 
456:STORE,r483,r482 # 
457:LLSHIFT,r123,r482,16 # 
458:OR,r482,r482,r124 # 
459:ADDI,r480,r483,8 # 
460:STORE,r483,r482 ## end SET_LYR_REG 
461:SUBI,r66,r66,0 # 
462:BRAZ,5 # 
463:ADDI,r104,r104,128 # 
464:SUBI,r66,r66,1 # 
465:BRALEZ,2 # 
466:BRAUNCOND,-3 # 
467:MOV,r122,192 # 
468:MOV,r74,0 # 
469:MOV,r70,1 # 
470:MOV,r71,1 # 
471:MOV,r117,2 # 
472:MOV,r98,3584 # 
473:MOV,r90,1 # 
474:MOV,r480,4128 # 
475:OR,r480,r480,r492 # 
476:LOAD,r480,r481 # #read  split_grp_reg
477:OR,r481,r481,r74 # 
478:STORE,r480,r481 # #write to split_grp_reg
479:ADDI,r104,r480,0 # 
480:ADDI,r71,r485,0 # 
481:ADDI,r480,r481,0 # 
482:MOV,r482,1 # 
483:LLSHIFT,r482,r482,16 # 
484:ADDI,r122,r483,0 # 
485:OR,r482,r482,r483 # 
486:STORE,r481,r482 ##write to bt_size_reg 
487:ADDI,r480,r481,20 # 
488:ADDI,r70,r482,0 # 
489:STORE,r481,r482 # #write to mb_config_reg
490:ADDI,r480,r481,28 # 
491:LLSHIFT,r90,r482,31 # 
492:OR,r482,r482,r98 # 
493:STORE,r481,r482 # #write to row_step_reg
494:ADDI,r480,r480,128 # 
495:SUBI,r485,r485,1 # 
496:BRALEZ,2 # 
497:BRAUNCOND,-16 # #End SET_NXBARS_REG
498:MOV,r90,1 # 
499:MOV,r77,64 # 
500:MOV,r76,1 # 
501:MOV,r87,2 # 
502:MOV,r88,1200 # 
503:MOV,r108,2 # 
504:MOV,r121,1284 # 
505:MOV,r91,0 # 
506:MOV,r66,0 # 
507:MOV,r94,1 # 
508:MOV,r89,1 # 
509:MOV,r67,0 # 
510:ADDI,r64,r68,0 # 
511:ADDI,r68,r68,3 # 
512:ADDI,r68,r69,0 # 
513:SUBI,r69,r69,56 # 
514:BRALEZ,2 # 
515:MOV,r68,56 # 
516:ADDI,r68,r70,0 # 
517:SUB,r70,r70,r66 # 
518:OR,r88,r482,r492 #  # Start START_TFR_REG_XBARS 
519:ADDI,r482,r480,80 # 
520:STORE,r480,r70 # # End START_TFR_REG_XBARS
521:MOV,r96,-64 # 
522:ADDI,r104,r105,0 # 
523:MOV,r93,64 # 
524:MOV,r116,3 # 
525:MOV,r99,0 # 
526:MOV,r100,3584 # 
527:MOV,r85,64 # 
528:MOV,r73,0 # 
529:ADDI,r73,r78,0 # 
530:MOV,r95,0 # 
531:SUBI,r89,r89,0 # 
532:BRAZ,69 # 
533:SUBI,r78,r78,1 # 
534:BRAGEZ,2 # 
535:BRAUNCOND,25 # 
536:SUBI,r78,r78,1 # 
537:BRAGEZ,2 # 
538:BRAUNCOND,28 # 
539:SUBI,r78,r78,1 # 
540:BRAGEZ,2 # 
541:BRAUNCOND,31 # 
542:SUBI,r78,r78,1 # 
543:BRAGEZ,2 # 
544:BRAUNCOND,34 # 
545:SUBI,r78,r78,1 # 
546:BRAGEZ,2 # 
547:BRAUNCOND,37 # 
548:SUBI,r78,r78,1 # 
549:BRAGEZ,2 # 
550:BRAUNCOND,40 # 
551:SUBI,r78,r78,1 # 
552:BRAGEZ,2 # 
553:BRAUNCOND,43 # 
554:MOV,r93,0 # 
555:MOV,r116,0 # 
556:MOV,r99,0 # 
557:MOV,r100,0 # 
558:MOV,r85,0 # 
559:BRAUNCOND,42 # 
560:MOV,r93,64 # 
561:MOV,r116,3 # 
562:MOV,r99,0 # 
563:MOV,r100,3584 # 
564:MOV,r85,64 # 
565:BRAUNCOND,36 # 
566:MOV,r93,0 # 
567:MOV,r116,0 # 
568:MOV,r99,0 # 
569:MOV,r100,0 # 
570:MOV,r85,0 # 
571:BRAUNCOND,30 # 
572:MOV,r93,0 # 
573:MOV,r116,0 # 
574:MOV,r99,0 # 
575:MOV,r100,0 # 
576:MOV,r85,0 # 
577:BRAUNCOND,24 # 
578:MOV,r93,0 # 
579:MOV,r116,0 # 
580:MOV,r99,0 # 
581:MOV,r100,0 # 
582:MOV,r85,0 # 
583:BRAUNCOND,18 # 
584:MOV,r93,64 # 
585:MOV,r116,0 # 
586:MOV,r99,3584 # 
587:MOV,r100,275615856 # 
588:MOV,r85,3 # 
589:BRAUNCOND,12 # 
590:MOV,r93,0 # 
591:MOV,r116,0 # 
592:MOV,r99,0 # 
593:MOV,r100,32766 # 
594:MOV,r85,0 # 
595:BRAUNCOND,6 # 
596:MOV,r93,0 # 
597:MOV,r116,0 # 
598:MOV,r99,0 # 
599:MOV,r100,10 # 
600:MOV,r85,0 # 
601:MOV,r80,0 # 
602:ADDI,r65,r83,0 # 
603:ADD,r83,r83,r99 # 
604:MOV,r107,0 # 
605:MOV,r84,0 # 
606:MOV,r97,0 # 
607:ADDI,r64,r86,0 # 
608:ADD,r86,r86,r97 # 
609:BRAGEZ,2 # 
610:BRAUNCOND,3 # 
611:SUBI,r86,r86,55 # 
612:BRALEZ,4 # 
613:MOV,r118,1 # 
614:MOV,r89,1 # 
615:BRAUNCOND,5 # 
616:SUBI,r94,r94,0 # 
617:BRAZ,27 # 
618:MOV,r118,0 # 
619:ADDI,r95,r95,1 # 
620:ADDI,r80,r119,0 # 
621:ADDI,r119,r119,31 # 
622:LRSHIFT,r119,r119,5 # 
623:ADDI,r105,r480,0 # # Start MOV_TO_XBARS_BLK 
624:ADDI,r480,r481,32 # 
625:ADD,r481,r481,r107 # 
626:LLSHIFT,r118,r484,1 # 
627:ORI,r484,r484,1 # 
628:LLSHIFT,r116,r482,2 # 
629:OR,r484,r485,r482 # 
630:LLSHIFT,r85,r483,4 # 
631:OR,r485,r485,r483 # 
632:LLSHIFT,r100,r484,16 # 
633:OR,r485,r474,r484 # 
634:STORE,r481,r474 ##write to cmd_wd0_reg 
635:ADDI,r83,r485,0 # 
636:BRAGEZ,2 # 
637:MOV,r485,0 # 
638:AND,r112,r484,r113 # 
639:ADD,r485,r485,r484 # 
640:LLSHIFT,r119,r482,25 # 
641:OR,r485,r485,r482 # 
642:ADDI,r481,r481,4 # 
643:STORE,r481,r485 ## write to cmd_wd1_reg - End MOV_TO_XBARS_BLK 
644:ADDI,r107,r107,8 # 
645:MOV,r486,3584 # 
646:ADD,r83,r83,r486 # 
647:ADDI,r80,r80,192 # 
648:ADDI,r97,r97,1 # 
649:ADDI,r84,r84,1 # 
650:MOV,r68,3 # 
651:SUB,r68,r68,r84 # 
652:BRALEZ,2 # 
653:BRAUNCOND,-46 # 
654:ADDI,r105,r105,128 # 
655:ADD,r96,r96,r77 # 
656:ADDI,r73,r73,1 # 
657:ADDI,r71,r68,0 # 
658:SUB,r68,r68,r73 # 
659:BRALEZ,2 # 
660:BRAUNCOND,-131 # 
661:LOAD,r479,r482 ## Start MULTI_END_BLOCK - Read input_cmd_list_en_reg
662:NOT,r117,r483 # 
663:AND,r483,r483,r482 # 
664:STORE,r479,r483 ## Write to input_cmd_list_en_reg 
665:OR,r117,r481,r482 # 
666:STORE,r479,r481 ## Write to input_cmd_list_en_reg - End MULTI_END_BLOCK 
667:NOP # # Start MULTI_END_SYNC
668:NOP # 
669:NOP # 
670:NOP # 
671:HALT # 
672:NOP # 
673:LOAD,r478,r483 # # read input_dma_busy_reg 
674:AND,r483,r483,r117 # 
675:BRAZ,4 # 
676:MOV,r461,629 # 
677:MOV,r449,2 # 
678:BRAUNCOND,-621 ##  End MULTI_END_SYNC 
679:SUBI,r94,r94,0 # 
680:BRAZ,10 # 
681:SUBI,r64,r64,0 # 
682:BRAGEZ,2 # 
683:BRAUNCOND,7 # 
684:MOV,r86,3 # 
685:SUB,r86,r86,r95 # 
686:BRALEZ,2 # 
687:BRAUNCOND,3 # 
688:MOV,r89,0 # 
689:MOV,r94,0 # 
690:SUB,r68,r68,r69 # 
691:ADDI,r64,r64,1 # 
692:BRALEZ,26 # 
693:ADDI,r64,r91,0 # 
694:ADDI,r64,r68,0 # 
695:SUBI,r68,r68,1 # 
696:BRALEZ,2 # 
697:MOV,r91,1 # 
698:ADDI,r88,r480,88 ## Start CHECK_FIFO_REG 
699:OR,r480,r480,r492 # 
700:LOAD,r480,r481 ##read in_buf_cntr_reg 
701:SUB,r481,r481,r91 # 
702:BRAGEZ,2 # 
703:BRAUNCOND,-3 # # End CHECK_FIFO_REG 
704:ADDI,r91,r68,0 # 
705:MOV,r84,1 # 
706:OR,r121,r480,r492 ## Start  POP_REG 
707:MOV,r481,1 # 
708:STORE,r480,r481 ## write to asq_send_reg 
709:MOV,r481,1028 # 
710:OR,r481,r481,r492 # 
711:STORE,r481,r87 ## write to in_buf_decr_reg- End POP_REG 
712:MOV,r481,1032 ## Start SEND_SYNC_PREV 
713:OR,r481,r481,r492 # 
714:STORE,r481,r87 # # End SEND_SYNC_PREV
715:SUBI,r68,r68,1 # 
716:BRALEZ,2 # 
717:BRAUNCOND,-11 # 
718:ADD,r66,r66,r91 # 
719:MOV,r486,3584 # 
720:ADD,r65,r65,r486 # 
721:ADDI,r67,r67,1 # 
722:MOV,r68,56 # 
723:SUB,r68,r68,r67 # 
724:BRALEZ,2 # 
725:BRAUNCOND,-215 # 
726:MOV,r66,1 # 
727:MOV,r73,4096 # 
728:MOV,r480,3 # 
729:LLSHIFT,r480,r480,16 # 
730:OR,r73,r73,r480 # 
731:ADD,r72,r72,r73 # 
732:MOV,r94,1304 # 
733:MOV,r95,1288 # 
734:NOP #  # Start SET_UP_NEXT 
735:SUBI,r66,r486,0 # 
736:BRAZ,16 # 
737:OR,r95,r480,r492 # 
738:LOAD,r480,r481 ##read input_buf_cnt_reg 
739:SUB,r481,r481,r66 # 
740:BRAGEZ,4 # 
741:MOV,r461,699 # 
742:MOV,r449,2 # 
743:BRAUNCOND,-686 # 
744:MOV,r481,1032 # 
745:OR,r481,r481,r492 # 
746:MOV,r483,1028 # 
747:OR,r483,r483,r492 # 
748:STORE,r481,r87 ## write to asq_send_reg 
749:STORE,r483,r87 ## write to ib_decr_reg 
750:SUBI,r66,r66,1 # 
751:BRANZ,-3 # 
752:MOV,r461,377 # 
753:MOV,r449,1 # 
754:BRAUNCOND,-697 # #Branch to the same layer, instruction start location
755:NOP # 
756:NOP # 
757:NOP # 
758:NOP # 
759:NOP # 
760:HALT # 
761:NOP ##End SET_UP_NEXT 
762:MOV,r136,0 # 
763:MOV,r480,0 # 
764:LLSHIFT,r480,r480,16 # 
765:OR,r136,r136,r480 # 
766:ADDI,r136,r129,0 # 
767:MOV,r486,3584 # 
768:SUB,r129,r129,r486 # 
769:MOV,r176,0 # 
770:MOV,r480,145 # 
771:LLSHIFT,r480,r480,16 # 
772:OR,r176,r176,r480 # 
773:MOV,r128,-1 # 
774:MOV,r165,2 # 
775:MOV,r477,4104 # 
776:MOV,r480,128 # 
777:LLSHIFT,r480,r480,16 # 
778:OR,r477,r477,r480 # 
779:MOV,r168,5120 # 
780:MOV,r480,128 # 
781:LLSHIFT,r480,r480,16 # 
782:OR,r168,r168,r480 # 
783:MOV,r177,32767 # 
784:MOV,r178,0 # 
785:MOV,r130,2 # 
786:MOV,r184,4896 # 
787:MOV,r480,128 # 
788:LLSHIFT,r480,r480,16 # 
789:OR,r184,r184,r480 # 
790:MOV,r187,0 # 
791:MOV,r188,128 # 
792:MOV,r186,1 # 
793:MOV,r180,0 # 
794:MOV,r480,0 # 
795:LLSHIFT,r480,r480,16 # 
796:OR,r180,r180,r480 # 
797:ADDI,r184,r480,0 ## Start SET_LYR_REG 
798:ADDI,r177,r482,0 # 
799:ADDI,r480,r483,0 # 
800:LLSHIFT,r482,r482,0 # 
801:STORE,r483,r482 # 
802:LLSHIFT,r176,r482,0 # 
803:ADDI,r480,r483,4 # 
804:STORE,r483,r482 # 
805:ADDI,r180,r482,0 # 
806:ADDI,r480,r483,12 # 
807:STORE,r483,r482 # 
808:LLSHIFT,r187,r482,16 # 
809:OR,r482,r482,r188 # 
810:ADDI,r480,r483,8 # 
811:STORE,r483,r482 ## end SET_LYR_REG 
812:SUBI,r130,r130,0 # 
813:BRAZ,5 # 
814:ADDI,r168,r168,128 # 
815:SUBI,r130,r130,1 # 
816:BRALEZ,2 # 
817:BRAUNCOND,-3 # 
818:MOV,r186,192 # 
819:MOV,r138,0 # 
820:MOV,r134,2 # 
821:MOV,r135,1 # 
822:MOV,r181,4 # 
823:MOV,r162,7168 # 
824:MOV,r154,1 # 
825:MOV,r480,4128 # 
826:OR,r480,r480,r492 # 
827:LOAD,r480,r481 # #read  split_grp_reg
828:OR,r481,r481,r138 # 
829:STORE,r480,r481 # #write to split_grp_reg
830:ADDI,r168,r480,0 # 
831:ADDI,r135,r485,0 # 
832:ADDI,r480,r481,0 # 
833:MOV,r482,1 # 
834:LLSHIFT,r482,r482,16 # 
835:ADDI,r186,r483,0 # 
836:OR,r482,r482,r483 # 
837:STORE,r481,r482 ##write to bt_size_reg 
838:ADDI,r480,r481,20 # 
839:ADDI,r134,r482,0 # 
840:STORE,r481,r482 # #write to mb_config_reg
841:ADDI,r480,r481,28 # 
842:LLSHIFT,r154,r482,31 # 
843:OR,r482,r482,r162 # 
844:STORE,r481,r482 # #write to row_step_reg
845:ADDI,r480,r480,128 # 
846:SUBI,r485,r485,1 # 
847:BRALEZ,2 # 
848:BRAUNCOND,-16 # #End SET_NXBARS_REG
849:MOV,r154,2 # 
850:MOV,r141,128 # 
851:MOV,r140,1 # 
852:MOV,r151,4 # 
853:MOV,r152,1312 # 
854:MOV,r172,2 # 
855:MOV,r185,1396 # 
856:MOV,r155,0 # 
857:MOV,r130,0 # 
858:MOV,r158,1 # 
859:MOV,r153,1 # 
860:MOV,r131,0 # 
861:ADDI,r128,r132,0 # 
862:ADDI,r132,r132,3 # 
863:ADDI,r132,r133,0 # 
864:SUBI,r133,r133,56 # 
865:BRALEZ,2 # 
866:MOV,r132,56 # 
867:ADDI,r132,r134,0 # 
868:SUB,r134,r134,r130 # 
869:OR,r152,r482,r492 #  # Start START_TFR_REG_XBARS 
870:ADDI,r482,r480,80 # 
871:STORE,r480,r134 # # End START_TFR_REG_XBARS
872:MOV,r160,-64 # 
873:ADDI,r168,r169,0 # 
874:MOV,r157,0 # 
875:MOV,r180,1 # 
876:MOV,r163,0 # 
877:MOV,r164,3584 # 
878:MOV,r149,64 # 
879:MOV,r137,0 # 
880:ADDI,r137,r142,0 # 
881:MOV,r159,0 # 
882:SUBI,r153,r153,0 # 
883:BRAZ,69 # 
884:SUBI,r142,r142,1 # 
885:BRAGEZ,2 # 
886:BRAUNCOND,25 # 
887:SUBI,r142,r142,1 # 
888:BRAGEZ,2 # 
889:BRAUNCOND,28 # 
890:SUBI,r142,r142,1 # 
891:BRAGEZ,2 # 
892:BRAUNCOND,31 # 
893:SUBI,r142,r142,1 # 
894:BRAGEZ,2 # 
895:BRAUNCOND,34 # 
896:SUBI,r142,r142,1 # 
897:BRAGEZ,2 # 
898:BRAUNCOND,37 # 
899:SUBI,r142,r142,1 # 
900:BRAGEZ,2 # 
901:BRAUNCOND,40 # 
902:SUBI,r142,r142,1 # 
903:BRAGEZ,2 # 
904:BRAUNCOND,43 # 
905:MOV,r157,0 # 
906:MOV,r180,0 # 
907:MOV,r163,0 # 
908:MOV,r164,0 # 
909:MOV,r149,0 # 
910:BRAUNCOND,42 # 
911:MOV,r157,0 # 
912:MOV,r180,1 # 
913:MOV,r163,0 # 
914:MOV,r164,3584 # 
915:MOV,r149,64 # 
916:BRAUNCOND,36 # 
917:MOV,r157,0 # 
918:MOV,r180,0 # 
919:MOV,r163,0 # 
920:MOV,r164,0 # 
921:MOV,r149,0 # 
922:BRAUNCOND,30 # 
923:MOV,r157,0 # 
924:MOV,r180,0 # 
925:MOV,r163,0 # 
926:MOV,r164,0 # 
927:MOV,r149,0 # 
928:BRAUNCOND,24 # 
929:MOV,r157,0 # 
930:MOV,r180,0 # 
931:MOV,r163,0 # 
932:MOV,r164,0 # 
933:MOV,r149,0 # 
934:BRAUNCOND,18 # 
935:MOV,r157,64 # 
936:MOV,r180,0 # 
937:MOV,r163,3584 # 
938:MOV,r164,275615856 # 
939:MOV,r149,1 # 
940:BRAUNCOND,12 # 
941:MOV,r157,0 # 
942:MOV,r180,0 # 
943:MOV,r163,0 # 
944:MOV,r164,32766 # 
945:MOV,r149,0 # 
946:BRAUNCOND,6 # 
947:MOV,r157,0 # 
948:MOV,r180,0 # 
949:MOV,r163,0 # 
950:MOV,r164,10 # 
951:MOV,r149,0 # 
952:MOV,r144,0 # 
953:ADDI,r129,r147,0 # 
954:ADD,r147,r147,r163 # 
955:MOV,r171,0 # 
956:MOV,r148,0 # 
957:MOV,r161,0 # 
958:ADDI,r128,r150,0 # 
959:ADD,r150,r150,r161 # 
960:BRAGEZ,2 # 
961:BRAUNCOND,3 # 
962:SUBI,r150,r150,55 # 
963:BRALEZ,4 # 
964:MOV,r182,1 # 
965:MOV,r153,1 # 
966:BRAUNCOND,5 # 
967:SUBI,r158,r158,0 # 
968:BRAZ,27 # 
969:MOV,r182,0 # 
970:ADDI,r159,r159,1 # 
971:ADDI,r144,r183,0 # 
972:ADDI,r183,r183,31 # 
973:LRSHIFT,r183,r183,5 # 
974:ADDI,r169,r480,0 # # Start MOV_TO_XBARS_BLK 
975:ADDI,r480,r481,32 # 
976:ADD,r481,r481,r171 # 
977:LLSHIFT,r182,r484,1 # 
978:ORI,r484,r484,1 # 
979:LLSHIFT,r180,r482,2 # 
980:OR,r484,r485,r482 # 
981:LLSHIFT,r149,r483,4 # 
982:OR,r485,r485,r483 # 
983:LLSHIFT,r164,r484,16 # 
984:OR,r485,r474,r484 # 
985:STORE,r481,r474 ##write to cmd_wd0_reg 
986:ADDI,r147,r485,0 # 
987:BRAGEZ,2 # 
988:MOV,r485,0 # 
989:AND,r176,r484,r177 # 
990:ADD,r485,r485,r484 # 
991:LLSHIFT,r183,r482,25 # 
992:OR,r485,r485,r482 # 
993:ADDI,r481,r481,4 # 
994:STORE,r481,r485 ## write to cmd_wd1_reg - End MOV_TO_XBARS_BLK 
995:ADDI,r171,r171,8 # 
996:MOV,r486,3584 # 
997:ADD,r147,r147,r486 # 
998:ADDI,r144,r144,192 # 
999:ADDI,r161,r161,1 # 
1000:ADDI,r148,r148,1 # 
1001:MOV,r132,3 # 
1002:SUB,r132,r132,r148 # 
1003:BRALEZ,2 # 
1004:BRAUNCOND,-46 # 
1005:ADDI,r169,r169,128 # 
1006:ADD,r160,r160,r141 # 
1007:ADDI,r137,r137,1 # 
1008:ADDI,r135,r132,0 # 
1009:SUB,r132,r132,r137 # 
1010:BRALEZ,2 # 
1011:BRAUNCOND,-131 # 
1012:LOAD,r479,r482 ## Start MULTI_END_BLOCK - Read input_cmd_list_en_reg
1013:NOT,r181,r483 # 
1014:AND,r483,r483,r482 # 
1015:STORE,r479,r483 ## Write to input_cmd_list_en_reg 
1016:OR,r181,r481,r482 # 
1017:STORE,r479,r481 ## Write to input_cmd_list_en_reg - End MULTI_END_BLOCK 
1018:NOP # # Start MULTI_END_SYNC
1019:NOP # 
1020:NOP # 
1021:NOP # 
1022:HALT # 
1023:NOP # 
1024:LOAD,r478,r483 # # read input_dma_busy_reg 
1025:AND,r483,r483,r181 # 
1026:BRAZ,4 # 
1027:MOV,r462,977 # 
1028:MOV,r449,3 # 
1029:BRAUNCOND,-972 ##  End MULTI_END_SYNC 
1030:SUBI,r158,r158,0 # 
1031:BRAZ,10 # 
1032:SUBI,r128,r128,0 # 
1033:BRAGEZ,2 # 
1034:BRAUNCOND,7 # 
1035:MOV,r150,3 # 
1036:SUB,r150,r150,r159 # 
1037:BRALEZ,2 # 
1038:BRAUNCOND,3 # 
1039:MOV,r153,0 # 
1040:MOV,r158,0 # 
1041:SUB,r132,r132,r133 # 
1042:ADDI,r128,r128,2 # 
1043:BRALEZ,26 # 
1044:ADDI,r128,r155,0 # 
1045:ADDI,r128,r132,0 # 
1046:SUBI,r132,r132,2 # 
1047:BRALEZ,2 # 
1048:MOV,r155,2 # 
1049:ADDI,r152,r480,88 ## Start CHECK_FIFO_REG 
1050:OR,r480,r480,r492 # 
1051:LOAD,r480,r481 ##read in_buf_cntr_reg 
1052:SUB,r481,r481,r155 # 
1053:BRAGEZ,2 # 
1054:BRAUNCOND,-3 # # End CHECK_FIFO_REG 
1055:ADDI,r155,r132,0 # 
1056:MOV,r148,1 # 
1057:OR,r185,r480,r492 ## Start  POP_REG 
1058:MOV,r481,1 # 
1059:STORE,r480,r481 ## write to asq_send_reg 
1060:MOV,r481,1028 # 
1061:OR,r481,r481,r492 # 
1062:STORE,r481,r151 ## write to in_buf_decr_reg- End POP_REG 
1063:MOV,r481,1032 ## Start SEND_SYNC_PREV 
1064:OR,r481,r481,r492 # 
1065:STORE,r481,r151 # # End SEND_SYNC_PREV
1066:SUBI,r132,r132,1 # 
1067:BRALEZ,2 # 
1068:BRAUNCOND,-11 # 
1069:ADD,r130,r130,r155 # 
1070:MOV,r486,7168 # 
1071:ADD,r129,r129,r486 # 
1072:ADDI,r131,r131,1 # 
1073:MOV,r132,28 # 
1074:SUB,r132,r132,r131 # 
1075:BRALEZ,2 # 
1076:BRAUNCOND,-215 # 
1077:MOV,r130,1 # 
1078:MOV,r137,4096 # 
1079:MOV,r480,3 # 
1080:LLSHIFT,r480,r480,16 # 
1081:OR,r137,r137,r480 # 
1082:ADD,r136,r136,r137 # 
1083:MOV,r158,1416 # 
1084:MOV,r159,1400 # 
1085:NOP #  # Start SET_UP_NEXT 
1086:SUBI,r130,r486,0 # 
1087:BRAZ,16 # 
1088:OR,r159,r480,r492 # 
1089:LOAD,r480,r481 ##read input_buf_cnt_reg 
1090:SUB,r481,r481,r130 # 
1091:BRAGEZ,4 # 
1092:MOV,r462,1047 # 
1093:MOV,r449,3 # 
1094:BRAUNCOND,-1037 # 
1095:MOV,r481,1032 # 
1096:OR,r481,r481,r492 # 
1097:MOV,r483,1028 # 
1098:OR,r483,r483,r492 # 
1099:STORE,r481,r151 ## write to asq_send_reg 
1100:STORE,r483,r151 ## write to ib_decr_reg 
1101:SUBI,r130,r130,1 # 
1102:BRANZ,-3 # 
1103:MOV,r462,725 # 
1104:MOV,r449,2 # 
1105:BRAUNCOND,-1048 # #Branch to the same layer, instruction start location
1106:NOP # 
1107:NOP # 
1108:NOP # 
1109:NOP # 
1110:NOP # 
1111:HALT # 
1112:NOP ##End SET_UP_NEXT 
1113:MOV,r200,0 # 
1114:MOV,r480,0 # 
1115:LLSHIFT,r480,r480,16 # 
1116:OR,r200,r200,r480 # 
1117:ADDI,r200,r193,0 # 
1118:MOV,r486,3584 # 
1119:SUB,r193,r193,r486 # 
1120:MOV,r240,32768 # 
1121:MOV,r480,145 # 
1122:LLSHIFT,r480,r480,16 # 
1123:OR,r240,r240,r480 # 
1124:MOV,r192,-1 # 
1125:MOV,r229,3 # 
1126:MOV,r477,4104 # 
1127:MOV,r480,128 # 
1128:LLSHIFT,r480,r480,16 # 
1129:OR,r477,r477,r480 # 
1130:MOV,r232,5120 # 
1131:MOV,r480,128 # 
1132:LLSHIFT,r480,r480,16 # 
1133:OR,r232,r232,r480 # 
1134:MOV,r241,32767 # 
1135:MOV,r242,0 # 
1136:MOV,r194,3 # 
1137:MOV,r248,4912 # 
1138:MOV,r480,128 # 
1139:LLSHIFT,r480,r480,16 # 
1140:OR,r248,r248,r480 # 
1141:MOV,r251,0 # 
1142:MOV,r252,384 # 
1143:MOV,r250,1 # 
1144:MOV,r244,0 # 
1145:MOV,r480,0 # 
1146:LLSHIFT,r480,r480,16 # 
1147:OR,r244,r244,r480 # 
1148:ADDI,r248,r480,0 ## Start SET_LYR_REG 
1149:ADDI,r241,r482,0 # 
1150:ADDI,r480,r483,0 # 
1151:LLSHIFT,r482,r482,0 # 
1152:STORE,r483,r482 # 
1153:LLSHIFT,r240,r482,0 # 
1154:ADDI,r480,r483,4 # 
1155:STORE,r483,r482 # 
1156:ADDI,r244,r482,0 # 
1157:ADDI,r480,r483,12 # 
1158:STORE,r483,r482 # 
1159:LLSHIFT,r251,r482,16 # 
1160:OR,r482,r482,r252 # 
1161:ADDI,r480,r483,8 # 
1162:STORE,r483,r482 ## end SET_LYR_REG 
1163:SUBI,r194,r194,0 # 
1164:BRAZ,5 # 
1165:ADDI,r232,r232,128 # 
1166:SUBI,r194,r194,1 # 
1167:BRALEZ,2 # 
1168:BRAUNCOND,-3 # 
1169:MOV,r250,640 # 
1170:MOV,r202,0 # 
1171:MOV,r198,3 # 
1172:MOV,r199,1 # 
1173:MOV,r245,8 # 
1174:MOV,r226,3584 # 
1175:MOV,r218,1 # 
1176:MOV,r480,4128 # 
1177:OR,r480,r480,r492 # 
1178:LOAD,r480,r481 # #read  split_grp_reg
1179:OR,r481,r481,r202 # 
1180:STORE,r480,r481 # #write to split_grp_reg
1181:ADDI,r232,r480,0 # 
1182:ADDI,r199,r485,0 # 
1183:ADDI,r480,r481,0 # 
1184:MOV,r482,1 # 
1185:LLSHIFT,r482,r482,16 # 
1186:ADDI,r250,r483,0 # 
1187:OR,r482,r482,r483 # 
1188:STORE,r481,r482 ##write to bt_size_reg 
1189:ADDI,r480,r481,20 # 
1190:ADDI,r198,r482,0 # 
1191:STORE,r481,r482 # #write to mb_config_reg
1192:ADDI,r480,r481,28 # 
1193:LLSHIFT,r218,r482,31 # 
1194:OR,r482,r482,r226 # 
1195:STORE,r481,r482 # #write to row_step_reg
1196:ADDI,r480,r480,128 # 
1197:SUBI,r485,r485,1 # 
1198:BRALEZ,2 # 
1199:BRAUNCOND,-16 # #End SET_NXBARS_REG
1200:MOV,r218,3 # 
1201:MOV,r205,384 # 
1202:MOV,r204,1 # 
1203:MOV,r215,8 # 
1204:MOV,r216,1424 # 
1205:MOV,r236,1 # 
1206:MOV,r249,1508 # 
1207:MOV,r219,0 # 
1208:MOV,r194,0 # 
1209:MOV,r222,1 # 
1210:MOV,r217,1 # 
1211:MOV,r195,0 # 
1212:ADDI,r192,r196,0 # 
1213:ADDI,r196,r196,3 # 
1214:ADDI,r196,r197,0 # 
1215:SUBI,r197,r197,28 # 
1216:BRALEZ,2 # 
1217:MOV,r196,28 # 
1218:ADDI,r196,r198,0 # 
1219:SUB,r198,r198,r194 # 
1220:OR,r216,r482,r492 #  # Start START_TFR_REG_XBARS 
1221:ADDI,r482,r480,80 # 
1222:STORE,r480,r198 # # End START_TFR_REG_XBARS
1223:MOV,r224,-128 # 
1224:ADDI,r232,r233,0 # 
1225:MOV,r221,128 # 
1226:MOV,r244,3 # 
1227:MOV,r227,0 # 
1228:MOV,r228,3584 # 
1229:MOV,r213,128 # 
1230:MOV,r201,0 # 
1231:ADDI,r201,r206,0 # 
1232:MOV,r223,0 # 
1233:SUBI,r217,r217,0 # 
1234:BRAZ,69 # 
1235:SUBI,r206,r206,1 # 
1236:BRAGEZ,2 # 
1237:BRAUNCOND,25 # 
1238:SUBI,r206,r206,1 # 
1239:BRAGEZ,2 # 
1240:BRAUNCOND,28 # 
1241:SUBI,r206,r206,1 # 
1242:BRAGEZ,2 # 
1243:BRAUNCOND,31 # 
1244:SUBI,r206,r206,1 # 
1245:BRAGEZ,2 # 
1246:BRAUNCOND,34 # 
1247:SUBI,r206,r206,1 # 
1248:BRAGEZ,2 # 
1249:BRAUNCOND,37 # 
1250:SUBI,r206,r206,1 # 
1251:BRAGEZ,2 # 
1252:BRAUNCOND,40 # 
1253:SUBI,r206,r206,1 # 
1254:BRAGEZ,2 # 
1255:BRAUNCOND,43 # 
1256:MOV,r221,0 # 
1257:MOV,r244,0 # 
1258:MOV,r227,0 # 
1259:MOV,r228,0 # 
1260:MOV,r213,0 # 
1261:BRAUNCOND,42 # 
1262:MOV,r221,128 # 
1263:MOV,r244,3 # 
1264:MOV,r227,0 # 
1265:MOV,r228,3584 # 
1266:MOV,r213,128 # 
1267:BRAUNCOND,36 # 
1268:MOV,r221,0 # 
1269:MOV,r244,0 # 
1270:MOV,r227,0 # 
1271:MOV,r228,0 # 
1272:MOV,r213,0 # 
1273:BRAUNCOND,30 # 
1274:MOV,r221,0 # 
1275:MOV,r244,0 # 
1276:MOV,r227,0 # 
1277:MOV,r228,0 # 
1278:MOV,r213,0 # 
1279:BRAUNCOND,24 # 
1280:MOV,r221,0 # 
1281:MOV,r244,0 # 
1282:MOV,r227,0 # 
1283:MOV,r228,0 # 
1284:MOV,r213,0 # 
1285:BRAUNCOND,18 # 
1286:MOV,r221,128 # 
1287:MOV,r244,0 # 
1288:MOV,r227,3584 # 
1289:MOV,r228,275615856 # 
1290:MOV,r213,3 # 
1291:BRAUNCOND,12 # 
1292:MOV,r221,0 # 
1293:MOV,r244,0 # 
1294:MOV,r227,0 # 
1295:MOV,r228,32766 # 
1296:MOV,r213,0 # 
1297:BRAUNCOND,6 # 
1298:MOV,r221,0 # 
1299:MOV,r244,0 # 
1300:MOV,r227,0 # 
1301:MOV,r228,10 # 
1302:MOV,r213,0 # 
1303:MOV,r208,0 # 
1304:ADDI,r193,r211,0 # 
1305:ADD,r211,r211,r227 # 
1306:MOV,r235,0 # 
1307:MOV,r212,0 # 
1308:MOV,r225,0 # 
1309:ADDI,r192,r214,0 # 
1310:ADD,r214,r214,r225 # 
1311:BRAGEZ,2 # 
1312:BRAUNCOND,3 # 
1313:SUBI,r214,r214,27 # 
1314:BRALEZ,4 # 
1315:MOV,r246,1 # 
1316:MOV,r217,1 # 
1317:BRAUNCOND,5 # 
1318:SUBI,r222,r222,0 # 
1319:BRAZ,27 # 
1320:MOV,r246,0 # 
1321:ADDI,r223,r223,1 # 
1322:ADDI,r208,r247,0 # 
1323:ADDI,r247,r247,31 # 
1324:LRSHIFT,r247,r247,5 # 
1325:ADDI,r233,r480,0 # # Start MOV_TO_XBARS_BLK 
1326:ADDI,r480,r481,32 # 
1327:ADD,r481,r481,r235 # 
1328:LLSHIFT,r246,r484,1 # 
1329:ORI,r484,r484,1 # 
1330:LLSHIFT,r244,r482,2 # 
1331:OR,r484,r485,r482 # 
1332:LLSHIFT,r213,r483,4 # 
1333:OR,r485,r485,r483 # 
1334:LLSHIFT,r228,r484,16 # 
1335:OR,r485,r474,r484 # 
1336:STORE,r481,r474 ##write to cmd_wd0_reg 
1337:ADDI,r211,r485,0 # 
1338:BRAGEZ,2 # 
1339:MOV,r485,0 # 
1340:AND,r240,r484,r241 # 
1341:ADD,r485,r485,r484 # 
1342:LLSHIFT,r247,r482,25 # 
1343:OR,r485,r485,r482 # 
1344:ADDI,r481,r481,4 # 
1345:STORE,r481,r485 ## write to cmd_wd1_reg - End MOV_TO_XBARS_BLK 
1346:ADDI,r235,r235,8 # 
1347:MOV,r486,3584 # 
1348:ADD,r211,r211,r486 # 
1349:ADDI,r208,r208,640 # 
1350:ADDI,r225,r225,1 # 
1351:ADDI,r212,r212,1 # 
1352:MOV,r196,3 # 
1353:SUB,r196,r196,r212 # 
1354:BRALEZ,2 # 
1355:BRAUNCOND,-46 # 
1356:ADDI,r233,r233,128 # 
1357:ADD,r224,r224,r205 # 
1358:ADDI,r201,r201,1 # 
1359:ADDI,r199,r196,0 # 
1360:SUB,r196,r196,r201 # 
1361:BRALEZ,2 # 
1362:BRAUNCOND,-131 # 
1363:LOAD,r479,r482 ## Start MULTI_END_BLOCK - Read input_cmd_list_en_reg
1364:NOT,r245,r483 # 
1365:AND,r483,r483,r482 # 
1366:STORE,r479,r483 ## Write to input_cmd_list_en_reg 
1367:OR,r245,r481,r482 # 
1368:STORE,r479,r481 ## Write to input_cmd_list_en_reg - End MULTI_END_BLOCK 
1369:NOP # # Start MULTI_END_SYNC
1370:NOP # 
1371:NOP # 
1372:NOP # 
1373:HALT # 
1374:NOP # 
1375:LOAD,r478,r483 # # read input_dma_busy_reg 
1376:AND,r483,r483,r245 # 
1377:BRAZ,4 # 
1378:MOV,r463,1325 # 
1379:MOV,r449,4 # 
1380:BRAUNCOND,-1323 ##  End MULTI_END_SYNC 
1381:SUBI,r222,r222,0 # 
1382:BRAZ,10 # 
1383:SUBI,r192,r192,0 # 
1384:BRAGEZ,2 # 
1385:BRAUNCOND,7 # 
1386:MOV,r214,3 # 
1387:SUB,r214,r214,r223 # 
1388:BRALEZ,2 # 
1389:BRAUNCOND,3 # 
1390:MOV,r217,0 # 
1391:MOV,r222,0 # 
1392:SUB,r196,r196,r197 # 
1393:ADDI,r192,r192,1 # 
1394:BRALEZ,26 # 
1395:ADDI,r192,r219,0 # 
1396:ADDI,r192,r196,0 # 
1397:SUBI,r196,r196,1 # 
1398:BRALEZ,2 # 
1399:MOV,r219,1 # 
1400:ADDI,r216,r480,88 ## Start CHECK_FIFO_REG 
1401:OR,r480,r480,r492 # 
1402:LOAD,r480,r481 ##read in_buf_cntr_reg 
1403:SUB,r481,r481,r219 # 
1404:BRAGEZ,2 # 
1405:BRAUNCOND,-3 # # End CHECK_FIFO_REG 
1406:ADDI,r219,r196,0 # 
1407:MOV,r212,1 # 
1408:OR,r249,r480,r492 ## Start  POP_REG 
1409:MOV,r481,1 # 
1410:STORE,r480,r481 ## write to asq_send_reg 
1411:MOV,r481,1028 # 
1412:OR,r481,r481,r492 # 
1413:STORE,r481,r215 ## write to in_buf_decr_reg- End POP_REG 
1414:MOV,r481,1032 ## Start SEND_SYNC_PREV 
1415:OR,r481,r481,r492 # 
1416:STORE,r481,r215 # # End SEND_SYNC_PREV
1417:SUBI,r196,r196,1 # 
1418:BRALEZ,2 # 
1419:BRAUNCOND,-11 # 
1420:ADD,r194,r194,r219 # 
1421:MOV,r486,3584 # 
1422:ADD,r193,r193,r486 # 
1423:ADDI,r195,r195,1 # 
1424:MOV,r196,28 # 
1425:SUB,r196,r196,r195 # 
1426:BRALEZ,2 # 
1427:BRAUNCOND,-215 # 
1428:MOV,r194,1 # 
1429:MOV,r201,34816 # 
1430:MOV,r480,1 # 
1431:LLSHIFT,r480,r480,16 # 
1432:OR,r201,r201,r480 # 
1433:ADD,r200,r200,r201 # 
1434:MOV,r222,1528 # 
1435:MOV,r223,1512 # 
1436:NOP #  # Start SET_UP_NEXT 
1437:SUBI,r194,r486,0 # 
1438:BRAZ,16 # 
1439:OR,r223,r480,r492 # 
1440:LOAD,r480,r481 ##read input_buf_cnt_reg 
1441:SUB,r481,r481,r194 # 
1442:BRAGEZ,4 # 
1443:MOV,r463,1395 # 
1444:MOV,r449,4 # 
1445:BRAUNCOND,-1388 # 
1446:MOV,r481,1032 # 
1447:OR,r481,r481,r492 # 
1448:MOV,r483,1028 # 
1449:OR,r483,r483,r492 # 
1450:STORE,r481,r215 ## write to asq_send_reg 
1451:STORE,r483,r215 ## write to ib_decr_reg 
1452:SUBI,r194,r194,1 # 
1453:BRANZ,-3 # 
1454:MOV,r463,1073 # 
1455:MOV,r449,3 # 
1456:BRAUNCOND,-1399 # #Branch to the same layer, instruction start location
1457:NOP # 
1458:NOP # 
1459:NOP # 
1460:NOP # 
1461:NOP # 
1462:HALT # 
1463:NOP ##End SET_UP_NEXT 