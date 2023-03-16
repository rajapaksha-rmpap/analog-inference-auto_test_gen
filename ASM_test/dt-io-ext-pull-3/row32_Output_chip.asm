# Assembler for Chip - Output Processor 
# Output uP Assembly Code 
0:NOP # 
1:MOV,r448,3 # # Init process count 
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
23:MOV,r451,272 # # store proc1 start loc
24:MOV,r461,272 # # store proc1 last loc  
25:MOV,r452,638 # # store proc2 start loc
26:MOV,r462,638 # # store proc2 last loc  
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
67:MOV,r24,0 # 
68:MOV,r44,16384 # 
69:MOV,r480,768 # 
70:LLSHIFT,r480,r480,16 # 
71:OR,r44,r44,r480 # 
72:MOV,r46,65024 # 
73:MOV,r480,799 # 
74:LLSHIFT,r480,r480,16 # 
75:OR,r46,r46,r480 # 
76:MOV,r47,65028 # 
77:MOV,r480,799 # 
78:LLSHIFT,r480,r480,16 # 
79:OR,r47,r47,r480 # 
80:LOAD,r46,r4 ##Start INIT_READ_DATA_STRUCT 
81:LOAD,r47,r43 ##End INIT_READ_DATA_STRUCT
82:MOV,r33,128 # 
83:MOV,r480,784 # 
84:LLSHIFT,r480,r480,16 # 
85:OR,r33,r33,r480 # 
86:MOV,r480,0 # # start STORE_TO_MEMORY 
87:STORE,r33,r480 # # end STORE_TO_MEMORY - write data to address
88:MOV,r1,22 # 
89:MOV,r2,22 # 
90:MOV,r41,4228 # 
91:MOV,r480,4280 # 
92:LLSHIFT,r480,r480,16 # 
93:OR,r41,r41,r480 # 
94:MOV,r58,224 # 
95:MOV,r480,0 # 
96:LLSHIFT,r480,r480,16 # 
97:OR,r58,r58,r480 # 
98:MOV,r35,4096 # 
99:MOV,r480,4280 # 
100:LLSHIFT,r480,r480,16 # 
101:OR,r35,r35,r480 # 
102:MOV,r36,4100 # 
103:MOV,r480,4280 # 
104:LLSHIFT,r480,r480,16 # 
105:OR,r36,r36,r480 # 
106:MOV,r50,4236 # 
107:MOV,r480,4280 # 
108:LLSHIFT,r480,r480,16 # 
109:OR,r50,r50,r480 # 
110:MOV,r51,4148 # 
111:MOV,r480,4280 # 
112:LLSHIFT,r480,r480,16 # 
113:OR,r51,r51,r480 # 
114:MOV,r52,4232 # 
115:MOV,r480,4280 # 
116:LLSHIFT,r480,r480,16 # 
117:OR,r52,r52,r480 # 
118:MOV,r53,4124 # 
119:MOV,r480,4280 # 
120:LLSHIFT,r480,r480,16 # 
121:OR,r53,r53,r480 # 
122:MOV,r59,4144 # 
123:MOV,r480,4280 # 
124:LLSHIFT,r480,r480,16 # 
125:OR,r59,r59,r480 # 
126:MOV,r54,4128 # 
127:MOV,r480,4280 # 
128:LLSHIFT,r480,r480,16 # 
129:OR,r54,r54,r480 # 
130:MOV,r55,4132 # 
131:MOV,r480,4280 # 
132:LLSHIFT,r480,r480,16 # 
133:OR,r55,r55,r480 # 
134:MOV,r56,4136 # 
135:MOV,r480,4280 # 
136:LLSHIFT,r480,r480,16 # 
137:OR,r56,r56,r480 # 
138:MOV,r57,4140 # 
139:MOV,r480,4280 # 
140:LLSHIFT,r480,r480,16 # 
141:OR,r57,r57,r480 # 
142:MOV,r483,1 # 
143:STORE,r35,r483 # 
144:MOV,r483,2 # 
145:STORE,r59,r483 # 
146:MOV,r483,0 # 
147:STORE,r51,r483 # 
148:MOV,r484,82 # 
149:STORE,r52,r484 ##End SET_PCI_DMA_REGS 
150:MOV,r42,1 # 
151:MOV,r60,256 # 
152:MOV,r45,1 # 
153:MOV,r480,0 # 
154:LLSHIFT,r480,r480,16 # 
155:OR,r45,r45,r480 # 
156:MOV,r5,0 # 
157:MOV,r6,1 # 
158:MOV,r7,1088 # 
159:MOV,r10,1172 # 
160:MOV,r9,0 # 
161:MOV,r11,1 # 
162:MOV,r16,1 # 
163:MOV,r12,0 # 
164:MOV,r14,16384 # 
165:MOV,r15,64768 # 
166:MOV,r480,1023 # 
167:LLSHIFT,r480,r480,16 # 
168:OR,r15,r15,r480 # 
169:ADDI,r5,r5,1 # 
170:MOV,r8,1 # 
171:ADDI,r2,r3,0 # 
172:SUB,r3,r3,r8 # 
173:BRAGEZ,3 # 
174:ADDI,r2,r8,0 # 
175:MOV,r1,0 # 
176:ADDI,r7,r482,84 ## Start START_INPUT_TFR_LAYER_CHECK 
177:OR,r482,r482,r492 # 
178:STORE,r482,r8 # # writre to ib_decr_reg
179:OR,r7,r481,r492 # 
180:ADDI,r481,r482,88 # 
181:LOAD,r482,r483 # # read ib_cntr_reg 
182:SUB,r483,r482,r8 # 
183:BRAGEZ,4 # 
184:MOV,r460,135 # 
185:MOV,r449,1 # 
186:BRAUNCOND,-123 # 
187:OR,r7,r481,r492 # 
188:ADDI,r481,r482,104 # 
189:LOAD,r482,r483 # #read ob_cntr_reg 
190:ADDI,r481,r482,96 # 
191:LOAD,r482,r484 # # read ob_full_lvl_reg 
192:SUB,r484,r482,r483 # 
193:SUB,r482,r482,r8 # 
194:BRAGEZ,4 # 
195:MOV,r460,146 # 
196:MOV,r449,1 # 
197:BRAUNCOND,-134 ## End START_INPUT_TFR_LAYER_CHECK 
198:MOV,r17,0 # 
199:ADDI,r44,r18,0 # 
200:MOV,r486,16383 # 
201:AND,r18,r18,r486 # 
202:ADDI,r18,r19,0 # 
203:ADD,r19,r19,r1 # 
204:SUB,r19,r19,r14 # 
205:BRALEZ,2 # 
206:BRAUNCOND,19 # 
207:MOV,r481,1 # #Start START_EXTERNAL_IO 
208:STORE,r50,r481 # 
209:LOAD,r50,r481 # 
210:STORE,r53,r1 # 
211:STORE,r54,r4 # 
212:STORE,r55,r43 # 
213:STORE,r56,r44 # 
214:STORE,r57,r45 # 
215:MOV,r481,1 # 
216:STORE,r36,r481 ##End START_EXTERNAL_IO 
217:OR,r58,r58,r492 # #Start EXTERNAL_IO_DONE 
218:LOAD,r58,r481 # 
219:AND,r481,r481,r60 # 
220:BRANZ,4 # 
221:MOV,r460,176 # 
222:MOV,r449,1 # 
223:BRAUNCOND,-160 # End EXTERNAL_IO_DONE 
224:BRAUNCOND,42 # 
225:MOV,r20,16384 # 
226:SUB,r20,r20,r18 # 
227:MOV,r481,1 # #Start START_EXTERNAL_IO 
228:STORE,r50,r481 # 
229:LOAD,r50,r481 # 
230:STORE,r53,r20 # 
231:STORE,r54,r4 # 
232:STORE,r55,r43 # 
233:STORE,r56,r44 # 
234:STORE,r57,r45 # 
235:MOV,r481,1 # 
236:STORE,r36,r481 ##End START_EXTERNAL_IO 
237:OR,r58,r58,r492 # #Start EXTERNAL_IO_DONE 
238:LOAD,r58,r481 # 
239:AND,r481,r481,r60 # 
240:BRANZ,4 # 
241:MOV,r460,196 # 
242:MOV,r449,1 # 
243:BRAUNCOND,-180 # End EXTERNAL_IO_DONE 
244:ADDI,r4,r21,0 # 
245:ADD,r21,r21,r20 # 
246:ADDI,r44,r20,0 # 
247:MOV,r486,-16384 # 
248:AND,r20,r20,r486 # 
249:MOV,r481,1 # #Start START_EXTERNAL_IO 
250:STORE,r50,r481 # 
251:LOAD,r50,r481 # 
252:STORE,r53,r19 # 
253:STORE,r54,r21 # 
254:STORE,r55,r43 # 
255:STORE,r56,r20 # 
256:STORE,r57,r45 # 
257:MOV,r481,1 # 
258:STORE,r36,r481 ##End START_EXTERNAL_IO 
259:OR,r58,r58,r492 # #Start EXTERNAL_IO_DONE 
260:LOAD,r58,r481 # 
261:AND,r481,r481,r60 # 
262:BRANZ,4 # 
263:MOV,r460,218 # 
264:MOV,r449,1 # 
265:BRAUNCOND,-202 # End EXTERNAL_IO_DONE 
266:MOV,r22,1 # 
267:ADDI,r8,r3,0 # 
268:MOV,r13,1 # 
269:OR,r10,r480,r492 # 
270:STORE,r480,r22 # 
271:MOV,r481,1028 # 
272:OR,r481,r481,r492 # 
273:STORE,r481,r6 # # End POP_SYNC - write to ib_decr_reg
274:MOV,r481,1032 ## Start SEND_SYNC_PREV 
275:OR,r481,r481,r492 # 
276:STORE,r481,r6 ## End SEND_SYNC_PREV - write to asq_send_reg
277:MOV,r482,1048 ## Start SEND_SYNC_NEXT 
278:OR,r482,r482,r492 # 
279:STORE,r482,r6 # # End SEND_SYNC_NEXT
280:MOV,r481,1044 # # Start END_BLOCK_EXTERNAL 
281:OR,r481,r481,r492 # 
282:STORE,r481,r6 ## write to ob_incr_reg - End END_BLOCK_EXTERNAL 
283:SUBI,r3,r3,1 # 
284:BRALEZ,2 # 
285:BRAUNCOND,-16 # 
286:ADD,r4,r4,r1 # 
287:ADD,r24,r24,r1 # 
288:MOV,r486,16383 # 
289:AND,r24,r24,r486 # 
290:MOV,r486,-16384 # 
291:AND,r44,r44,r486 # 
292:ADD,r44,r44,r24 # 
293:SUBI,r2,r2,1 # 
294:BRALEZ,2 # 
295:BRAUNCOND,-131 # 
296:MOV,r28,1 # 
297:MOV,r29,0 # 
298:MOV,r31,1 # 
299:MOV,r32,1192 # 
300:MOV,r33,128 # 
301:MOV,r480,784 # 
302:LLSHIFT,r480,r480,16 # 
303:OR,r33,r33,r480 # 
304:NOP ##Start SET_UP_NEXT 
305:NOP # 
306:NOP # 
307:MOV,r460,31 # 
308:MOV,r449,0 # 
309:BRAUNCOND,-246 # #Branch to the same layer, instruction start location
310:NOP # 
311:NOP # 
312:NOP # 
313:NOP # 
314:HALT # 
315:NOP ##End SET_UP_NEXT 
316:MOV,r100,0 # 
317:MOV,r67,0 # 
318:MOV,r106,0 # 
319:MOV,r112,0 # 
320:MOV,r118,0 # 
321:MOV,r480,0 # 
322:LLSHIFT,r480,r480,16 # 
323:OR,r118,r118,r480 # 
324:MOV,r107,0 # 
325:MOV,r113,0 # 
326:MOV,r119,0 # 
327:MOV,r480,0 # 
328:LLSHIFT,r480,r480,16 # 
329:OR,r119,r119,r480 # 
330:MOV,r108,0 # 
331:MOV,r114,0 # 
332:MOV,r120,0 # 
333:MOV,r480,0 # 
334:LLSHIFT,r480,r480,16 # 
335:OR,r120,r120,r480 # 
336:MOV,r109,0 # 
337:MOV,r115,0 # 
338:MOV,r121,0 # 
339:MOV,r480,0 # 
340:LLSHIFT,r480,r480,16 # 
341:OR,r121,r121,r480 # 
342:MOV,r480,33184 ##Start READ_FROM_SCRATCH
343:MOV,r481,208 # 
344:OR,r481,r481,r492 # 
345:STORE,r481,r480 # write process_memory_addr
346:MOV,r481,212 # 
347:OR,r481,r481,r492 # 
348:LOAD,r481,r106 ## End READ_FROM_SCRATCH - read from process_memory_loc 
349:MOV,r480,33188 ##Start READ_FROM_SCRATCH
350:MOV,r481,208 # 
351:OR,r481,r481,r492 # 
352:STORE,r481,r480 # write process_memory_addr
353:MOV,r481,212 # 
354:OR,r481,r481,r492 # 
355:LOAD,r481,r112 ## End READ_FROM_SCRATCH - read from process_memory_loc 
356:MOV,r480,33192 ##Start READ_FROM_SCRATCH
357:MOV,r481,208 # 
358:OR,r481,r481,r492 # 
359:STORE,r481,r480 # write process_memory_addr
360:MOV,r481,212 # 
361:OR,r481,r481,r492 # 
362:LOAD,r481,r118 ## End READ_FROM_SCRATCH - read from process_memory_loc 
363:MOV,r69,0 # 
364:MOV,r86,1 # 
365:MOV,r105,256 # 
366:MOV,r89,0 # 
367:MOV,r91,0 # 
368:ADDI,r86,r484,0 # # Start SET_MULTICAST_ADDR
369:SUBI,r484,r484,1 # 
370:BRALEZ,69 # 
371:ADDI,r105,r480,0 # 
372:OR,r480,r480,r492 # 
373:ADDI,r86,r484,1 # 
374:SUBI,r91,r485,0 # 
375:BRALEZ,8 # # Jump to first dest_detail
376:SUBI,r91,r485,1 # 
377:BRALEZ,19 # # Jump to second dest detail 
378:SUBI,r91,r485,2 # 
379:BRALEZ,31 # # Jump to third dest detail 
380:SUBI,r91,r485,3 # 
381:BRALEZ,43 # # Jumpt to fourth dest detail 
382:BRAUNCOND,57 # 
383:AND,r112,r481,r106 # 
384:ADDI,r118,r481,0 # 
385:SUBI,r484,r484,1 # 
386:BRALEZ,4 # 
387:ORI,r481,r481,1 # 
388:ADDI,r484,r484,0 # 
389:BRAUNCOND,2 # 
390:MOV,r481,0 # 
391:STORE,r480,r481 # 
392:ADDI,r480,r481,4 # 
393:STORE,r481,r112 # 
394:ADDI,r480,r481,8 # 
395:STORE,r481,r106 # 
396:ADDI,r480,r486,16 # 
397:AND,r113,r481,r107 # 
398:ADDI,r119,r481,0 # 
399:SUBI,r484,r484,1 # 
400:BRALEZ,4 # 
401:ORI,r481,r481,1 # 
402:ADDI,r484,r484,0 # 
403:BRAUNCOND,2 # 
404:MOV,r481,0 # 
405:STORE,r486,r481 # 
406:ADDI,r486,r481,4 # 
407:STORE,r481,r113 # 
408:ADDI,r486,r481,8 # 
409:STORE,r481,r107 # 
410:ADDI,r480,r486,32 # 
411:AND,r114,r481,r108 # 
412:ADDI,r120,r481,0 # 
413:SUBI,r484,r484,1 # 
414:BRALEZ,4 # 
415:ORI,r481,r481,1 # 
416:ADDI,r484,r484,0 # 
417:BRAUNCOND,2 # 
418:MOV,r481,0 # 
419:STORE,r486,r481 # 
420:ADDI,r486,r481,4 # 
421:STORE,r481,r114 # 
422:ADDI,r486,r481,8 # 
423:STORE,r481,r108 # 
424:ADDI,r480,r486,48 # 
425:AND,r115,r481,r109 # 
426:ADDI,r121,r481,0 # 
427:SUBI,r484,r484,1 # 
428:BRALEZ,4 # 
429:ORI,r481,r481,1 # 
430:ADDI,r484,r484,0 # 
431:BRAUNCOND,2 # 
432:MOV,r481,0 # 
433:STORE,r486,r481 # 
434:ADDI,r486,r481,4 # 
435:STORE,r481,r115 # 
436:ADDI,r486,r481,8 # 
437:STORE,r481,r109 # 
438:NOP # # End SET_MULTICAST_ADDR
439:MOV,r91,16384 # 
440:MOV,r480,768 # 
441:LLSHIFT,r480,r480,16 # 
442:OR,r91,r91,r480 # 
443:MOV,r97,128 # 
444:MOV,r480,784 # 
445:LLSHIFT,r480,r480,16 # 
446:OR,r97,r97,r480 # 
447:MOV,r480,0 # # start STORE_TO_MEMORY 
448:STORE,r97,r480 # # end STORE_TO_MEMORY - write data to address
449:MOV,r65,22 # 
450:MOV,r64,0 # 
451:MOV,r74,1 # 
452:MOV,r75,0 # 
453:MOV,r76,1 # 
454:MOV,r77,8 # 
455:MOV,r90,9216 # 
456:MOV,r79,16383 # 
457:MOV,r83,2 # 
458:MOV,r84,1200 # 
459:MOV,r97,0 # 
460:MOV,r98,1284 # 
461:MOV,r104,0 # 
462:MOV,r111,1023 # 
463:MOV,r123,1 # 
464:MOV,r117,8976 # 
465:MOV,r116,128 # 
466:ADDI,r117,r480,0 ## Start SET_LYR_REG 
467:OR,r480,r480,r492 # 
468:STORE,r480,r79 # # write to addr_mask_reg
469:ADDI,r480,r483,4 # 
470:STORE,r483,r91 # # write to base_addr_reg
471:LLSHIFT,r64,r482,16 # 
472:OR,r482,r482,r116 # 
473:ADDI,r480,r483,8 # 
474:STORE,r483,r482 # #wite to addr_stp_reg
475:MOV,r480,8228 # 
476:OR,r480,r480,r492 # 
477:LOAD,r480,r481 # 
478:OR,r481,r481,r64 # 
479:STORE,r480,r481 # # end SET_OUTPUT_LYR_REG - write to xbar_grp_reg
480:MOV,r116,304 # 
481:MOV,r117,80 # 
482:MOV,r66,0 # 
483:MOV,r116,0 # 
484:MOV,r82,0 # 
485:MOV,r66,22 # 
486:MOV,r81,0 # 
487:MOV,r71,0 # 
488:ADDI,r81,r68,0 # 
489:ADDI,r68,r68,1 # 
490:MOV,r69,1 # 
491:ADDI,r84,r482,84 # # Start START_INPUT_TFR_LAYER
492:OR,r482,r482,r492 # 
493:STORE,r482,r69 # # End START_INPUT_TFR_LAYER
494:MOV,r70,1 # 
495:MOV,r80,64 # 
496:MOV,r102,0 # 
497:MOV,r86,1 # 
498:MOV,r122,22 # 
499:MOV,r101,0 # 
500:MOV,r103,256 # 
501:MOV,r105,0 # 
502:MOV,r87,0 # 
503:SUBI,r105,r105,0 # 
504:BRALEZ,2 # 
505:BRAUNCOND,5 # 
506:MOV,r87,0 # 
507:MOV,r480,0 # 
508:LLSHIFT,r480,r480,16 # 
509:OR,r87,r87,r480 # 
510:MOV,r88,22 # 
511:MOV,r92,0 # 
512:MOV,r96,0 # 
513:MOV,r480,32992 ##Start READ_FROM_SCRATCH
514:MOV,r481,208 # 
515:OR,r481,r481,r492 # 
516:STORE,r481,r480 # write process_memory_addr
517:MOV,r481,212 # 
518:OR,r481,r481,r492 # 
519:LOAD,r481,r110 ## End READ_FROM_SCRATCH - read from process_memory_loc 
520:MOV,r99,16383 # 
521:MOV,r480,0 # 
522:LLSHIFT,r480,r480,16 # 
523:OR,r99,r99,r480 # 
524:STOREI,r117,r110 # #Start SET_SIMD_BASE- write to simd_base_addr_reg
525:ADDI,r117,r480,4 # 
526:STOREI,r480,r99 # #write to simd_addr_mask_reg - End SET_SIMD_BASE 
527:NOP # # Instruction not used in Assembly Generation
528:ADDI,r80,r80,1 # 
529:ADD,r102,r102,r86 # 
530:ADDI,r100,r105,0 # 
531:ADDI,r88,r94,0 # 
532:MOV,r486,2048 # 
533:SUB,r88,r88,r486 # 
534:BRALEZ,2 # 
535:MOV,r94,2048 # 
536:ADDI,r67,r72,0 # 
537:ADD,r72,r72,r71 # 
538:MOV,r483,1 # # start TFR_OUT_LAYER_MEM
539:LLSHIFTREG,r483,r483,r97 # 
540:LOAD,r494,r481 # 
541:AND,r481,r481,r483 # 
542:BRAZ,2 # 
543:BRAUNCOND,-3 # 
544:ADDI,r90,r480,0 # 
545:OR,r480,r480,r492 # 
546:ADDI,r480,r482,20 # 
547:MOV,r481,1 # 
548:LLSHIFT,r481,r481,4 # 
549:OR,r481,r481,r74 # 
550:STORE,r482,r481 # #write to mb_config_reg
551:ADDI,r480,r480,32 # 
552:ADDI,r94,r482,0 # 
553:LLSHIFT,r482,r482,16 # 
554:ORI,r482,r482,1 # 
555:STORE,r480,r482 ## write to cmd_wd0_reg 
556:AND,r72,r481,r79 # 
557:ADD,r481,r481,r91 # 
558:ADDI,r480,r480,4 # 
559:STORE,r480,r481 # # write to cmd_wd1_reg 
560:ADDI,r90,r480,0 # 
561:ADDI,r480,r480,0 # 
562:OR,r480,r480,r492 # 
563:ADDI,r94,r481,0 # 
564:STORE,r480,r481 # # write to bt_size_reg
565:MOV,r480,8200 # 
566:OR,r480,r480,r492 # 
567:LOAD,r480,r482 # # read cmd_list_en_Reg 
568:MOV,r483,1 # 
569:LLSHIFTREG,r483,r483,r97 # 
570:NOT,r483,r484 # 
571:AND,r484,r485,r482 # 
572:STORE,r480,r485 # write to cmd_list_en_reg with complementary val
573:OR,r483,r482,r482 # 
574:STORE,r480,r482 ## End TFR_OUT_LAYER_MEM - write to cmd_list_en_reg 
575:MOV,r480,20 # # start CHECK_LAYER_MEM_IOPE 
576:LOADI,r480,r481 # #read mac_cmd_data_fifo_status_reg
577:ANDI,r481,r481,1 # 
578:BRAZ,4 # 
579:MOV,r461,531 # 
580:MOV,r449,2 # 
581:BRAUNCOND,-518 # 
582:MOV,r480,48 # 
583:LOADI,r480,r481 # # read simd_intr_lyr_reg 
584:ANDI,r481,r481,7 # 
585:SUB,r481,r482,r449 # 
586:BRAZ,4 # 
587:MOV,r461,538 # 
588:ADDI,r481,r449,0 # 
589:BRAUNCOND,-526 # 
590:MOV,r480,4 # 
591:LOADI,r480,r472 ##End CHECK_LAYER_MEM_IOPE
592:ADDI,r71,r89,0 # 
593:SUB,r89,r89,r96 # 
594:ADD,r105,r105,r87 # 
595:MOV,r480,44 ## Start Set_IOPE_GAP 
596:LLSHIFT,r123,r481,28 # 
597:LLSHIFT,r94,r482,9 # 
598:OR,r481,r481,r482 # 
599:LLSHIFT,r123,r482,21 # 
600:OR,r481,r481,r482 # 
601:LLSHIFT,r116,r482,22 # 
602:OR,r481,r481,r482 # 
603:STOREI,r480,r481 ## write to gap_cmd2_reg 
604:MOV,r480,0 # 
605:ADD,r105,r483,r89 # 
606:MOV,r484,255 # 
607:LLSHIFT,r484,r484,24 # 
608:AND,r472,r485,r484 # 
609:OR,r483,r483,r485 # 
610:STOREI,r480,r483 # # End Set_IOPE_GAP - write to gap_cmd_reg
611:NOP # # Instruction not used in Assembly Generation
612:ADD,r71,r71,r94 # 
613:SUBI,r88,r88,0 # 
614:BRALEZ,2 # 
615:BRAUNCOND,-84 # 
616:MOV,r480,12 # 
617:LOADI,r480,r481 # 
618:ANDI,r481,r481,1 # 
619:BRANZ,2 # 
620:BRAUNCOND,-3 #  # End CHECK_SIMD_STATUS
621:ADDI,r106,r106,22 # 
622:MOV,r70,0 # 
623:MOV,r480,12 # 
624:LOADI,r480,r481 # #read simd_wbuf_addr_status_reg 
625:ANDI,r481,r481,1 # 
626:BRANZ,2 # 
627:BRAUNCOND,-3 # End END_BLOCK 
628:MOV,r480,1044 # 
629:OR,r480,r480,r492 # 
630:STORE,r480,r83 # # End INCREMENT_OBUF_COUNTER  
631:MOV,r483,1 # 
632:LLSHIFTREG,r483,r483,r97 # 
633:LOAD,r494,r481 # 
634:AND,r481,r481,r483 # 
635:BRAZ,2 # 
636:BRAUNCOND,-3 # # End CHECK_OUTPUT_DMA_BUSY
637:MOV,r78,1 # 
638:MOV,r86,1 # 
639:MOV,r482,1048 ## Start SEND_SYNC_NEXT 
640:OR,r482,r482,r492 # 
641:STORE,r482,r83 # # End SEND_SYNC_NEXT
642:SUBI,r86,r86,1 # 
643:BRALEZ,2 # 
644:BRAUNCOND,-5 # 
645:ADDI,r78,r102,0 # 
646:OR,r98,r480,r492 # 
647:STORE,r480,r78 # 
648:MOV,r481,1028 # 
649:OR,r481,r481,r492 # 
650:STORE,r481,r83 # # End POP_SYNC - write to ib_decr_reg
651:MOV,r481,1032 ## Start SEND_SYNC_PREV 
652:OR,r481,r481,r492 # 
653:STORE,r481,r83 ## End SEND_SYNC_PREV - write to asq_send_reg
654:SUBI,r102,r102,1 # 
655:BRALEZ,2 # 
656:BRAUNCOND,-10 # 
657:ADD,r82,r82,r122 # 
658:ADDI,r67,r67,22 # 
659:ADD,r100,r100,r122 # 
660:ADDI,r81,r81,1 # 
661:SUBI,r66,r66,1 # 
662:BRALEZ,2 # 
663:BRAUNCOND,-176 # 
664:ADD,r91,r91,r72 # 
665:MOV,r92,2 # 
666:MOV,r93,1 # 
667:MOV,r94,1304 # 
668:MOV,r95,1 # 
669:MOV,r97,128 # 
670:MOV,r480,784 # 
671:LLSHIFT,r480,r480,16 # 
672:OR,r97,r97,r480 # 
673:NOP ##Start SET_UP_NEXT 
674:NOP # 
675:NOP # 
676:MOV,r461,395 # 
677:MOV,r449,1 # 
678:BRAUNCOND,-615 # #Branch to the same layer, instruction start location
679:NOP # 
680:NOP # 
681:NOP # 
682:NOP # 
683:HALT # 
684:NOP ##End SET_UP_NEXT 
685:MOV,r132,32768 # 
686:MOV,r480,768 # 
687:LLSHIFT,r480,r480,16 # 
688:OR,r132,r132,r480 # 
689:MOV,r171,1 # 
690:MOV,r480,0 # 
691:LLSHIFT,r480,r480,16 # 
692:OR,r171,r171,r480 # 
693:MOV,r152,0 # 
694:MOV,r174,65036 # 
695:MOV,r480,799 # 
696:LLSHIFT,r480,r480,16 # 
697:OR,r174,r174,r480 # 
698:MOV,r175,65040 # 
699:MOV,r480,799 # 
700:LLSHIFT,r480,r480,16 # 
701:OR,r175,r175,r480 # 
702:LOAD,r174,r172 ##Start INIT_WRITE_DATA_STRUCT 
703:LOAD,r175,r173 ##End INIT_WRITE_DATA_STRUCT
704:MOV,r161,128 # 
705:MOV,r480,784 # 
706:LLSHIFT,r480,r480,16 # 
707:OR,r161,r161,r480 # 
708:MOV,r480,0 # # start STORE_TO_MEMORY 
709:STORE,r161,r480 # # end STORE_TO_MEMORY - write data to address
710:MOV,r129,14 # 
711:MOV,r130,14 # 
712:MOV,r169,132 # 
713:MOV,r480,4280 # 
714:LLSHIFT,r480,r480,16 # 
715:OR,r169,r169,r480 # 
716:MOV,r186,224 # 
717:MOV,r480,0 # 
718:LLSHIFT,r480,r480,16 # 
719:OR,r186,r186,r480 # 
720:MOV,r163,0 # 
721:MOV,r480,4280 # 
722:LLSHIFT,r480,r480,16 # 
723:OR,r163,r163,r480 # 
724:MOV,r164,4 # 
725:MOV,r480,4280 # 
726:LLSHIFT,r480,r480,16 # 
727:OR,r164,r164,r480 # 
728:MOV,r178,140 # 
729:MOV,r480,4280 # 
730:LLSHIFT,r480,r480,16 # 
731:OR,r178,r178,r480 # 
732:MOV,r179,52 # 
733:MOV,r480,4280 # 
734:LLSHIFT,r480,r480,16 # 
735:OR,r179,r179,r480 # 
736:MOV,r180,136 # 
737:MOV,r480,4280 # 
738:LLSHIFT,r480,r480,16 # 
739:OR,r180,r180,r480 # 
740:MOV,r181,28 # 
741:MOV,r480,4280 # 
742:LLSHIFT,r480,r480,16 # 
743:OR,r181,r181,r480 # 
744:MOV,r187,48 # 
745:MOV,r480,4280 # 
746:LLSHIFT,r480,r480,16 # 
747:OR,r187,r187,r480 # 
748:MOV,r182,32 # 
749:MOV,r480,4280 # 
750:LLSHIFT,r480,r480,16 # 
751:OR,r182,r182,r480 # 
752:MOV,r183,36 # 
753:MOV,r480,4280 # 
754:LLSHIFT,r480,r480,16 # 
755:OR,r183,r183,r480 # 
756:MOV,r184,40 # 
757:MOV,r480,4280 # 
758:LLSHIFT,r480,r480,16 # 
759:OR,r184,r184,r480 # 
760:MOV,r185,44 # 
761:MOV,r480,4280 # 
762:LLSHIFT,r480,r480,16 # 
763:OR,r185,r185,r480 # 
764:MOV,r483,1 # 
765:STORE,r163,r483 # 
766:MOV,r483,2 # 
767:STORE,r187,r483 # 
768:MOV,r483,0 # 
769:STORE,r179,r483 # 
770:MOV,r484,82 # 
771:STORE,r180,r484 ##End SET_PCI_DMA_REGS 
772:MOV,r170,1 # 
773:MOV,r188,1 # 
774:MOV,r133,0 # 
775:MOV,r134,4 # 
776:MOV,r135,1312 # 
777:MOV,r138,1396 # 
778:MOV,r137,0 # 
779:MOV,r139,2 # 
780:MOV,r140,1 # 
781:MOV,r142,16384 # 
782:MOV,r143,67108124 # 
783:ADDI,r133,r133,1 # 
784:MOV,r136,1 # 
785:ADDI,r130,r131,0 # 
786:SUB,r131,r131,r136 # 
787:BRAGEZ,2 # 
788:ADDI,r130,r136,0 # 
789:MOV,r144,1 # 
790:ADDI,r132,r145,0 # 
791:ADDI,r172,r146,0 # 
792:ADDI,r144,r147,0 # 
793:MOV,r129,14 # 
794:SUBI,r131,r131,0 # 
795:BRAGEZ,2 # 
796:MOV,r129,0 # 
797:SUBI,r147,r147,1 # 
798:BRALEZ,2 # 
799:BRAUNCOND,5 # 
800:MOV,r129,14 # 
801:SUBI,r131,r131,0 # 
802:BRAGEZ,2 # 
803:MOV,r129,0 # 
804:ADDI,r135,r482,84 ## Start START_INPUT_TFR_LAYER_CHECK 
805:OR,r482,r482,r492 # 
806:STORE,r482,r136 # # writre to ib_decr_reg
807:OR,r135,r481,r492 # 
808:ADDI,r481,r482,88 # 
809:LOAD,r482,r483 # # read ib_cntr_reg 
810:SUB,r483,r482,r136 # 
811:BRAGEZ,4 # 
812:MOV,r462,757 # 
813:MOV,r449,3 # 
814:BRAUNCOND,-751 # 
815:OR,r135,r481,r492 # 
816:ADDI,r481,r482,104 # 
817:LOAD,r482,r483 # #read ob_cntr_reg 
818:ADDI,r481,r482,96 # 
819:LOAD,r482,r484 # # read ob_full_lvl_reg 
820:SUB,r484,r482,r483 # 
821:SUB,r482,r482,r136 # 
822:BRAGEZ,4 # 
823:MOV,r462,768 # 
824:MOV,r449,3 # 
825:BRAUNCOND,-762 ## End START_INPUT_TFR_LAYER_CHECK 
826:MOV,r147,1 # 
827:ADDI,r145,r151,0 # 
828:MOV,r486,16383 # 
829:AND,r151,r151,r486 # 
830:ADDI,r151,r149,0 # 
831:ADD,r149,r149,r129 # 
832:SUB,r149,r149,r142 # 
833:BRALEZ,2 # 
834:BRAUNCOND,19 # 
835:MOV,r481,1 # #Start START_EXTERNAL_IO 
836:STORE,r178,r481 # 
837:LOAD,r178,r481 # 
838:STORE,r181,r129 # 
839:STORE,r182,r145 # 
840:STORE,r183,r171 # 
841:STORE,r184,r146 # 
842:STORE,r185,r173 # 
843:MOV,r481,1 # 
844:STORE,r164,r481 ##End START_EXTERNAL_IO 
845:OR,r186,r186,r492 # #Start EXTERNAL_IO_DONE 
846:LOAD,r186,r481 # 
847:AND,r481,r481,r188 # 
848:BRANZ,4 # 
849:MOV,r462,798 # 
850:MOV,r449,3 # 
851:BRAUNCOND,-788 # End EXTERNAL_IO_DONE 
852:BRAUNCOND,42 # 
853:MOV,r153,16384 # 
854:SUB,r153,r153,r151 # 
855:MOV,r481,1 # #Start START_EXTERNAL_IO 
856:STORE,r178,r481 # 
857:LOAD,r178,r481 # 
858:STORE,r181,r153 # 
859:STORE,r182,r145 # 
860:STORE,r183,r171 # 
861:STORE,r184,r146 # 
862:STORE,r185,r173 # 
863:MOV,r481,1 # 
864:STORE,r164,r481 ##End START_EXTERNAL_IO 
865:OR,r186,r186,r492 # #Start EXTERNAL_IO_DONE 
866:LOAD,r186,r481 # 
867:AND,r481,r481,r188 # 
868:BRANZ,4 # 
869:MOV,r462,818 # 
870:MOV,r449,3 # 
871:BRAUNCOND,-808 # End EXTERNAL_IO_DONE 
872:ADDI,r146,r154,0 # 
873:ADD,r154,r154,r153 # 
874:ADDI,r145,r155,0 # 
875:MOV,r486,-16384 # 
876:AND,r155,r155,r486 # 
877:MOV,r481,1 # #Start START_EXTERNAL_IO 
878:STORE,r178,r481 # 
879:LOAD,r178,r481 # 
880:STORE,r181,r149 # 
881:STORE,r182,r155 # 
882:STORE,r183,r171 # 
883:STORE,r184,r154 # 
884:STORE,r185,r173 # 
885:MOV,r481,1 # 
886:STORE,r164,r481 ##End START_EXTERNAL_IO 
887:OR,r186,r186,r492 # #Start EXTERNAL_IO_DONE 
888:LOAD,r186,r481 # 
889:AND,r481,r481,r188 # 
890:BRANZ,4 # 
891:MOV,r462,840 # 
892:MOV,r449,3 # 
893:BRAUNCOND,-830 # End EXTERNAL_IO_DONE 
894:ADDI,r145,r148,0 # 
895:ADD,r148,r148,r129 # 
896:MOV,r486,16383 # 
897:AND,r148,r148,r486 # 
898:MOV,r486,-16384 # 
899:AND,r145,r145,r486 # 
900:ADD,r145,r145,r148 # 
901:ADD,r146,r146,r129 # 
902:SUBI,r144,r144,1 # 
903:BRALEZ,2 # 
904:BRAUNCOND,-107 # 
905:MOV,r150,1 # 
906:ADDI,r136,r131,0 # 
907:MOV,r141,1 # 
908:OR,r138,r480,r492 # 
909:STORE,r480,r150 # 
910:MOV,r481,1028 # 
911:OR,r481,r481,r492 # 
912:STORE,r481,r134 # # End POP_SYNC - write to ib_decr_reg
913:MOV,r481,1032 ## Start SEND_SYNC_PREV 
914:OR,r481,r481,r492 # 
915:STORE,r481,r134 ## End SEND_SYNC_PREV - write to asq_send_reg
916:MOV,r482,1048 ## Start SEND_SYNC_NEXT 
917:OR,r482,r482,r492 # 
918:STORE,r482,r134 # # End SEND_SYNC_NEXT
919:MOV,r481,1044 # # Start END_BLOCK_EXTERNAL 
920:OR,r481,r481,r492 # 
921:STORE,r481,r134 ## write to ob_incr_reg - End END_BLOCK_EXTERNAL 
922:SUBI,r131,r131,1 # 
923:BRALEZ,2 # 
924:BRAUNCOND,-16 # 
925:ADD,r172,r172,r129 # 
926:ADD,r152,r152,r129 # 
927:MOV,r486,16383 # 
928:AND,r152,r152,r486 # 
929:MOV,r486,-16384 # 
930:AND,r132,r132,r486 # 
931:ADD,r132,r132,r152 # 
932:SUBI,r130,r130,1 # 
933:BRALEZ,2 # 
934:BRAUNCOND,-153 # 
935:MOV,r156,4 # 
936:MOV,r157,2 # 
937:MOV,r158,1416 # 
938:MOV,r159,1 # 
939:MOV,r161,128 # 
940:MOV,r480,784 # 
941:LLSHIFT,r480,r480,16 # 
942:OR,r161,r161,r480 # 
943:NOP ##Start SET_UP_NEXT 
944:NOP # 
945:NOP # 
946:MOV,r462,647 # 
947:MOV,r449,2 # 
948:BRAUNCOND,-885 # #Branch to the same layer, instruction start location
949:NOP # 
950:NOP # 
951:NOP # 
952:NOP # 
953:HALT # 
954:NOP ##End SET_UP_NEXT 
