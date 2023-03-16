# Assembler for Chip - Output Processor 
# Output uP Assembly Code 
0:NOP # 
1:MOV,r448,6 # # Init process count 
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
23:MOV,r451,392 # # store proc1 start loc
24:MOV,r461,392 # # store proc1 last loc  
25:MOV,r452,758 # # store proc2 start loc
26:MOV,r462,758 # # store proc2 last loc  
27:MOV,r453,1124 # # store proc3 start loc
28:MOV,r463,1124 # # store proc3 last loc  
29:MOV,r454,1128 # # store proc4 start loc
30:MOV,r464,1128 # # store proc4 last loc  
31:MOV,r455,1132 # # store proc5 start loc
32:MOV,r465,1132 # # store proc5 last loc  
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
67:MOV,r36,0 # 
68:MOV,r3,0 # 
69:MOV,r42,0 # 
70:MOV,r48,0 # 
71:MOV,r54,0 # 
72:MOV,r480,0 # 
73:LLSHIFT,r480,r480,16 # 
74:OR,r54,r54,r480 # 
75:MOV,r43,0 # 
76:MOV,r49,0 # 
77:MOV,r55,0 # 
78:MOV,r480,0 # 
79:LLSHIFT,r480,r480,16 # 
80:OR,r55,r55,r480 # 
81:MOV,r44,0 # 
82:MOV,r50,0 # 
83:MOV,r56,0 # 
84:MOV,r480,0 # 
85:LLSHIFT,r480,r480,16 # 
86:OR,r56,r56,r480 # 
87:MOV,r45,0 # 
88:MOV,r51,0 # 
89:MOV,r57,0 # 
90:MOV,r480,0 # 
91:LLSHIFT,r480,r480,16 # 
92:OR,r57,r57,r480 # 
93:MOV,r480,33120 ##Start READ_FROM_SCRATCH
94:MOV,r481,208 # 
95:OR,r481,r481,r492 # 
96:STORE,r481,r480 # write process_memory_addr
97:MOV,r481,212 # 
98:OR,r481,r481,r492 # 
99:LOAD,r481,r42 ## End READ_FROM_SCRATCH - read from process_memory_loc 
100:MOV,r480,33124 ##Start READ_FROM_SCRATCH
101:MOV,r481,208 # 
102:OR,r481,r481,r492 # 
103:STORE,r481,r480 # write process_memory_addr
104:MOV,r481,212 # 
105:OR,r481,r481,r492 # 
106:LOAD,r481,r48 ## End READ_FROM_SCRATCH - read from process_memory_loc 
107:MOV,r480,33128 ##Start READ_FROM_SCRATCH
108:MOV,r481,208 # 
109:OR,r481,r481,r492 # 
110:STORE,r481,r480 # write process_memory_addr
111:MOV,r481,212 # 
112:OR,r481,r481,r492 # 
113:LOAD,r481,r54 ## End READ_FROM_SCRATCH - read from process_memory_loc 
114:MOV,r5,0 # 
115:MOV,r22,1 # 
116:MOV,r41,256 # 
117:MOV,r25,0 # 
118:MOV,r27,0 # 
119:ADDI,r22,r484,0 # # Start SET_MULTICAST_ADDR
120:SUBI,r484,r484,1 # 
121:BRALEZ,69 # 
122:ADDI,r41,r480,0 # 
123:OR,r480,r480,r492 # 
124:ADDI,r22,r484,1 # 
125:SUBI,r27,r485,0 # 
126:BRALEZ,8 # # Jump to first dest_detail
127:SUBI,r27,r485,1 # 
128:BRALEZ,19 # # Jump to second dest detail 
129:SUBI,r27,r485,2 # 
130:BRALEZ,31 # # Jump to third dest detail 
131:SUBI,r27,r485,3 # 
132:BRALEZ,43 # # Jumpt to fourth dest detail 
133:BRAUNCOND,57 # 
134:AND,r48,r481,r42 # 
135:ADDI,r54,r481,0 # 
136:SUBI,r484,r484,1 # 
137:BRALEZ,4 # 
138:ORI,r481,r481,1 # 
139:ADDI,r484,r484,0 # 
140:BRAUNCOND,2 # 
141:MOV,r481,0 # 
142:STORE,r480,r481 # 
143:ADDI,r480,r481,4 # 
144:STORE,r481,r48 # 
145:ADDI,r480,r481,8 # 
146:STORE,r481,r42 # 
147:ADDI,r480,r486,16 # 
148:AND,r49,r481,r43 # 
149:ADDI,r55,r481,0 # 
150:SUBI,r484,r484,1 # 
151:BRALEZ,4 # 
152:ORI,r481,r481,1 # 
153:ADDI,r484,r484,0 # 
154:BRAUNCOND,2 # 
155:MOV,r481,0 # 
156:STORE,r486,r481 # 
157:ADDI,r486,r481,4 # 
158:STORE,r481,r49 # 
159:ADDI,r486,r481,8 # 
160:STORE,r481,r43 # 
161:ADDI,r480,r486,32 # 
162:AND,r50,r481,r44 # 
163:ADDI,r56,r481,0 # 
164:SUBI,r484,r484,1 # 
165:BRALEZ,4 # 
166:ORI,r481,r481,1 # 
167:ADDI,r484,r484,0 # 
168:BRAUNCOND,2 # 
169:MOV,r481,0 # 
170:STORE,r486,r481 # 
171:ADDI,r486,r481,4 # 
172:STORE,r481,r50 # 
173:ADDI,r486,r481,8 # 
174:STORE,r481,r44 # 
175:ADDI,r480,r486,48 # 
176:AND,r51,r481,r45 # 
177:ADDI,r57,r481,0 # 
178:SUBI,r484,r484,1 # 
179:BRALEZ,4 # 
180:ORI,r481,r481,1 # 
181:ADDI,r484,r484,0 # 
182:BRAUNCOND,2 # 
183:MOV,r481,0 # 
184:STORE,r486,r481 # 
185:ADDI,r486,r481,4 # 
186:STORE,r481,r51 # 
187:ADDI,r486,r481,8 # 
188:STORE,r481,r45 # 
189:NOP # # End SET_MULTICAST_ADDR
190:MOV,r27,0 # 
191:MOV,r480,768 # 
192:LLSHIFT,r480,r480,16 # 
193:OR,r27,r27,r480 # 
194:MOV,r33,128 # 
195:MOV,r480,784 # 
196:LLSHIFT,r480,r480,16 # 
197:OR,r33,r33,r480 # 
198:MOV,r480,0 # # start STORE_TO_MEMORY 
199:STORE,r33,r480 # # end STORE_TO_MEMORY - write data to address
200:MOV,r1,12 # 
201:MOV,r0,0 # 
202:MOV,r10,0 # 
203:MOV,r11,0 # 
204:MOV,r12,1 # 
205:MOV,r13,8 # 
206:MOV,r26,9216 # 
207:MOV,r15,16383 # 
208:MOV,r19,1 # 
209:MOV,r20,1088 # 
210:MOV,r33,0 # 
211:MOV,r34,1172 # 
212:MOV,r40,0 # 
213:MOV,r47,1023 # 
214:MOV,r59,1 # 
215:MOV,r53,8960 # 
216:MOV,r52,128 # 
217:ADDI,r53,r480,0 ## Start SET_LYR_REG 
218:OR,r480,r480,r492 # 
219:STORE,r480,r15 # # write to addr_mask_reg
220:ADDI,r480,r483,4 # 
221:STORE,r483,r27 # # write to base_addr_reg
222:LLSHIFT,r0,r482,16 # 
223:OR,r482,r482,r52 # 
224:ADDI,r480,r483,8 # 
225:STORE,r483,r482 # #wite to addr_stp_reg
226:MOV,r480,8228 # 
227:OR,r480,r480,r492 # 
228:LOAD,r480,r481 # 
229:OR,r481,r481,r0 # 
230:STORE,r480,r481 # # end SET_OUTPUT_LYR_REG - write to xbar_grp_reg
231:MOV,r52,272 # 
232:MOV,r53,64 # 
233:MOV,r2,0 # 
234:MOV,r52,0 # 
235:MOV,r18,0 # 
236:MOV,r2,3 # 
237:MOV,r17,0 # 
238:MOV,r7,0 # 
239:ADDI,r17,r4,0 # 
240:ADDI,r4,r4,1 # 
241:MOV,r5,1 # 
242:ADDI,r20,r482,84 # # Start START_INPUT_TFR_LAYER
243:OR,r482,r482,r492 # 
244:STORE,r482,r5 # # End START_INPUT_TFR_LAYER
245:MOV,r6,1 # 
246:MOV,r16,0 # 
247:MOV,r38,0 # 
248:MOV,r22,1 # 
249:MOV,r58,12 # 
250:MOV,r37,0 # 
251:MOV,r39,256 # 
252:MOV,r41,0 # 
253:MOV,r23,0 # 
254:SUBI,r41,r41,0 # 
255:BRALEZ,2 # 
256:BRAUNCOND,5 # 
257:MOV,r23,0 # 
258:MOV,r480,0 # 
259:LLSHIFT,r480,r480,16 # 
260:OR,r23,r23,r480 # 
261:MOV,r24,12 # 
262:MOV,r28,0 # 
263:MOV,r32,0 # 
264:MOV,r480,32976 ##Start READ_FROM_SCRATCH
265:MOV,r481,208 # 
266:OR,r481,r481,r492 # 
267:STORE,r481,r480 # write process_memory_addr
268:MOV,r481,212 # 
269:OR,r481,r481,r492 # 
270:LOAD,r481,r46 ## End READ_FROM_SCRATCH - read from process_memory_loc 
271:MOV,r35,16383 # 
272:MOV,r480,0 # 
273:LLSHIFT,r480,r480,16 # 
274:OR,r35,r35,r480 # 
275:STOREI,r53,r46 # #Start SET_SIMD_BASE- write to simd_base_addr_reg
276:ADDI,r53,r480,4 # 
277:STOREI,r480,r35 # #write to simd_addr_mask_reg - End SET_SIMD_BASE 
278:NOP # # Instruction not used in Assembly Generation
279:ADDI,r16,r16,1 # 
280:ADD,r38,r38,r22 # 
281:ADDI,r36,r41,0 # 
282:ADDI,r24,r30,0 # 
283:MOV,r486,2048 # 
284:SUB,r24,r24,r486 # 
285:BRALEZ,2 # 
286:MOV,r30,2048 # 
287:ADDI,r3,r8,0 # 
288:ADD,r8,r8,r7 # 
289:MOV,r483,1 # # start TFR_OUT_LAYER_MEM
290:LLSHIFTREG,r483,r483,r33 # 
291:LOAD,r494,r481 # 
292:AND,r481,r481,r483 # 
293:BRAZ,2 # 
294:BRAUNCOND,-3 # 
295:ADDI,r26,r480,0 # 
296:OR,r480,r480,r492 # 
297:ADDI,r480,r482,20 # 
298:MOV,r481,1 # 
299:LLSHIFT,r481,r481,4 # 
300:OR,r481,r481,r10 # 
301:STORE,r482,r481 # #write to mb_config_reg
302:ADDI,r480,r480,32 # 
303:ADDI,r30,r482,0 # 
304:LLSHIFT,r482,r482,16 # 
305:ORI,r482,r482,1 # 
306:STORE,r480,r482 ## write to cmd_wd0_reg 
307:AND,r8,r481,r15 # 
308:ADD,r481,r481,r27 # 
309:ADDI,r480,r480,4 # 
310:STORE,r480,r481 # # write to cmd_wd1_reg 
311:ADDI,r26,r480,0 # 
312:ADDI,r480,r480,0 # 
313:OR,r480,r480,r492 # 
314:ADDI,r30,r481,0 # 
315:STORE,r480,r481 # # write to bt_size_reg
316:MOV,r480,8200 # 
317:OR,r480,r480,r492 # 
318:LOAD,r480,r482 # # read cmd_list_en_Reg 
319:MOV,r483,1 # 
320:LLSHIFTREG,r483,r483,r33 # 
321:NOT,r483,r484 # 
322:AND,r484,r485,r482 # 
323:STORE,r480,r485 # write to cmd_list_en_reg with complementary val
324:OR,r483,r482,r482 # 
325:STORE,r480,r482 ## End TFR_OUT_LAYER_MEM - write to cmd_list_en_reg 
326:MOV,r480,20 # # start CHECK_LAYER_MEM_IOPE 
327:LOADI,r480,r481 # #read mac_cmd_data_fifo_status_reg
328:ANDI,r481,r481,1 # 
329:BRAZ,4 # 
330:MOV,r460,285 # 
331:MOV,r449,1 # 
332:BRAUNCOND,-269 # 
333:MOV,r480,48 # 
334:LOADI,r480,r481 # # read simd_intr_lyr_reg 
335:ANDI,r481,r481,7 # 
336:SUB,r481,r482,r449 # 
337:BRAZ,4 # 
338:MOV,r460,292 # 
339:ADDI,r481,r449,0 # 
340:BRAUNCOND,-277 # 
341:MOV,r480,4 # 
342:LOADI,r480,r472 ##End CHECK_LAYER_MEM_IOPE
343:ADDI,r7,r25,0 # 
344:SUB,r25,r25,r32 # 
345:ADD,r41,r41,r23 # 
346:MOV,r480,44 ## Start Set_IOPE_GAP 
347:LLSHIFT,r59,r481,28 # 
348:LLSHIFT,r30,r482,9 # 
349:OR,r481,r481,r482 # 
350:LLSHIFT,r59,r482,21 # 
351:OR,r481,r481,r482 # 
352:LLSHIFT,r52,r482,22 # 
353:OR,r481,r481,r482 # 
354:STOREI,r480,r481 ## write to gap_cmd2_reg 
355:MOV,r480,0 # 
356:ADD,r41,r483,r25 # 
357:MOV,r484,255 # 
358:LLSHIFT,r484,r484,24 # 
359:AND,r472,r485,r484 # 
360:OR,r483,r483,r485 # 
361:STOREI,r480,r483 # # End Set_IOPE_GAP - write to gap_cmd_reg
362:NOP # # Instruction not used in Assembly Generation
363:ADD,r7,r7,r30 # 
364:SUBI,r24,r24,0 # 
365:BRALEZ,2 # 
366:BRAUNCOND,-84 # 
367:MOV,r480,12 # 
368:LOADI,r480,r481 # 
369:ANDI,r481,r481,1 # 
370:BRANZ,2 # 
371:BRAUNCOND,-3 #  # End CHECK_SIMD_STATUS
372:ADDI,r42,r42,12 # 
373:MOV,r6,0 # 
374:MOV,r480,12 # 
375:LOADI,r480,r481 # #read simd_wbuf_addr_status_reg 
376:ANDI,r481,r481,1 # 
377:BRANZ,2 # 
378:BRAUNCOND,-3 # End END_BLOCK 
379:MOV,r480,1044 # 
380:OR,r480,r480,r492 # 
381:STORE,r480,r19 # # End INCREMENT_OBUF_COUNTER  
382:MOV,r483,1 # 
383:LLSHIFTREG,r483,r483,r33 # 
384:LOAD,r494,r481 # 
385:AND,r481,r481,r483 # 
386:BRAZ,2 # 
387:BRAUNCOND,-3 # # End CHECK_OUTPUT_DMA_BUSY
388:MOV,r14,1 # 
389:MOV,r22,1 # 
390:MOV,r482,1048 ## Start SEND_SYNC_NEXT 
391:OR,r482,r482,r492 # 
392:STORE,r482,r19 # # End SEND_SYNC_NEXT
393:SUBI,r22,r22,1 # 
394:BRALEZ,2 # 
395:BRAUNCOND,-5 # 
396:ADDI,r14,r38,0 # 
397:OR,r34,r480,r492 # 
398:STORE,r480,r14 # 
399:MOV,r481,1028 # 
400:OR,r481,r481,r492 # 
401:STORE,r481,r19 # # End POP_SYNC - write to ib_decr_reg
402:MOV,r481,1032 ## Start SEND_SYNC_PREV 
403:OR,r481,r481,r492 # 
404:STORE,r481,r19 ## End SEND_SYNC_PREV - write to asq_send_reg
405:SUBI,r38,r38,1 # 
406:BRALEZ,2 # 
407:BRAUNCOND,-10 # 
408:ADD,r18,r18,r58 # 
409:ADDI,r3,r3,12 # 
410:ADD,r36,r36,r58 # 
411:ADDI,r17,r17,1 # 
412:SUBI,r2,r2,1 # 
413:BRALEZ,2 # 
414:BRAUNCOND,-176 # 
415:ADD,r27,r27,r8 # 
416:MOV,r28,1 # 
417:MOV,r29,0 # 
418:MOV,r30,1192 # 
419:MOV,r31,1 # 
420:MOV,r33,128 # 
421:MOV,r480,784 # 
422:LLSHIFT,r480,r480,16 # 
423:OR,r33,r33,r480 # 
424:NOP ##Start SET_UP_NEXT 
425:NOP # 
426:NOP # 
427:MOV,r460,149 # 
428:MOV,r449,0 # 
429:BRAUNCOND,-366 # #Branch to the same layer, instruction start location
430:NOP # 
431:NOP # 
432:NOP # 
433:NOP # 
434:HALT # 
435:NOP ##End SET_UP_NEXT 
436:MOV,r100,0 # 
437:MOV,r67,0 # 
438:MOV,r106,0 # 
439:MOV,r112,0 # 
440:MOV,r118,0 # 
441:MOV,r480,0 # 
442:LLSHIFT,r480,r480,16 # 
443:OR,r118,r118,r480 # 
444:MOV,r107,0 # 
445:MOV,r113,0 # 
446:MOV,r119,0 # 
447:MOV,r480,0 # 
448:LLSHIFT,r480,r480,16 # 
449:OR,r119,r119,r480 # 
450:MOV,r108,0 # 
451:MOV,r114,0 # 
452:MOV,r120,0 # 
453:MOV,r480,0 # 
454:LLSHIFT,r480,r480,16 # 
455:OR,r120,r120,r480 # 
456:MOV,r109,0 # 
457:MOV,r115,0 # 
458:MOV,r121,0 # 
459:MOV,r480,0 # 
460:LLSHIFT,r480,r480,16 # 
461:OR,r121,r121,r480 # 
462:MOV,r480,33184 ##Start READ_FROM_SCRATCH
463:MOV,r481,208 # 
464:OR,r481,r481,r492 # 
465:STORE,r481,r480 # write process_memory_addr
466:MOV,r481,212 # 
467:OR,r481,r481,r492 # 
468:LOAD,r481,r106 ## End READ_FROM_SCRATCH - read from process_memory_loc 
469:MOV,r480,33188 ##Start READ_FROM_SCRATCH
470:MOV,r481,208 # 
471:OR,r481,r481,r492 # 
472:STORE,r481,r480 # write process_memory_addr
473:MOV,r481,212 # 
474:OR,r481,r481,r492 # 
475:LOAD,r481,r112 ## End READ_FROM_SCRATCH - read from process_memory_loc 
476:MOV,r480,33192 ##Start READ_FROM_SCRATCH
477:MOV,r481,208 # 
478:OR,r481,r481,r492 # 
479:STORE,r481,r480 # write process_memory_addr
480:MOV,r481,212 # 
481:OR,r481,r481,r492 # 
482:LOAD,r481,r118 ## End READ_FROM_SCRATCH - read from process_memory_loc 
483:MOV,r69,0 # 
484:MOV,r86,1 # 
485:MOV,r105,256 # 
486:MOV,r89,0 # 
487:MOV,r91,0 # 
488:ADDI,r86,r484,0 # # Start SET_MULTICAST_ADDR
489:SUBI,r484,r484,1 # 
490:BRALEZ,69 # 
491:ADDI,r105,r480,0 # 
492:OR,r480,r480,r492 # 
493:ADDI,r86,r484,1 # 
494:SUBI,r91,r485,0 # 
495:BRALEZ,8 # # Jump to first dest_detail
496:SUBI,r91,r485,1 # 
497:BRALEZ,19 # # Jump to second dest detail 
498:SUBI,r91,r485,2 # 
499:BRALEZ,31 # # Jump to third dest detail 
500:SUBI,r91,r485,3 # 
501:BRALEZ,43 # # Jumpt to fourth dest detail 
502:BRAUNCOND,57 # 
503:AND,r112,r481,r106 # 
504:ADDI,r118,r481,0 # 
505:SUBI,r484,r484,1 # 
506:BRALEZ,4 # 
507:ORI,r481,r481,1 # 
508:ADDI,r484,r484,0 # 
509:BRAUNCOND,2 # 
510:MOV,r481,0 # 
511:STORE,r480,r481 # 
512:ADDI,r480,r481,4 # 
513:STORE,r481,r112 # 
514:ADDI,r480,r481,8 # 
515:STORE,r481,r106 # 
516:ADDI,r480,r486,16 # 
517:AND,r113,r481,r107 # 
518:ADDI,r119,r481,0 # 
519:SUBI,r484,r484,1 # 
520:BRALEZ,4 # 
521:ORI,r481,r481,1 # 
522:ADDI,r484,r484,0 # 
523:BRAUNCOND,2 # 
524:MOV,r481,0 # 
525:STORE,r486,r481 # 
526:ADDI,r486,r481,4 # 
527:STORE,r481,r113 # 
528:ADDI,r486,r481,8 # 
529:STORE,r481,r107 # 
530:ADDI,r480,r486,32 # 
531:AND,r114,r481,r108 # 
532:ADDI,r120,r481,0 # 
533:SUBI,r484,r484,1 # 
534:BRALEZ,4 # 
535:ORI,r481,r481,1 # 
536:ADDI,r484,r484,0 # 
537:BRAUNCOND,2 # 
538:MOV,r481,0 # 
539:STORE,r486,r481 # 
540:ADDI,r486,r481,4 # 
541:STORE,r481,r114 # 
542:ADDI,r486,r481,8 # 
543:STORE,r481,r108 # 
544:ADDI,r480,r486,48 # 
545:AND,r115,r481,r109 # 
546:ADDI,r121,r481,0 # 
547:SUBI,r484,r484,1 # 
548:BRALEZ,4 # 
549:ORI,r481,r481,1 # 
550:ADDI,r484,r484,0 # 
551:BRAUNCOND,2 # 
552:MOV,r481,0 # 
553:STORE,r486,r481 # 
554:ADDI,r486,r481,4 # 
555:STORE,r481,r115 # 
556:ADDI,r486,r481,8 # 
557:STORE,r481,r109 # 
558:NOP # # End SET_MULTICAST_ADDR
559:MOV,r91,16384 # 
560:MOV,r480,768 # 
561:LLSHIFT,r480,r480,16 # 
562:OR,r91,r91,r480 # 
563:MOV,r97,128 # 
564:MOV,r480,784 # 
565:LLSHIFT,r480,r480,16 # 
566:OR,r97,r97,r480 # 
567:MOV,r480,0 # # start STORE_TO_MEMORY 
568:STORE,r97,r480 # # end STORE_TO_MEMORY - write data to address
569:MOV,r65,9 # 
570:MOV,r64,0 # 
571:MOV,r74,1 # 
572:MOV,r75,0 # 
573:MOV,r76,1 # 
574:MOV,r77,8 # 
575:MOV,r90,9344 # 
576:MOV,r79,16383 # 
577:MOV,r83,2 # 
578:MOV,r84,1200 # 
579:MOV,r97,1 # 
580:MOV,r98,1284 # 
581:MOV,r104,0 # 
582:MOV,r111,1023 # 
583:MOV,r123,1 # 
584:MOV,r117,8976 # 
585:MOV,r116,128 # 
586:ADDI,r117,r480,0 ## Start SET_LYR_REG 
587:OR,r480,r480,r492 # 
588:STORE,r480,r79 # # write to addr_mask_reg
589:ADDI,r480,r483,4 # 
590:STORE,r483,r91 # # write to base_addr_reg
591:LLSHIFT,r64,r482,16 # 
592:OR,r482,r482,r116 # 
593:ADDI,r480,r483,8 # 
594:STORE,r483,r482 # #wite to addr_stp_reg
595:MOV,r480,8228 # 
596:OR,r480,r480,r492 # 
597:LOAD,r480,r481 # 
598:OR,r481,r481,r64 # 
599:STORE,r480,r481 # # end SET_OUTPUT_LYR_REG - write to xbar_grp_reg
600:MOV,r116,304 # 
601:MOV,r117,80 # 
602:MOV,r66,0 # 
603:MOV,r116,512 # 
604:MOV,r82,0 # 
605:MOV,r66,3 # 
606:MOV,r81,0 # 
607:MOV,r71,0 # 
608:ADDI,r81,r68,0 # 
609:ADDI,r68,r68,1 # 
610:MOV,r69,1 # 
611:ADDI,r84,r482,84 # # Start START_INPUT_TFR_LAYER
612:OR,r482,r482,r492 # 
613:STORE,r482,r69 # # End START_INPUT_TFR_LAYER
614:MOV,r70,1 # 
615:MOV,r80,64 # 
616:MOV,r102,0 # 
617:MOV,r86,1 # 
618:MOV,r122,9 # 
619:MOV,r101,0 # 
620:MOV,r103,256 # 
621:MOV,r105,0 # 
622:MOV,r87,0 # 
623:SUBI,r105,r105,0 # 
624:BRALEZ,2 # 
625:BRAUNCOND,5 # 
626:MOV,r87,0 # 
627:MOV,r480,0 # 
628:LLSHIFT,r480,r480,16 # 
629:OR,r87,r87,r480 # 
630:MOV,r88,9 # 
631:MOV,r92,0 # 
632:MOV,r96,0 # 
633:MOV,r480,32992 ##Start READ_FROM_SCRATCH
634:MOV,r481,208 # 
635:OR,r481,r481,r492 # 
636:STORE,r481,r480 # write process_memory_addr
637:MOV,r481,212 # 
638:OR,r481,r481,r492 # 
639:LOAD,r481,r110 ## End READ_FROM_SCRATCH - read from process_memory_loc 
640:MOV,r99,16383 # 
641:MOV,r480,0 # 
642:LLSHIFT,r480,r480,16 # 
643:OR,r99,r99,r480 # 
644:STOREI,r117,r110 # #Start SET_SIMD_BASE- write to simd_base_addr_reg
645:ADDI,r117,r480,4 # 
646:STOREI,r480,r99 # #write to simd_addr_mask_reg - End SET_SIMD_BASE 
647:NOP # # Instruction not used in Assembly Generation
648:ADDI,r80,r80,1 # 
649:ADD,r102,r102,r86 # 
650:ADDI,r100,r105,0 # 
651:ADDI,r88,r94,0 # 
652:MOV,r486,2048 # 
653:SUB,r88,r88,r486 # 
654:BRALEZ,2 # 
655:MOV,r94,2048 # 
656:ADDI,r67,r72,0 # 
657:ADD,r72,r72,r71 # 
658:MOV,r483,1 # # start TFR_OUT_LAYER_MEM
659:LLSHIFTREG,r483,r483,r97 # 
660:LOAD,r494,r481 # 
661:AND,r481,r481,r483 # 
662:BRAZ,2 # 
663:BRAUNCOND,-3 # 
664:ADDI,r90,r480,0 # 
665:OR,r480,r480,r492 # 
666:ADDI,r480,r482,20 # 
667:MOV,r481,1 # 
668:LLSHIFT,r481,r481,4 # 
669:OR,r481,r481,r74 # 
670:STORE,r482,r481 # #write to mb_config_reg
671:ADDI,r480,r480,32 # 
672:ADDI,r94,r482,0 # 
673:LLSHIFT,r482,r482,16 # 
674:ORI,r482,r482,1 # 
675:STORE,r480,r482 ## write to cmd_wd0_reg 
676:AND,r72,r481,r79 # 
677:ADD,r481,r481,r91 # 
678:ADDI,r480,r480,4 # 
679:STORE,r480,r481 # # write to cmd_wd1_reg 
680:ADDI,r90,r480,0 # 
681:ADDI,r480,r480,0 # 
682:OR,r480,r480,r492 # 
683:ADDI,r94,r481,0 # 
684:STORE,r480,r481 # # write to bt_size_reg
685:MOV,r480,8200 # 
686:OR,r480,r480,r492 # 
687:LOAD,r480,r482 # # read cmd_list_en_Reg 
688:MOV,r483,1 # 
689:LLSHIFTREG,r483,r483,r97 # 
690:NOT,r483,r484 # 
691:AND,r484,r485,r482 # 
692:STORE,r480,r485 # write to cmd_list_en_reg with complementary val
693:OR,r483,r482,r482 # 
694:STORE,r480,r482 ## End TFR_OUT_LAYER_MEM - write to cmd_list_en_reg 
695:MOV,r480,20 # # start CHECK_LAYER_MEM_IOPE 
696:LOADI,r480,r481 # #read mac_cmd_data_fifo_status_reg
697:ANDI,r481,r481,1 # 
698:BRAZ,4 # 
699:MOV,r461,651 # 
700:MOV,r449,2 # 
701:BRAUNCOND,-638 # 
702:MOV,r480,48 # 
703:LOADI,r480,r481 # # read simd_intr_lyr_reg 
704:ANDI,r481,r481,7 # 
705:SUB,r481,r482,r449 # 
706:BRAZ,4 # 
707:MOV,r461,658 # 
708:ADDI,r481,r449,0 # 
709:BRAUNCOND,-646 # 
710:MOV,r480,4 # 
711:LOADI,r480,r472 ##End CHECK_LAYER_MEM_IOPE
712:ADDI,r71,r89,0 # 
713:SUB,r89,r89,r96 # 
714:ADD,r105,r105,r87 # 
715:MOV,r480,44 ## Start Set_IOPE_GAP 
716:LLSHIFT,r123,r481,28 # 
717:LLSHIFT,r94,r482,9 # 
718:OR,r481,r481,r482 # 
719:LLSHIFT,r123,r482,21 # 
720:OR,r481,r481,r482 # 
721:LLSHIFT,r116,r482,22 # 
722:OR,r481,r481,r482 # 
723:STOREI,r480,r481 ## write to gap_cmd2_reg 
724:MOV,r480,0 # 
725:ADD,r105,r483,r89 # 
726:MOV,r484,255 # 
727:LLSHIFT,r484,r484,24 # 
728:AND,r472,r485,r484 # 
729:OR,r483,r483,r485 # 
730:STOREI,r480,r483 # # End Set_IOPE_GAP - write to gap_cmd_reg
731:NOP # # Instruction not used in Assembly Generation
732:ADD,r71,r71,r94 # 
733:SUBI,r88,r88,0 # 
734:BRALEZ,2 # 
735:BRAUNCOND,-84 # 
736:MOV,r480,12 # 
737:LOADI,r480,r481 # 
738:ANDI,r481,r481,1 # 
739:BRANZ,2 # 
740:BRAUNCOND,-3 #  # End CHECK_SIMD_STATUS
741:ADDI,r106,r106,9 # 
742:MOV,r70,0 # 
743:MOV,r480,12 # 
744:LOADI,r480,r481 # #read simd_wbuf_addr_status_reg 
745:ANDI,r481,r481,1 # 
746:BRANZ,2 # 
747:BRAUNCOND,-3 # End END_BLOCK 
748:MOV,r480,1044 # 
749:OR,r480,r480,r492 # 
750:STORE,r480,r83 # # End INCREMENT_OBUF_COUNTER  
751:MOV,r483,1 # 
752:LLSHIFTREG,r483,r483,r97 # 
753:LOAD,r494,r481 # 
754:AND,r481,r481,r483 # 
755:BRAZ,2 # 
756:BRAUNCOND,-3 # # End CHECK_OUTPUT_DMA_BUSY
757:MOV,r78,1 # 
758:MOV,r86,1 # 
759:MOV,r482,1048 ## Start SEND_SYNC_NEXT 
760:OR,r482,r482,r492 # 
761:STORE,r482,r83 # # End SEND_SYNC_NEXT
762:SUBI,r86,r86,1 # 
763:BRALEZ,2 # 
764:BRAUNCOND,-5 # 
765:ADDI,r78,r102,0 # 
766:OR,r98,r480,r492 # 
767:STORE,r480,r78 # 
768:MOV,r481,1028 # 
769:OR,r481,r481,r492 # 
770:STORE,r481,r83 # # End POP_SYNC - write to ib_decr_reg
771:MOV,r481,1032 ## Start SEND_SYNC_PREV 
772:OR,r481,r481,r492 # 
773:STORE,r481,r83 ## End SEND_SYNC_PREV - write to asq_send_reg
774:SUBI,r102,r102,1 # 
775:BRALEZ,2 # 
776:BRAUNCOND,-10 # 
777:ADD,r82,r82,r122 # 
778:ADDI,r67,r67,9 # 
779:ADD,r100,r100,r122 # 
780:ADDI,r81,r81,1 # 
781:SUBI,r66,r66,1 # 
782:BRALEZ,2 # 
783:BRAUNCOND,-176 # 
784:ADD,r91,r91,r72 # 
785:MOV,r92,2 # 
786:MOV,r93,1 # 
787:MOV,r94,1304 # 
788:MOV,r95,1 # 
789:MOV,r97,128 # 
790:MOV,r480,784 # 
791:LLSHIFT,r480,r480,16 # 
792:OR,r97,r97,r480 # 
793:NOP ##Start SET_UP_NEXT 
794:NOP # 
795:NOP # 
796:MOV,r461,515 # 
797:MOV,r449,1 # 
798:BRAUNCOND,-735 # #Branch to the same layer, instruction start location
799:NOP # 
800:NOP # 
801:NOP # 
802:NOP # 
803:HALT # 
804:NOP ##End SET_UP_NEXT 
805:MOV,r164,0 # 
806:MOV,r131,0 # 
807:MOV,r170,0 # 
808:MOV,r176,0 # 
809:MOV,r182,0 # 
810:MOV,r480,0 # 
811:LLSHIFT,r480,r480,16 # 
812:OR,r182,r182,r480 # 
813:MOV,r171,0 # 
814:MOV,r177,0 # 
815:MOV,r183,0 # 
816:MOV,r480,0 # 
817:LLSHIFT,r480,r480,16 # 
818:OR,r183,r183,r480 # 
819:MOV,r172,0 # 
820:MOV,r178,0 # 
821:MOV,r184,0 # 
822:MOV,r480,0 # 
823:LLSHIFT,r480,r480,16 # 
824:OR,r184,r184,r480 # 
825:MOV,r173,0 # 
826:MOV,r179,0 # 
827:MOV,r185,0 # 
828:MOV,r480,0 # 
829:LLSHIFT,r480,r480,16 # 
830:OR,r185,r185,r480 # 
831:MOV,r480,33248 ##Start READ_FROM_SCRATCH
832:MOV,r481,208 # 
833:OR,r481,r481,r492 # 
834:STORE,r481,r480 # write process_memory_addr
835:MOV,r481,212 # 
836:OR,r481,r481,r492 # 
837:LOAD,r481,r170 ## End READ_FROM_SCRATCH - read from process_memory_loc 
838:MOV,r480,33252 ##Start READ_FROM_SCRATCH
839:MOV,r481,208 # 
840:OR,r481,r481,r492 # 
841:STORE,r481,r480 # write process_memory_addr
842:MOV,r481,212 # 
843:OR,r481,r481,r492 # 
844:LOAD,r481,r176 ## End READ_FROM_SCRATCH - read from process_memory_loc 
845:MOV,r480,33256 ##Start READ_FROM_SCRATCH
846:MOV,r481,208 # 
847:OR,r481,r481,r492 # 
848:STORE,r481,r480 # write process_memory_addr
849:MOV,r481,212 # 
850:OR,r481,r481,r492 # 
851:LOAD,r481,r182 ## End READ_FROM_SCRATCH - read from process_memory_loc 
852:MOV,r133,0 # 
853:MOV,r150,1 # 
854:MOV,r169,256 # 
855:MOV,r153,0 # 
856:MOV,r155,0 # 
857:ADDI,r150,r484,0 # # Start SET_MULTICAST_ADDR
858:SUBI,r484,r484,1 # 
859:BRALEZ,69 # 
860:ADDI,r169,r480,0 # 
861:OR,r480,r480,r492 # 
862:ADDI,r150,r484,1 # 
863:SUBI,r155,r485,0 # 
864:BRALEZ,8 # # Jump to first dest_detail
865:SUBI,r155,r485,1 # 
866:BRALEZ,19 # # Jump to second dest detail 
867:SUBI,r155,r485,2 # 
868:BRALEZ,31 # # Jump to third dest detail 
869:SUBI,r155,r485,3 # 
870:BRALEZ,43 # # Jumpt to fourth dest detail 
871:BRAUNCOND,57 # 
872:AND,r176,r481,r170 # 
873:ADDI,r182,r481,0 # 
874:SUBI,r484,r484,1 # 
875:BRALEZ,4 # 
876:ORI,r481,r481,1 # 
877:ADDI,r484,r484,0 # 
878:BRAUNCOND,2 # 
879:MOV,r481,0 # 
880:STORE,r480,r481 # 
881:ADDI,r480,r481,4 # 
882:STORE,r481,r176 # 
883:ADDI,r480,r481,8 # 
884:STORE,r481,r170 # 
885:ADDI,r480,r486,16 # 
886:AND,r177,r481,r171 # 
887:ADDI,r183,r481,0 # 
888:SUBI,r484,r484,1 # 
889:BRALEZ,4 # 
890:ORI,r481,r481,1 # 
891:ADDI,r484,r484,0 # 
892:BRAUNCOND,2 # 
893:MOV,r481,0 # 
894:STORE,r486,r481 # 
895:ADDI,r486,r481,4 # 
896:STORE,r481,r177 # 
897:ADDI,r486,r481,8 # 
898:STORE,r481,r171 # 
899:ADDI,r480,r486,32 # 
900:AND,r178,r481,r172 # 
901:ADDI,r184,r481,0 # 
902:SUBI,r484,r484,1 # 
903:BRALEZ,4 # 
904:ORI,r481,r481,1 # 
905:ADDI,r484,r484,0 # 
906:BRAUNCOND,2 # 
907:MOV,r481,0 # 
908:STORE,r486,r481 # 
909:ADDI,r486,r481,4 # 
910:STORE,r481,r178 # 
911:ADDI,r486,r481,8 # 
912:STORE,r481,r172 # 
913:ADDI,r480,r486,48 # 
914:AND,r179,r481,r173 # 
915:ADDI,r185,r481,0 # 
916:SUBI,r484,r484,1 # 
917:BRALEZ,4 # 
918:ORI,r481,r481,1 # 
919:ADDI,r484,r484,0 # 
920:BRAUNCOND,2 # 
921:MOV,r481,0 # 
922:STORE,r486,r481 # 
923:ADDI,r486,r481,4 # 
924:STORE,r481,r179 # 
925:ADDI,r486,r481,8 # 
926:STORE,r481,r173 # 
927:NOP # # End SET_MULTICAST_ADDR
928:MOV,r155,32768 # 
929:MOV,r480,768 # 
930:LLSHIFT,r480,r480,16 # 
931:OR,r155,r155,r480 # 
932:MOV,r161,128 # 
933:MOV,r480,784 # 
934:LLSHIFT,r480,r480,16 # 
935:OR,r161,r161,r480 # 
936:MOV,r480,0 # # start STORE_TO_MEMORY 
937:STORE,r161,r480 # # end STORE_TO_MEMORY - write data to address
938:MOV,r129,9 # 
939:MOV,r128,0 # 
940:MOV,r138,2 # 
941:MOV,r139,0 # 
942:MOV,r140,1 # 
943:MOV,r141,8 # 
944:MOV,r154,9472 # 
945:MOV,r143,16383 # 
946:MOV,r147,4 # 
947:MOV,r148,1312 # 
948:MOV,r161,2 # 
949:MOV,r162,1396 # 
950:MOV,r168,0 # 
951:MOV,r175,1023 # 
952:MOV,r187,1 # 
953:MOV,r181,8992 # 
954:MOV,r180,128 # 
955:ADDI,r181,r480,0 ## Start SET_LYR_REG 
956:OR,r480,r480,r492 # 
957:STORE,r480,r143 # # write to addr_mask_reg
958:ADDI,r480,r483,4 # 
959:STORE,r483,r155 # # write to base_addr_reg
960:LLSHIFT,r128,r482,16 # 
961:OR,r482,r482,r180 # 
962:ADDI,r480,r483,8 # 
963:STORE,r483,r482 # #wite to addr_stp_reg
964:MOV,r480,8228 # 
965:OR,r480,r480,r492 # 
966:LOAD,r480,r481 # 
967:OR,r481,r481,r128 # 
968:STORE,r480,r481 # # end SET_OUTPUT_LYR_REG - write to xbar_grp_reg
969:MOV,r180,336 # 
970:MOV,r181,96 # 
971:MOV,r130,0 # 
972:MOV,r180,1024 # 
973:MOV,r146,0 # 
974:MOV,r130,3 # 
975:MOV,r145,0 # 
976:MOV,r135,0 # 
977:ADDI,r145,r132,0 # 
978:ADDI,r132,r132,1 # 
979:MOV,r133,1 # 
980:ADDI,r148,r482,84 # # Start START_INPUT_TFR_LAYER
981:OR,r482,r482,r492 # 
982:STORE,r482,r133 # # End START_INPUT_TFR_LAYER
983:MOV,r134,1 # 
984:MOV,r144,128 # 
985:MOV,r166,0 # 
986:MOV,r150,1 # 
987:MOV,r186,9 # 
988:MOV,r165,0 # 
989:MOV,r167,256 # 
990:MOV,r169,0 # 
991:MOV,r151,0 # 
992:SUBI,r169,r169,0 # 
993:BRALEZ,2 # 
994:BRAUNCOND,5 # 
995:MOV,r151,0 # 
996:MOV,r480,0 # 
997:LLSHIFT,r480,r480,16 # 
998:OR,r151,r151,r480 # 
999:MOV,r152,9 # 
1000:MOV,r156,0 # 
1001:MOV,r160,0 # 
1002:MOV,r480,33008 ##Start READ_FROM_SCRATCH
1003:MOV,r481,208 # 
1004:OR,r481,r481,r492 # 
1005:STORE,r481,r480 # write process_memory_addr
1006:MOV,r481,212 # 
1007:OR,r481,r481,r492 # 
1008:LOAD,r481,r174 ## End READ_FROM_SCRATCH - read from process_memory_loc 
1009:MOV,r163,16383 # 
1010:MOV,r480,0 # 
1011:LLSHIFT,r480,r480,16 # 
1012:OR,r163,r163,r480 # 
1013:STOREI,r181,r174 # #Start SET_SIMD_BASE- write to simd_base_addr_reg
1014:ADDI,r181,r480,4 # 
1015:STOREI,r480,r163 # #write to simd_addr_mask_reg - End SET_SIMD_BASE 
1016:NOP # # Instruction not used in Assembly Generation
1017:ADDI,r144,r144,1 # 
1018:ADD,r166,r166,r150 # 
1019:ADDI,r164,r169,0 # 
1020:ADDI,r152,r158,0 # 
1021:MOV,r486,2048 # 
1022:SUB,r152,r152,r486 # 
1023:BRALEZ,2 # 
1024:MOV,r158,2048 # 
1025:ADDI,r131,r136,0 # 
1026:ADD,r136,r136,r135 # 
1027:MOV,r483,1 # # start TFR_OUT_LAYER_MEM
1028:LLSHIFTREG,r483,r483,r161 # 
1029:LOAD,r494,r481 # 
1030:AND,r481,r481,r483 # 
1031:BRAZ,2 # 
1032:BRAUNCOND,-3 # 
1033:ADDI,r154,r480,0 # 
1034:OR,r480,r480,r492 # 
1035:ADDI,r480,r482,20 # 
1036:MOV,r481,1 # 
1037:LLSHIFT,r481,r481,4 # 
1038:OR,r481,r481,r138 # 
1039:STORE,r482,r481 # #write to mb_config_reg
1040:ADDI,r480,r480,32 # 
1041:ADDI,r158,r482,0 # 
1042:LLSHIFT,r482,r482,16 # 
1043:ORI,r482,r482,1 # 
1044:STORE,r480,r482 ## write to cmd_wd0_reg 
1045:AND,r136,r481,r143 # 
1046:ADD,r481,r481,r155 # 
1047:ADDI,r480,r480,4 # 
1048:STORE,r480,r481 # # write to cmd_wd1_reg 
1049:ADDI,r154,r480,0 # 
1050:ADDI,r480,r480,0 # 
1051:OR,r480,r480,r492 # 
1052:ADDI,r158,r481,0 # 
1053:STORE,r480,r481 # # write to bt_size_reg
1054:MOV,r480,8200 # 
1055:OR,r480,r480,r492 # 
1056:LOAD,r480,r482 # # read cmd_list_en_Reg 
1057:MOV,r483,1 # 
1058:LLSHIFTREG,r483,r483,r161 # 
1059:NOT,r483,r484 # 
1060:AND,r484,r485,r482 # 
1061:STORE,r480,r485 # write to cmd_list_en_reg with complementary val
1062:OR,r483,r482,r482 # 
1063:STORE,r480,r482 ## End TFR_OUT_LAYER_MEM - write to cmd_list_en_reg 
1064:MOV,r480,20 # # start CHECK_LAYER_MEM_IOPE 
1065:LOADI,r480,r481 # #read mac_cmd_data_fifo_status_reg
1066:ANDI,r481,r481,1 # 
1067:BRAZ,4 # 
1068:MOV,r462,1017 # 
1069:MOV,r449,3 # 
1070:BRAUNCOND,-1007 # 
1071:MOV,r480,48 # 
1072:LOADI,r480,r481 # # read simd_intr_lyr_reg 
1073:ANDI,r481,r481,7 # 
1074:SUB,r481,r482,r449 # 
1075:BRAZ,4 # 
1076:MOV,r462,1024 # 
1077:ADDI,r481,r449,0 # 
1078:BRAUNCOND,-1015 # 
1079:MOV,r480,4 # 
1080:LOADI,r480,r472 ##End CHECK_LAYER_MEM_IOPE
1081:ADDI,r135,r153,0 # 
1082:SUB,r153,r153,r160 # 
1083:ADD,r169,r169,r151 # 
1084:MOV,r480,44 ## Start Set_IOPE_GAP 
1085:LLSHIFT,r187,r481,28 # 
1086:LLSHIFT,r158,r482,9 # 
1087:OR,r481,r481,r482 # 
1088:LLSHIFT,r187,r482,21 # 
1089:OR,r481,r481,r482 # 
1090:LLSHIFT,r180,r482,22 # 
1091:OR,r481,r481,r482 # 
1092:STOREI,r480,r481 ## write to gap_cmd2_reg 
1093:MOV,r480,0 # 
1094:ADD,r169,r483,r153 # 
1095:MOV,r484,255 # 
1096:LLSHIFT,r484,r484,24 # 
1097:AND,r472,r485,r484 # 
1098:OR,r483,r483,r485 # 
1099:STOREI,r480,r483 # # End Set_IOPE_GAP - write to gap_cmd_reg
1100:NOP # # Instruction not used in Assembly Generation
1101:ADD,r135,r135,r158 # 
1102:SUBI,r152,r152,0 # 
1103:BRALEZ,2 # 
1104:BRAUNCOND,-84 # 
1105:MOV,r480,12 # 
1106:LOADI,r480,r481 # 
1107:ANDI,r481,r481,1 # 
1108:BRANZ,2 # 
1109:BRAUNCOND,-3 #  # End CHECK_SIMD_STATUS
1110:ADDI,r170,r170,9 # 
1111:MOV,r134,0 # 
1112:MOV,r480,12 # 
1113:LOADI,r480,r481 # #read simd_wbuf_addr_status_reg 
1114:ANDI,r481,r481,1 # 
1115:BRANZ,2 # 
1116:BRAUNCOND,-3 # End END_BLOCK 
1117:MOV,r480,1044 # 
1118:OR,r480,r480,r492 # 
1119:STORE,r480,r147 # # End INCREMENT_OBUF_COUNTER  
1120:MOV,r483,1 # 
1121:LLSHIFTREG,r483,r483,r161 # 
1122:LOAD,r494,r481 # 
1123:AND,r481,r481,r483 # 
1124:BRAZ,2 # 
1125:BRAUNCOND,-3 # # End CHECK_OUTPUT_DMA_BUSY
1126:MOV,r142,1 # 
1127:MOV,r150,1 # 
1128:MOV,r482,1048 ## Start SEND_SYNC_NEXT 
1129:OR,r482,r482,r492 # 
1130:STORE,r482,r147 # # End SEND_SYNC_NEXT
1131:SUBI,r150,r150,1 # 
1132:BRALEZ,2 # 
1133:BRAUNCOND,-5 # 
1134:ADDI,r142,r166,0 # 
1135:OR,r162,r480,r492 # 
1136:STORE,r480,r142 # 
1137:MOV,r481,1028 # 
1138:OR,r481,r481,r492 # 
1139:STORE,r481,r147 # # End POP_SYNC - write to ib_decr_reg
1140:MOV,r481,1032 ## Start SEND_SYNC_PREV 
1141:OR,r481,r481,r492 # 
1142:STORE,r481,r147 ## End SEND_SYNC_PREV - write to asq_send_reg
1143:SUBI,r166,r166,1 # 
1144:BRALEZ,2 # 
1145:BRAUNCOND,-10 # 
1146:ADD,r146,r146,r186 # 
1147:ADDI,r131,r131,9 # 
1148:ADD,r164,r164,r186 # 
1149:ADDI,r145,r145,1 # 
1150:SUBI,r130,r130,1 # 
1151:BRALEZ,2 # 
1152:BRAUNCOND,-176 # 
1153:ADD,r155,r155,r136 # 
1154:MOV,r156,4 # 
1155:MOV,r157,2 # 
1156:MOV,r158,1416 # 
1157:MOV,r159,1 # 
1158:MOV,r161,128 # 
1159:MOV,r480,784 # 
1160:LLSHIFT,r480,r480,16 # 
1161:OR,r161,r161,r480 # 
1162:NOP ##Start SET_UP_NEXT 
1163:NOP # 
1164:NOP # 
1165:MOV,r462,881 # 
1166:MOV,r449,2 # 
1167:BRAUNCOND,-1104 # #Branch to the same layer, instruction start location
1168:NOP # 
1169:NOP # 
1170:NOP # 
1171:NOP # 
1172:HALT # 
1173:NOP ##End SET_UP_NEXT 
1174:MOV,r463,1124 # 
1175:MOV,r449,4 # 
1176:BRAUNCOND,-1113 # 
1177:NOP # 
1178:NOP # 
1179:NOP # 
1180:NOP ## End CONTEXT SWITCH  - context switch
1181:MOV,r464,1128 # 
1182:MOV,r449,5 # 
1183:BRAUNCOND,-1120 # 
1184:NOP # 
1185:NOP # 
1186:NOP # 
1187:NOP ## End CONTEXT SWITCH  - context switch
1188:MOV,r465,1132 # 
1189:MOV,r449,6 # 
1190:BRAUNCOND,-1127 # 
1191:NOP # 
1192:NOP # 
1193:NOP # 
1194:NOP ## End CONTEXT SWITCH  - context switch
