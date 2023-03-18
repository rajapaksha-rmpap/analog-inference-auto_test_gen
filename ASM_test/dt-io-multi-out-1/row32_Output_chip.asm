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
23:MOV,r451,392 # # store proc1 start loc
24:MOV,r461,392 # # store proc1 last loc  
25:MOV,r452,396 # # store proc2 start loc
26:MOV,r462,396 # # store proc2 last loc  
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
200:MOV,r1,24 # 
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
236:MOV,r2,8 # 
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
249:MOV,r58,24 # 
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
261:MOV,r24,24 # 
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
372:ADDI,r42,r42,24 # 
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
409:ADDI,r3,r3,24 # 
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
436:MOV,r461,392 # 
437:MOV,r449,2 # 
438:BRAUNCOND,-375 # 
439:NOP # 
440:NOP # 
441:NOP # 
442:NOP ## End CONTEXT SWITCH  - context switch
443:MOV,r462,396 # 
444:MOV,r449,3 # 
445:BRAUNCOND,-382 # 
446:NOP # 
447:NOP # 
448:NOP # 
449:NOP ## End CONTEXT SWITCH  - context switch