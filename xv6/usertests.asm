
_usertests:     file format elf32-i386


Disassembly of section .text:

00000000 <opentest>:

// simple file system tests

void
opentest(void)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 ec 28             	sub    $0x28,%esp
  int fd;

  printf(stdout, "open test\n");
       6:	a1 f4 63 00 00       	mov    0x63f4,%eax
       b:	c7 44 24 04 b2 46 00 	movl   $0x46b2,0x4(%esp)
      12:	00 
      13:	89 04 24             	mov    %eax,(%esp)
      16:	e8 b2 42 00 00       	call   42cd <printf>
  fd = open("echo", 0);
      1b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
      22:	00 
      23:	c7 04 24 9c 46 00 00 	movl   $0x469c,(%esp)
      2a:	e8 4e 41 00 00       	call   417d <open>
      2f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
      32:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
      36:	79 21                	jns    59 <opentest+0x59>
    printf(stdout, "open echo failed!\n");
      38:	a1 f4 63 00 00       	mov    0x63f4,%eax
      3d:	c7 44 24 04 bd 46 00 	movl   $0x46bd,0x4(%esp)
      44:	00 
      45:	89 04 24             	mov    %eax,(%esp)
      48:	e8 80 42 00 00       	call   42cd <printf>
    exit(1);
      4d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
      54:	e8 e4 40 00 00       	call   413d <exit>
  }
  close(fd);
      59:	8b 45 f4             	mov    -0xc(%ebp),%eax
      5c:	89 04 24             	mov    %eax,(%esp)
      5f:	e8 01 41 00 00       	call   4165 <close>
  fd = open("doesnotexist", 0);
      64:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
      6b:	00 
      6c:	c7 04 24 d0 46 00 00 	movl   $0x46d0,(%esp)
      73:	e8 05 41 00 00       	call   417d <open>
      78:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
      7b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
      7f:	78 21                	js     a2 <opentest+0xa2>
    printf(stdout, "open doesnotexist succeeded!\n");
      81:	a1 f4 63 00 00       	mov    0x63f4,%eax
      86:	c7 44 24 04 dd 46 00 	movl   $0x46dd,0x4(%esp)
      8d:	00 
      8e:	89 04 24             	mov    %eax,(%esp)
      91:	e8 37 42 00 00       	call   42cd <printf>
    exit(1);
      96:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
      9d:	e8 9b 40 00 00       	call   413d <exit>
  }
  printf(stdout, "open test ok\n");
      a2:	a1 f4 63 00 00       	mov    0x63f4,%eax
      a7:	c7 44 24 04 fb 46 00 	movl   $0x46fb,0x4(%esp)
      ae:	00 
      af:	89 04 24             	mov    %eax,(%esp)
      b2:	e8 16 42 00 00       	call   42cd <printf>
}
      b7:	c9                   	leave  
      b8:	c3                   	ret    

000000b9 <writetest>:

void
writetest(void)
{
      b9:	55                   	push   %ebp
      ba:	89 e5                	mov    %esp,%ebp
      bc:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int i;

  printf(stdout, "small file test\n");
      bf:	a1 f4 63 00 00       	mov    0x63f4,%eax
      c4:	c7 44 24 04 09 47 00 	movl   $0x4709,0x4(%esp)
      cb:	00 
      cc:	89 04 24             	mov    %eax,(%esp)
      cf:	e8 f9 41 00 00       	call   42cd <printf>
  fd = open("small", O_CREATE|O_RDWR);
      d4:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
      db:	00 
      dc:	c7 04 24 1a 47 00 00 	movl   $0x471a,(%esp)
      e3:	e8 95 40 00 00       	call   417d <open>
      e8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd >= 0){
      eb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
      ef:	78 21                	js     112 <writetest+0x59>
    printf(stdout, "creat small succeeded; ok\n");
      f1:	a1 f4 63 00 00       	mov    0x63f4,%eax
      f6:	c7 44 24 04 20 47 00 	movl   $0x4720,0x4(%esp)
      fd:	00 
      fe:	89 04 24             	mov    %eax,(%esp)
     101:	e8 c7 41 00 00       	call   42cd <printf>
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit(1);
  }
  for(i = 0; i < 100; i++){
     106:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     10d:	e9 b5 00 00 00       	jmp    1c7 <writetest+0x10e>
  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
     112:	a1 f4 63 00 00       	mov    0x63f4,%eax
     117:	c7 44 24 04 3b 47 00 	movl   $0x473b,0x4(%esp)
     11e:	00 
     11f:	89 04 24             	mov    %eax,(%esp)
     122:	e8 a6 41 00 00       	call   42cd <printf>
    exit(1);
     127:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     12e:	e8 0a 40 00 00       	call   413d <exit>
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     133:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     13a:	00 
     13b:	c7 44 24 04 57 47 00 	movl   $0x4757,0x4(%esp)
     142:	00 
     143:	8b 45 f0             	mov    -0x10(%ebp),%eax
     146:	89 04 24             	mov    %eax,(%esp)
     149:	e8 0f 40 00 00       	call   415d <write>
     14e:	83 f8 0a             	cmp    $0xa,%eax
     151:	74 28                	je     17b <writetest+0xc2>
      printf(stdout, "error: write aa %d new file failed\n", i);
     153:	a1 f4 63 00 00       	mov    0x63f4,%eax
     158:	8b 55 f4             	mov    -0xc(%ebp),%edx
     15b:	89 54 24 08          	mov    %edx,0x8(%esp)
     15f:	c7 44 24 04 64 47 00 	movl   $0x4764,0x4(%esp)
     166:	00 
     167:	89 04 24             	mov    %eax,(%esp)
     16a:	e8 5e 41 00 00       	call   42cd <printf>
      exit(1);
     16f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     176:	e8 c2 3f 00 00       	call   413d <exit>
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     17b:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     182:	00 
     183:	c7 44 24 04 88 47 00 	movl   $0x4788,0x4(%esp)
     18a:	00 
     18b:	8b 45 f0             	mov    -0x10(%ebp),%eax
     18e:	89 04 24             	mov    %eax,(%esp)
     191:	e8 c7 3f 00 00       	call   415d <write>
     196:	83 f8 0a             	cmp    $0xa,%eax
     199:	74 28                	je     1c3 <writetest+0x10a>
      printf(stdout, "error: write bb %d new file failed\n", i);
     19b:	a1 f4 63 00 00       	mov    0x63f4,%eax
     1a0:	8b 55 f4             	mov    -0xc(%ebp),%edx
     1a3:	89 54 24 08          	mov    %edx,0x8(%esp)
     1a7:	c7 44 24 04 94 47 00 	movl   $0x4794,0x4(%esp)
     1ae:	00 
     1af:	89 04 24             	mov    %eax,(%esp)
     1b2:	e8 16 41 00 00       	call   42cd <printf>
      exit(1);
     1b7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     1be:	e8 7a 3f 00 00       	call   413d <exit>
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit(1);
  }
  for(i = 0; i < 100; i++){
     1c3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     1c7:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
     1cb:	0f 8e 62 ff ff ff    	jle    133 <writetest+0x7a>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
      exit(1);
    }
  }
  printf(stdout, "writes ok\n");
     1d1:	a1 f4 63 00 00       	mov    0x63f4,%eax
     1d6:	c7 44 24 04 b8 47 00 	movl   $0x47b8,0x4(%esp)
     1dd:	00 
     1de:	89 04 24             	mov    %eax,(%esp)
     1e1:	e8 e7 40 00 00       	call   42cd <printf>
  close(fd);
     1e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
     1e9:	89 04 24             	mov    %eax,(%esp)
     1ec:	e8 74 3f 00 00       	call   4165 <close>
  fd = open("small", O_RDONLY);
     1f1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     1f8:	00 
     1f9:	c7 04 24 1a 47 00 00 	movl   $0x471a,(%esp)
     200:	e8 78 3f 00 00       	call   417d <open>
     205:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd >= 0){
     208:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     20c:	78 3e                	js     24c <writetest+0x193>
    printf(stdout, "open small succeeded ok\n");
     20e:	a1 f4 63 00 00       	mov    0x63f4,%eax
     213:	c7 44 24 04 c3 47 00 	movl   $0x47c3,0x4(%esp)
     21a:	00 
     21b:	89 04 24             	mov    %eax,(%esp)
     21e:	e8 aa 40 00 00       	call   42cd <printf>
  } else {
    printf(stdout, "error: open small failed!\n");
    exit(1);
  }
  i = read(fd, buf, 2000);
     223:	c7 44 24 08 d0 07 00 	movl   $0x7d0,0x8(%esp)
     22a:	00 
     22b:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
     232:	00 
     233:	8b 45 f0             	mov    -0x10(%ebp),%eax
     236:	89 04 24             	mov    %eax,(%esp)
     239:	e8 17 3f 00 00       	call   4155 <read>
     23e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(i == 2000){
     241:	81 7d f4 d0 07 00 00 	cmpl   $0x7d0,-0xc(%ebp)
     248:	75 55                	jne    29f <writetest+0x1e6>
     24a:	eb 21                	jmp    26d <writetest+0x1b4>
  close(fd);
  fd = open("small", O_RDONLY);
  if(fd >= 0){
    printf(stdout, "open small succeeded ok\n");
  } else {
    printf(stdout, "error: open small failed!\n");
     24c:	a1 f4 63 00 00       	mov    0x63f4,%eax
     251:	c7 44 24 04 dc 47 00 	movl   $0x47dc,0x4(%esp)
     258:	00 
     259:	89 04 24             	mov    %eax,(%esp)
     25c:	e8 6c 40 00 00       	call   42cd <printf>
    exit(1);
     261:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     268:	e8 d0 3e 00 00       	call   413d <exit>
  }
  i = read(fd, buf, 2000);
  if(i == 2000){
    printf(stdout, "read succeeded ok\n");
     26d:	a1 f4 63 00 00       	mov    0x63f4,%eax
     272:	c7 44 24 04 f7 47 00 	movl   $0x47f7,0x4(%esp)
     279:	00 
     27a:	89 04 24             	mov    %eax,(%esp)
     27d:	e8 4b 40 00 00       	call   42cd <printf>
  } else {
    printf(stdout, "read failed\n");
    exit(1);
  }
  close(fd);
     282:	8b 45 f0             	mov    -0x10(%ebp),%eax
     285:	89 04 24             	mov    %eax,(%esp)
     288:	e8 d8 3e 00 00       	call   4165 <close>

  if(unlink("small") < 0){
     28d:	c7 04 24 1a 47 00 00 	movl   $0x471a,(%esp)
     294:	e8 f4 3e 00 00       	call   418d <unlink>
     299:	85 c0                	test   %eax,%eax
     29b:	79 44                	jns    2e1 <writetest+0x228>
     29d:	eb 21                	jmp    2c0 <writetest+0x207>
  }
  i = read(fd, buf, 2000);
  if(i == 2000){
    printf(stdout, "read succeeded ok\n");
  } else {
    printf(stdout, "read failed\n");
     29f:	a1 f4 63 00 00       	mov    0x63f4,%eax
     2a4:	c7 44 24 04 0a 48 00 	movl   $0x480a,0x4(%esp)
     2ab:	00 
     2ac:	89 04 24             	mov    %eax,(%esp)
     2af:	e8 19 40 00 00       	call   42cd <printf>
    exit(1);
     2b4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     2bb:	e8 7d 3e 00 00       	call   413d <exit>
  }
  close(fd);

  if(unlink("small") < 0){
    printf(stdout, "unlink small failed\n");
     2c0:	a1 f4 63 00 00       	mov    0x63f4,%eax
     2c5:	c7 44 24 04 17 48 00 	movl   $0x4817,0x4(%esp)
     2cc:	00 
     2cd:	89 04 24             	mov    %eax,(%esp)
     2d0:	e8 f8 3f 00 00       	call   42cd <printf>
    exit(1);
     2d5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     2dc:	e8 5c 3e 00 00       	call   413d <exit>
  }
  printf(stdout, "small file test ok\n");
     2e1:	a1 f4 63 00 00       	mov    0x63f4,%eax
     2e6:	c7 44 24 04 2c 48 00 	movl   $0x482c,0x4(%esp)
     2ed:	00 
     2ee:	89 04 24             	mov    %eax,(%esp)
     2f1:	e8 d7 3f 00 00       	call   42cd <printf>
}
     2f6:	c9                   	leave  
     2f7:	c3                   	ret    

000002f8 <writetest1>:

void
writetest1(void)
{
     2f8:	55                   	push   %ebp
     2f9:	89 e5                	mov    %esp,%ebp
     2fb:	83 ec 28             	sub    $0x28,%esp
  int i, fd, n;

  printf(stdout, "big files test\n");
     2fe:	a1 f4 63 00 00       	mov    0x63f4,%eax
     303:	c7 44 24 04 40 48 00 	movl   $0x4840,0x4(%esp)
     30a:	00 
     30b:	89 04 24             	mov    %eax,(%esp)
     30e:	e8 ba 3f 00 00       	call   42cd <printf>

  fd = open("big", O_CREATE|O_RDWR);
     313:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
     31a:	00 
     31b:	c7 04 24 50 48 00 00 	movl   $0x4850,(%esp)
     322:	e8 56 3e 00 00       	call   417d <open>
     327:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
     32a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     32e:	79 21                	jns    351 <writetest1+0x59>
    printf(stdout, "error: creat big failed!\n");
     330:	a1 f4 63 00 00       	mov    0x63f4,%eax
     335:	c7 44 24 04 54 48 00 	movl   $0x4854,0x4(%esp)
     33c:	00 
     33d:	89 04 24             	mov    %eax,(%esp)
     340:	e8 88 3f 00 00       	call   42cd <printf>
    exit(1);
     345:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     34c:	e8 ec 3d 00 00       	call   413d <exit>
  }

  for(i = 0; i < MAXFILE; i++){
     351:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     358:	eb 58                	jmp    3b2 <writetest1+0xba>
    ((int*)buf)[0] = i;
     35a:	b8 e0 8b 00 00       	mov    $0x8be0,%eax
     35f:	8b 55 f4             	mov    -0xc(%ebp),%edx
     362:	89 10                	mov    %edx,(%eax)
    if(write(fd, buf, 512) != 512){
     364:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
     36b:	00 
     36c:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
     373:	00 
     374:	8b 45 ec             	mov    -0x14(%ebp),%eax
     377:	89 04 24             	mov    %eax,(%esp)
     37a:	e8 de 3d 00 00       	call   415d <write>
     37f:	3d 00 02 00 00       	cmp    $0x200,%eax
     384:	74 28                	je     3ae <writetest1+0xb6>
      printf(stdout, "error: write big file failed\n", i);
     386:	a1 f4 63 00 00       	mov    0x63f4,%eax
     38b:	8b 55 f4             	mov    -0xc(%ebp),%edx
     38e:	89 54 24 08          	mov    %edx,0x8(%esp)
     392:	c7 44 24 04 6e 48 00 	movl   $0x486e,0x4(%esp)
     399:	00 
     39a:	89 04 24             	mov    %eax,(%esp)
     39d:	e8 2b 3f 00 00       	call   42cd <printf>
      exit(1);
     3a2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     3a9:	e8 8f 3d 00 00       	call   413d <exit>
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
    exit(1);
  }

  for(i = 0; i < MAXFILE; i++){
     3ae:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     3b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     3b5:	3d 8b 00 00 00       	cmp    $0x8b,%eax
     3ba:	76 9e                	jbe    35a <writetest1+0x62>
      printf(stdout, "error: write big file failed\n", i);
      exit(1);
    }
  }

  close(fd);
     3bc:	8b 45 ec             	mov    -0x14(%ebp),%eax
     3bf:	89 04 24             	mov    %eax,(%esp)
     3c2:	e8 9e 3d 00 00       	call   4165 <close>

  fd = open("big", O_RDONLY);
     3c7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     3ce:	00 
     3cf:	c7 04 24 50 48 00 00 	movl   $0x4850,(%esp)
     3d6:	e8 a2 3d 00 00       	call   417d <open>
     3db:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
     3de:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     3e2:	79 21                	jns    405 <writetest1+0x10d>
    printf(stdout, "error: open big failed!\n");
     3e4:	a1 f4 63 00 00       	mov    0x63f4,%eax
     3e9:	c7 44 24 04 8c 48 00 	movl   $0x488c,0x4(%esp)
     3f0:	00 
     3f1:	89 04 24             	mov    %eax,(%esp)
     3f4:	e8 d4 3e 00 00       	call   42cd <printf>
    exit(1);
     3f9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     400:	e8 38 3d 00 00       	call   413d <exit>
  }

  n = 0;
     405:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(;;){
    i = read(fd, buf, 512);
     40c:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
     413:	00 
     414:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
     41b:	00 
     41c:	8b 45 ec             	mov    -0x14(%ebp),%eax
     41f:	89 04 24             	mov    %eax,(%esp)
     422:	e8 2e 3d 00 00       	call   4155 <read>
     427:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(i == 0){
     42a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     42e:	75 53                	jne    483 <writetest1+0x18b>
      if(n == MAXFILE - 1){
     430:	81 7d f0 8b 00 00 00 	cmpl   $0x8b,-0x10(%ebp)
     437:	75 28                	jne    461 <writetest1+0x169>
        printf(stdout, "read only %d blocks from big", n);
     439:	a1 f4 63 00 00       	mov    0x63f4,%eax
     43e:	8b 55 f0             	mov    -0x10(%ebp),%edx
     441:	89 54 24 08          	mov    %edx,0x8(%esp)
     445:	c7 44 24 04 a5 48 00 	movl   $0x48a5,0x4(%esp)
     44c:	00 
     44d:	89 04 24             	mov    %eax,(%esp)
     450:	e8 78 3e 00 00       	call   42cd <printf>
        exit(1);
     455:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     45c:	e8 dc 3c 00 00       	call   413d <exit>
      }
      break;
     461:	90                   	nop
             n, ((int*)buf)[0]);
      exit(1);
    }
    n++;
  }
  close(fd);
     462:	8b 45 ec             	mov    -0x14(%ebp),%eax
     465:	89 04 24             	mov    %eax,(%esp)
     468:	e8 f8 3c 00 00       	call   4165 <close>
  if(unlink("big") < 0){
     46d:	c7 04 24 50 48 00 00 	movl   $0x4850,(%esp)
     474:	e8 14 3d 00 00       	call   418d <unlink>
     479:	85 c0                	test   %eax,%eax
     47b:	0f 89 9c 00 00 00    	jns    51d <writetest1+0x225>
     481:	eb 79                	jmp    4fc <writetest1+0x204>
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
        exit(1);
      }
      break;
    } else if(i != 512){
     483:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
     48a:	74 28                	je     4b4 <writetest1+0x1bc>
      printf(stdout, "read failed %d\n", i);
     48c:	a1 f4 63 00 00       	mov    0x63f4,%eax
     491:	8b 55 f4             	mov    -0xc(%ebp),%edx
     494:	89 54 24 08          	mov    %edx,0x8(%esp)
     498:	c7 44 24 04 c2 48 00 	movl   $0x48c2,0x4(%esp)
     49f:	00 
     4a0:	89 04 24             	mov    %eax,(%esp)
     4a3:	e8 25 3e 00 00       	call   42cd <printf>
      exit(1);
     4a8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     4af:	e8 89 3c 00 00       	call   413d <exit>
    }
    if(((int*)buf)[0] != n){
     4b4:	b8 e0 8b 00 00       	mov    $0x8be0,%eax
     4b9:	8b 00                	mov    (%eax),%eax
     4bb:	3b 45 f0             	cmp    -0x10(%ebp),%eax
     4be:	74 33                	je     4f3 <writetest1+0x1fb>
      printf(stdout, "read content of block %d is %d\n",
             n, ((int*)buf)[0]);
     4c0:	b8 e0 8b 00 00       	mov    $0x8be0,%eax
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
      exit(1);
    }
    if(((int*)buf)[0] != n){
      printf(stdout, "read content of block %d is %d\n",
     4c5:	8b 10                	mov    (%eax),%edx
     4c7:	a1 f4 63 00 00       	mov    0x63f4,%eax
     4cc:	89 54 24 0c          	mov    %edx,0xc(%esp)
     4d0:	8b 55 f0             	mov    -0x10(%ebp),%edx
     4d3:	89 54 24 08          	mov    %edx,0x8(%esp)
     4d7:	c7 44 24 04 d4 48 00 	movl   $0x48d4,0x4(%esp)
     4de:	00 
     4df:	89 04 24             	mov    %eax,(%esp)
     4e2:	e8 e6 3d 00 00       	call   42cd <printf>
             n, ((int*)buf)[0]);
      exit(1);
     4e7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     4ee:	e8 4a 3c 00 00       	call   413d <exit>
    }
    n++;
     4f3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  }
     4f7:	e9 10 ff ff ff       	jmp    40c <writetest1+0x114>
  close(fd);
  if(unlink("big") < 0){
    printf(stdout, "unlink big failed\n");
     4fc:	a1 f4 63 00 00       	mov    0x63f4,%eax
     501:	c7 44 24 04 f4 48 00 	movl   $0x48f4,0x4(%esp)
     508:	00 
     509:	89 04 24             	mov    %eax,(%esp)
     50c:	e8 bc 3d 00 00       	call   42cd <printf>
    exit(1);
     511:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     518:	e8 20 3c 00 00       	call   413d <exit>
  }
  printf(stdout, "big files ok\n");
     51d:	a1 f4 63 00 00       	mov    0x63f4,%eax
     522:	c7 44 24 04 07 49 00 	movl   $0x4907,0x4(%esp)
     529:	00 
     52a:	89 04 24             	mov    %eax,(%esp)
     52d:	e8 9b 3d 00 00       	call   42cd <printf>
}
     532:	c9                   	leave  
     533:	c3                   	ret    

00000534 <createtest>:

void
createtest(void)
{
     534:	55                   	push   %ebp
     535:	89 e5                	mov    %esp,%ebp
     537:	83 ec 28             	sub    $0x28,%esp
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");
     53a:	a1 f4 63 00 00       	mov    0x63f4,%eax
     53f:	c7 44 24 04 18 49 00 	movl   $0x4918,0x4(%esp)
     546:	00 
     547:	89 04 24             	mov    %eax,(%esp)
     54a:	e8 7e 3d 00 00       	call   42cd <printf>

  name[0] = 'a';
     54f:	c6 05 e0 ab 00 00 61 	movb   $0x61,0xabe0
  name[2] = '\0';
     556:	c6 05 e2 ab 00 00 00 	movb   $0x0,0xabe2
  for(i = 0; i < 52; i++){
     55d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     564:	eb 31                	jmp    597 <createtest+0x63>
    name[1] = '0' + i;
     566:	8b 45 f4             	mov    -0xc(%ebp),%eax
     569:	83 c0 30             	add    $0x30,%eax
     56c:	a2 e1 ab 00 00       	mov    %al,0xabe1
    fd = open(name, O_CREATE|O_RDWR);
     571:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
     578:	00 
     579:	c7 04 24 e0 ab 00 00 	movl   $0xabe0,(%esp)
     580:	e8 f8 3b 00 00       	call   417d <open>
     585:	89 45 f0             	mov    %eax,-0x10(%ebp)
    close(fd);
     588:	8b 45 f0             	mov    -0x10(%ebp),%eax
     58b:	89 04 24             	mov    %eax,(%esp)
     58e:	e8 d2 3b 00 00       	call   4165 <close>

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     593:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     597:	83 7d f4 33          	cmpl   $0x33,-0xc(%ebp)
     59b:	7e c9                	jle    566 <createtest+0x32>
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
     59d:	c6 05 e0 ab 00 00 61 	movb   $0x61,0xabe0
  name[2] = '\0';
     5a4:	c6 05 e2 ab 00 00 00 	movb   $0x0,0xabe2
  for(i = 0; i < 52; i++){
     5ab:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     5b2:	eb 1b                	jmp    5cf <createtest+0x9b>
    name[1] = '0' + i;
     5b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     5b7:	83 c0 30             	add    $0x30,%eax
     5ba:	a2 e1 ab 00 00       	mov    %al,0xabe1
    unlink(name);
     5bf:	c7 04 24 e0 ab 00 00 	movl   $0xabe0,(%esp)
     5c6:	e8 c2 3b 00 00       	call   418d <unlink>
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     5cb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     5cf:	83 7d f4 33          	cmpl   $0x33,-0xc(%ebp)
     5d3:	7e df                	jle    5b4 <createtest+0x80>
    name[1] = '0' + i;
    unlink(name);
  }
  printf(stdout, "many creates, followed by unlink; ok\n");
     5d5:	a1 f4 63 00 00       	mov    0x63f4,%eax
     5da:	c7 44 24 04 40 49 00 	movl   $0x4940,0x4(%esp)
     5e1:	00 
     5e2:	89 04 24             	mov    %eax,(%esp)
     5e5:	e8 e3 3c 00 00       	call   42cd <printf>
}
     5ea:	c9                   	leave  
     5eb:	c3                   	ret    

000005ec <dirtest>:

void dirtest(void)
{
     5ec:	55                   	push   %ebp
     5ed:	89 e5                	mov    %esp,%ebp
     5ef:	83 ec 18             	sub    $0x18,%esp
  printf(stdout, "mkdir test\n");
     5f2:	a1 f4 63 00 00       	mov    0x63f4,%eax
     5f7:	c7 44 24 04 66 49 00 	movl   $0x4966,0x4(%esp)
     5fe:	00 
     5ff:	89 04 24             	mov    %eax,(%esp)
     602:	e8 c6 3c 00 00       	call   42cd <printf>

  if(mkdir("dir0") < 0){
     607:	c7 04 24 72 49 00 00 	movl   $0x4972,(%esp)
     60e:	e8 92 3b 00 00       	call   41a5 <mkdir>
     613:	85 c0                	test   %eax,%eax
     615:	79 21                	jns    638 <dirtest+0x4c>
    printf(stdout, "mkdir failed\n");
     617:	a1 f4 63 00 00       	mov    0x63f4,%eax
     61c:	c7 44 24 04 77 49 00 	movl   $0x4977,0x4(%esp)
     623:	00 
     624:	89 04 24             	mov    %eax,(%esp)
     627:	e8 a1 3c 00 00       	call   42cd <printf>
    exit(1);
     62c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     633:	e8 05 3b 00 00       	call   413d <exit>
  }

  if(chdir("dir0") < 0){
     638:	c7 04 24 72 49 00 00 	movl   $0x4972,(%esp)
     63f:	e8 69 3b 00 00       	call   41ad <chdir>
     644:	85 c0                	test   %eax,%eax
     646:	79 21                	jns    669 <dirtest+0x7d>
    printf(stdout, "chdir dir0 failed\n");
     648:	a1 f4 63 00 00       	mov    0x63f4,%eax
     64d:	c7 44 24 04 85 49 00 	movl   $0x4985,0x4(%esp)
     654:	00 
     655:	89 04 24             	mov    %eax,(%esp)
     658:	e8 70 3c 00 00       	call   42cd <printf>
    exit(1);
     65d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     664:	e8 d4 3a 00 00       	call   413d <exit>
  }

  if(chdir("..") < 0){
     669:	c7 04 24 98 49 00 00 	movl   $0x4998,(%esp)
     670:	e8 38 3b 00 00       	call   41ad <chdir>
     675:	85 c0                	test   %eax,%eax
     677:	79 21                	jns    69a <dirtest+0xae>
    printf(stdout, "chdir .. failed\n");
     679:	a1 f4 63 00 00       	mov    0x63f4,%eax
     67e:	c7 44 24 04 9b 49 00 	movl   $0x499b,0x4(%esp)
     685:	00 
     686:	89 04 24             	mov    %eax,(%esp)
     689:	e8 3f 3c 00 00       	call   42cd <printf>
    exit(1);
     68e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     695:	e8 a3 3a 00 00       	call   413d <exit>
  }

  if(unlink("dir0") < 0){
     69a:	c7 04 24 72 49 00 00 	movl   $0x4972,(%esp)
     6a1:	e8 e7 3a 00 00       	call   418d <unlink>
     6a6:	85 c0                	test   %eax,%eax
     6a8:	79 21                	jns    6cb <dirtest+0xdf>
    printf(stdout, "unlink dir0 failed\n");
     6aa:	a1 f4 63 00 00       	mov    0x63f4,%eax
     6af:	c7 44 24 04 ac 49 00 	movl   $0x49ac,0x4(%esp)
     6b6:	00 
     6b7:	89 04 24             	mov    %eax,(%esp)
     6ba:	e8 0e 3c 00 00       	call   42cd <printf>
    exit(1);
     6bf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     6c6:	e8 72 3a 00 00       	call   413d <exit>
  }
  printf(stdout, "mkdir test\n");
     6cb:	a1 f4 63 00 00       	mov    0x63f4,%eax
     6d0:	c7 44 24 04 66 49 00 	movl   $0x4966,0x4(%esp)
     6d7:	00 
     6d8:	89 04 24             	mov    %eax,(%esp)
     6db:	e8 ed 3b 00 00       	call   42cd <printf>
}
     6e0:	c9                   	leave  
     6e1:	c3                   	ret    

000006e2 <exectest>:

void
exectest(void)
{
     6e2:	55                   	push   %ebp
     6e3:	89 e5                	mov    %esp,%ebp
     6e5:	83 ec 18             	sub    $0x18,%esp
  printf(stdout, "exec test\n");
     6e8:	a1 f4 63 00 00       	mov    0x63f4,%eax
     6ed:	c7 44 24 04 c0 49 00 	movl   $0x49c0,0x4(%esp)
     6f4:	00 
     6f5:	89 04 24             	mov    %eax,(%esp)
     6f8:	e8 d0 3b 00 00       	call   42cd <printf>
  if(exec("echo", echoargv) < 0){
     6fd:	c7 44 24 04 e0 63 00 	movl   $0x63e0,0x4(%esp)
     704:	00 
     705:	c7 04 24 9c 46 00 00 	movl   $0x469c,(%esp)
     70c:	e8 64 3a 00 00       	call   4175 <exec>
     711:	85 c0                	test   %eax,%eax
     713:	79 21                	jns    736 <exectest+0x54>
    printf(stdout, "exec echo failed\n");
     715:	a1 f4 63 00 00       	mov    0x63f4,%eax
     71a:	c7 44 24 04 cb 49 00 	movl   $0x49cb,0x4(%esp)
     721:	00 
     722:	89 04 24             	mov    %eax,(%esp)
     725:	e8 a3 3b 00 00       	call   42cd <printf>
    exit(1);
     72a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     731:	e8 07 3a 00 00       	call   413d <exit>
  }
}
     736:	c9                   	leave  
     737:	c3                   	ret    

00000738 <pipe1>:

// simple fork and pipe read/write

void
pipe1(void)
{
     738:	55                   	push   %ebp
     739:	89 e5                	mov    %esp,%ebp
     73b:	83 ec 48             	sub    $0x48,%esp
  int fds[2], pid;
  int seq, i, n, cc, total,st;

  if(pipe(fds) != 0){
     73e:	8d 45 d8             	lea    -0x28(%ebp),%eax
     741:	89 04 24             	mov    %eax,(%esp)
     744:	e8 04 3a 00 00       	call   414d <pipe>
     749:	85 c0                	test   %eax,%eax
     74b:	74 20                	je     76d <pipe1+0x35>
    printf(1, "pipe() failed\n");
     74d:	c7 44 24 04 dd 49 00 	movl   $0x49dd,0x4(%esp)
     754:	00 
     755:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     75c:	e8 6c 3b 00 00       	call   42cd <printf>
    exit(1);
     761:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     768:	e8 d0 39 00 00       	call   413d <exit>
  }
  pid = fork();
     76d:	e8 c3 39 00 00       	call   4135 <fork>
     772:	89 45 e0             	mov    %eax,-0x20(%ebp)
  seq = 0;
     775:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  if(pid == 0){
     77c:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     780:	0f 85 96 00 00 00    	jne    81c <pipe1+0xe4>
    close(fds[0]);
     786:	8b 45 d8             	mov    -0x28(%ebp),%eax
     789:	89 04 24             	mov    %eax,(%esp)
     78c:	e8 d4 39 00 00       	call   4165 <close>
    for(n = 0; n < 5; n++){
     791:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
     798:	eb 70                	jmp    80a <pipe1+0xd2>
      for(i = 0; i < 1033; i++)
     79a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     7a1:	eb 18                	jmp    7bb <pipe1+0x83>
        buf[i] = seq++;
     7a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     7a6:	8d 50 01             	lea    0x1(%eax),%edx
     7a9:	89 55 f4             	mov    %edx,-0xc(%ebp)
     7ac:	8b 55 f0             	mov    -0x10(%ebp),%edx
     7af:	81 c2 e0 8b 00 00    	add    $0x8be0,%edx
     7b5:	88 02                	mov    %al,(%edx)
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
     7b7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     7bb:	81 7d f0 08 04 00 00 	cmpl   $0x408,-0x10(%ebp)
     7c2:	7e df                	jle    7a3 <pipe1+0x6b>
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
     7c4:	8b 45 dc             	mov    -0x24(%ebp),%eax
     7c7:	c7 44 24 08 09 04 00 	movl   $0x409,0x8(%esp)
     7ce:	00 
     7cf:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
     7d6:	00 
     7d7:	89 04 24             	mov    %eax,(%esp)
     7da:	e8 7e 39 00 00       	call   415d <write>
     7df:	3d 09 04 00 00       	cmp    $0x409,%eax
     7e4:	74 20                	je     806 <pipe1+0xce>
        printf(1, "pipe1 oops 1\n");
     7e6:	c7 44 24 04 ec 49 00 	movl   $0x49ec,0x4(%esp)
     7ed:	00 
     7ee:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     7f5:	e8 d3 3a 00 00       	call   42cd <printf>
        exit(1);
     7fa:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     801:	e8 37 39 00 00       	call   413d <exit>
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
     806:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
     80a:	83 7d ec 04          	cmpl   $0x4,-0x14(%ebp)
     80e:	7e 8a                	jle    79a <pipe1+0x62>
      if(write(fds[1], buf, 1033) != 1033){
        printf(1, "pipe1 oops 1\n");
        exit(1);
      }
    }
    exit(1);
     810:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     817:	e8 21 39 00 00       	call   413d <exit>
  } else if(pid > 0){
     81c:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     820:	0f 8e 06 01 00 00    	jle    92c <pipe1+0x1f4>
    close(fds[1]);
     826:	8b 45 dc             	mov    -0x24(%ebp),%eax
     829:	89 04 24             	mov    %eax,(%esp)
     82c:	e8 34 39 00 00       	call   4165 <close>
    total = 0;
     831:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    cc = 1;
     838:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
    while((n = read(fds[0], buf, cc)) > 0){
     83f:	eb 68                	jmp    8a9 <pipe1+0x171>
      for(i = 0; i < n; i++){
     841:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     848:	eb 3d                	jmp    887 <pipe1+0x14f>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     84a:	8b 45 f0             	mov    -0x10(%ebp),%eax
     84d:	05 e0 8b 00 00       	add    $0x8be0,%eax
     852:	0f b6 00             	movzbl (%eax),%eax
     855:	0f be c8             	movsbl %al,%ecx
     858:	8b 45 f4             	mov    -0xc(%ebp),%eax
     85b:	8d 50 01             	lea    0x1(%eax),%edx
     85e:	89 55 f4             	mov    %edx,-0xc(%ebp)
     861:	31 c8                	xor    %ecx,%eax
     863:	0f b6 c0             	movzbl %al,%eax
     866:	85 c0                	test   %eax,%eax
     868:	74 19                	je     883 <pipe1+0x14b>
          printf(1, "pipe1 oops 2\n");
     86a:	c7 44 24 04 fa 49 00 	movl   $0x49fa,0x4(%esp)
     871:	00 
     872:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     879:	e8 4f 3a 00 00       	call   42cd <printf>
     87e:	e9 c9 00 00 00       	jmp    94c <pipe1+0x214>
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
     883:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     887:	8b 45 f0             	mov    -0x10(%ebp),%eax
     88a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     88d:	7c bb                	jl     84a <pipe1+0x112>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
     88f:	8b 45 ec             	mov    -0x14(%ebp),%eax
     892:	01 45 e4             	add    %eax,-0x1c(%ebp)
      cc = cc * 2;
     895:	d1 65 e8             	shll   -0x18(%ebp)
      if(cc > sizeof(buf))
     898:	8b 45 e8             	mov    -0x18(%ebp),%eax
     89b:	3d 00 20 00 00       	cmp    $0x2000,%eax
     8a0:	76 07                	jbe    8a9 <pipe1+0x171>
        cc = sizeof(buf);
     8a2:	c7 45 e8 00 20 00 00 	movl   $0x2000,-0x18(%ebp)
    exit(1);
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
     8a9:	8b 45 d8             	mov    -0x28(%ebp),%eax
     8ac:	8b 55 e8             	mov    -0x18(%ebp),%edx
     8af:	89 54 24 08          	mov    %edx,0x8(%esp)
     8b3:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
     8ba:	00 
     8bb:	89 04 24             	mov    %eax,(%esp)
     8be:	e8 92 38 00 00       	call   4155 <read>
     8c3:	89 45 ec             	mov    %eax,-0x14(%ebp)
     8c6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     8ca:	0f 8f 71 ff ff ff    	jg     841 <pipe1+0x109>
      total += n;
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
     8d0:	81 7d e4 2d 14 00 00 	cmpl   $0x142d,-0x1c(%ebp)
     8d7:	74 27                	je     900 <pipe1+0x1c8>
      printf(1, "pipe1 oops 3 total %d\n", total);
     8d9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     8dc:	89 44 24 08          	mov    %eax,0x8(%esp)
     8e0:	c7 44 24 04 08 4a 00 	movl   $0x4a08,0x4(%esp)
     8e7:	00 
     8e8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     8ef:	e8 d9 39 00 00       	call   42cd <printf>
      exit(1);
     8f4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     8fb:	e8 3d 38 00 00       	call   413d <exit>
    }
    close(fds[0]);
     900:	8b 45 d8             	mov    -0x28(%ebp),%eax
     903:	89 04 24             	mov    %eax,(%esp)
     906:	e8 5a 38 00 00       	call   4165 <close>
    wait(&st);
     90b:	8d 45 d4             	lea    -0x2c(%ebp),%eax
     90e:	89 04 24             	mov    %eax,(%esp)
     911:	e8 2f 38 00 00       	call   4145 <wait>
  } else {
    printf(1, "fork() failed\n");
    exit(1);
  }
  printf(1, "pipe1 ok\n");
     916:	c7 44 24 04 2e 4a 00 	movl   $0x4a2e,0x4(%esp)
     91d:	00 
     91e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     925:	e8 a3 39 00 00       	call   42cd <printf>
     92a:	eb 20                	jmp    94c <pipe1+0x214>
      exit(1);
    }
    close(fds[0]);
    wait(&st);
  } else {
    printf(1, "fork() failed\n");
     92c:	c7 44 24 04 1f 4a 00 	movl   $0x4a1f,0x4(%esp)
     933:	00 
     934:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     93b:	e8 8d 39 00 00       	call   42cd <printf>
    exit(1);
     940:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     947:	e8 f1 37 00 00       	call   413d <exit>
  }
  printf(1, "pipe1 ok\n");
}
     94c:	c9                   	leave  
     94d:	c3                   	ret    

0000094e <preempt>:

// meant to be run w/ at most two CPUs
void
preempt(void)
{
     94e:	55                   	push   %ebp
     94f:	89 e5                	mov    %esp,%ebp
     951:	83 ec 38             	sub    $0x38,%esp
  int pid1, pid2, pid3;
  int pfds[2];
  int st;
  printf(1, "preempt: ");
     954:	c7 44 24 04 38 4a 00 	movl   $0x4a38,0x4(%esp)
     95b:	00 
     95c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     963:	e8 65 39 00 00       	call   42cd <printf>
  pid1 = fork();
     968:	e8 c8 37 00 00       	call   4135 <fork>
     96d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(pid1 == 0)
     970:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     974:	75 02                	jne    978 <preempt+0x2a>
    for(;;)
      ;
     976:	eb fe                	jmp    976 <preempt+0x28>

  pid2 = fork();
     978:	e8 b8 37 00 00       	call   4135 <fork>
     97d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(pid2 == 0)
     980:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     984:	75 02                	jne    988 <preempt+0x3a>
    for(;;)
      ;
     986:	eb fe                	jmp    986 <preempt+0x38>

  pipe(pfds);
     988:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     98b:	89 04 24             	mov    %eax,(%esp)
     98e:	e8 ba 37 00 00       	call   414d <pipe>
  pid3 = fork();
     993:	e8 9d 37 00 00       	call   4135 <fork>
     998:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(pid3 == 0){
     99b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     99f:	75 4c                	jne    9ed <preempt+0x9f>
    close(pfds[0]);
     9a1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     9a4:	89 04 24             	mov    %eax,(%esp)
     9a7:	e8 b9 37 00 00       	call   4165 <close>
    if(write(pfds[1], "x", 1) != 1)
     9ac:	8b 45 e8             	mov    -0x18(%ebp),%eax
     9af:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     9b6:	00 
     9b7:	c7 44 24 04 42 4a 00 	movl   $0x4a42,0x4(%esp)
     9be:	00 
     9bf:	89 04 24             	mov    %eax,(%esp)
     9c2:	e8 96 37 00 00       	call   415d <write>
     9c7:	83 f8 01             	cmp    $0x1,%eax
     9ca:	74 14                	je     9e0 <preempt+0x92>
      printf(1, "preempt write error");
     9cc:	c7 44 24 04 44 4a 00 	movl   $0x4a44,0x4(%esp)
     9d3:	00 
     9d4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     9db:	e8 ed 38 00 00       	call   42cd <printf>
    close(pfds[1]);
     9e0:	8b 45 e8             	mov    -0x18(%ebp),%eax
     9e3:	89 04 24             	mov    %eax,(%esp)
     9e6:	e8 7a 37 00 00       	call   4165 <close>
    for(;;)
      ;
     9eb:	eb fe                	jmp    9eb <preempt+0x9d>
  }

  close(pfds[1]);
     9ed:	8b 45 e8             	mov    -0x18(%ebp),%eax
     9f0:	89 04 24             	mov    %eax,(%esp)
     9f3:	e8 6d 37 00 00       	call   4165 <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     9f8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     9fb:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
     a02:	00 
     a03:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
     a0a:	00 
     a0b:	89 04 24             	mov    %eax,(%esp)
     a0e:	e8 42 37 00 00       	call   4155 <read>
     a13:	83 f8 01             	cmp    $0x1,%eax
     a16:	74 19                	je     a31 <preempt+0xe3>
    printf(1, "preempt read error");
     a18:	c7 44 24 04 58 4a 00 	movl   $0x4a58,0x4(%esp)
     a1f:	00 
     a20:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     a27:	e8 a1 38 00 00       	call   42cd <printf>
     a2c:	e9 89 00 00 00       	jmp    aba <preempt+0x16c>
    return;
  }
  close(pfds[0]);
     a31:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     a34:	89 04 24             	mov    %eax,(%esp)
     a37:	e8 29 37 00 00       	call   4165 <close>
  printf(1, "kill... ");
     a3c:	c7 44 24 04 6b 4a 00 	movl   $0x4a6b,0x4(%esp)
     a43:	00 
     a44:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     a4b:	e8 7d 38 00 00       	call   42cd <printf>
  kill(pid1);
     a50:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a53:	89 04 24             	mov    %eax,(%esp)
     a56:	e8 12 37 00 00       	call   416d <kill>
  kill(pid2);
     a5b:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a5e:	89 04 24             	mov    %eax,(%esp)
     a61:	e8 07 37 00 00       	call   416d <kill>
  kill(pid3);
     a66:	8b 45 ec             	mov    -0x14(%ebp),%eax
     a69:	89 04 24             	mov    %eax,(%esp)
     a6c:	e8 fc 36 00 00       	call   416d <kill>
  printf(1, "wait... ");
     a71:	c7 44 24 04 74 4a 00 	movl   $0x4a74,0x4(%esp)
     a78:	00 
     a79:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     a80:	e8 48 38 00 00       	call   42cd <printf>
  wait(&st);
     a85:	8d 45 e0             	lea    -0x20(%ebp),%eax
     a88:	89 04 24             	mov    %eax,(%esp)
     a8b:	e8 b5 36 00 00       	call   4145 <wait>
  wait(&st);
     a90:	8d 45 e0             	lea    -0x20(%ebp),%eax
     a93:	89 04 24             	mov    %eax,(%esp)
     a96:	e8 aa 36 00 00       	call   4145 <wait>
  wait(&st);
     a9b:	8d 45 e0             	lea    -0x20(%ebp),%eax
     a9e:	89 04 24             	mov    %eax,(%esp)
     aa1:	e8 9f 36 00 00       	call   4145 <wait>
  printf(1, "preempt ok\n");
     aa6:	c7 44 24 04 7d 4a 00 	movl   $0x4a7d,0x4(%esp)
     aad:	00 
     aae:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     ab5:	e8 13 38 00 00       	call   42cd <printf>
}
     aba:	c9                   	leave  
     abb:	c3                   	ret    

00000abc <exitwait>:

// try to find any races between exit and wait
void
exitwait(void)
{
     abc:	55                   	push   %ebp
     abd:	89 e5                	mov    %esp,%ebp
     abf:	83 ec 28             	sub    $0x28,%esp
  int i, pid, st;

  for(i = 0; i < 100; i++){
     ac2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     ac9:	eb 60                	jmp    b2b <exitwait+0x6f>
    pid = fork();
     acb:	e8 65 36 00 00       	call   4135 <fork>
     ad0:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(pid < 0){
     ad3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     ad7:	79 16                	jns    aef <exitwait+0x33>
      printf(1, "fork failed\n");
     ad9:	c7 44 24 04 89 4a 00 	movl   $0x4a89,0x4(%esp)
     ae0:	00 
     ae1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     ae8:	e8 e0 37 00 00       	call   42cd <printf>
      return;
     aed:	eb 56                	jmp    b45 <exitwait+0x89>
    }
    if(pid){
     aef:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     af3:	74 26                	je     b1b <exitwait+0x5f>
      if(wait(&st) != pid){
     af5:	8d 45 ec             	lea    -0x14(%ebp),%eax
     af8:	89 04 24             	mov    %eax,(%esp)
     afb:	e8 45 36 00 00       	call   4145 <wait>
     b00:	3b 45 f0             	cmp    -0x10(%ebp),%eax
     b03:	74 22                	je     b27 <exitwait+0x6b>
        printf(1, "wait wrong pid\n");
     b05:	c7 44 24 04 96 4a 00 	movl   $0x4a96,0x4(%esp)
     b0c:	00 
     b0d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     b14:	e8 b4 37 00 00       	call   42cd <printf>
        return;
     b19:	eb 2a                	jmp    b45 <exitwait+0x89>
      }
    } else {
      exit(1);
     b1b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     b22:	e8 16 36 00 00       	call   413d <exit>
void
exitwait(void)
{
  int i, pid, st;

  for(i = 0; i < 100; i++){
     b27:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     b2b:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
     b2f:	7e 9a                	jle    acb <exitwait+0xf>
      }
    } else {
      exit(1);
    }
  }
  printf(1, "exitwait ok\n");
     b31:	c7 44 24 04 a6 4a 00 	movl   $0x4aa6,0x4(%esp)
     b38:	00 
     b39:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     b40:	e8 88 37 00 00       	call   42cd <printf>
}
     b45:	c9                   	leave  
     b46:	c3                   	ret    

00000b47 <mem>:

void
mem(void)
{
     b47:	55                   	push   %ebp
     b48:	89 e5                	mov    %esp,%ebp
     b4a:	83 ec 38             	sub    $0x38,%esp
  void *m1, *m2;
  int pid, ppid ,st;

  printf(1, "mem test\n");
     b4d:	c7 44 24 04 b3 4a 00 	movl   $0x4ab3,0x4(%esp)
     b54:	00 
     b55:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     b5c:	e8 6c 37 00 00       	call   42cd <printf>
  ppid = getpid();
     b61:	e8 57 36 00 00       	call   41bd <getpid>
     b66:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if((pid = fork()) == 0){
     b69:	e8 c7 35 00 00       	call   4135 <fork>
     b6e:	89 45 ec             	mov    %eax,-0x14(%ebp)
     b71:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     b75:	0f 85 b8 00 00 00    	jne    c33 <mem+0xec>
    m1 = 0;
     b7b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while((m2 = malloc(10001)) != 0){
     b82:	eb 0e                	jmp    b92 <mem+0x4b>
      *(char**)m2 = m1;
     b84:	8b 45 e8             	mov    -0x18(%ebp),%eax
     b87:	8b 55 f4             	mov    -0xc(%ebp),%edx
     b8a:	89 10                	mov    %edx,(%eax)
      m1 = m2;
     b8c:	8b 45 e8             	mov    -0x18(%ebp),%eax
     b8f:	89 45 f4             	mov    %eax,-0xc(%ebp)

  printf(1, "mem test\n");
  ppid = getpid();
  if((pid = fork()) == 0){
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
     b92:	c7 04 24 11 27 00 00 	movl   $0x2711,(%esp)
     b99:	e8 1b 3a 00 00       	call   45b9 <malloc>
     b9e:	89 45 e8             	mov    %eax,-0x18(%ebp)
     ba1:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     ba5:	75 dd                	jne    b84 <mem+0x3d>
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     ba7:	eb 19                	jmp    bc2 <mem+0x7b>
      m2 = *(char**)m1;
     ba9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     bac:	8b 00                	mov    (%eax),%eax
     bae:	89 45 e8             	mov    %eax,-0x18(%ebp)
      free(m1);
     bb1:	8b 45 f4             	mov    -0xc(%ebp),%eax
     bb4:	89 04 24             	mov    %eax,(%esp)
     bb7:	e8 c4 38 00 00       	call   4480 <free>
      m1 = m2;
     bbc:	8b 45 e8             	mov    -0x18(%ebp),%eax
     bbf:	89 45 f4             	mov    %eax,-0xc(%ebp)
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     bc2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     bc6:	75 e1                	jne    ba9 <mem+0x62>
      m2 = *(char**)m1;
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
     bc8:	c7 04 24 00 50 00 00 	movl   $0x5000,(%esp)
     bcf:	e8 e5 39 00 00       	call   45b9 <malloc>
     bd4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(m1 == 0){
     bd7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     bdb:	75 2b                	jne    c08 <mem+0xc1>
      printf(1, "couldn't allocate mem?!!\n");
     bdd:	c7 44 24 04 bd 4a 00 	movl   $0x4abd,0x4(%esp)
     be4:	00 
     be5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     bec:	e8 dc 36 00 00       	call   42cd <printf>
      kill(ppid);
     bf1:	8b 45 f0             	mov    -0x10(%ebp),%eax
     bf4:	89 04 24             	mov    %eax,(%esp)
     bf7:	e8 71 35 00 00       	call   416d <kill>
      exit(1);
     bfc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     c03:	e8 35 35 00 00       	call   413d <exit>
    }
    free(m1);
     c08:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c0b:	89 04 24             	mov    %eax,(%esp)
     c0e:	e8 6d 38 00 00       	call   4480 <free>
    printf(1, "mem ok\n");
     c13:	c7 44 24 04 d7 4a 00 	movl   $0x4ad7,0x4(%esp)
     c1a:	00 
     c1b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     c22:	e8 a6 36 00 00       	call   42cd <printf>
    exit(1);
     c27:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     c2e:	e8 0a 35 00 00       	call   413d <exit>
  } else {
    wait(&st);
     c33:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     c36:	89 04 24             	mov    %eax,(%esp)
     c39:	e8 07 35 00 00       	call   4145 <wait>
  }
}
     c3e:	c9                   	leave  
     c3f:	c3                   	ret    

00000c40 <sharedfd>:

// two processes write to the same file descriptor
// is the offset shared? does inode locking work?
void
sharedfd(void)
{
     c40:	55                   	push   %ebp
     c41:	89 e5                	mov    %esp,%ebp
     c43:	83 ec 48             	sub    $0x48,%esp
  int fd, pid, i, n, nc, np, st;
  char buf[10];

  printf(1, "sharedfd test\n");
     c46:	c7 44 24 04 df 4a 00 	movl   $0x4adf,0x4(%esp)
     c4d:	00 
     c4e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     c55:	e8 73 36 00 00       	call   42cd <printf>

  unlink("sharedfd");
     c5a:	c7 04 24 ee 4a 00 00 	movl   $0x4aee,(%esp)
     c61:	e8 27 35 00 00       	call   418d <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     c66:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
     c6d:	00 
     c6e:	c7 04 24 ee 4a 00 00 	movl   $0x4aee,(%esp)
     c75:	e8 03 35 00 00       	call   417d <open>
     c7a:	89 45 e8             	mov    %eax,-0x18(%ebp)
  if(fd < 0){
     c7d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     c81:	79 19                	jns    c9c <sharedfd+0x5c>
    printf(1, "fstests: cannot open sharedfd for writing");
     c83:	c7 44 24 04 f8 4a 00 	movl   $0x4af8,0x4(%esp)
     c8a:	00 
     c8b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     c92:	e8 36 36 00 00       	call   42cd <printf>
    return;
     c97:	e9 b4 01 00 00       	jmp    e50 <sharedfd+0x210>
  }
  pid = fork();
     c9c:	e8 94 34 00 00       	call   4135 <fork>
     ca1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  memset(buf, pid==0?'c':'p', sizeof(buf));
     ca4:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     ca8:	75 07                	jne    cb1 <sharedfd+0x71>
     caa:	b8 63 00 00 00       	mov    $0x63,%eax
     caf:	eb 05                	jmp    cb6 <sharedfd+0x76>
     cb1:	b8 70 00 00 00       	mov    $0x70,%eax
     cb6:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     cbd:	00 
     cbe:	89 44 24 04          	mov    %eax,0x4(%esp)
     cc2:	8d 45 d2             	lea    -0x2e(%ebp),%eax
     cc5:	89 04 24             	mov    %eax,(%esp)
     cc8:	e8 c3 32 00 00       	call   3f90 <memset>
  for(i = 0; i < 1000; i++){
     ccd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     cd4:	eb 39                	jmp    d0f <sharedfd+0xcf>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     cd6:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     cdd:	00 
     cde:	8d 45 d2             	lea    -0x2e(%ebp),%eax
     ce1:	89 44 24 04          	mov    %eax,0x4(%esp)
     ce5:	8b 45 e8             	mov    -0x18(%ebp),%eax
     ce8:	89 04 24             	mov    %eax,(%esp)
     ceb:	e8 6d 34 00 00       	call   415d <write>
     cf0:	83 f8 0a             	cmp    $0xa,%eax
     cf3:	74 16                	je     d0b <sharedfd+0xcb>
      printf(1, "fstests: write sharedfd failed\n");
     cf5:	c7 44 24 04 24 4b 00 	movl   $0x4b24,0x4(%esp)
     cfc:	00 
     cfd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     d04:	e8 c4 35 00 00       	call   42cd <printf>
      break;
     d09:	eb 0d                	jmp    d18 <sharedfd+0xd8>
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
  memset(buf, pid==0?'c':'p', sizeof(buf));
  for(i = 0; i < 1000; i++){
     d0b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     d0f:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
     d16:	7e be                	jle    cd6 <sharedfd+0x96>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
      printf(1, "fstests: write sharedfd failed\n");
      break;
    }
  }
  if(pid == 0)
     d18:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     d1c:	75 0c                	jne    d2a <sharedfd+0xea>
    exit(1);
     d1e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     d25:	e8 13 34 00 00       	call   413d <exit>
  else
    wait(&st);
     d2a:	8d 45 dc             	lea    -0x24(%ebp),%eax
     d2d:	89 04 24             	mov    %eax,(%esp)
     d30:	e8 10 34 00 00       	call   4145 <wait>
  close(fd);
     d35:	8b 45 e8             	mov    -0x18(%ebp),%eax
     d38:	89 04 24             	mov    %eax,(%esp)
     d3b:	e8 25 34 00 00       	call   4165 <close>
  fd = open("sharedfd", 0);
     d40:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     d47:	00 
     d48:	c7 04 24 ee 4a 00 00 	movl   $0x4aee,(%esp)
     d4f:	e8 29 34 00 00       	call   417d <open>
     d54:	89 45 e8             	mov    %eax,-0x18(%ebp)
  if(fd < 0){
     d57:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     d5b:	79 19                	jns    d76 <sharedfd+0x136>
    printf(1, "fstests: cannot open sharedfd for reading\n");
     d5d:	c7 44 24 04 44 4b 00 	movl   $0x4b44,0x4(%esp)
     d64:	00 
     d65:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     d6c:	e8 5c 35 00 00       	call   42cd <printf>
    return;
     d71:	e9 da 00 00 00       	jmp    e50 <sharedfd+0x210>
  }
  nc = np = 0;
     d76:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
     d7d:	8b 45 ec             	mov    -0x14(%ebp),%eax
     d80:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
     d83:	eb 3b                	jmp    dc0 <sharedfd+0x180>
    for(i = 0; i < sizeof(buf); i++){
     d85:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     d8c:	eb 2a                	jmp    db8 <sharedfd+0x178>
      if(buf[i] == 'c')
     d8e:	8d 55 d2             	lea    -0x2e(%ebp),%edx
     d91:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d94:	01 d0                	add    %edx,%eax
     d96:	0f b6 00             	movzbl (%eax),%eax
     d99:	3c 63                	cmp    $0x63,%al
     d9b:	75 04                	jne    da1 <sharedfd+0x161>
        nc++;
     d9d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      if(buf[i] == 'p')
     da1:	8d 55 d2             	lea    -0x2e(%ebp),%edx
     da4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     da7:	01 d0                	add    %edx,%eax
     da9:	0f b6 00             	movzbl (%eax),%eax
     dac:	3c 70                	cmp    $0x70,%al
     dae:	75 04                	jne    db4 <sharedfd+0x174>
        np++;
     db0:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i = 0; i < sizeof(buf); i++){
     db4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     db8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     dbb:	83 f8 09             	cmp    $0x9,%eax
     dbe:	76 ce                	jbe    d8e <sharedfd+0x14e>
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
     dc0:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     dc7:	00 
     dc8:	8d 45 d2             	lea    -0x2e(%ebp),%eax
     dcb:	89 44 24 04          	mov    %eax,0x4(%esp)
     dcf:	8b 45 e8             	mov    -0x18(%ebp),%eax
     dd2:	89 04 24             	mov    %eax,(%esp)
     dd5:	e8 7b 33 00 00       	call   4155 <read>
     dda:	89 45 e0             	mov    %eax,-0x20(%ebp)
     ddd:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     de1:	7f a2                	jg     d85 <sharedfd+0x145>
        nc++;
      if(buf[i] == 'p')
        np++;
    }
  }
  close(fd);
     de3:	8b 45 e8             	mov    -0x18(%ebp),%eax
     de6:	89 04 24             	mov    %eax,(%esp)
     de9:	e8 77 33 00 00       	call   4165 <close>
  unlink("sharedfd");
     dee:	c7 04 24 ee 4a 00 00 	movl   $0x4aee,(%esp)
     df5:	e8 93 33 00 00       	call   418d <unlink>
  if(nc == 10000 && np == 10000){
     dfa:	81 7d f0 10 27 00 00 	cmpl   $0x2710,-0x10(%ebp)
     e01:	75 1f                	jne    e22 <sharedfd+0x1e2>
     e03:	81 7d ec 10 27 00 00 	cmpl   $0x2710,-0x14(%ebp)
     e0a:	75 16                	jne    e22 <sharedfd+0x1e2>
    printf(1, "sharedfd ok\n");
     e0c:	c7 44 24 04 6f 4b 00 	movl   $0x4b6f,0x4(%esp)
     e13:	00 
     e14:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     e1b:	e8 ad 34 00 00       	call   42cd <printf>
     e20:	eb 2e                	jmp    e50 <sharedfd+0x210>
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
     e22:	8b 45 ec             	mov    -0x14(%ebp),%eax
     e25:	89 44 24 0c          	mov    %eax,0xc(%esp)
     e29:	8b 45 f0             	mov    -0x10(%ebp),%eax
     e2c:	89 44 24 08          	mov    %eax,0x8(%esp)
     e30:	c7 44 24 04 7c 4b 00 	movl   $0x4b7c,0x4(%esp)
     e37:	00 
     e38:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     e3f:	e8 89 34 00 00       	call   42cd <printf>
    exit(1);
     e44:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     e4b:	e8 ed 32 00 00       	call   413d <exit>
  }
}
     e50:	c9                   	leave  
     e51:	c3                   	ret    

00000e52 <twofiles>:

// two processes write two different files at the same
// time, to test block allocation.
void
twofiles(void)
{
     e52:	55                   	push   %ebp
     e53:	89 e5                	mov    %esp,%ebp
     e55:	83 ec 38             	sub    $0x38,%esp
  int fd, pid, i, j, n, total ,st;
  char *fname;

  printf(1, "twofiles test\n");
     e58:	c7 44 24 04 91 4b 00 	movl   $0x4b91,0x4(%esp)
     e5f:	00 
     e60:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     e67:	e8 61 34 00 00       	call   42cd <printf>

  unlink("f1");
     e6c:	c7 04 24 a0 4b 00 00 	movl   $0x4ba0,(%esp)
     e73:	e8 15 33 00 00       	call   418d <unlink>
  unlink("f2");
     e78:	c7 04 24 a3 4b 00 00 	movl   $0x4ba3,(%esp)
     e7f:	e8 09 33 00 00       	call   418d <unlink>

  pid = fork();
     e84:	e8 ac 32 00 00       	call   4135 <fork>
     e89:	89 45 e8             	mov    %eax,-0x18(%ebp)
  if(pid < 0){
     e8c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     e90:	79 20                	jns    eb2 <twofiles+0x60>
    printf(1, "fork failed\n");
     e92:	c7 44 24 04 89 4a 00 	movl   $0x4a89,0x4(%esp)
     e99:	00 
     e9a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     ea1:	e8 27 34 00 00       	call   42cd <printf>
    exit(1);
     ea6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     ead:	e8 8b 32 00 00       	call   413d <exit>
  }

  fname = pid ? "f1" : "f2";
     eb2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     eb6:	74 07                	je     ebf <twofiles+0x6d>
     eb8:	b8 a0 4b 00 00       	mov    $0x4ba0,%eax
     ebd:	eb 05                	jmp    ec4 <twofiles+0x72>
     ebf:	b8 a3 4b 00 00       	mov    $0x4ba3,%eax
     ec4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  fd = open(fname, O_CREATE | O_RDWR);
     ec7:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
     ece:	00 
     ecf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     ed2:	89 04 24             	mov    %eax,(%esp)
     ed5:	e8 a3 32 00 00       	call   417d <open>
     eda:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(fd < 0){
     edd:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     ee1:	79 20                	jns    f03 <twofiles+0xb1>
    printf(1, "create failed\n");
     ee3:	c7 44 24 04 a6 4b 00 	movl   $0x4ba6,0x4(%esp)
     eea:	00 
     eeb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     ef2:	e8 d6 33 00 00       	call   42cd <printf>
    exit(1);
     ef7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     efe:	e8 3a 32 00 00       	call   413d <exit>
  }

  memset(buf, pid?'p':'c', 512);
     f03:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     f07:	74 07                	je     f10 <twofiles+0xbe>
     f09:	b8 70 00 00 00       	mov    $0x70,%eax
     f0e:	eb 05                	jmp    f15 <twofiles+0xc3>
     f10:	b8 63 00 00 00       	mov    $0x63,%eax
     f15:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
     f1c:	00 
     f1d:	89 44 24 04          	mov    %eax,0x4(%esp)
     f21:	c7 04 24 e0 8b 00 00 	movl   $0x8be0,(%esp)
     f28:	e8 63 30 00 00       	call   3f90 <memset>
  for(i = 0; i < 12; i++){
     f2d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     f34:	eb 52                	jmp    f88 <twofiles+0x136>
    if((n = write(fd, buf, 500)) != 500){
     f36:	c7 44 24 08 f4 01 00 	movl   $0x1f4,0x8(%esp)
     f3d:	00 
     f3e:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
     f45:	00 
     f46:	8b 45 e0             	mov    -0x20(%ebp),%eax
     f49:	89 04 24             	mov    %eax,(%esp)
     f4c:	e8 0c 32 00 00       	call   415d <write>
     f51:	89 45 dc             	mov    %eax,-0x24(%ebp)
     f54:	81 7d dc f4 01 00 00 	cmpl   $0x1f4,-0x24(%ebp)
     f5b:	74 27                	je     f84 <twofiles+0x132>
      printf(1, "write failed %d\n", n);
     f5d:	8b 45 dc             	mov    -0x24(%ebp),%eax
     f60:	89 44 24 08          	mov    %eax,0x8(%esp)
     f64:	c7 44 24 04 b5 4b 00 	movl   $0x4bb5,0x4(%esp)
     f6b:	00 
     f6c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     f73:	e8 55 33 00 00       	call   42cd <printf>
      exit(1);
     f78:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     f7f:	e8 b9 31 00 00       	call   413d <exit>
    printf(1, "create failed\n");
    exit(1);
  }

  memset(buf, pid?'p':'c', 512);
  for(i = 0; i < 12; i++){
     f84:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     f88:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
     f8c:	7e a8                	jle    f36 <twofiles+0xe4>
    if((n = write(fd, buf, 500)) != 500){
      printf(1, "write failed %d\n", n);
      exit(1);
    }
  }
  close(fd);
     f8e:	8b 45 e0             	mov    -0x20(%ebp),%eax
     f91:	89 04 24             	mov    %eax,(%esp)
     f94:	e8 cc 31 00 00       	call   4165 <close>
  if(pid)
     f99:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     f9d:	74 17                	je     fb6 <twofiles+0x164>
    wait(&st);
     f9f:	8d 45 d8             	lea    -0x28(%ebp),%eax
     fa2:	89 04 24             	mov    %eax,(%esp)
     fa5:	e8 9b 31 00 00       	call   4145 <wait>
  else
    exit(1);

  for(i = 0; i < 2; i++){
     faa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     fb1:	e9 00 01 00 00       	jmp    10b6 <twofiles+0x264>
  }
  close(fd);
  if(pid)
    wait(&st);
  else
    exit(1);
     fb6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     fbd:	e8 7b 31 00 00       	call   413d <exit>

  for(i = 0; i < 2; i++){
    fd = open(i?"f1":"f2", 0);
     fc2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     fc6:	74 07                	je     fcf <twofiles+0x17d>
     fc8:	b8 a0 4b 00 00       	mov    $0x4ba0,%eax
     fcd:	eb 05                	jmp    fd4 <twofiles+0x182>
     fcf:	b8 a3 4b 00 00       	mov    $0x4ba3,%eax
     fd4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     fdb:	00 
     fdc:	89 04 24             	mov    %eax,(%esp)
     fdf:	e8 99 31 00 00       	call   417d <open>
     fe4:	89 45 e0             	mov    %eax,-0x20(%ebp)
    total = 0;
     fe7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    while((n = read(fd, buf, sizeof(buf))) > 0){
     fee:	eb 5f                	jmp    104f <twofiles+0x1fd>
      for(j = 0; j < n; j++){
     ff0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     ff7:	eb 48                	jmp    1041 <twofiles+0x1ef>
        if(buf[j] != (i?'p':'c')){
     ff9:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ffc:	05 e0 8b 00 00       	add    $0x8be0,%eax
    1001:	0f b6 00             	movzbl (%eax),%eax
    1004:	0f be d0             	movsbl %al,%edx
    1007:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    100b:	74 07                	je     1014 <twofiles+0x1c2>
    100d:	b8 70 00 00 00       	mov    $0x70,%eax
    1012:	eb 05                	jmp    1019 <twofiles+0x1c7>
    1014:	b8 63 00 00 00       	mov    $0x63,%eax
    1019:	39 c2                	cmp    %eax,%edx
    101b:	74 20                	je     103d <twofiles+0x1eb>
          printf(1, "wrong char\n");
    101d:	c7 44 24 04 c6 4b 00 	movl   $0x4bc6,0x4(%esp)
    1024:	00 
    1025:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    102c:	e8 9c 32 00 00       	call   42cd <printf>
          exit(1);
    1031:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1038:	e8 00 31 00 00       	call   413d <exit>

  for(i = 0; i < 2; i++){
    fd = open(i?"f1":"f2", 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
    103d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1041:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1044:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    1047:	7c b0                	jl     ff9 <twofiles+0x1a7>
        if(buf[j] != (i?'p':'c')){
          printf(1, "wrong char\n");
          exit(1);
        }
      }
      total += n;
    1049:	8b 45 dc             	mov    -0x24(%ebp),%eax
    104c:	01 45 ec             	add    %eax,-0x14(%ebp)
    exit(1);

  for(i = 0; i < 2; i++){
    fd = open(i?"f1":"f2", 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
    104f:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    1056:	00 
    1057:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
    105e:	00 
    105f:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1062:	89 04 24             	mov    %eax,(%esp)
    1065:	e8 eb 30 00 00       	call   4155 <read>
    106a:	89 45 dc             	mov    %eax,-0x24(%ebp)
    106d:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    1071:	0f 8f 79 ff ff ff    	jg     ff0 <twofiles+0x19e>
          exit(1);
        }
      }
      total += n;
    }
    close(fd);
    1077:	8b 45 e0             	mov    -0x20(%ebp),%eax
    107a:	89 04 24             	mov    %eax,(%esp)
    107d:	e8 e3 30 00 00       	call   4165 <close>
    if(total != 12*500){
    1082:	81 7d ec 70 17 00 00 	cmpl   $0x1770,-0x14(%ebp)
    1089:	74 27                	je     10b2 <twofiles+0x260>
      printf(1, "wrong length %d\n", total);
    108b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    108e:	89 44 24 08          	mov    %eax,0x8(%esp)
    1092:	c7 44 24 04 d2 4b 00 	movl   $0x4bd2,0x4(%esp)
    1099:	00 
    109a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10a1:	e8 27 32 00 00       	call   42cd <printf>
      exit(1);
    10a6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10ad:	e8 8b 30 00 00       	call   413d <exit>
  if(pid)
    wait(&st);
  else
    exit(1);

  for(i = 0; i < 2; i++){
    10b2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    10b6:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
    10ba:	0f 8e 02 ff ff ff    	jle    fc2 <twofiles+0x170>
      printf(1, "wrong length %d\n", total);
      exit(1);
    }
  }

  unlink("f1");
    10c0:	c7 04 24 a0 4b 00 00 	movl   $0x4ba0,(%esp)
    10c7:	e8 c1 30 00 00       	call   418d <unlink>
  unlink("f2");
    10cc:	c7 04 24 a3 4b 00 00 	movl   $0x4ba3,(%esp)
    10d3:	e8 b5 30 00 00       	call   418d <unlink>

  printf(1, "twofiles ok\n");
    10d8:	c7 44 24 04 e3 4b 00 	movl   $0x4be3,0x4(%esp)
    10df:	00 
    10e0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10e7:	e8 e1 31 00 00       	call   42cd <printf>
}
    10ec:	c9                   	leave  
    10ed:	c3                   	ret    

000010ee <createdelete>:

// two processes create and delete different files in same directory
void
createdelete(void)
{
    10ee:	55                   	push   %ebp
    10ef:	89 e5                	mov    %esp,%ebp
    10f1:	83 ec 48             	sub    $0x48,%esp
  enum { N = 20 };
  int pid, i, fd, st;
  char name[32];

  printf(1, "createdelete test\n");
    10f4:	c7 44 24 04 f0 4b 00 	movl   $0x4bf0,0x4(%esp)
    10fb:	00 
    10fc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1103:	e8 c5 31 00 00       	call   42cd <printf>
  pid = fork();
    1108:	e8 28 30 00 00       	call   4135 <fork>
    110d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(pid < 0){
    1110:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1114:	79 20                	jns    1136 <createdelete+0x48>
    printf(1, "fork failed\n");
    1116:	c7 44 24 04 89 4a 00 	movl   $0x4a89,0x4(%esp)
    111d:	00 
    111e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1125:	e8 a3 31 00 00       	call   42cd <printf>
    exit(1);
    112a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1131:	e8 07 30 00 00       	call   413d <exit>
  }

  name[0] = pid ? 'p' : 'c';
    1136:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    113a:	74 07                	je     1143 <createdelete+0x55>
    113c:	b8 70 00 00 00       	mov    $0x70,%eax
    1141:	eb 05                	jmp    1148 <createdelete+0x5a>
    1143:	b8 63 00 00 00       	mov    $0x63,%eax
    1148:	88 45 c8             	mov    %al,-0x38(%ebp)
  name[2] = '\0';
    114b:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
  for(i = 0; i < N; i++){
    114f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1156:	e9 a5 00 00 00       	jmp    1200 <createdelete+0x112>
    name[1] = '0' + i;
    115b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    115e:	83 c0 30             	add    $0x30,%eax
    1161:	88 45 c9             	mov    %al,-0x37(%ebp)
    fd = open(name, O_CREATE | O_RDWR);
    1164:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    116b:	00 
    116c:	8d 45 c8             	lea    -0x38(%ebp),%eax
    116f:	89 04 24             	mov    %eax,(%esp)
    1172:	e8 06 30 00 00       	call   417d <open>
    1177:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(fd < 0){
    117a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    117e:	79 20                	jns    11a0 <createdelete+0xb2>
      printf(1, "create failed\n");
    1180:	c7 44 24 04 a6 4b 00 	movl   $0x4ba6,0x4(%esp)
    1187:	00 
    1188:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    118f:	e8 39 31 00 00       	call   42cd <printf>
      exit(1);
    1194:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    119b:	e8 9d 2f 00 00       	call   413d <exit>
    }
    close(fd);
    11a0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    11a3:	89 04 24             	mov    %eax,(%esp)
    11a6:	e8 ba 2f 00 00       	call   4165 <close>
    if(i > 0 && (i % 2 ) == 0){
    11ab:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    11af:	7e 4b                	jle    11fc <createdelete+0x10e>
    11b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11b4:	83 e0 01             	and    $0x1,%eax
    11b7:	85 c0                	test   %eax,%eax
    11b9:	75 41                	jne    11fc <createdelete+0x10e>
      name[1] = '0' + (i / 2);
    11bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11be:	89 c2                	mov    %eax,%edx
    11c0:	c1 ea 1f             	shr    $0x1f,%edx
    11c3:	01 d0                	add    %edx,%eax
    11c5:	d1 f8                	sar    %eax
    11c7:	83 c0 30             	add    $0x30,%eax
    11ca:	88 45 c9             	mov    %al,-0x37(%ebp)
      if(unlink(name) < 0){
    11cd:	8d 45 c8             	lea    -0x38(%ebp),%eax
    11d0:	89 04 24             	mov    %eax,(%esp)
    11d3:	e8 b5 2f 00 00       	call   418d <unlink>
    11d8:	85 c0                	test   %eax,%eax
    11da:	79 20                	jns    11fc <createdelete+0x10e>
        printf(1, "unlink failed\n");
    11dc:	c7 44 24 04 03 4c 00 	movl   $0x4c03,0x4(%esp)
    11e3:	00 
    11e4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    11eb:	e8 dd 30 00 00       	call   42cd <printf>
        exit(1);
    11f0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    11f7:	e8 41 2f 00 00       	call   413d <exit>
    exit(1);
  }

  name[0] = pid ? 'p' : 'c';
  name[2] = '\0';
  for(i = 0; i < N; i++){
    11fc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1200:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    1204:	0f 8e 51 ff ff ff    	jle    115b <createdelete+0x6d>
        exit(1);
      }
    }
  }

  if(pid==0)
    120a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    120e:	75 0c                	jne    121c <createdelete+0x12e>
    exit(1);
    1210:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1217:	e8 21 2f 00 00       	call   413d <exit>
  else
    wait(&st);
    121c:	8d 45 e8             	lea    -0x18(%ebp),%eax
    121f:	89 04 24             	mov    %eax,(%esp)
    1222:	e8 1e 2f 00 00       	call   4145 <wait>

  for(i = 0; i < N; i++){
    1227:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    122e:	e9 50 01 00 00       	jmp    1383 <createdelete+0x295>
    name[0] = 'p';
    1233:	c6 45 c8 70          	movb   $0x70,-0x38(%ebp)
    name[1] = '0' + i;
    1237:	8b 45 f4             	mov    -0xc(%ebp),%eax
    123a:	83 c0 30             	add    $0x30,%eax
    123d:	88 45 c9             	mov    %al,-0x37(%ebp)
    fd = open(name, 0);
    1240:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1247:	00 
    1248:	8d 45 c8             	lea    -0x38(%ebp),%eax
    124b:	89 04 24             	mov    %eax,(%esp)
    124e:	e8 2a 2f 00 00       	call   417d <open>
    1253:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if((i == 0 || i >= N/2) && fd < 0){
    1256:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    125a:	74 06                	je     1262 <createdelete+0x174>
    125c:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    1260:	7e 2d                	jle    128f <createdelete+0x1a1>
    1262:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1266:	79 27                	jns    128f <createdelete+0x1a1>
      printf(1, "oops createdelete %s didn't exist\n", name);
    1268:	8d 45 c8             	lea    -0x38(%ebp),%eax
    126b:	89 44 24 08          	mov    %eax,0x8(%esp)
    126f:	c7 44 24 04 14 4c 00 	movl   $0x4c14,0x4(%esp)
    1276:	00 
    1277:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    127e:	e8 4a 30 00 00       	call   42cd <printf>
      exit(1);
    1283:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    128a:	e8 ae 2e 00 00       	call   413d <exit>
    } else if((i >= 1 && i < N/2) && fd >= 0){
    128f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1293:	7e 33                	jle    12c8 <createdelete+0x1da>
    1295:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    1299:	7f 2d                	jg     12c8 <createdelete+0x1da>
    129b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    129f:	78 27                	js     12c8 <createdelete+0x1da>
      printf(1, "oops createdelete %s did exist\n", name);
    12a1:	8d 45 c8             	lea    -0x38(%ebp),%eax
    12a4:	89 44 24 08          	mov    %eax,0x8(%esp)
    12a8:	c7 44 24 04 38 4c 00 	movl   $0x4c38,0x4(%esp)
    12af:	00 
    12b0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    12b7:	e8 11 30 00 00       	call   42cd <printf>
      exit(1);
    12bc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    12c3:	e8 75 2e 00 00       	call   413d <exit>
    }
    if(fd >= 0)
    12c8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    12cc:	78 0b                	js     12d9 <createdelete+0x1eb>
      close(fd);
    12ce:	8b 45 ec             	mov    -0x14(%ebp),%eax
    12d1:	89 04 24             	mov    %eax,(%esp)
    12d4:	e8 8c 2e 00 00       	call   4165 <close>

    name[0] = 'c';
    12d9:	c6 45 c8 63          	movb   $0x63,-0x38(%ebp)
    name[1] = '0' + i;
    12dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12e0:	83 c0 30             	add    $0x30,%eax
    12e3:	88 45 c9             	mov    %al,-0x37(%ebp)
    fd = open(name, 0);
    12e6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    12ed:	00 
    12ee:	8d 45 c8             	lea    -0x38(%ebp),%eax
    12f1:	89 04 24             	mov    %eax,(%esp)
    12f4:	e8 84 2e 00 00       	call   417d <open>
    12f9:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if((i == 0 || i >= N/2) && fd < 0){
    12fc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1300:	74 06                	je     1308 <createdelete+0x21a>
    1302:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    1306:	7e 2d                	jle    1335 <createdelete+0x247>
    1308:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    130c:	79 27                	jns    1335 <createdelete+0x247>
      printf(1, "oops createdelete %s didn't exist\n", name);
    130e:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1311:	89 44 24 08          	mov    %eax,0x8(%esp)
    1315:	c7 44 24 04 14 4c 00 	movl   $0x4c14,0x4(%esp)
    131c:	00 
    131d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1324:	e8 a4 2f 00 00       	call   42cd <printf>
      exit(1);
    1329:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1330:	e8 08 2e 00 00       	call   413d <exit>
    } else if((i >= 1 && i < N/2) && fd >= 0){
    1335:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1339:	7e 33                	jle    136e <createdelete+0x280>
    133b:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    133f:	7f 2d                	jg     136e <createdelete+0x280>
    1341:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1345:	78 27                	js     136e <createdelete+0x280>
      printf(1, "oops createdelete %s did exist\n", name);
    1347:	8d 45 c8             	lea    -0x38(%ebp),%eax
    134a:	89 44 24 08          	mov    %eax,0x8(%esp)
    134e:	c7 44 24 04 38 4c 00 	movl   $0x4c38,0x4(%esp)
    1355:	00 
    1356:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    135d:	e8 6b 2f 00 00       	call   42cd <printf>
      exit(1);
    1362:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1369:	e8 cf 2d 00 00       	call   413d <exit>
    }
    if(fd >= 0)
    136e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1372:	78 0b                	js     137f <createdelete+0x291>
      close(fd);
    1374:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1377:	89 04 24             	mov    %eax,(%esp)
    137a:	e8 e6 2d 00 00       	call   4165 <close>
  if(pid==0)
    exit(1);
  else
    wait(&st);

  for(i = 0; i < N; i++){
    137f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1383:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    1387:	0f 8e a6 fe ff ff    	jle    1233 <createdelete+0x145>
    }
    if(fd >= 0)
      close(fd);
  }

  for(i = 0; i < N; i++){
    138d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1394:	eb 2b                	jmp    13c1 <createdelete+0x2d3>
    name[0] = 'p';
    1396:	c6 45 c8 70          	movb   $0x70,-0x38(%ebp)
    name[1] = '0' + i;
    139a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    139d:	83 c0 30             	add    $0x30,%eax
    13a0:	88 45 c9             	mov    %al,-0x37(%ebp)
    unlink(name);
    13a3:	8d 45 c8             	lea    -0x38(%ebp),%eax
    13a6:	89 04 24             	mov    %eax,(%esp)
    13a9:	e8 df 2d 00 00       	call   418d <unlink>
    name[0] = 'c';
    13ae:	c6 45 c8 63          	movb   $0x63,-0x38(%ebp)
    unlink(name);
    13b2:	8d 45 c8             	lea    -0x38(%ebp),%eax
    13b5:	89 04 24             	mov    %eax,(%esp)
    13b8:	e8 d0 2d 00 00       	call   418d <unlink>
    }
    if(fd >= 0)
      close(fd);
  }

  for(i = 0; i < N; i++){
    13bd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    13c1:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    13c5:	7e cf                	jle    1396 <createdelete+0x2a8>
    unlink(name);
    name[0] = 'c';
    unlink(name);
  }

  printf(1, "createdelete ok\n");
    13c7:	c7 44 24 04 58 4c 00 	movl   $0x4c58,0x4(%esp)
    13ce:	00 
    13cf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    13d6:	e8 f2 2e 00 00       	call   42cd <printf>
}
    13db:	c9                   	leave  
    13dc:	c3                   	ret    

000013dd <unlinkread>:

// can I unlink a file and still read it?
void
unlinkread(void)
{
    13dd:	55                   	push   %ebp
    13de:	89 e5                	mov    %esp,%ebp
    13e0:	83 ec 28             	sub    $0x28,%esp
  int fd, fd1;

  printf(1, "unlinkread test\n");
    13e3:	c7 44 24 04 69 4c 00 	movl   $0x4c69,0x4(%esp)
    13ea:	00 
    13eb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    13f2:	e8 d6 2e 00 00       	call   42cd <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    13f7:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    13fe:	00 
    13ff:	c7 04 24 7a 4c 00 00 	movl   $0x4c7a,(%esp)
    1406:	e8 72 2d 00 00       	call   417d <open>
    140b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    140e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1412:	79 20                	jns    1434 <unlinkread+0x57>
    printf(1, "create unlinkread failed\n");
    1414:	c7 44 24 04 85 4c 00 	movl   $0x4c85,0x4(%esp)
    141b:	00 
    141c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1423:	e8 a5 2e 00 00       	call   42cd <printf>
    exit(1);
    1428:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    142f:	e8 09 2d 00 00       	call   413d <exit>
  }
  write(fd, "hello", 5);
    1434:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
    143b:	00 
    143c:	c7 44 24 04 9f 4c 00 	movl   $0x4c9f,0x4(%esp)
    1443:	00 
    1444:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1447:	89 04 24             	mov    %eax,(%esp)
    144a:	e8 0e 2d 00 00       	call   415d <write>
  close(fd);
    144f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1452:	89 04 24             	mov    %eax,(%esp)
    1455:	e8 0b 2d 00 00       	call   4165 <close>

  fd = open("unlinkread", O_RDWR);
    145a:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    1461:	00 
    1462:	c7 04 24 7a 4c 00 00 	movl   $0x4c7a,(%esp)
    1469:	e8 0f 2d 00 00       	call   417d <open>
    146e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    1471:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1475:	79 20                	jns    1497 <unlinkread+0xba>
    printf(1, "open unlinkread failed\n");
    1477:	c7 44 24 04 a5 4c 00 	movl   $0x4ca5,0x4(%esp)
    147e:	00 
    147f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1486:	e8 42 2e 00 00       	call   42cd <printf>
    exit(1);
    148b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1492:	e8 a6 2c 00 00       	call   413d <exit>
  }
  if(unlink("unlinkread") != 0){
    1497:	c7 04 24 7a 4c 00 00 	movl   $0x4c7a,(%esp)
    149e:	e8 ea 2c 00 00       	call   418d <unlink>
    14a3:	85 c0                	test   %eax,%eax
    14a5:	74 20                	je     14c7 <unlinkread+0xea>
    printf(1, "unlink unlinkread failed\n");
    14a7:	c7 44 24 04 bd 4c 00 	movl   $0x4cbd,0x4(%esp)
    14ae:	00 
    14af:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    14b6:	e8 12 2e 00 00       	call   42cd <printf>
    exit(1);
    14bb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    14c2:	e8 76 2c 00 00       	call   413d <exit>
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    14c7:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    14ce:	00 
    14cf:	c7 04 24 7a 4c 00 00 	movl   $0x4c7a,(%esp)
    14d6:	e8 a2 2c 00 00       	call   417d <open>
    14db:	89 45 f0             	mov    %eax,-0x10(%ebp)
  write(fd1, "yyy", 3);
    14de:	c7 44 24 08 03 00 00 	movl   $0x3,0x8(%esp)
    14e5:	00 
    14e6:	c7 44 24 04 d7 4c 00 	movl   $0x4cd7,0x4(%esp)
    14ed:	00 
    14ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
    14f1:	89 04 24             	mov    %eax,(%esp)
    14f4:	e8 64 2c 00 00       	call   415d <write>
  close(fd1);
    14f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    14fc:	89 04 24             	mov    %eax,(%esp)
    14ff:	e8 61 2c 00 00       	call   4165 <close>

  if(read(fd, buf, sizeof(buf)) != 5){
    1504:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    150b:	00 
    150c:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
    1513:	00 
    1514:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1517:	89 04 24             	mov    %eax,(%esp)
    151a:	e8 36 2c 00 00       	call   4155 <read>
    151f:	83 f8 05             	cmp    $0x5,%eax
    1522:	74 20                	je     1544 <unlinkread+0x167>
    printf(1, "unlinkread read failed");
    1524:	c7 44 24 04 db 4c 00 	movl   $0x4cdb,0x4(%esp)
    152b:	00 
    152c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1533:	e8 95 2d 00 00       	call   42cd <printf>
    exit(1);
    1538:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    153f:	e8 f9 2b 00 00       	call   413d <exit>
  }
  if(buf[0] != 'h'){
    1544:	0f b6 05 e0 8b 00 00 	movzbl 0x8be0,%eax
    154b:	3c 68                	cmp    $0x68,%al
    154d:	74 20                	je     156f <unlinkread+0x192>
    printf(1, "unlinkread wrong data\n");
    154f:	c7 44 24 04 f2 4c 00 	movl   $0x4cf2,0x4(%esp)
    1556:	00 
    1557:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    155e:	e8 6a 2d 00 00       	call   42cd <printf>
    exit(1);
    1563:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    156a:	e8 ce 2b 00 00       	call   413d <exit>
  }
  if(write(fd, buf, 10) != 10){
    156f:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    1576:	00 
    1577:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
    157e:	00 
    157f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1582:	89 04 24             	mov    %eax,(%esp)
    1585:	e8 d3 2b 00 00       	call   415d <write>
    158a:	83 f8 0a             	cmp    $0xa,%eax
    158d:	74 20                	je     15af <unlinkread+0x1d2>
    printf(1, "unlinkread write failed\n");
    158f:	c7 44 24 04 09 4d 00 	movl   $0x4d09,0x4(%esp)
    1596:	00 
    1597:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    159e:	e8 2a 2d 00 00       	call   42cd <printf>
    exit(1);
    15a3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    15aa:	e8 8e 2b 00 00       	call   413d <exit>
  }
  close(fd);
    15af:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15b2:	89 04 24             	mov    %eax,(%esp)
    15b5:	e8 ab 2b 00 00       	call   4165 <close>
  unlink("unlinkread");
    15ba:	c7 04 24 7a 4c 00 00 	movl   $0x4c7a,(%esp)
    15c1:	e8 c7 2b 00 00       	call   418d <unlink>
  printf(1, "unlinkread ok\n");
    15c6:	c7 44 24 04 22 4d 00 	movl   $0x4d22,0x4(%esp)
    15cd:	00 
    15ce:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    15d5:	e8 f3 2c 00 00       	call   42cd <printf>
}
    15da:	c9                   	leave  
    15db:	c3                   	ret    

000015dc <linktest>:

void
linktest(void)
{
    15dc:	55                   	push   %ebp
    15dd:	89 e5                	mov    %esp,%ebp
    15df:	83 ec 28             	sub    $0x28,%esp
  int fd;

  printf(1, "linktest\n");
    15e2:	c7 44 24 04 31 4d 00 	movl   $0x4d31,0x4(%esp)
    15e9:	00 
    15ea:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    15f1:	e8 d7 2c 00 00       	call   42cd <printf>

  unlink("lf1");
    15f6:	c7 04 24 3b 4d 00 00 	movl   $0x4d3b,(%esp)
    15fd:	e8 8b 2b 00 00       	call   418d <unlink>
  unlink("lf2");
    1602:	c7 04 24 3f 4d 00 00 	movl   $0x4d3f,(%esp)
    1609:	e8 7f 2b 00 00       	call   418d <unlink>

  fd = open("lf1", O_CREATE|O_RDWR);
    160e:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    1615:	00 
    1616:	c7 04 24 3b 4d 00 00 	movl   $0x4d3b,(%esp)
    161d:	e8 5b 2b 00 00       	call   417d <open>
    1622:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    1625:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1629:	79 20                	jns    164b <linktest+0x6f>
    printf(1, "create lf1 failed\n");
    162b:	c7 44 24 04 43 4d 00 	movl   $0x4d43,0x4(%esp)
    1632:	00 
    1633:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    163a:	e8 8e 2c 00 00       	call   42cd <printf>
    exit(1);
    163f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1646:	e8 f2 2a 00 00       	call   413d <exit>
  }
  if(write(fd, "hello", 5) != 5){
    164b:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
    1652:	00 
    1653:	c7 44 24 04 9f 4c 00 	movl   $0x4c9f,0x4(%esp)
    165a:	00 
    165b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    165e:	89 04 24             	mov    %eax,(%esp)
    1661:	e8 f7 2a 00 00       	call   415d <write>
    1666:	83 f8 05             	cmp    $0x5,%eax
    1669:	74 20                	je     168b <linktest+0xaf>
    printf(1, "write lf1 failed\n");
    166b:	c7 44 24 04 56 4d 00 	movl   $0x4d56,0x4(%esp)
    1672:	00 
    1673:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    167a:	e8 4e 2c 00 00       	call   42cd <printf>
    exit(1);
    167f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1686:	e8 b2 2a 00 00       	call   413d <exit>
  }
  close(fd);
    168b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    168e:	89 04 24             	mov    %eax,(%esp)
    1691:	e8 cf 2a 00 00       	call   4165 <close>

  if(link("lf1", "lf2") < 0){
    1696:	c7 44 24 04 3f 4d 00 	movl   $0x4d3f,0x4(%esp)
    169d:	00 
    169e:	c7 04 24 3b 4d 00 00 	movl   $0x4d3b,(%esp)
    16a5:	e8 f3 2a 00 00       	call   419d <link>
    16aa:	85 c0                	test   %eax,%eax
    16ac:	79 20                	jns    16ce <linktest+0xf2>
    printf(1, "link lf1 lf2 failed\n");
    16ae:	c7 44 24 04 68 4d 00 	movl   $0x4d68,0x4(%esp)
    16b5:	00 
    16b6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    16bd:	e8 0b 2c 00 00       	call   42cd <printf>
    exit(1);
    16c2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    16c9:	e8 6f 2a 00 00       	call   413d <exit>
  }
  unlink("lf1");
    16ce:	c7 04 24 3b 4d 00 00 	movl   $0x4d3b,(%esp)
    16d5:	e8 b3 2a 00 00       	call   418d <unlink>

  if(open("lf1", 0) >= 0){
    16da:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    16e1:	00 
    16e2:	c7 04 24 3b 4d 00 00 	movl   $0x4d3b,(%esp)
    16e9:	e8 8f 2a 00 00       	call   417d <open>
    16ee:	85 c0                	test   %eax,%eax
    16f0:	78 20                	js     1712 <linktest+0x136>
    printf(1, "unlinked lf1 but it is still there!\n");
    16f2:	c7 44 24 04 80 4d 00 	movl   $0x4d80,0x4(%esp)
    16f9:	00 
    16fa:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1701:	e8 c7 2b 00 00       	call   42cd <printf>
    exit(1);
    1706:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    170d:	e8 2b 2a 00 00       	call   413d <exit>
  }

  fd = open("lf2", 0);
    1712:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1719:	00 
    171a:	c7 04 24 3f 4d 00 00 	movl   $0x4d3f,(%esp)
    1721:	e8 57 2a 00 00       	call   417d <open>
    1726:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    1729:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    172d:	79 20                	jns    174f <linktest+0x173>
    printf(1, "open lf2 failed\n");
    172f:	c7 44 24 04 a5 4d 00 	movl   $0x4da5,0x4(%esp)
    1736:	00 
    1737:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    173e:	e8 8a 2b 00 00       	call   42cd <printf>
    exit(1);
    1743:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    174a:	e8 ee 29 00 00       	call   413d <exit>
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    174f:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    1756:	00 
    1757:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
    175e:	00 
    175f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1762:	89 04 24             	mov    %eax,(%esp)
    1765:	e8 eb 29 00 00       	call   4155 <read>
    176a:	83 f8 05             	cmp    $0x5,%eax
    176d:	74 20                	je     178f <linktest+0x1b3>
    printf(1, "read lf2 failed\n");
    176f:	c7 44 24 04 b6 4d 00 	movl   $0x4db6,0x4(%esp)
    1776:	00 
    1777:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    177e:	e8 4a 2b 00 00       	call   42cd <printf>
    exit(1);
    1783:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    178a:	e8 ae 29 00 00       	call   413d <exit>
  }
  close(fd);
    178f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1792:	89 04 24             	mov    %eax,(%esp)
    1795:	e8 cb 29 00 00       	call   4165 <close>

  if(link("lf2", "lf2") >= 0){
    179a:	c7 44 24 04 3f 4d 00 	movl   $0x4d3f,0x4(%esp)
    17a1:	00 
    17a2:	c7 04 24 3f 4d 00 00 	movl   $0x4d3f,(%esp)
    17a9:	e8 ef 29 00 00       	call   419d <link>
    17ae:	85 c0                	test   %eax,%eax
    17b0:	78 20                	js     17d2 <linktest+0x1f6>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    17b2:	c7 44 24 04 c7 4d 00 	movl   $0x4dc7,0x4(%esp)
    17b9:	00 
    17ba:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    17c1:	e8 07 2b 00 00       	call   42cd <printf>
    exit(1);
    17c6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    17cd:	e8 6b 29 00 00       	call   413d <exit>
  }

  unlink("lf2");
    17d2:	c7 04 24 3f 4d 00 00 	movl   $0x4d3f,(%esp)
    17d9:	e8 af 29 00 00       	call   418d <unlink>
  if(link("lf2", "lf1") >= 0){
    17de:	c7 44 24 04 3b 4d 00 	movl   $0x4d3b,0x4(%esp)
    17e5:	00 
    17e6:	c7 04 24 3f 4d 00 00 	movl   $0x4d3f,(%esp)
    17ed:	e8 ab 29 00 00       	call   419d <link>
    17f2:	85 c0                	test   %eax,%eax
    17f4:	78 20                	js     1816 <linktest+0x23a>
    printf(1, "link non-existant succeeded! oops\n");
    17f6:	c7 44 24 04 e8 4d 00 	movl   $0x4de8,0x4(%esp)
    17fd:	00 
    17fe:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1805:	e8 c3 2a 00 00       	call   42cd <printf>
    exit(1);
    180a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1811:	e8 27 29 00 00       	call   413d <exit>
  }

  if(link(".", "lf1") >= 0){
    1816:	c7 44 24 04 3b 4d 00 	movl   $0x4d3b,0x4(%esp)
    181d:	00 
    181e:	c7 04 24 0b 4e 00 00 	movl   $0x4e0b,(%esp)
    1825:	e8 73 29 00 00       	call   419d <link>
    182a:	85 c0                	test   %eax,%eax
    182c:	78 20                	js     184e <linktest+0x272>
    printf(1, "link . lf1 succeeded! oops\n");
    182e:	c7 44 24 04 0d 4e 00 	movl   $0x4e0d,0x4(%esp)
    1835:	00 
    1836:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    183d:	e8 8b 2a 00 00       	call   42cd <printf>
    exit(1);
    1842:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1849:	e8 ef 28 00 00       	call   413d <exit>
  }

  printf(1, "linktest ok\n");
    184e:	c7 44 24 04 29 4e 00 	movl   $0x4e29,0x4(%esp)
    1855:	00 
    1856:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    185d:	e8 6b 2a 00 00       	call   42cd <printf>
}
    1862:	c9                   	leave  
    1863:	c3                   	ret    

00001864 <concreate>:

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    1864:	55                   	push   %ebp
    1865:	89 e5                	mov    %esp,%ebp
    1867:	83 ec 68             	sub    $0x68,%esp
  struct {
    ushort inum;
    char name[14];
  } de;

  printf(1, "concreate test\n");
    186a:	c7 44 24 04 36 4e 00 	movl   $0x4e36,0x4(%esp)
    1871:	00 
    1872:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1879:	e8 4f 2a 00 00       	call   42cd <printf>
  file[0] = 'C';
    187e:	c6 45 e5 43          	movb   $0x43,-0x1b(%ebp)
  file[2] = '\0';
    1882:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
  for(i = 0; i < 40; i++){
    1886:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    188d:	e9 0b 01 00 00       	jmp    199d <concreate+0x139>
    file[1] = '0' + i;
    1892:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1895:	83 c0 30             	add    $0x30,%eax
    1898:	88 45 e6             	mov    %al,-0x1a(%ebp)
    unlink(file);
    189b:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    189e:	89 04 24             	mov    %eax,(%esp)
    18a1:	e8 e7 28 00 00       	call   418d <unlink>
    pid = fork();
    18a6:	e8 8a 28 00 00       	call   4135 <fork>
    18ab:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(pid && (i % 3) == 1){
    18ae:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    18b2:	74 3a                	je     18ee <concreate+0x8a>
    18b4:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    18b7:	ba 56 55 55 55       	mov    $0x55555556,%edx
    18bc:	89 c8                	mov    %ecx,%eax
    18be:	f7 ea                	imul   %edx
    18c0:	89 c8                	mov    %ecx,%eax
    18c2:	c1 f8 1f             	sar    $0x1f,%eax
    18c5:	29 c2                	sub    %eax,%edx
    18c7:	89 d0                	mov    %edx,%eax
    18c9:	01 c0                	add    %eax,%eax
    18cb:	01 d0                	add    %edx,%eax
    18cd:	29 c1                	sub    %eax,%ecx
    18cf:	89 ca                	mov    %ecx,%edx
    18d1:	83 fa 01             	cmp    $0x1,%edx
    18d4:	75 18                	jne    18ee <concreate+0x8a>
      link("C0", file);
    18d6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    18d9:	89 44 24 04          	mov    %eax,0x4(%esp)
    18dd:	c7 04 24 46 4e 00 00 	movl   $0x4e46,(%esp)
    18e4:	e8 b4 28 00 00       	call   419d <link>
    18e9:	e9 8e 00 00 00       	jmp    197c <concreate+0x118>
    } else if(pid == 0 && (i % 5) == 1){
    18ee:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    18f2:	75 3a                	jne    192e <concreate+0xca>
    18f4:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    18f7:	ba 67 66 66 66       	mov    $0x66666667,%edx
    18fc:	89 c8                	mov    %ecx,%eax
    18fe:	f7 ea                	imul   %edx
    1900:	d1 fa                	sar    %edx
    1902:	89 c8                	mov    %ecx,%eax
    1904:	c1 f8 1f             	sar    $0x1f,%eax
    1907:	29 c2                	sub    %eax,%edx
    1909:	89 d0                	mov    %edx,%eax
    190b:	c1 e0 02             	shl    $0x2,%eax
    190e:	01 d0                	add    %edx,%eax
    1910:	29 c1                	sub    %eax,%ecx
    1912:	89 ca                	mov    %ecx,%edx
    1914:	83 fa 01             	cmp    $0x1,%edx
    1917:	75 15                	jne    192e <concreate+0xca>
      link("C0", file);
    1919:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    191c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1920:	c7 04 24 46 4e 00 00 	movl   $0x4e46,(%esp)
    1927:	e8 71 28 00 00       	call   419d <link>
    192c:	eb 4e                	jmp    197c <concreate+0x118>
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    192e:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    1935:	00 
    1936:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1939:	89 04 24             	mov    %eax,(%esp)
    193c:	e8 3c 28 00 00       	call   417d <open>
    1941:	89 45 e8             	mov    %eax,-0x18(%ebp)
      if(fd < 0){
    1944:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1948:	79 27                	jns    1971 <concreate+0x10d>
        printf(1, "concreate create %s failed\n", file);
    194a:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    194d:	89 44 24 08          	mov    %eax,0x8(%esp)
    1951:	c7 44 24 04 49 4e 00 	movl   $0x4e49,0x4(%esp)
    1958:	00 
    1959:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1960:	e8 68 29 00 00       	call   42cd <printf>
        exit(1);
    1965:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    196c:	e8 cc 27 00 00       	call   413d <exit>
      }
      close(fd);
    1971:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1974:	89 04 24             	mov    %eax,(%esp)
    1977:	e8 e9 27 00 00       	call   4165 <close>
    }
    if(pid == 0)
    197c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1980:	75 0c                	jne    198e <concreate+0x12a>
      exit(1);
    1982:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1989:	e8 af 27 00 00       	call   413d <exit>
    else
      wait(&st);
    198e:	8d 45 e0             	lea    -0x20(%ebp),%eax
    1991:	89 04 24             	mov    %eax,(%esp)
    1994:	e8 ac 27 00 00       	call   4145 <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1999:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    199d:	83 7d f4 27          	cmpl   $0x27,-0xc(%ebp)
    19a1:	0f 8e eb fe ff ff    	jle    1892 <concreate+0x2e>
      exit(1);
    else
      wait(&st);
  }

  memset(fa, 0, sizeof(fa));
    19a7:	c7 44 24 08 28 00 00 	movl   $0x28,0x8(%esp)
    19ae:	00 
    19af:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    19b6:	00 
    19b7:	8d 45 b8             	lea    -0x48(%ebp),%eax
    19ba:	89 04 24             	mov    %eax,(%esp)
    19bd:	e8 ce 25 00 00       	call   3f90 <memset>
  fd = open(".", 0);
    19c2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    19c9:	00 
    19ca:	c7 04 24 0b 4e 00 00 	movl   $0x4e0b,(%esp)
    19d1:	e8 a7 27 00 00       	call   417d <open>
    19d6:	89 45 e8             	mov    %eax,-0x18(%ebp)
  n = 0;
    19d9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  while(read(fd, &de, sizeof(de)) > 0){
    19e0:	e9 b3 00 00 00       	jmp    1a98 <concreate+0x234>
    if(de.inum == 0)
    19e5:	0f b7 45 a8          	movzwl -0x58(%ebp),%eax
    19e9:	66 85 c0             	test   %ax,%ax
    19ec:	75 05                	jne    19f3 <concreate+0x18f>
      continue;
    19ee:	e9 a5 00 00 00       	jmp    1a98 <concreate+0x234>
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    19f3:	0f b6 45 aa          	movzbl -0x56(%ebp),%eax
    19f7:	3c 43                	cmp    $0x43,%al
    19f9:	0f 85 99 00 00 00    	jne    1a98 <concreate+0x234>
    19ff:	0f b6 45 ac          	movzbl -0x54(%ebp),%eax
    1a03:	84 c0                	test   %al,%al
    1a05:	0f 85 8d 00 00 00    	jne    1a98 <concreate+0x234>
      i = de.name[1] - '0';
    1a0b:	0f b6 45 ab          	movzbl -0x55(%ebp),%eax
    1a0f:	0f be c0             	movsbl %al,%eax
    1a12:	83 e8 30             	sub    $0x30,%eax
    1a15:	89 45 f4             	mov    %eax,-0xc(%ebp)
      if(i < 0 || i >= sizeof(fa)){
    1a18:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1a1c:	78 08                	js     1a26 <concreate+0x1c2>
    1a1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a21:	83 f8 27             	cmp    $0x27,%eax
    1a24:	76 2a                	jbe    1a50 <concreate+0x1ec>
        printf(1, "concreate weird file %s\n", de.name);
    1a26:	8d 45 a8             	lea    -0x58(%ebp),%eax
    1a29:	83 c0 02             	add    $0x2,%eax
    1a2c:	89 44 24 08          	mov    %eax,0x8(%esp)
    1a30:	c7 44 24 04 65 4e 00 	movl   $0x4e65,0x4(%esp)
    1a37:	00 
    1a38:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1a3f:	e8 89 28 00 00       	call   42cd <printf>
        exit(1);
    1a44:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1a4b:	e8 ed 26 00 00       	call   413d <exit>
      }
      if(fa[i]){
    1a50:	8d 55 b8             	lea    -0x48(%ebp),%edx
    1a53:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a56:	01 d0                	add    %edx,%eax
    1a58:	0f b6 00             	movzbl (%eax),%eax
    1a5b:	84 c0                	test   %al,%al
    1a5d:	74 2a                	je     1a89 <concreate+0x225>
        printf(1, "concreate duplicate file %s\n", de.name);
    1a5f:	8d 45 a8             	lea    -0x58(%ebp),%eax
    1a62:	83 c0 02             	add    $0x2,%eax
    1a65:	89 44 24 08          	mov    %eax,0x8(%esp)
    1a69:	c7 44 24 04 7e 4e 00 	movl   $0x4e7e,0x4(%esp)
    1a70:	00 
    1a71:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1a78:	e8 50 28 00 00       	call   42cd <printf>
        exit(1);
    1a7d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1a84:	e8 b4 26 00 00       	call   413d <exit>
      }
      fa[i] = 1;
    1a89:	8d 55 b8             	lea    -0x48(%ebp),%edx
    1a8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a8f:	01 d0                	add    %edx,%eax
    1a91:	c6 00 01             	movb   $0x1,(%eax)
      n++;
    1a94:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  }

  memset(fa, 0, sizeof(fa));
  fd = open(".", 0);
  n = 0;
  while(read(fd, &de, sizeof(de)) > 0){
    1a98:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    1a9f:	00 
    1aa0:	8d 45 a8             	lea    -0x58(%ebp),%eax
    1aa3:	89 44 24 04          	mov    %eax,0x4(%esp)
    1aa7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1aaa:	89 04 24             	mov    %eax,(%esp)
    1aad:	e8 a3 26 00 00       	call   4155 <read>
    1ab2:	85 c0                	test   %eax,%eax
    1ab4:	0f 8f 2b ff ff ff    	jg     19e5 <concreate+0x181>
      }
      fa[i] = 1;
      n++;
    }
  }
  close(fd);
    1aba:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1abd:	89 04 24             	mov    %eax,(%esp)
    1ac0:	e8 a0 26 00 00       	call   4165 <close>

  if(n != 40){
    1ac5:	83 7d f0 28          	cmpl   $0x28,-0x10(%ebp)
    1ac9:	74 20                	je     1aeb <concreate+0x287>
    printf(1, "concreate not enough files in directory listing\n");
    1acb:	c7 44 24 04 9c 4e 00 	movl   $0x4e9c,0x4(%esp)
    1ad2:	00 
    1ad3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1ada:	e8 ee 27 00 00       	call   42cd <printf>
    exit(1);
    1adf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1ae6:	e8 52 26 00 00       	call   413d <exit>
  }

  for(i = 0; i < 40; i++){
    1aeb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1af2:	e9 41 01 00 00       	jmp    1c38 <concreate+0x3d4>
    file[1] = '0' + i;
    1af7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1afa:	83 c0 30             	add    $0x30,%eax
    1afd:	88 45 e6             	mov    %al,-0x1a(%ebp)
    pid = fork();
    1b00:	e8 30 26 00 00       	call   4135 <fork>
    1b05:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(pid < 0){
    1b08:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1b0c:	79 20                	jns    1b2e <concreate+0x2ca>
      printf(1, "fork failed\n");
    1b0e:	c7 44 24 04 89 4a 00 	movl   $0x4a89,0x4(%esp)
    1b15:	00 
    1b16:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1b1d:	e8 ab 27 00 00       	call   42cd <printf>
      exit(1);
    1b22:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1b29:	e8 0f 26 00 00       	call   413d <exit>
    }
    if(((i % 3) == 0 && pid == 0) ||
    1b2e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    1b31:	ba 56 55 55 55       	mov    $0x55555556,%edx
    1b36:	89 c8                	mov    %ecx,%eax
    1b38:	f7 ea                	imul   %edx
    1b3a:	89 c8                	mov    %ecx,%eax
    1b3c:	c1 f8 1f             	sar    $0x1f,%eax
    1b3f:	29 c2                	sub    %eax,%edx
    1b41:	89 d0                	mov    %edx,%eax
    1b43:	01 c0                	add    %eax,%eax
    1b45:	01 d0                	add    %edx,%eax
    1b47:	29 c1                	sub    %eax,%ecx
    1b49:	89 ca                	mov    %ecx,%edx
    1b4b:	85 d2                	test   %edx,%edx
    1b4d:	75 06                	jne    1b55 <concreate+0x2f1>
    1b4f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1b53:	74 28                	je     1b7d <concreate+0x319>
       ((i % 3) == 1 && pid != 0)){
    1b55:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    1b58:	ba 56 55 55 55       	mov    $0x55555556,%edx
    1b5d:	89 c8                	mov    %ecx,%eax
    1b5f:	f7 ea                	imul   %edx
    1b61:	89 c8                	mov    %ecx,%eax
    1b63:	c1 f8 1f             	sar    $0x1f,%eax
    1b66:	29 c2                	sub    %eax,%edx
    1b68:	89 d0                	mov    %edx,%eax
    1b6a:	01 c0                	add    %eax,%eax
    1b6c:	01 d0                	add    %edx,%eax
    1b6e:	29 c1                	sub    %eax,%ecx
    1b70:	89 ca                	mov    %ecx,%edx
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
      exit(1);
    }
    if(((i % 3) == 0 && pid == 0) ||
    1b72:	83 fa 01             	cmp    $0x1,%edx
    1b75:	75 74                	jne    1beb <concreate+0x387>
       ((i % 3) == 1 && pid != 0)){
    1b77:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1b7b:	74 6e                	je     1beb <concreate+0x387>
      close(open(file, 0));
    1b7d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1b84:	00 
    1b85:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1b88:	89 04 24             	mov    %eax,(%esp)
    1b8b:	e8 ed 25 00 00       	call   417d <open>
    1b90:	89 04 24             	mov    %eax,(%esp)
    1b93:	e8 cd 25 00 00       	call   4165 <close>
      close(open(file, 0));
    1b98:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1b9f:	00 
    1ba0:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1ba3:	89 04 24             	mov    %eax,(%esp)
    1ba6:	e8 d2 25 00 00       	call   417d <open>
    1bab:	89 04 24             	mov    %eax,(%esp)
    1bae:	e8 b2 25 00 00       	call   4165 <close>
      close(open(file, 0));
    1bb3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1bba:	00 
    1bbb:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1bbe:	89 04 24             	mov    %eax,(%esp)
    1bc1:	e8 b7 25 00 00       	call   417d <open>
    1bc6:	89 04 24             	mov    %eax,(%esp)
    1bc9:	e8 97 25 00 00       	call   4165 <close>
      close(open(file, 0));
    1bce:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1bd5:	00 
    1bd6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1bd9:	89 04 24             	mov    %eax,(%esp)
    1bdc:	e8 9c 25 00 00       	call   417d <open>
    1be1:	89 04 24             	mov    %eax,(%esp)
    1be4:	e8 7c 25 00 00       	call   4165 <close>
    1be9:	eb 2c                	jmp    1c17 <concreate+0x3b3>
    } else {
      unlink(file);
    1beb:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1bee:	89 04 24             	mov    %eax,(%esp)
    1bf1:	e8 97 25 00 00       	call   418d <unlink>
      unlink(file);
    1bf6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1bf9:	89 04 24             	mov    %eax,(%esp)
    1bfc:	e8 8c 25 00 00       	call   418d <unlink>
      unlink(file);
    1c01:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1c04:	89 04 24             	mov    %eax,(%esp)
    1c07:	e8 81 25 00 00       	call   418d <unlink>
      unlink(file);
    1c0c:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1c0f:	89 04 24             	mov    %eax,(%esp)
    1c12:	e8 76 25 00 00       	call   418d <unlink>
    }
    if(pid == 0)
    1c17:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1c1b:	75 0c                	jne    1c29 <concreate+0x3c5>
      exit(1);
    1c1d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c24:	e8 14 25 00 00       	call   413d <exit>
    else
      wait(&st);
    1c29:	8d 45 e0             	lea    -0x20(%ebp),%eax
    1c2c:	89 04 24             	mov    %eax,(%esp)
    1c2f:	e8 11 25 00 00       	call   4145 <wait>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit(1);
  }

  for(i = 0; i < 40; i++){
    1c34:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1c38:	83 7d f4 27          	cmpl   $0x27,-0xc(%ebp)
    1c3c:	0f 8e b5 fe ff ff    	jle    1af7 <concreate+0x293>
      exit(1);
    else
      wait(&st);
  }

  printf(1, "concreate ok\n");
    1c42:	c7 44 24 04 cd 4e 00 	movl   $0x4ecd,0x4(%esp)
    1c49:	00 
    1c4a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c51:	e8 77 26 00 00       	call   42cd <printf>
}
    1c56:	c9                   	leave  
    1c57:	c3                   	ret    

00001c58 <linkunlink>:

// another concurrent link/unlink/create test,
// to look for deadlocks.
void
linkunlink()
{
    1c58:	55                   	push   %ebp
    1c59:	89 e5                	mov    %esp,%ebp
    1c5b:	83 ec 28             	sub    $0x28,%esp
  int pid, i,st;

  printf(1, "linkunlink test\n");
    1c5e:	c7 44 24 04 db 4e 00 	movl   $0x4edb,0x4(%esp)
    1c65:	00 
    1c66:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c6d:	e8 5b 26 00 00       	call   42cd <printf>

  unlink("x");
    1c72:	c7 04 24 42 4a 00 00 	movl   $0x4a42,(%esp)
    1c79:	e8 0f 25 00 00       	call   418d <unlink>
  pid = fork();
    1c7e:	e8 b2 24 00 00       	call   4135 <fork>
    1c83:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(pid < 0){
    1c86:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1c8a:	79 20                	jns    1cac <linkunlink+0x54>
    printf(1, "fork failed\n");
    1c8c:	c7 44 24 04 89 4a 00 	movl   $0x4a89,0x4(%esp)
    1c93:	00 
    1c94:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c9b:	e8 2d 26 00 00       	call   42cd <printf>
    exit(1);
    1ca0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1ca7:	e8 91 24 00 00       	call   413d <exit>
  }

  unsigned int x = (pid ? 1 : 97);
    1cac:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1cb0:	74 07                	je     1cb9 <linkunlink+0x61>
    1cb2:	b8 01 00 00 00       	mov    $0x1,%eax
    1cb7:	eb 05                	jmp    1cbe <linkunlink+0x66>
    1cb9:	b8 61 00 00 00       	mov    $0x61,%eax
    1cbe:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for(i = 0; i < 100; i++){
    1cc1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1cc8:	e9 8e 00 00 00       	jmp    1d5b <linkunlink+0x103>
    x = x * 1103515245 + 12345;
    1ccd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1cd0:	69 c0 6d 4e c6 41    	imul   $0x41c64e6d,%eax,%eax
    1cd6:	05 39 30 00 00       	add    $0x3039,%eax
    1cdb:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if((x % 3) == 0){
    1cde:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    1ce1:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
    1ce6:	89 c8                	mov    %ecx,%eax
    1ce8:	f7 e2                	mul    %edx
    1cea:	d1 ea                	shr    %edx
    1cec:	89 d0                	mov    %edx,%eax
    1cee:	01 c0                	add    %eax,%eax
    1cf0:	01 d0                	add    %edx,%eax
    1cf2:	29 c1                	sub    %eax,%ecx
    1cf4:	89 ca                	mov    %ecx,%edx
    1cf6:	85 d2                	test   %edx,%edx
    1cf8:	75 1e                	jne    1d18 <linkunlink+0xc0>
      close(open("x", O_RDWR | O_CREATE));
    1cfa:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    1d01:	00 
    1d02:	c7 04 24 42 4a 00 00 	movl   $0x4a42,(%esp)
    1d09:	e8 6f 24 00 00       	call   417d <open>
    1d0e:	89 04 24             	mov    %eax,(%esp)
    1d11:	e8 4f 24 00 00       	call   4165 <close>
    1d16:	eb 3f                	jmp    1d57 <linkunlink+0xff>
    } else if((x % 3) == 1){
    1d18:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    1d1b:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
    1d20:	89 c8                	mov    %ecx,%eax
    1d22:	f7 e2                	mul    %edx
    1d24:	d1 ea                	shr    %edx
    1d26:	89 d0                	mov    %edx,%eax
    1d28:	01 c0                	add    %eax,%eax
    1d2a:	01 d0                	add    %edx,%eax
    1d2c:	29 c1                	sub    %eax,%ecx
    1d2e:	89 ca                	mov    %ecx,%edx
    1d30:	83 fa 01             	cmp    $0x1,%edx
    1d33:	75 16                	jne    1d4b <linkunlink+0xf3>
      link("cat", "x");
    1d35:	c7 44 24 04 42 4a 00 	movl   $0x4a42,0x4(%esp)
    1d3c:	00 
    1d3d:	c7 04 24 ec 4e 00 00 	movl   $0x4eec,(%esp)
    1d44:	e8 54 24 00 00       	call   419d <link>
    1d49:	eb 0c                	jmp    1d57 <linkunlink+0xff>
    } else {
      unlink("x");
    1d4b:	c7 04 24 42 4a 00 00 	movl   $0x4a42,(%esp)
    1d52:	e8 36 24 00 00       	call   418d <unlink>
    printf(1, "fork failed\n");
    exit(1);
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    1d57:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1d5b:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
    1d5f:	0f 8e 68 ff ff ff    	jle    1ccd <linkunlink+0x75>
    } else {
      unlink("x");
    }
  }

  if(pid)
    1d65:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1d69:	74 0d                	je     1d78 <linkunlink+0x120>
    wait(&st);
    1d6b:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1d6e:	89 04 24             	mov    %eax,(%esp)
    1d71:	e8 cf 23 00 00       	call   4145 <wait>
    1d76:	eb 0c                	jmp    1d84 <linkunlink+0x12c>
  else 
    exit(1);
    1d78:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1d7f:	e8 b9 23 00 00       	call   413d <exit>

  printf(1, "linkunlink ok\n");
    1d84:	c7 44 24 04 f0 4e 00 	movl   $0x4ef0,0x4(%esp)
    1d8b:	00 
    1d8c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1d93:	e8 35 25 00 00       	call   42cd <printf>
}
    1d98:	c9                   	leave  
    1d99:	c3                   	ret    

00001d9a <bigdir>:

// directory that uses indirect blocks
void
bigdir(void)
{
    1d9a:	55                   	push   %ebp
    1d9b:	89 e5                	mov    %esp,%ebp
    1d9d:	83 ec 38             	sub    $0x38,%esp
  int i, fd;
  char name[10];

  printf(1, "bigdir test\n");
    1da0:	c7 44 24 04 ff 4e 00 	movl   $0x4eff,0x4(%esp)
    1da7:	00 
    1da8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1daf:	e8 19 25 00 00       	call   42cd <printf>
  unlink("bd");
    1db4:	c7 04 24 0c 4f 00 00 	movl   $0x4f0c,(%esp)
    1dbb:	e8 cd 23 00 00       	call   418d <unlink>

  fd = open("bd", O_CREATE);
    1dc0:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    1dc7:	00 
    1dc8:	c7 04 24 0c 4f 00 00 	movl   $0x4f0c,(%esp)
    1dcf:	e8 a9 23 00 00       	call   417d <open>
    1dd4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0){
    1dd7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1ddb:	79 20                	jns    1dfd <bigdir+0x63>
    printf(1, "bigdir create failed\n");
    1ddd:	c7 44 24 04 0f 4f 00 	movl   $0x4f0f,0x4(%esp)
    1de4:	00 
    1de5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1dec:	e8 dc 24 00 00       	call   42cd <printf>
    exit(1);
    1df1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1df8:	e8 40 23 00 00       	call   413d <exit>
  }
  close(fd);
    1dfd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e00:	89 04 24             	mov    %eax,(%esp)
    1e03:	e8 5d 23 00 00       	call   4165 <close>

  for(i = 0; i < 500; i++){
    1e08:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1e0f:	eb 6b                	jmp    1e7c <bigdir+0xe2>
    name[0] = 'x';
    1e11:	c6 45 e6 78          	movb   $0x78,-0x1a(%ebp)
    name[1] = '0' + (i / 64);
    1e15:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e18:	8d 50 3f             	lea    0x3f(%eax),%edx
    1e1b:	85 c0                	test   %eax,%eax
    1e1d:	0f 48 c2             	cmovs  %edx,%eax
    1e20:	c1 f8 06             	sar    $0x6,%eax
    1e23:	83 c0 30             	add    $0x30,%eax
    1e26:	88 45 e7             	mov    %al,-0x19(%ebp)
    name[2] = '0' + (i % 64);
    1e29:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e2c:	99                   	cltd   
    1e2d:	c1 ea 1a             	shr    $0x1a,%edx
    1e30:	01 d0                	add    %edx,%eax
    1e32:	83 e0 3f             	and    $0x3f,%eax
    1e35:	29 d0                	sub    %edx,%eax
    1e37:	83 c0 30             	add    $0x30,%eax
    1e3a:	88 45 e8             	mov    %al,-0x18(%ebp)
    name[3] = '\0';
    1e3d:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    if(link("bd", name) != 0){
    1e41:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1e44:	89 44 24 04          	mov    %eax,0x4(%esp)
    1e48:	c7 04 24 0c 4f 00 00 	movl   $0x4f0c,(%esp)
    1e4f:	e8 49 23 00 00       	call   419d <link>
    1e54:	85 c0                	test   %eax,%eax
    1e56:	74 20                	je     1e78 <bigdir+0xde>
      printf(1, "bigdir link failed\n");
    1e58:	c7 44 24 04 25 4f 00 	movl   $0x4f25,0x4(%esp)
    1e5f:	00 
    1e60:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1e67:	e8 61 24 00 00       	call   42cd <printf>
      exit(1);
    1e6c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1e73:	e8 c5 22 00 00       	call   413d <exit>
    printf(1, "bigdir create failed\n");
    exit(1);
  }
  close(fd);

  for(i = 0; i < 500; i++){
    1e78:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1e7c:	81 7d f4 f3 01 00 00 	cmpl   $0x1f3,-0xc(%ebp)
    1e83:	7e 8c                	jle    1e11 <bigdir+0x77>
      printf(1, "bigdir link failed\n");
      exit(1);
    }
  }

  unlink("bd");
    1e85:	c7 04 24 0c 4f 00 00 	movl   $0x4f0c,(%esp)
    1e8c:	e8 fc 22 00 00       	call   418d <unlink>
  for(i = 0; i < 500; i++){
    1e91:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1e98:	eb 63                	jmp    1efd <bigdir+0x163>
    name[0] = 'x';
    1e9a:	c6 45 e6 78          	movb   $0x78,-0x1a(%ebp)
    name[1] = '0' + (i / 64);
    1e9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ea1:	8d 50 3f             	lea    0x3f(%eax),%edx
    1ea4:	85 c0                	test   %eax,%eax
    1ea6:	0f 48 c2             	cmovs  %edx,%eax
    1ea9:	c1 f8 06             	sar    $0x6,%eax
    1eac:	83 c0 30             	add    $0x30,%eax
    1eaf:	88 45 e7             	mov    %al,-0x19(%ebp)
    name[2] = '0' + (i % 64);
    1eb2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1eb5:	99                   	cltd   
    1eb6:	c1 ea 1a             	shr    $0x1a,%edx
    1eb9:	01 d0                	add    %edx,%eax
    1ebb:	83 e0 3f             	and    $0x3f,%eax
    1ebe:	29 d0                	sub    %edx,%eax
    1ec0:	83 c0 30             	add    $0x30,%eax
    1ec3:	88 45 e8             	mov    %al,-0x18(%ebp)
    name[3] = '\0';
    1ec6:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    if(unlink(name) != 0){
    1eca:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1ecd:	89 04 24             	mov    %eax,(%esp)
    1ed0:	e8 b8 22 00 00       	call   418d <unlink>
    1ed5:	85 c0                	test   %eax,%eax
    1ed7:	74 20                	je     1ef9 <bigdir+0x15f>
      printf(1, "bigdir unlink failed");
    1ed9:	c7 44 24 04 39 4f 00 	movl   $0x4f39,0x4(%esp)
    1ee0:	00 
    1ee1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1ee8:	e8 e0 23 00 00       	call   42cd <printf>
      exit(1);
    1eed:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1ef4:	e8 44 22 00 00       	call   413d <exit>
      exit(1);
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    1ef9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1efd:	81 7d f4 f3 01 00 00 	cmpl   $0x1f3,-0xc(%ebp)
    1f04:	7e 94                	jle    1e9a <bigdir+0x100>
      printf(1, "bigdir unlink failed");
      exit(1);
    }
  }

  printf(1, "bigdir ok\n");
    1f06:	c7 44 24 04 4e 4f 00 	movl   $0x4f4e,0x4(%esp)
    1f0d:	00 
    1f0e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1f15:	e8 b3 23 00 00       	call   42cd <printf>
}
    1f1a:	c9                   	leave  
    1f1b:	c3                   	ret    

00001f1c <subdir>:

void
subdir(void)
{
    1f1c:	55                   	push   %ebp
    1f1d:	89 e5                	mov    %esp,%ebp
    1f1f:	83 ec 28             	sub    $0x28,%esp
  int fd, cc;

  printf(1, "subdir test\n");
    1f22:	c7 44 24 04 59 4f 00 	movl   $0x4f59,0x4(%esp)
    1f29:	00 
    1f2a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1f31:	e8 97 23 00 00       	call   42cd <printf>

  unlink("ff");
    1f36:	c7 04 24 66 4f 00 00 	movl   $0x4f66,(%esp)
    1f3d:	e8 4b 22 00 00       	call   418d <unlink>
  if(mkdir("dd") != 0){
    1f42:	c7 04 24 69 4f 00 00 	movl   $0x4f69,(%esp)
    1f49:	e8 57 22 00 00       	call   41a5 <mkdir>
    1f4e:	85 c0                	test   %eax,%eax
    1f50:	74 20                	je     1f72 <subdir+0x56>
    printf(1, "subdir mkdir dd failed\n");
    1f52:	c7 44 24 04 6c 4f 00 	movl   $0x4f6c,0x4(%esp)
    1f59:	00 
    1f5a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1f61:	e8 67 23 00 00       	call   42cd <printf>
    exit(1);
    1f66:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1f6d:	e8 cb 21 00 00       	call   413d <exit>
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    1f72:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    1f79:	00 
    1f7a:	c7 04 24 84 4f 00 00 	movl   $0x4f84,(%esp)
    1f81:	e8 f7 21 00 00       	call   417d <open>
    1f86:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    1f89:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1f8d:	79 20                	jns    1faf <subdir+0x93>
    printf(1, "create dd/ff failed\n");
    1f8f:	c7 44 24 04 8a 4f 00 	movl   $0x4f8a,0x4(%esp)
    1f96:	00 
    1f97:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1f9e:	e8 2a 23 00 00       	call   42cd <printf>
    exit(1);
    1fa3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1faa:	e8 8e 21 00 00       	call   413d <exit>
  }
  write(fd, "ff", 2);
    1faf:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
    1fb6:	00 
    1fb7:	c7 44 24 04 66 4f 00 	movl   $0x4f66,0x4(%esp)
    1fbe:	00 
    1fbf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1fc2:	89 04 24             	mov    %eax,(%esp)
    1fc5:	e8 93 21 00 00       	call   415d <write>
  close(fd);
    1fca:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1fcd:	89 04 24             	mov    %eax,(%esp)
    1fd0:	e8 90 21 00 00       	call   4165 <close>
  
  if(unlink("dd") >= 0){
    1fd5:	c7 04 24 69 4f 00 00 	movl   $0x4f69,(%esp)
    1fdc:	e8 ac 21 00 00       	call   418d <unlink>
    1fe1:	85 c0                	test   %eax,%eax
    1fe3:	78 20                	js     2005 <subdir+0xe9>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    1fe5:	c7 44 24 04 a0 4f 00 	movl   $0x4fa0,0x4(%esp)
    1fec:	00 
    1fed:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1ff4:	e8 d4 22 00 00       	call   42cd <printf>
    exit(1);
    1ff9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2000:	e8 38 21 00 00       	call   413d <exit>
  }

  if(mkdir("/dd/dd") != 0){
    2005:	c7 04 24 c6 4f 00 00 	movl   $0x4fc6,(%esp)
    200c:	e8 94 21 00 00       	call   41a5 <mkdir>
    2011:	85 c0                	test   %eax,%eax
    2013:	74 20                	je     2035 <subdir+0x119>
    printf(1, "subdir mkdir dd/dd failed\n");
    2015:	c7 44 24 04 cd 4f 00 	movl   $0x4fcd,0x4(%esp)
    201c:	00 
    201d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2024:	e8 a4 22 00 00       	call   42cd <printf>
    exit(1);
    2029:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2030:	e8 08 21 00 00       	call   413d <exit>
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    2035:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    203c:	00 
    203d:	c7 04 24 e8 4f 00 00 	movl   $0x4fe8,(%esp)
    2044:	e8 34 21 00 00       	call   417d <open>
    2049:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    204c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2050:	79 20                	jns    2072 <subdir+0x156>
    printf(1, "create dd/dd/ff failed\n");
    2052:	c7 44 24 04 f1 4f 00 	movl   $0x4ff1,0x4(%esp)
    2059:	00 
    205a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2061:	e8 67 22 00 00       	call   42cd <printf>
    exit(1);
    2066:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    206d:	e8 cb 20 00 00       	call   413d <exit>
  }
  write(fd, "FF", 2);
    2072:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
    2079:	00 
    207a:	c7 44 24 04 09 50 00 	movl   $0x5009,0x4(%esp)
    2081:	00 
    2082:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2085:	89 04 24             	mov    %eax,(%esp)
    2088:	e8 d0 20 00 00       	call   415d <write>
  close(fd);
    208d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2090:	89 04 24             	mov    %eax,(%esp)
    2093:	e8 cd 20 00 00       	call   4165 <close>

  fd = open("dd/dd/../ff", 0);
    2098:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    209f:	00 
    20a0:	c7 04 24 0c 50 00 00 	movl   $0x500c,(%esp)
    20a7:	e8 d1 20 00 00       	call   417d <open>
    20ac:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    20af:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    20b3:	79 20                	jns    20d5 <subdir+0x1b9>
    printf(1, "open dd/dd/../ff failed\n");
    20b5:	c7 44 24 04 18 50 00 	movl   $0x5018,0x4(%esp)
    20bc:	00 
    20bd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    20c4:	e8 04 22 00 00       	call   42cd <printf>
    exit(1);
    20c9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    20d0:	e8 68 20 00 00       	call   413d <exit>
  }
  cc = read(fd, buf, sizeof(buf));
    20d5:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    20dc:	00 
    20dd:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
    20e4:	00 
    20e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    20e8:	89 04 24             	mov    %eax,(%esp)
    20eb:	e8 65 20 00 00       	call   4155 <read>
    20f0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(cc != 2 || buf[0] != 'f'){
    20f3:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
    20f7:	75 0b                	jne    2104 <subdir+0x1e8>
    20f9:	0f b6 05 e0 8b 00 00 	movzbl 0x8be0,%eax
    2100:	3c 66                	cmp    $0x66,%al
    2102:	74 20                	je     2124 <subdir+0x208>
    printf(1, "dd/dd/../ff wrong content\n");
    2104:	c7 44 24 04 31 50 00 	movl   $0x5031,0x4(%esp)
    210b:	00 
    210c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2113:	e8 b5 21 00 00       	call   42cd <printf>
    exit(1);
    2118:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    211f:	e8 19 20 00 00       	call   413d <exit>
  }
  close(fd);
    2124:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2127:	89 04 24             	mov    %eax,(%esp)
    212a:	e8 36 20 00 00       	call   4165 <close>

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    212f:	c7 44 24 04 4c 50 00 	movl   $0x504c,0x4(%esp)
    2136:	00 
    2137:	c7 04 24 e8 4f 00 00 	movl   $0x4fe8,(%esp)
    213e:	e8 5a 20 00 00       	call   419d <link>
    2143:	85 c0                	test   %eax,%eax
    2145:	74 20                	je     2167 <subdir+0x24b>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    2147:	c7 44 24 04 58 50 00 	movl   $0x5058,0x4(%esp)
    214e:	00 
    214f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2156:	e8 72 21 00 00       	call   42cd <printf>
    exit(1);
    215b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2162:	e8 d6 1f 00 00       	call   413d <exit>
  }

  if(unlink("dd/dd/ff") != 0){
    2167:	c7 04 24 e8 4f 00 00 	movl   $0x4fe8,(%esp)
    216e:	e8 1a 20 00 00       	call   418d <unlink>
    2173:	85 c0                	test   %eax,%eax
    2175:	74 20                	je     2197 <subdir+0x27b>
    printf(1, "unlink dd/dd/ff failed\n");
    2177:	c7 44 24 04 79 50 00 	movl   $0x5079,0x4(%esp)
    217e:	00 
    217f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2186:	e8 42 21 00 00       	call   42cd <printf>
    exit(1);
    218b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2192:	e8 a6 1f 00 00       	call   413d <exit>
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    2197:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    219e:	00 
    219f:	c7 04 24 e8 4f 00 00 	movl   $0x4fe8,(%esp)
    21a6:	e8 d2 1f 00 00       	call   417d <open>
    21ab:	85 c0                	test   %eax,%eax
    21ad:	78 20                	js     21cf <subdir+0x2b3>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    21af:	c7 44 24 04 94 50 00 	movl   $0x5094,0x4(%esp)
    21b6:	00 
    21b7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    21be:	e8 0a 21 00 00       	call   42cd <printf>
    exit(1);
    21c3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    21ca:	e8 6e 1f 00 00       	call   413d <exit>
  }

  if(chdir("dd") != 0){
    21cf:	c7 04 24 69 4f 00 00 	movl   $0x4f69,(%esp)
    21d6:	e8 d2 1f 00 00       	call   41ad <chdir>
    21db:	85 c0                	test   %eax,%eax
    21dd:	74 20                	je     21ff <subdir+0x2e3>
    printf(1, "chdir dd failed\n");
    21df:	c7 44 24 04 b8 50 00 	movl   $0x50b8,0x4(%esp)
    21e6:	00 
    21e7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    21ee:	e8 da 20 00 00       	call   42cd <printf>
    exit(1);
    21f3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    21fa:	e8 3e 1f 00 00       	call   413d <exit>
  }
  if(chdir("dd/../../dd") != 0){
    21ff:	c7 04 24 c9 50 00 00 	movl   $0x50c9,(%esp)
    2206:	e8 a2 1f 00 00       	call   41ad <chdir>
    220b:	85 c0                	test   %eax,%eax
    220d:	74 20                	je     222f <subdir+0x313>
    printf(1, "chdir dd/../../dd failed\n");
    220f:	c7 44 24 04 d5 50 00 	movl   $0x50d5,0x4(%esp)
    2216:	00 
    2217:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    221e:	e8 aa 20 00 00       	call   42cd <printf>
    exit(1);
    2223:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    222a:	e8 0e 1f 00 00       	call   413d <exit>
  }
  if(chdir("dd/../../../dd") != 0){
    222f:	c7 04 24 ef 50 00 00 	movl   $0x50ef,(%esp)
    2236:	e8 72 1f 00 00       	call   41ad <chdir>
    223b:	85 c0                	test   %eax,%eax
    223d:	74 20                	je     225f <subdir+0x343>
    printf(1, "chdir dd/../../dd failed\n");
    223f:	c7 44 24 04 d5 50 00 	movl   $0x50d5,0x4(%esp)
    2246:	00 
    2247:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    224e:	e8 7a 20 00 00       	call   42cd <printf>
    exit(1);
    2253:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    225a:	e8 de 1e 00 00       	call   413d <exit>
  }
  if(chdir("./..") != 0){
    225f:	c7 04 24 fe 50 00 00 	movl   $0x50fe,(%esp)
    2266:	e8 42 1f 00 00       	call   41ad <chdir>
    226b:	85 c0                	test   %eax,%eax
    226d:	74 20                	je     228f <subdir+0x373>
    printf(1, "chdir ./.. failed\n");
    226f:	c7 44 24 04 03 51 00 	movl   $0x5103,0x4(%esp)
    2276:	00 
    2277:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    227e:	e8 4a 20 00 00       	call   42cd <printf>
    exit(1);
    2283:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    228a:	e8 ae 1e 00 00       	call   413d <exit>
  }

  fd = open("dd/dd/ffff", 0);
    228f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2296:	00 
    2297:	c7 04 24 4c 50 00 00 	movl   $0x504c,(%esp)
    229e:	e8 da 1e 00 00       	call   417d <open>
    22a3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    22a6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    22aa:	79 20                	jns    22cc <subdir+0x3b0>
    printf(1, "open dd/dd/ffff failed\n");
    22ac:	c7 44 24 04 16 51 00 	movl   $0x5116,0x4(%esp)
    22b3:	00 
    22b4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    22bb:	e8 0d 20 00 00       	call   42cd <printf>
    exit(1);
    22c0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    22c7:	e8 71 1e 00 00       	call   413d <exit>
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    22cc:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    22d3:	00 
    22d4:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
    22db:	00 
    22dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22df:	89 04 24             	mov    %eax,(%esp)
    22e2:	e8 6e 1e 00 00       	call   4155 <read>
    22e7:	83 f8 02             	cmp    $0x2,%eax
    22ea:	74 20                	je     230c <subdir+0x3f0>
    printf(1, "read dd/dd/ffff wrong len\n");
    22ec:	c7 44 24 04 2e 51 00 	movl   $0x512e,0x4(%esp)
    22f3:	00 
    22f4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    22fb:	e8 cd 1f 00 00       	call   42cd <printf>
    exit(1);
    2300:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2307:	e8 31 1e 00 00       	call   413d <exit>
  }
  close(fd);
    230c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    230f:	89 04 24             	mov    %eax,(%esp)
    2312:	e8 4e 1e 00 00       	call   4165 <close>

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    2317:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    231e:	00 
    231f:	c7 04 24 e8 4f 00 00 	movl   $0x4fe8,(%esp)
    2326:	e8 52 1e 00 00       	call   417d <open>
    232b:	85 c0                	test   %eax,%eax
    232d:	78 20                	js     234f <subdir+0x433>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    232f:	c7 44 24 04 4c 51 00 	movl   $0x514c,0x4(%esp)
    2336:	00 
    2337:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    233e:	e8 8a 1f 00 00       	call   42cd <printf>
    exit(1);
    2343:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    234a:	e8 ee 1d 00 00       	call   413d <exit>
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    234f:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    2356:	00 
    2357:	c7 04 24 71 51 00 00 	movl   $0x5171,(%esp)
    235e:	e8 1a 1e 00 00       	call   417d <open>
    2363:	85 c0                	test   %eax,%eax
    2365:	78 20                	js     2387 <subdir+0x46b>
    printf(1, "create dd/ff/ff succeeded!\n");
    2367:	c7 44 24 04 7a 51 00 	movl   $0x517a,0x4(%esp)
    236e:	00 
    236f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2376:	e8 52 1f 00 00       	call   42cd <printf>
    exit(1);
    237b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2382:	e8 b6 1d 00 00       	call   413d <exit>
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    2387:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    238e:	00 
    238f:	c7 04 24 96 51 00 00 	movl   $0x5196,(%esp)
    2396:	e8 e2 1d 00 00       	call   417d <open>
    239b:	85 c0                	test   %eax,%eax
    239d:	78 20                	js     23bf <subdir+0x4a3>
    printf(1, "create dd/xx/ff succeeded!\n");
    239f:	c7 44 24 04 9f 51 00 	movl   $0x519f,0x4(%esp)
    23a6:	00 
    23a7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    23ae:	e8 1a 1f 00 00       	call   42cd <printf>
    exit(1);
    23b3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    23ba:	e8 7e 1d 00 00       	call   413d <exit>
  }
  if(open("dd", O_CREATE) >= 0){
    23bf:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    23c6:	00 
    23c7:	c7 04 24 69 4f 00 00 	movl   $0x4f69,(%esp)
    23ce:	e8 aa 1d 00 00       	call   417d <open>
    23d3:	85 c0                	test   %eax,%eax
    23d5:	78 20                	js     23f7 <subdir+0x4db>
    printf(1, "create dd succeeded!\n");
    23d7:	c7 44 24 04 bb 51 00 	movl   $0x51bb,0x4(%esp)
    23de:	00 
    23df:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    23e6:	e8 e2 1e 00 00       	call   42cd <printf>
    exit(1);
    23eb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    23f2:	e8 46 1d 00 00       	call   413d <exit>
  }
  if(open("dd", O_RDWR) >= 0){
    23f7:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    23fe:	00 
    23ff:	c7 04 24 69 4f 00 00 	movl   $0x4f69,(%esp)
    2406:	e8 72 1d 00 00       	call   417d <open>
    240b:	85 c0                	test   %eax,%eax
    240d:	78 20                	js     242f <subdir+0x513>
    printf(1, "open dd rdwr succeeded!\n");
    240f:	c7 44 24 04 d1 51 00 	movl   $0x51d1,0x4(%esp)
    2416:	00 
    2417:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    241e:	e8 aa 1e 00 00       	call   42cd <printf>
    exit(1);
    2423:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    242a:	e8 0e 1d 00 00       	call   413d <exit>
  }
  if(open("dd", O_WRONLY) >= 0){
    242f:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    2436:	00 
    2437:	c7 04 24 69 4f 00 00 	movl   $0x4f69,(%esp)
    243e:	e8 3a 1d 00 00       	call   417d <open>
    2443:	85 c0                	test   %eax,%eax
    2445:	78 20                	js     2467 <subdir+0x54b>
    printf(1, "open dd wronly succeeded!\n");
    2447:	c7 44 24 04 ea 51 00 	movl   $0x51ea,0x4(%esp)
    244e:	00 
    244f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2456:	e8 72 1e 00 00       	call   42cd <printf>
    exit(1);
    245b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2462:	e8 d6 1c 00 00       	call   413d <exit>
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    2467:	c7 44 24 04 05 52 00 	movl   $0x5205,0x4(%esp)
    246e:	00 
    246f:	c7 04 24 71 51 00 00 	movl   $0x5171,(%esp)
    2476:	e8 22 1d 00 00       	call   419d <link>
    247b:	85 c0                	test   %eax,%eax
    247d:	75 20                	jne    249f <subdir+0x583>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    247f:	c7 44 24 04 10 52 00 	movl   $0x5210,0x4(%esp)
    2486:	00 
    2487:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    248e:	e8 3a 1e 00 00       	call   42cd <printf>
    exit(1);
    2493:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    249a:	e8 9e 1c 00 00       	call   413d <exit>
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    249f:	c7 44 24 04 05 52 00 	movl   $0x5205,0x4(%esp)
    24a6:	00 
    24a7:	c7 04 24 96 51 00 00 	movl   $0x5196,(%esp)
    24ae:	e8 ea 1c 00 00       	call   419d <link>
    24b3:	85 c0                	test   %eax,%eax
    24b5:	75 20                	jne    24d7 <subdir+0x5bb>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    24b7:	c7 44 24 04 34 52 00 	movl   $0x5234,0x4(%esp)
    24be:	00 
    24bf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    24c6:	e8 02 1e 00 00       	call   42cd <printf>
    exit(1);
    24cb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    24d2:	e8 66 1c 00 00       	call   413d <exit>
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    24d7:	c7 44 24 04 4c 50 00 	movl   $0x504c,0x4(%esp)
    24de:	00 
    24df:	c7 04 24 84 4f 00 00 	movl   $0x4f84,(%esp)
    24e6:	e8 b2 1c 00 00       	call   419d <link>
    24eb:	85 c0                	test   %eax,%eax
    24ed:	75 20                	jne    250f <subdir+0x5f3>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    24ef:	c7 44 24 04 58 52 00 	movl   $0x5258,0x4(%esp)
    24f6:	00 
    24f7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    24fe:	e8 ca 1d 00 00       	call   42cd <printf>
    exit(1);
    2503:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    250a:	e8 2e 1c 00 00       	call   413d <exit>
  }
  if(mkdir("dd/ff/ff") == 0){
    250f:	c7 04 24 71 51 00 00 	movl   $0x5171,(%esp)
    2516:	e8 8a 1c 00 00       	call   41a5 <mkdir>
    251b:	85 c0                	test   %eax,%eax
    251d:	75 20                	jne    253f <subdir+0x623>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    251f:	c7 44 24 04 7a 52 00 	movl   $0x527a,0x4(%esp)
    2526:	00 
    2527:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    252e:	e8 9a 1d 00 00       	call   42cd <printf>
    exit(1);
    2533:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    253a:	e8 fe 1b 00 00       	call   413d <exit>
  }
  if(mkdir("dd/xx/ff") == 0){
    253f:	c7 04 24 96 51 00 00 	movl   $0x5196,(%esp)
    2546:	e8 5a 1c 00 00       	call   41a5 <mkdir>
    254b:	85 c0                	test   %eax,%eax
    254d:	75 20                	jne    256f <subdir+0x653>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    254f:	c7 44 24 04 95 52 00 	movl   $0x5295,0x4(%esp)
    2556:	00 
    2557:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    255e:	e8 6a 1d 00 00       	call   42cd <printf>
    exit(1);
    2563:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    256a:	e8 ce 1b 00 00       	call   413d <exit>
  }
  if(mkdir("dd/dd/ffff") == 0){
    256f:	c7 04 24 4c 50 00 00 	movl   $0x504c,(%esp)
    2576:	e8 2a 1c 00 00       	call   41a5 <mkdir>
    257b:	85 c0                	test   %eax,%eax
    257d:	75 20                	jne    259f <subdir+0x683>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    257f:	c7 44 24 04 b0 52 00 	movl   $0x52b0,0x4(%esp)
    2586:	00 
    2587:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    258e:	e8 3a 1d 00 00       	call   42cd <printf>
    exit(1);
    2593:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    259a:	e8 9e 1b 00 00       	call   413d <exit>
  }
  if(unlink("dd/xx/ff") == 0){
    259f:	c7 04 24 96 51 00 00 	movl   $0x5196,(%esp)
    25a6:	e8 e2 1b 00 00       	call   418d <unlink>
    25ab:	85 c0                	test   %eax,%eax
    25ad:	75 20                	jne    25cf <subdir+0x6b3>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    25af:	c7 44 24 04 cd 52 00 	movl   $0x52cd,0x4(%esp)
    25b6:	00 
    25b7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    25be:	e8 0a 1d 00 00       	call   42cd <printf>
    exit(1);
    25c3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    25ca:	e8 6e 1b 00 00       	call   413d <exit>
  }
  if(unlink("dd/ff/ff") == 0){
    25cf:	c7 04 24 71 51 00 00 	movl   $0x5171,(%esp)
    25d6:	e8 b2 1b 00 00       	call   418d <unlink>
    25db:	85 c0                	test   %eax,%eax
    25dd:	75 20                	jne    25ff <subdir+0x6e3>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    25df:	c7 44 24 04 e9 52 00 	movl   $0x52e9,0x4(%esp)
    25e6:	00 
    25e7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    25ee:	e8 da 1c 00 00       	call   42cd <printf>
    exit(1);
    25f3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    25fa:	e8 3e 1b 00 00       	call   413d <exit>
  }
  if(chdir("dd/ff") == 0){
    25ff:	c7 04 24 84 4f 00 00 	movl   $0x4f84,(%esp)
    2606:	e8 a2 1b 00 00       	call   41ad <chdir>
    260b:	85 c0                	test   %eax,%eax
    260d:	75 20                	jne    262f <subdir+0x713>
    printf(1, "chdir dd/ff succeeded!\n");
    260f:	c7 44 24 04 05 53 00 	movl   $0x5305,0x4(%esp)
    2616:	00 
    2617:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    261e:	e8 aa 1c 00 00       	call   42cd <printf>
    exit(1);
    2623:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    262a:	e8 0e 1b 00 00       	call   413d <exit>
  }
  if(chdir("dd/xx") == 0){
    262f:	c7 04 24 1d 53 00 00 	movl   $0x531d,(%esp)
    2636:	e8 72 1b 00 00       	call   41ad <chdir>
    263b:	85 c0                	test   %eax,%eax
    263d:	75 20                	jne    265f <subdir+0x743>
    printf(1, "chdir dd/xx succeeded!\n");
    263f:	c7 44 24 04 23 53 00 	movl   $0x5323,0x4(%esp)
    2646:	00 
    2647:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    264e:	e8 7a 1c 00 00       	call   42cd <printf>
    exit(1);
    2653:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    265a:	e8 de 1a 00 00       	call   413d <exit>
  }

  if(unlink("dd/dd/ffff") != 0){
    265f:	c7 04 24 4c 50 00 00 	movl   $0x504c,(%esp)
    2666:	e8 22 1b 00 00       	call   418d <unlink>
    266b:	85 c0                	test   %eax,%eax
    266d:	74 20                	je     268f <subdir+0x773>
    printf(1, "unlink dd/dd/ff failed\n");
    266f:	c7 44 24 04 79 50 00 	movl   $0x5079,0x4(%esp)
    2676:	00 
    2677:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    267e:	e8 4a 1c 00 00       	call   42cd <printf>
    exit(1);
    2683:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    268a:	e8 ae 1a 00 00       	call   413d <exit>
  }
  if(unlink("dd/ff") != 0){
    268f:	c7 04 24 84 4f 00 00 	movl   $0x4f84,(%esp)
    2696:	e8 f2 1a 00 00       	call   418d <unlink>
    269b:	85 c0                	test   %eax,%eax
    269d:	74 20                	je     26bf <subdir+0x7a3>
    printf(1, "unlink dd/ff failed\n");
    269f:	c7 44 24 04 3b 53 00 	movl   $0x533b,0x4(%esp)
    26a6:	00 
    26a7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    26ae:	e8 1a 1c 00 00       	call   42cd <printf>
    exit(1);
    26b3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    26ba:	e8 7e 1a 00 00       	call   413d <exit>
  }
  if(unlink("dd") == 0){
    26bf:	c7 04 24 69 4f 00 00 	movl   $0x4f69,(%esp)
    26c6:	e8 c2 1a 00 00       	call   418d <unlink>
    26cb:	85 c0                	test   %eax,%eax
    26cd:	75 20                	jne    26ef <subdir+0x7d3>
    printf(1, "unlink non-empty dd succeeded!\n");
    26cf:	c7 44 24 04 50 53 00 	movl   $0x5350,0x4(%esp)
    26d6:	00 
    26d7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    26de:	e8 ea 1b 00 00       	call   42cd <printf>
    exit(1);
    26e3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    26ea:	e8 4e 1a 00 00       	call   413d <exit>
  }
  if(unlink("dd/dd") < 0){
    26ef:	c7 04 24 70 53 00 00 	movl   $0x5370,(%esp)
    26f6:	e8 92 1a 00 00       	call   418d <unlink>
    26fb:	85 c0                	test   %eax,%eax
    26fd:	79 20                	jns    271f <subdir+0x803>
    printf(1, "unlink dd/dd failed\n");
    26ff:	c7 44 24 04 76 53 00 	movl   $0x5376,0x4(%esp)
    2706:	00 
    2707:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    270e:	e8 ba 1b 00 00       	call   42cd <printf>
    exit(1);
    2713:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    271a:	e8 1e 1a 00 00       	call   413d <exit>
  }
  if(unlink("dd") < 0){
    271f:	c7 04 24 69 4f 00 00 	movl   $0x4f69,(%esp)
    2726:	e8 62 1a 00 00       	call   418d <unlink>
    272b:	85 c0                	test   %eax,%eax
    272d:	79 20                	jns    274f <subdir+0x833>
    printf(1, "unlink dd failed\n");
    272f:	c7 44 24 04 8b 53 00 	movl   $0x538b,0x4(%esp)
    2736:	00 
    2737:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    273e:	e8 8a 1b 00 00       	call   42cd <printf>
    exit(1);
    2743:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    274a:	e8 ee 19 00 00       	call   413d <exit>
  }

  printf(1, "subdir ok\n");
    274f:	c7 44 24 04 9d 53 00 	movl   $0x539d,0x4(%esp)
    2756:	00 
    2757:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    275e:	e8 6a 1b 00 00       	call   42cd <printf>
}
    2763:	c9                   	leave  
    2764:	c3                   	ret    

00002765 <bigwrite>:

// test writes that are larger than the log.
void
bigwrite(void)
{
    2765:	55                   	push   %ebp
    2766:	89 e5                	mov    %esp,%ebp
    2768:	83 ec 28             	sub    $0x28,%esp
  int fd, sz;

  printf(1, "bigwrite test\n");
    276b:	c7 44 24 04 a8 53 00 	movl   $0x53a8,0x4(%esp)
    2772:	00 
    2773:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    277a:	e8 4e 1b 00 00       	call   42cd <printf>

  unlink("bigwrite");
    277f:	c7 04 24 b7 53 00 00 	movl   $0x53b7,(%esp)
    2786:	e8 02 1a 00 00       	call   418d <unlink>
  for(sz = 499; sz < 12*512; sz += 471){
    278b:	c7 45 f4 f3 01 00 00 	movl   $0x1f3,-0xc(%ebp)
    2792:	e9 c1 00 00 00       	jmp    2858 <bigwrite+0xf3>
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2797:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    279e:	00 
    279f:	c7 04 24 b7 53 00 00 	movl   $0x53b7,(%esp)
    27a6:	e8 d2 19 00 00       	call   417d <open>
    27ab:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(fd < 0){
    27ae:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    27b2:	79 20                	jns    27d4 <bigwrite+0x6f>
      printf(1, "cannot create bigwrite\n");
    27b4:	c7 44 24 04 c0 53 00 	movl   $0x53c0,0x4(%esp)
    27bb:	00 
    27bc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    27c3:	e8 05 1b 00 00       	call   42cd <printf>
      exit(1);
    27c8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    27cf:	e8 69 19 00 00       	call   413d <exit>
    }
    int i;
    for(i = 0; i < 2; i++){
    27d4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    27db:	eb 57                	jmp    2834 <bigwrite+0xcf>
      int cc = write(fd, buf, sz);
    27dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    27e0:	89 44 24 08          	mov    %eax,0x8(%esp)
    27e4:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
    27eb:	00 
    27ec:	8b 45 ec             	mov    -0x14(%ebp),%eax
    27ef:	89 04 24             	mov    %eax,(%esp)
    27f2:	e8 66 19 00 00       	call   415d <write>
    27f7:	89 45 e8             	mov    %eax,-0x18(%ebp)
      if(cc != sz){
    27fa:	8b 45 e8             	mov    -0x18(%ebp),%eax
    27fd:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2800:	74 2e                	je     2830 <bigwrite+0xcb>
        printf(1, "write(%d) ret %d\n", sz, cc);
    2802:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2805:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2809:	8b 45 f4             	mov    -0xc(%ebp),%eax
    280c:	89 44 24 08          	mov    %eax,0x8(%esp)
    2810:	c7 44 24 04 d8 53 00 	movl   $0x53d8,0x4(%esp)
    2817:	00 
    2818:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    281f:	e8 a9 1a 00 00       	call   42cd <printf>
        exit(1);
    2824:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    282b:	e8 0d 19 00 00       	call   413d <exit>
    if(fd < 0){
      printf(1, "cannot create bigwrite\n");
      exit(1);
    }
    int i;
    for(i = 0; i < 2; i++){
    2830:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2834:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    2838:	7e a3                	jle    27dd <bigwrite+0x78>
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit(1);
      }
    }
    close(fd);
    283a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    283d:	89 04 24             	mov    %eax,(%esp)
    2840:	e8 20 19 00 00       	call   4165 <close>
    unlink("bigwrite");
    2845:	c7 04 24 b7 53 00 00 	movl   $0x53b7,(%esp)
    284c:	e8 3c 19 00 00       	call   418d <unlink>
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    2851:	81 45 f4 d7 01 00 00 	addl   $0x1d7,-0xc(%ebp)
    2858:	81 7d f4 ff 17 00 00 	cmpl   $0x17ff,-0xc(%ebp)
    285f:	0f 8e 32 ff ff ff    	jle    2797 <bigwrite+0x32>
    }
    close(fd);
    unlink("bigwrite");
  }

  printf(1, "bigwrite ok\n");
    2865:	c7 44 24 04 ea 53 00 	movl   $0x53ea,0x4(%esp)
    286c:	00 
    286d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2874:	e8 54 1a 00 00       	call   42cd <printf>
}
    2879:	c9                   	leave  
    287a:	c3                   	ret    

0000287b <bigfile>:

void
bigfile(void)
{
    287b:	55                   	push   %ebp
    287c:	89 e5                	mov    %esp,%ebp
    287e:	83 ec 28             	sub    $0x28,%esp
  int fd, i, total, cc;

  printf(1, "bigfile test\n");
    2881:	c7 44 24 04 f7 53 00 	movl   $0x53f7,0x4(%esp)
    2888:	00 
    2889:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2890:	e8 38 1a 00 00       	call   42cd <printf>

  unlink("bigfile");
    2895:	c7 04 24 05 54 00 00 	movl   $0x5405,(%esp)
    289c:	e8 ec 18 00 00       	call   418d <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    28a1:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    28a8:	00 
    28a9:	c7 04 24 05 54 00 00 	movl   $0x5405,(%esp)
    28b0:	e8 c8 18 00 00       	call   417d <open>
    28b5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
    28b8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    28bc:	79 20                	jns    28de <bigfile+0x63>
    printf(1, "cannot create bigfile");
    28be:	c7 44 24 04 0d 54 00 	movl   $0x540d,0x4(%esp)
    28c5:	00 
    28c6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    28cd:	e8 fb 19 00 00       	call   42cd <printf>
    exit(1);
    28d2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    28d9:	e8 5f 18 00 00       	call   413d <exit>
  }
  for(i = 0; i < 20; i++){
    28de:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    28e5:	eb 61                	jmp    2948 <bigfile+0xcd>
    memset(buf, i, 600);
    28e7:	c7 44 24 08 58 02 00 	movl   $0x258,0x8(%esp)
    28ee:	00 
    28ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
    28f2:	89 44 24 04          	mov    %eax,0x4(%esp)
    28f6:	c7 04 24 e0 8b 00 00 	movl   $0x8be0,(%esp)
    28fd:	e8 8e 16 00 00       	call   3f90 <memset>
    if(write(fd, buf, 600) != 600){
    2902:	c7 44 24 08 58 02 00 	movl   $0x258,0x8(%esp)
    2909:	00 
    290a:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
    2911:	00 
    2912:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2915:	89 04 24             	mov    %eax,(%esp)
    2918:	e8 40 18 00 00       	call   415d <write>
    291d:	3d 58 02 00 00       	cmp    $0x258,%eax
    2922:	74 20                	je     2944 <bigfile+0xc9>
      printf(1, "write bigfile failed\n");
    2924:	c7 44 24 04 23 54 00 	movl   $0x5423,0x4(%esp)
    292b:	00 
    292c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2933:	e8 95 19 00 00       	call   42cd <printf>
      exit(1);
    2938:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    293f:	e8 f9 17 00 00       	call   413d <exit>
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    exit(1);
  }
  for(i = 0; i < 20; i++){
    2944:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2948:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    294c:	7e 99                	jle    28e7 <bigfile+0x6c>
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
      exit(1);
    }
  }
  close(fd);
    294e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2951:	89 04 24             	mov    %eax,(%esp)
    2954:	e8 0c 18 00 00       	call   4165 <close>

  fd = open("bigfile", 0);
    2959:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2960:	00 
    2961:	c7 04 24 05 54 00 00 	movl   $0x5405,(%esp)
    2968:	e8 10 18 00 00       	call   417d <open>
    296d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
    2970:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2974:	79 20                	jns    2996 <bigfile+0x11b>
    printf(1, "cannot open bigfile\n");
    2976:	c7 44 24 04 39 54 00 	movl   $0x5439,0x4(%esp)
    297d:	00 
    297e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2985:	e8 43 19 00 00       	call   42cd <printf>
    exit(1);
    298a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2991:	e8 a7 17 00 00       	call   413d <exit>
  }
  total = 0;
    2996:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(i = 0; ; i++){
    299d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    cc = read(fd, buf, 300);
    29a4:	c7 44 24 08 2c 01 00 	movl   $0x12c,0x8(%esp)
    29ab:	00 
    29ac:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
    29b3:	00 
    29b4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    29b7:	89 04 24             	mov    %eax,(%esp)
    29ba:	e8 96 17 00 00       	call   4155 <read>
    29bf:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(cc < 0){
    29c2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    29c6:	79 20                	jns    29e8 <bigfile+0x16d>
      printf(1, "read bigfile failed\n");
    29c8:	c7 44 24 04 4e 54 00 	movl   $0x544e,0x4(%esp)
    29cf:	00 
    29d0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    29d7:	e8 f1 18 00 00       	call   42cd <printf>
      exit(1);
    29dc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    29e3:	e8 55 17 00 00       	call   413d <exit>
    }
    if(cc == 0)
    29e8:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    29ec:	75 1e                	jne    2a0c <bigfile+0x191>
      break;
    29ee:	90                   	nop
      printf(1, "read bigfile wrong data\n");
      exit(1);
    }
    total += cc;
  }
  close(fd);
    29ef:	8b 45 ec             	mov    -0x14(%ebp),%eax
    29f2:	89 04 24             	mov    %eax,(%esp)
    29f5:	e8 6b 17 00 00       	call   4165 <close>
  if(total != 20*600){
    29fa:	81 7d f0 e0 2e 00 00 	cmpl   $0x2ee0,-0x10(%ebp)
    2a01:	0f 84 b1 00 00 00    	je     2ab8 <bigfile+0x23d>
    2a07:	e9 8c 00 00 00       	jmp    2a98 <bigfile+0x21d>
      printf(1, "read bigfile failed\n");
      exit(1);
    }
    if(cc == 0)
      break;
    if(cc != 300){
    2a0c:	81 7d e8 2c 01 00 00 	cmpl   $0x12c,-0x18(%ebp)
    2a13:	74 20                	je     2a35 <bigfile+0x1ba>
      printf(1, "short read bigfile\n");
    2a15:	c7 44 24 04 63 54 00 	movl   $0x5463,0x4(%esp)
    2a1c:	00 
    2a1d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a24:	e8 a4 18 00 00       	call   42cd <printf>
      exit(1);
    2a29:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a30:	e8 08 17 00 00       	call   413d <exit>
    }
    if(buf[0] != i/2 || buf[299] != i/2){
    2a35:	0f b6 05 e0 8b 00 00 	movzbl 0x8be0,%eax
    2a3c:	0f be d0             	movsbl %al,%edx
    2a3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2a42:	89 c1                	mov    %eax,%ecx
    2a44:	c1 e9 1f             	shr    $0x1f,%ecx
    2a47:	01 c8                	add    %ecx,%eax
    2a49:	d1 f8                	sar    %eax
    2a4b:	39 c2                	cmp    %eax,%edx
    2a4d:	75 1a                	jne    2a69 <bigfile+0x1ee>
    2a4f:	0f b6 05 0b 8d 00 00 	movzbl 0x8d0b,%eax
    2a56:	0f be d0             	movsbl %al,%edx
    2a59:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2a5c:	89 c1                	mov    %eax,%ecx
    2a5e:	c1 e9 1f             	shr    $0x1f,%ecx
    2a61:	01 c8                	add    %ecx,%eax
    2a63:	d1 f8                	sar    %eax
    2a65:	39 c2                	cmp    %eax,%edx
    2a67:	74 20                	je     2a89 <bigfile+0x20e>
      printf(1, "read bigfile wrong data\n");
    2a69:	c7 44 24 04 77 54 00 	movl   $0x5477,0x4(%esp)
    2a70:	00 
    2a71:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a78:	e8 50 18 00 00       	call   42cd <printf>
      exit(1);
    2a7d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a84:	e8 b4 16 00 00       	call   413d <exit>
    }
    total += cc;
    2a89:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2a8c:	01 45 f0             	add    %eax,-0x10(%ebp)
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    exit(1);
  }
  total = 0;
  for(i = 0; ; i++){
    2a8f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(buf[0] != i/2 || buf[299] != i/2){
      printf(1, "read bigfile wrong data\n");
      exit(1);
    }
    total += cc;
  }
    2a93:	e9 0c ff ff ff       	jmp    29a4 <bigfile+0x129>
  close(fd);
  if(total != 20*600){
    printf(1, "read bigfile wrong total\n");
    2a98:	c7 44 24 04 90 54 00 	movl   $0x5490,0x4(%esp)
    2a9f:	00 
    2aa0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2aa7:	e8 21 18 00 00       	call   42cd <printf>
    exit(1);
    2aac:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2ab3:	e8 85 16 00 00       	call   413d <exit>
  }
  unlink("bigfile");
    2ab8:	c7 04 24 05 54 00 00 	movl   $0x5405,(%esp)
    2abf:	e8 c9 16 00 00       	call   418d <unlink>

  printf(1, "bigfile test ok\n");
    2ac4:	c7 44 24 04 aa 54 00 	movl   $0x54aa,0x4(%esp)
    2acb:	00 
    2acc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2ad3:	e8 f5 17 00 00       	call   42cd <printf>
}
    2ad8:	c9                   	leave  
    2ad9:	c3                   	ret    

00002ada <fourteen>:

void
fourteen(void)
{
    2ada:	55                   	push   %ebp
    2adb:	89 e5                	mov    %esp,%ebp
    2add:	83 ec 28             	sub    $0x28,%esp
  int fd;

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");
    2ae0:	c7 44 24 04 bb 54 00 	movl   $0x54bb,0x4(%esp)
    2ae7:	00 
    2ae8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2aef:	e8 d9 17 00 00       	call   42cd <printf>

  if(mkdir("12345678901234") != 0){
    2af4:	c7 04 24 ca 54 00 00 	movl   $0x54ca,(%esp)
    2afb:	e8 a5 16 00 00       	call   41a5 <mkdir>
    2b00:	85 c0                	test   %eax,%eax
    2b02:	74 20                	je     2b24 <fourteen+0x4a>
    printf(1, "mkdir 12345678901234 failed\n");
    2b04:	c7 44 24 04 d9 54 00 	movl   $0x54d9,0x4(%esp)
    2b0b:	00 
    2b0c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2b13:	e8 b5 17 00 00       	call   42cd <printf>
    exit(1);
    2b18:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2b1f:	e8 19 16 00 00       	call   413d <exit>
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    2b24:	c7 04 24 f8 54 00 00 	movl   $0x54f8,(%esp)
    2b2b:	e8 75 16 00 00       	call   41a5 <mkdir>
    2b30:	85 c0                	test   %eax,%eax
    2b32:	74 20                	je     2b54 <fourteen+0x7a>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    2b34:	c7 44 24 04 18 55 00 	movl   $0x5518,0x4(%esp)
    2b3b:	00 
    2b3c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2b43:	e8 85 17 00 00       	call   42cd <printf>
    exit(1);
    2b48:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2b4f:	e8 e9 15 00 00       	call   413d <exit>
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    2b54:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    2b5b:	00 
    2b5c:	c7 04 24 48 55 00 00 	movl   $0x5548,(%esp)
    2b63:	e8 15 16 00 00       	call   417d <open>
    2b68:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    2b6b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2b6f:	79 20                	jns    2b91 <fourteen+0xb7>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    2b71:	c7 44 24 04 78 55 00 	movl   $0x5578,0x4(%esp)
    2b78:	00 
    2b79:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2b80:	e8 48 17 00 00       	call   42cd <printf>
    exit(1);
    2b85:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2b8c:	e8 ac 15 00 00       	call   413d <exit>
  }
  close(fd);
    2b91:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2b94:	89 04 24             	mov    %eax,(%esp)
    2b97:	e8 c9 15 00 00       	call   4165 <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    2b9c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2ba3:	00 
    2ba4:	c7 04 24 b8 55 00 00 	movl   $0x55b8,(%esp)
    2bab:	e8 cd 15 00 00       	call   417d <open>
    2bb0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    2bb3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2bb7:	79 20                	jns    2bd9 <fourteen+0xff>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    2bb9:	c7 44 24 04 e8 55 00 	movl   $0x55e8,0x4(%esp)
    2bc0:	00 
    2bc1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2bc8:	e8 00 17 00 00       	call   42cd <printf>
    exit(1);
    2bcd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2bd4:	e8 64 15 00 00       	call   413d <exit>
  }
  close(fd);
    2bd9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2bdc:	89 04 24             	mov    %eax,(%esp)
    2bdf:	e8 81 15 00 00       	call   4165 <close>

  if(mkdir("12345678901234/12345678901234") == 0){
    2be4:	c7 04 24 22 56 00 00 	movl   $0x5622,(%esp)
    2beb:	e8 b5 15 00 00       	call   41a5 <mkdir>
    2bf0:	85 c0                	test   %eax,%eax
    2bf2:	75 20                	jne    2c14 <fourteen+0x13a>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    2bf4:	c7 44 24 04 40 56 00 	movl   $0x5640,0x4(%esp)
    2bfb:	00 
    2bfc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c03:	e8 c5 16 00 00       	call   42cd <printf>
    exit(1);
    2c08:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c0f:	e8 29 15 00 00       	call   413d <exit>
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    2c14:	c7 04 24 70 56 00 00 	movl   $0x5670,(%esp)
    2c1b:	e8 85 15 00 00       	call   41a5 <mkdir>
    2c20:	85 c0                	test   %eax,%eax
    2c22:	75 20                	jne    2c44 <fourteen+0x16a>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    2c24:	c7 44 24 04 90 56 00 	movl   $0x5690,0x4(%esp)
    2c2b:	00 
    2c2c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c33:	e8 95 16 00 00       	call   42cd <printf>
    exit(1);
    2c38:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c3f:	e8 f9 14 00 00       	call   413d <exit>
  }

  printf(1, "fourteen ok\n");
    2c44:	c7 44 24 04 c1 56 00 	movl   $0x56c1,0x4(%esp)
    2c4b:	00 
    2c4c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c53:	e8 75 16 00 00       	call   42cd <printf>
}
    2c58:	c9                   	leave  
    2c59:	c3                   	ret    

00002c5a <rmdot>:

void
rmdot(void)
{
    2c5a:	55                   	push   %ebp
    2c5b:	89 e5                	mov    %esp,%ebp
    2c5d:	83 ec 18             	sub    $0x18,%esp
  printf(1, "rmdot test\n");
    2c60:	c7 44 24 04 ce 56 00 	movl   $0x56ce,0x4(%esp)
    2c67:	00 
    2c68:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c6f:	e8 59 16 00 00       	call   42cd <printf>
  if(mkdir("dots") != 0){
    2c74:	c7 04 24 da 56 00 00 	movl   $0x56da,(%esp)
    2c7b:	e8 25 15 00 00       	call   41a5 <mkdir>
    2c80:	85 c0                	test   %eax,%eax
    2c82:	74 20                	je     2ca4 <rmdot+0x4a>
    printf(1, "mkdir dots failed\n");
    2c84:	c7 44 24 04 df 56 00 	movl   $0x56df,0x4(%esp)
    2c8b:	00 
    2c8c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c93:	e8 35 16 00 00       	call   42cd <printf>
    exit(1);
    2c98:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c9f:	e8 99 14 00 00       	call   413d <exit>
  }
  if(chdir("dots") != 0){
    2ca4:	c7 04 24 da 56 00 00 	movl   $0x56da,(%esp)
    2cab:	e8 fd 14 00 00       	call   41ad <chdir>
    2cb0:	85 c0                	test   %eax,%eax
    2cb2:	74 20                	je     2cd4 <rmdot+0x7a>
    printf(1, "chdir dots failed\n");
    2cb4:	c7 44 24 04 f2 56 00 	movl   $0x56f2,0x4(%esp)
    2cbb:	00 
    2cbc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2cc3:	e8 05 16 00 00       	call   42cd <printf>
    exit(1);
    2cc8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2ccf:	e8 69 14 00 00       	call   413d <exit>
  }
  if(unlink(".") == 0){
    2cd4:	c7 04 24 0b 4e 00 00 	movl   $0x4e0b,(%esp)
    2cdb:	e8 ad 14 00 00       	call   418d <unlink>
    2ce0:	85 c0                	test   %eax,%eax
    2ce2:	75 20                	jne    2d04 <rmdot+0xaa>
    printf(1, "rm . worked!\n");
    2ce4:	c7 44 24 04 05 57 00 	movl   $0x5705,0x4(%esp)
    2ceb:	00 
    2cec:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2cf3:	e8 d5 15 00 00       	call   42cd <printf>
    exit(1);
    2cf8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2cff:	e8 39 14 00 00       	call   413d <exit>
  }
  if(unlink("..") == 0){
    2d04:	c7 04 24 98 49 00 00 	movl   $0x4998,(%esp)
    2d0b:	e8 7d 14 00 00       	call   418d <unlink>
    2d10:	85 c0                	test   %eax,%eax
    2d12:	75 20                	jne    2d34 <rmdot+0xda>
    printf(1, "rm .. worked!\n");
    2d14:	c7 44 24 04 13 57 00 	movl   $0x5713,0x4(%esp)
    2d1b:	00 
    2d1c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2d23:	e8 a5 15 00 00       	call   42cd <printf>
    exit(1);
    2d28:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2d2f:	e8 09 14 00 00       	call   413d <exit>
  }
  if(chdir("/") != 0){
    2d34:	c7 04 24 22 57 00 00 	movl   $0x5722,(%esp)
    2d3b:	e8 6d 14 00 00       	call   41ad <chdir>
    2d40:	85 c0                	test   %eax,%eax
    2d42:	74 20                	je     2d64 <rmdot+0x10a>
    printf(1, "chdir / failed\n");
    2d44:	c7 44 24 04 24 57 00 	movl   $0x5724,0x4(%esp)
    2d4b:	00 
    2d4c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2d53:	e8 75 15 00 00       	call   42cd <printf>
    exit(1);
    2d58:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2d5f:	e8 d9 13 00 00       	call   413d <exit>
  }
  if(unlink("dots/.") == 0){
    2d64:	c7 04 24 34 57 00 00 	movl   $0x5734,(%esp)
    2d6b:	e8 1d 14 00 00       	call   418d <unlink>
    2d70:	85 c0                	test   %eax,%eax
    2d72:	75 20                	jne    2d94 <rmdot+0x13a>
    printf(1, "unlink dots/. worked!\n");
    2d74:	c7 44 24 04 3b 57 00 	movl   $0x573b,0x4(%esp)
    2d7b:	00 
    2d7c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2d83:	e8 45 15 00 00       	call   42cd <printf>
    exit(1);
    2d88:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2d8f:	e8 a9 13 00 00       	call   413d <exit>
  }
  if(unlink("dots/..") == 0){
    2d94:	c7 04 24 52 57 00 00 	movl   $0x5752,(%esp)
    2d9b:	e8 ed 13 00 00       	call   418d <unlink>
    2da0:	85 c0                	test   %eax,%eax
    2da2:	75 20                	jne    2dc4 <rmdot+0x16a>
    printf(1, "unlink dots/.. worked!\n");
    2da4:	c7 44 24 04 5a 57 00 	movl   $0x575a,0x4(%esp)
    2dab:	00 
    2dac:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2db3:	e8 15 15 00 00       	call   42cd <printf>
    exit(1);
    2db8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2dbf:	e8 79 13 00 00       	call   413d <exit>
  }
  if(unlink("dots") != 0){
    2dc4:	c7 04 24 da 56 00 00 	movl   $0x56da,(%esp)
    2dcb:	e8 bd 13 00 00       	call   418d <unlink>
    2dd0:	85 c0                	test   %eax,%eax
    2dd2:	74 20                	je     2df4 <rmdot+0x19a>
    printf(1, "unlink dots failed!\n");
    2dd4:	c7 44 24 04 72 57 00 	movl   $0x5772,0x4(%esp)
    2ddb:	00 
    2ddc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2de3:	e8 e5 14 00 00       	call   42cd <printf>
    exit(1);
    2de8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2def:	e8 49 13 00 00       	call   413d <exit>
  }
  printf(1, "rmdot ok\n");
    2df4:	c7 44 24 04 87 57 00 	movl   $0x5787,0x4(%esp)
    2dfb:	00 
    2dfc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e03:	e8 c5 14 00 00       	call   42cd <printf>
}
    2e08:	c9                   	leave  
    2e09:	c3                   	ret    

00002e0a <dirfile>:

void
dirfile(void)
{
    2e0a:	55                   	push   %ebp
    2e0b:	89 e5                	mov    %esp,%ebp
    2e0d:	83 ec 28             	sub    $0x28,%esp
  int fd;

  printf(1, "dir vs file\n");
    2e10:	c7 44 24 04 91 57 00 	movl   $0x5791,0x4(%esp)
    2e17:	00 
    2e18:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e1f:	e8 a9 14 00 00       	call   42cd <printf>

  fd = open("dirfile", O_CREATE);
    2e24:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    2e2b:	00 
    2e2c:	c7 04 24 9e 57 00 00 	movl   $0x579e,(%esp)
    2e33:	e8 45 13 00 00       	call   417d <open>
    2e38:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    2e3b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2e3f:	79 20                	jns    2e61 <dirfile+0x57>
    printf(1, "create dirfile failed\n");
    2e41:	c7 44 24 04 a6 57 00 	movl   $0x57a6,0x4(%esp)
    2e48:	00 
    2e49:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e50:	e8 78 14 00 00       	call   42cd <printf>
    exit(1);
    2e55:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e5c:	e8 dc 12 00 00       	call   413d <exit>
  }
  close(fd);
    2e61:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2e64:	89 04 24             	mov    %eax,(%esp)
    2e67:	e8 f9 12 00 00       	call   4165 <close>
  if(chdir("dirfile") == 0){
    2e6c:	c7 04 24 9e 57 00 00 	movl   $0x579e,(%esp)
    2e73:	e8 35 13 00 00       	call   41ad <chdir>
    2e78:	85 c0                	test   %eax,%eax
    2e7a:	75 20                	jne    2e9c <dirfile+0x92>
    printf(1, "chdir dirfile succeeded!\n");
    2e7c:	c7 44 24 04 bd 57 00 	movl   $0x57bd,0x4(%esp)
    2e83:	00 
    2e84:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e8b:	e8 3d 14 00 00       	call   42cd <printf>
    exit(1);
    2e90:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e97:	e8 a1 12 00 00       	call   413d <exit>
  }
  fd = open("dirfile/xx", 0);
    2e9c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2ea3:	00 
    2ea4:	c7 04 24 d7 57 00 00 	movl   $0x57d7,(%esp)
    2eab:	e8 cd 12 00 00       	call   417d <open>
    2eb0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
    2eb3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2eb7:	78 20                	js     2ed9 <dirfile+0xcf>
    printf(1, "create dirfile/xx succeeded!\n");
    2eb9:	c7 44 24 04 e2 57 00 	movl   $0x57e2,0x4(%esp)
    2ec0:	00 
    2ec1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2ec8:	e8 00 14 00 00       	call   42cd <printf>
    exit(1);
    2ecd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2ed4:	e8 64 12 00 00       	call   413d <exit>
  }
  fd = open("dirfile/xx", O_CREATE);
    2ed9:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    2ee0:	00 
    2ee1:	c7 04 24 d7 57 00 00 	movl   $0x57d7,(%esp)
    2ee8:	e8 90 12 00 00       	call   417d <open>
    2eed:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
    2ef0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2ef4:	78 20                	js     2f16 <dirfile+0x10c>
    printf(1, "create dirfile/xx succeeded!\n");
    2ef6:	c7 44 24 04 e2 57 00 	movl   $0x57e2,0x4(%esp)
    2efd:	00 
    2efe:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2f05:	e8 c3 13 00 00       	call   42cd <printf>
    exit(1);
    2f0a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2f11:	e8 27 12 00 00       	call   413d <exit>
  }
  if(mkdir("dirfile/xx") == 0){
    2f16:	c7 04 24 d7 57 00 00 	movl   $0x57d7,(%esp)
    2f1d:	e8 83 12 00 00       	call   41a5 <mkdir>
    2f22:	85 c0                	test   %eax,%eax
    2f24:	75 20                	jne    2f46 <dirfile+0x13c>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    2f26:	c7 44 24 04 00 58 00 	movl   $0x5800,0x4(%esp)
    2f2d:	00 
    2f2e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2f35:	e8 93 13 00 00       	call   42cd <printf>
    exit(1);
    2f3a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2f41:	e8 f7 11 00 00       	call   413d <exit>
  }
  if(unlink("dirfile/xx") == 0){
    2f46:	c7 04 24 d7 57 00 00 	movl   $0x57d7,(%esp)
    2f4d:	e8 3b 12 00 00       	call   418d <unlink>
    2f52:	85 c0                	test   %eax,%eax
    2f54:	75 20                	jne    2f76 <dirfile+0x16c>
    printf(1, "unlink dirfile/xx succeeded!\n");
    2f56:	c7 44 24 04 1d 58 00 	movl   $0x581d,0x4(%esp)
    2f5d:	00 
    2f5e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2f65:	e8 63 13 00 00       	call   42cd <printf>
    exit(1);
    2f6a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2f71:	e8 c7 11 00 00       	call   413d <exit>
  }
  if(link("README", "dirfile/xx") == 0){
    2f76:	c7 44 24 04 d7 57 00 	movl   $0x57d7,0x4(%esp)
    2f7d:	00 
    2f7e:	c7 04 24 3b 58 00 00 	movl   $0x583b,(%esp)
    2f85:	e8 13 12 00 00       	call   419d <link>
    2f8a:	85 c0                	test   %eax,%eax
    2f8c:	75 20                	jne    2fae <dirfile+0x1a4>
    printf(1, "link to dirfile/xx succeeded!\n");
    2f8e:	c7 44 24 04 44 58 00 	movl   $0x5844,0x4(%esp)
    2f95:	00 
    2f96:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2f9d:	e8 2b 13 00 00       	call   42cd <printf>
    exit(1);
    2fa2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2fa9:	e8 8f 11 00 00       	call   413d <exit>
  }
  if(unlink("dirfile") != 0){
    2fae:	c7 04 24 9e 57 00 00 	movl   $0x579e,(%esp)
    2fb5:	e8 d3 11 00 00       	call   418d <unlink>
    2fba:	85 c0                	test   %eax,%eax
    2fbc:	74 20                	je     2fde <dirfile+0x1d4>
    printf(1, "unlink dirfile failed!\n");
    2fbe:	c7 44 24 04 63 58 00 	movl   $0x5863,0x4(%esp)
    2fc5:	00 
    2fc6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2fcd:	e8 fb 12 00 00       	call   42cd <printf>
    exit(1);
    2fd2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2fd9:	e8 5f 11 00 00       	call   413d <exit>
  }

  fd = open(".", O_RDWR);
    2fde:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    2fe5:	00 
    2fe6:	c7 04 24 0b 4e 00 00 	movl   $0x4e0b,(%esp)
    2fed:	e8 8b 11 00 00       	call   417d <open>
    2ff2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
    2ff5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2ff9:	78 20                	js     301b <dirfile+0x211>
    printf(1, "open . for writing succeeded!\n");
    2ffb:	c7 44 24 04 7c 58 00 	movl   $0x587c,0x4(%esp)
    3002:	00 
    3003:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    300a:	e8 be 12 00 00       	call   42cd <printf>
    exit(1);
    300f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3016:	e8 22 11 00 00       	call   413d <exit>
  }
  fd = open(".", 0);
    301b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3022:	00 
    3023:	c7 04 24 0b 4e 00 00 	movl   $0x4e0b,(%esp)
    302a:	e8 4e 11 00 00       	call   417d <open>
    302f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(write(fd, "x", 1) > 0){
    3032:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3039:	00 
    303a:	c7 44 24 04 42 4a 00 	movl   $0x4a42,0x4(%esp)
    3041:	00 
    3042:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3045:	89 04 24             	mov    %eax,(%esp)
    3048:	e8 10 11 00 00       	call   415d <write>
    304d:	85 c0                	test   %eax,%eax
    304f:	7e 20                	jle    3071 <dirfile+0x267>
    printf(1, "write . succeeded!\n");
    3051:	c7 44 24 04 9b 58 00 	movl   $0x589b,0x4(%esp)
    3058:	00 
    3059:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3060:	e8 68 12 00 00       	call   42cd <printf>
    exit(1);
    3065:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    306c:	e8 cc 10 00 00       	call   413d <exit>
  }
  close(fd);
    3071:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3074:	89 04 24             	mov    %eax,(%esp)
    3077:	e8 e9 10 00 00       	call   4165 <close>

  printf(1, "dir vs file OK\n");
    307c:	c7 44 24 04 af 58 00 	movl   $0x58af,0x4(%esp)
    3083:	00 
    3084:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    308b:	e8 3d 12 00 00       	call   42cd <printf>
}
    3090:	c9                   	leave  
    3091:	c3                   	ret    

00003092 <iref>:

// test that iput() is called at the end of _namei()
void
iref(void)
{
    3092:	55                   	push   %ebp
    3093:	89 e5                	mov    %esp,%ebp
    3095:	83 ec 28             	sub    $0x28,%esp
  int i, fd;

  printf(1, "empty file name\n");
    3098:	c7 44 24 04 bf 58 00 	movl   $0x58bf,0x4(%esp)
    309f:	00 
    30a0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    30a7:	e8 21 12 00 00       	call   42cd <printf>

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    30ac:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    30b3:	e9 e0 00 00 00       	jmp    3198 <iref+0x106>
    if(mkdir("irefd") != 0){
    30b8:	c7 04 24 d0 58 00 00 	movl   $0x58d0,(%esp)
    30bf:	e8 e1 10 00 00       	call   41a5 <mkdir>
    30c4:	85 c0                	test   %eax,%eax
    30c6:	74 20                	je     30e8 <iref+0x56>
      printf(1, "mkdir irefd failed\n");
    30c8:	c7 44 24 04 d6 58 00 	movl   $0x58d6,0x4(%esp)
    30cf:	00 
    30d0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    30d7:	e8 f1 11 00 00       	call   42cd <printf>
      exit(1);
    30dc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    30e3:	e8 55 10 00 00       	call   413d <exit>
    }
    if(chdir("irefd") != 0){
    30e8:	c7 04 24 d0 58 00 00 	movl   $0x58d0,(%esp)
    30ef:	e8 b9 10 00 00       	call   41ad <chdir>
    30f4:	85 c0                	test   %eax,%eax
    30f6:	74 20                	je     3118 <iref+0x86>
      printf(1, "chdir irefd failed\n");
    30f8:	c7 44 24 04 ea 58 00 	movl   $0x58ea,0x4(%esp)
    30ff:	00 
    3100:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3107:	e8 c1 11 00 00       	call   42cd <printf>
      exit(1);
    310c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3113:	e8 25 10 00 00       	call   413d <exit>
    }

    mkdir("");
    3118:	c7 04 24 fe 58 00 00 	movl   $0x58fe,(%esp)
    311f:	e8 81 10 00 00       	call   41a5 <mkdir>
    link("README", "");
    3124:	c7 44 24 04 fe 58 00 	movl   $0x58fe,0x4(%esp)
    312b:	00 
    312c:	c7 04 24 3b 58 00 00 	movl   $0x583b,(%esp)
    3133:	e8 65 10 00 00       	call   419d <link>
    fd = open("", O_CREATE);
    3138:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    313f:	00 
    3140:	c7 04 24 fe 58 00 00 	movl   $0x58fe,(%esp)
    3147:	e8 31 10 00 00       	call   417d <open>
    314c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(fd >= 0)
    314f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3153:	78 0b                	js     3160 <iref+0xce>
      close(fd);
    3155:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3158:	89 04 24             	mov    %eax,(%esp)
    315b:	e8 05 10 00 00       	call   4165 <close>
    fd = open("xx", O_CREATE);
    3160:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    3167:	00 
    3168:	c7 04 24 ff 58 00 00 	movl   $0x58ff,(%esp)
    316f:	e8 09 10 00 00       	call   417d <open>
    3174:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(fd >= 0)
    3177:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    317b:	78 0b                	js     3188 <iref+0xf6>
      close(fd);
    317d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3180:	89 04 24             	mov    %eax,(%esp)
    3183:	e8 dd 0f 00 00       	call   4165 <close>
    unlink("xx");
    3188:	c7 04 24 ff 58 00 00 	movl   $0x58ff,(%esp)
    318f:	e8 f9 0f 00 00       	call   418d <unlink>
  int i, fd;

  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    3194:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3198:	83 7d f4 32          	cmpl   $0x32,-0xc(%ebp)
    319c:	0f 8e 16 ff ff ff    	jle    30b8 <iref+0x26>
    if(fd >= 0)
      close(fd);
    unlink("xx");
  }

  chdir("/");
    31a2:	c7 04 24 22 57 00 00 	movl   $0x5722,(%esp)
    31a9:	e8 ff 0f 00 00       	call   41ad <chdir>
  printf(1, "empty file name OK\n");
    31ae:	c7 44 24 04 02 59 00 	movl   $0x5902,0x4(%esp)
    31b5:	00 
    31b6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    31bd:	e8 0b 11 00 00       	call   42cd <printf>
}
    31c2:	c9                   	leave  
    31c3:	c3                   	ret    

000031c4 <forktest>:
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    31c4:	55                   	push   %ebp
    31c5:	89 e5                	mov    %esp,%ebp
    31c7:	83 ec 28             	sub    $0x28,%esp
  int n, pid,st;

  printf(1, "fork test\n");
    31ca:	c7 44 24 04 16 59 00 	movl   $0x5916,0x4(%esp)
    31d1:	00 
    31d2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    31d9:	e8 ef 10 00 00       	call   42cd <printf>

  for(n=0; n<1000; n++){
    31de:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    31e5:	eb 26                	jmp    320d <forktest+0x49>
    pid = fork();
    31e7:	e8 49 0f 00 00       	call   4135 <fork>
    31ec:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(pid < 0)
    31ef:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    31f3:	79 02                	jns    31f7 <forktest+0x33>
      break;
    31f5:	eb 1f                	jmp    3216 <forktest+0x52>
    if(pid == 0)
    31f7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    31fb:	75 0c                	jne    3209 <forktest+0x45>
      exit(1);
    31fd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3204:	e8 34 0f 00 00       	call   413d <exit>
{
  int n, pid,st;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    3209:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    320d:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
    3214:	7e d1                	jle    31e7 <forktest+0x23>
      break;
    if(pid == 0)
      exit(1);
  }
  
  if(n == 1000){
    3216:	81 7d f4 e8 03 00 00 	cmpl   $0x3e8,-0xc(%ebp)
    321d:	75 20                	jne    323f <forktest+0x7b>
    printf(1, "fork claimed to work 1000 times!\n");
    321f:	c7 44 24 04 24 59 00 	movl   $0x5924,0x4(%esp)
    3226:	00 
    3227:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    322e:	e8 9a 10 00 00       	call   42cd <printf>
    exit(1);
    3233:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    323a:	e8 fe 0e 00 00       	call   413d <exit>
  }
  
  for(; n > 0; n--){
    323f:	eb 33                	jmp    3274 <forktest+0xb0>
    if(wait(&st) < 0){
    3241:	8d 45 ec             	lea    -0x14(%ebp),%eax
    3244:	89 04 24             	mov    %eax,(%esp)
    3247:	e8 f9 0e 00 00       	call   4145 <wait>
    324c:	85 c0                	test   %eax,%eax
    324e:	79 20                	jns    3270 <forktest+0xac>
      printf(1, "wait stopped early\n");
    3250:	c7 44 24 04 46 59 00 	movl   $0x5946,0x4(%esp)
    3257:	00 
    3258:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    325f:	e8 69 10 00 00       	call   42cd <printf>
      exit(1);
    3264:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    326b:	e8 cd 0e 00 00       	call   413d <exit>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit(1);
  }
  
  for(; n > 0; n--){
    3270:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    3274:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3278:	7f c7                	jg     3241 <forktest+0x7d>
      printf(1, "wait stopped early\n");
      exit(1);
    }
  }
  
  if(wait(&st) != -1){
    327a:	8d 45 ec             	lea    -0x14(%ebp),%eax
    327d:	89 04 24             	mov    %eax,(%esp)
    3280:	e8 c0 0e 00 00       	call   4145 <wait>
    3285:	83 f8 ff             	cmp    $0xffffffff,%eax
    3288:	74 20                	je     32aa <forktest+0xe6>
    printf(1, "wait got too many\n");
    328a:	c7 44 24 04 5a 59 00 	movl   $0x595a,0x4(%esp)
    3291:	00 
    3292:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3299:	e8 2f 10 00 00       	call   42cd <printf>
    exit(1);
    329e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    32a5:	e8 93 0e 00 00       	call   413d <exit>
  }
  
  printf(1, "fork test OK\n");
    32aa:	c7 44 24 04 6d 59 00 	movl   $0x596d,0x4(%esp)
    32b1:	00 
    32b2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    32b9:	e8 0f 10 00 00       	call   42cd <printf>
}
    32be:	c9                   	leave  
    32bf:	c3                   	ret    

000032c0 <sbrktest>:

void
sbrktest(void)
{
    32c0:	55                   	push   %ebp
    32c1:	89 e5                	mov    %esp,%ebp
    32c3:	53                   	push   %ebx
    32c4:	81 ec 84 00 00 00    	sub    $0x84,%esp
  int fds[2], pid, pids[10], ppid ,st;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
    32ca:	a1 f4 63 00 00       	mov    0x63f4,%eax
    32cf:	c7 44 24 04 7b 59 00 	movl   $0x597b,0x4(%esp)
    32d6:	00 
    32d7:	89 04 24             	mov    %eax,(%esp)
    32da:	e8 ee 0f 00 00       	call   42cd <printf>
  oldbrk = sbrk(0);
    32df:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    32e6:	e8 da 0e 00 00       	call   41c5 <sbrk>
    32eb:	89 45 ec             	mov    %eax,-0x14(%ebp)

  // can one sbrk() less than a page?
  a = sbrk(0);
    32ee:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    32f5:	e8 cb 0e 00 00       	call   41c5 <sbrk>
    32fa:	89 45 f4             	mov    %eax,-0xc(%ebp)
  int i;
  for(i = 0; i < 5000; i++){ 
    32fd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3304:	eb 60                	jmp    3366 <sbrktest+0xa6>
    b = sbrk(1);
    3306:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    330d:	e8 b3 0e 00 00       	call   41c5 <sbrk>
    3312:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(b != a){
    3315:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3318:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    331b:	74 36                	je     3353 <sbrktest+0x93>
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    331d:	a1 f4 63 00 00       	mov    0x63f4,%eax
    3322:	8b 55 e8             	mov    -0x18(%ebp),%edx
    3325:	89 54 24 10          	mov    %edx,0x10(%esp)
    3329:	8b 55 f4             	mov    -0xc(%ebp),%edx
    332c:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3330:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3333:	89 54 24 08          	mov    %edx,0x8(%esp)
    3337:	c7 44 24 04 86 59 00 	movl   $0x5986,0x4(%esp)
    333e:	00 
    333f:	89 04 24             	mov    %eax,(%esp)
    3342:	e8 86 0f 00 00       	call   42cd <printf>
      exit(1);
    3347:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    334e:	e8 ea 0d 00 00       	call   413d <exit>
    }
    *b = 1;
    3353:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3356:	c6 00 01             	movb   $0x1,(%eax)
    a = b + 1;
    3359:	8b 45 e8             	mov    -0x18(%ebp),%eax
    335c:	83 c0 01             	add    $0x1,%eax
    335f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){ 
    3362:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3366:	81 7d f0 87 13 00 00 	cmpl   $0x1387,-0x10(%ebp)
    336d:	7e 97                	jle    3306 <sbrktest+0x46>
      exit(1);
    }
    *b = 1;
    a = b + 1;
  }
  pid = fork();
    336f:	e8 c1 0d 00 00       	call   4135 <fork>
    3374:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(pid < 0){
    3377:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    337b:	79 21                	jns    339e <sbrktest+0xde>
    printf(stdout, "sbrk test fork failed\n");
    337d:	a1 f4 63 00 00       	mov    0x63f4,%eax
    3382:	c7 44 24 04 a1 59 00 	movl   $0x59a1,0x4(%esp)
    3389:	00 
    338a:	89 04 24             	mov    %eax,(%esp)
    338d:	e8 3b 0f 00 00       	call   42cd <printf>
    exit(1);
    3392:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3399:	e8 9f 0d 00 00       	call   413d <exit>
  }
  c = sbrk(1);
    339e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    33a5:	e8 1b 0e 00 00       	call   41c5 <sbrk>
    33aa:	89 45 e0             	mov    %eax,-0x20(%ebp)
  c = sbrk(1);
    33ad:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    33b4:	e8 0c 0e 00 00       	call   41c5 <sbrk>
    33b9:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a + 1){
    33bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    33bf:	83 c0 01             	add    $0x1,%eax
    33c2:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    33c5:	74 21                	je     33e8 <sbrktest+0x128>
    printf(stdout, "sbrk test failed post-fork\n");
    33c7:	a1 f4 63 00 00       	mov    0x63f4,%eax
    33cc:	c7 44 24 04 b8 59 00 	movl   $0x59b8,0x4(%esp)
    33d3:	00 
    33d4:	89 04 24             	mov    %eax,(%esp)
    33d7:	e8 f1 0e 00 00       	call   42cd <printf>
    exit(1);
    33dc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    33e3:	e8 55 0d 00 00       	call   413d <exit>
  }
  if(pid == 0)
    33e8:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    33ec:	75 0c                	jne    33fa <sbrktest+0x13a>
    exit(1);
    33ee:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    33f5:	e8 43 0d 00 00       	call   413d <exit>
  wait(&st);
    33fa:	8d 45 9c             	lea    -0x64(%ebp),%eax
    33fd:	89 04 24             	mov    %eax,(%esp)
    3400:	e8 40 0d 00 00       	call   4145 <wait>

  // can one grow address space to something big?
#define BIG (100*1024*1024)
  a = sbrk(0);
    3405:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    340c:	e8 b4 0d 00 00       	call   41c5 <sbrk>
    3411:	89 45 f4             	mov    %eax,-0xc(%ebp)
  amt = (BIG) - (uint)a;
    3414:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3417:	ba 00 00 40 06       	mov    $0x6400000,%edx
    341c:	29 c2                	sub    %eax,%edx
    341e:	89 d0                	mov    %edx,%eax
    3420:	89 45 dc             	mov    %eax,-0x24(%ebp)
  p = sbrk(amt);
    3423:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3426:	89 04 24             	mov    %eax,(%esp)
    3429:	e8 97 0d 00 00       	call   41c5 <sbrk>
    342e:	89 45 d8             	mov    %eax,-0x28(%ebp)
  if (p != a) { 
    3431:	8b 45 d8             	mov    -0x28(%ebp),%eax
    3434:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3437:	74 21                	je     345a <sbrktest+0x19a>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    3439:	a1 f4 63 00 00       	mov    0x63f4,%eax
    343e:	c7 44 24 04 d4 59 00 	movl   $0x59d4,0x4(%esp)
    3445:	00 
    3446:	89 04 24             	mov    %eax,(%esp)
    3449:	e8 7f 0e 00 00       	call   42cd <printf>
    exit(1);
    344e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3455:	e8 e3 0c 00 00       	call   413d <exit>
  }
  lastaddr = (char*) (BIG-1);
    345a:	c7 45 d4 ff ff 3f 06 	movl   $0x63fffff,-0x2c(%ebp)
  *lastaddr = 99;
    3461:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3464:	c6 00 63             	movb   $0x63,(%eax)

  // can one de-allocate?
  a = sbrk(0);
    3467:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    346e:	e8 52 0d 00 00       	call   41c5 <sbrk>
    3473:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c = sbrk(-4096);
    3476:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
    347d:	e8 43 0d 00 00       	call   41c5 <sbrk>
    3482:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c == (char*)0xffffffff){
    3485:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
    3489:	75 21                	jne    34ac <sbrktest+0x1ec>
    printf(stdout, "sbrk could not deallocate\n");
    348b:	a1 f4 63 00 00       	mov    0x63f4,%eax
    3490:	c7 44 24 04 12 5a 00 	movl   $0x5a12,0x4(%esp)
    3497:	00 
    3498:	89 04 24             	mov    %eax,(%esp)
    349b:	e8 2d 0e 00 00       	call   42cd <printf>
    exit(1);
    34a0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    34a7:	e8 91 0c 00 00       	call   413d <exit>
  }
  c = sbrk(0);
    34ac:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    34b3:	e8 0d 0d 00 00       	call   41c5 <sbrk>
    34b8:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a - 4096){
    34bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34be:	2d 00 10 00 00       	sub    $0x1000,%eax
    34c3:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    34c6:	74 2f                	je     34f7 <sbrktest+0x237>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    34c8:	a1 f4 63 00 00       	mov    0x63f4,%eax
    34cd:	8b 55 e0             	mov    -0x20(%ebp),%edx
    34d0:	89 54 24 0c          	mov    %edx,0xc(%esp)
    34d4:	8b 55 f4             	mov    -0xc(%ebp),%edx
    34d7:	89 54 24 08          	mov    %edx,0x8(%esp)
    34db:	c7 44 24 04 30 5a 00 	movl   $0x5a30,0x4(%esp)
    34e2:	00 
    34e3:	89 04 24             	mov    %eax,(%esp)
    34e6:	e8 e2 0d 00 00       	call   42cd <printf>
    exit(1);
    34eb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    34f2:	e8 46 0c 00 00       	call   413d <exit>
  }

  // can one re-allocate that page?
  a = sbrk(0);
    34f7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    34fe:	e8 c2 0c 00 00       	call   41c5 <sbrk>
    3503:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c = sbrk(4096);
    3506:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    350d:	e8 b3 0c 00 00       	call   41c5 <sbrk>
    3512:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a || sbrk(0) != a + 4096){
    3515:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3518:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    351b:	75 19                	jne    3536 <sbrktest+0x276>
    351d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3524:	e8 9c 0c 00 00       	call   41c5 <sbrk>
    3529:	8b 55 f4             	mov    -0xc(%ebp),%edx
    352c:	81 c2 00 10 00 00    	add    $0x1000,%edx
    3532:	39 d0                	cmp    %edx,%eax
    3534:	74 2f                	je     3565 <sbrktest+0x2a5>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    3536:	a1 f4 63 00 00       	mov    0x63f4,%eax
    353b:	8b 55 e0             	mov    -0x20(%ebp),%edx
    353e:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3542:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3545:	89 54 24 08          	mov    %edx,0x8(%esp)
    3549:	c7 44 24 04 68 5a 00 	movl   $0x5a68,0x4(%esp)
    3550:	00 
    3551:	89 04 24             	mov    %eax,(%esp)
    3554:	e8 74 0d 00 00       	call   42cd <printf>
    exit(1);
    3559:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3560:	e8 d8 0b 00 00       	call   413d <exit>
  }
  if(*lastaddr == 99){
    3565:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3568:	0f b6 00             	movzbl (%eax),%eax
    356b:	3c 63                	cmp    $0x63,%al
    356d:	75 21                	jne    3590 <sbrktest+0x2d0>
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    356f:	a1 f4 63 00 00       	mov    0x63f4,%eax
    3574:	c7 44 24 04 90 5a 00 	movl   $0x5a90,0x4(%esp)
    357b:	00 
    357c:	89 04 24             	mov    %eax,(%esp)
    357f:	e8 49 0d 00 00       	call   42cd <printf>
    exit(1);
    3584:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    358b:	e8 ad 0b 00 00       	call   413d <exit>
  }

  a = sbrk(0);
    3590:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3597:	e8 29 0c 00 00       	call   41c5 <sbrk>
    359c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c = sbrk(-(sbrk(0) - oldbrk));
    359f:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    35a2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    35a9:	e8 17 0c 00 00       	call   41c5 <sbrk>
    35ae:	29 c3                	sub    %eax,%ebx
    35b0:	89 d8                	mov    %ebx,%eax
    35b2:	89 04 24             	mov    %eax,(%esp)
    35b5:	e8 0b 0c 00 00       	call   41c5 <sbrk>
    35ba:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a){
    35bd:	8b 45 e0             	mov    -0x20(%ebp),%eax
    35c0:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    35c3:	74 2f                	je     35f4 <sbrktest+0x334>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    35c5:	a1 f4 63 00 00       	mov    0x63f4,%eax
    35ca:	8b 55 e0             	mov    -0x20(%ebp),%edx
    35cd:	89 54 24 0c          	mov    %edx,0xc(%esp)
    35d1:	8b 55 f4             	mov    -0xc(%ebp),%edx
    35d4:	89 54 24 08          	mov    %edx,0x8(%esp)
    35d8:	c7 44 24 04 c0 5a 00 	movl   $0x5ac0,0x4(%esp)
    35df:	00 
    35e0:	89 04 24             	mov    %eax,(%esp)
    35e3:	e8 e5 0c 00 00       	call   42cd <printf>
    exit(1);
    35e8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    35ef:	e8 49 0b 00 00       	call   413d <exit>
  }
  
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    35f4:	c7 45 f4 00 00 00 80 	movl   $0x80000000,-0xc(%ebp)
    35fb:	e9 8f 00 00 00       	jmp    368f <sbrktest+0x3cf>
    ppid = getpid();
    3600:	e8 b8 0b 00 00       	call   41bd <getpid>
    3605:	89 45 d0             	mov    %eax,-0x30(%ebp)
    pid = fork();
    3608:	e8 28 0b 00 00       	call   4135 <fork>
    360d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(pid < 0){
    3610:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    3614:	79 21                	jns    3637 <sbrktest+0x377>
      printf(stdout, "fork failed\n");
    3616:	a1 f4 63 00 00       	mov    0x63f4,%eax
    361b:	c7 44 24 04 89 4a 00 	movl   $0x4a89,0x4(%esp)
    3622:	00 
    3623:	89 04 24             	mov    %eax,(%esp)
    3626:	e8 a2 0c 00 00       	call   42cd <printf>
      exit(1);
    362b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3632:	e8 06 0b 00 00       	call   413d <exit>
    }
    if(pid == 0){
    3637:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    363b:	75 40                	jne    367d <sbrktest+0x3bd>
      printf(stdout, "oops could read %x = %x\n", a, *a);
    363d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3640:	0f b6 00             	movzbl (%eax),%eax
    3643:	0f be d0             	movsbl %al,%edx
    3646:	a1 f4 63 00 00       	mov    0x63f4,%eax
    364b:	89 54 24 0c          	mov    %edx,0xc(%esp)
    364f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3652:	89 54 24 08          	mov    %edx,0x8(%esp)
    3656:	c7 44 24 04 e1 5a 00 	movl   $0x5ae1,0x4(%esp)
    365d:	00 
    365e:	89 04 24             	mov    %eax,(%esp)
    3661:	e8 67 0c 00 00       	call   42cd <printf>
      kill(ppid);
    3666:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3669:	89 04 24             	mov    %eax,(%esp)
    366c:	e8 fc 0a 00 00       	call   416d <kill>
      exit(1);
    3671:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3678:	e8 c0 0a 00 00       	call   413d <exit>
    }
    wait(&st);
    367d:	8d 45 9c             	lea    -0x64(%ebp),%eax
    3680:	89 04 24             	mov    %eax,(%esp)
    3683:	e8 bd 0a 00 00       	call   4145 <wait>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit(1);
  }
  
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    3688:	81 45 f4 50 c3 00 00 	addl   $0xc350,-0xc(%ebp)
    368f:	81 7d f4 7f 84 1e 80 	cmpl   $0x801e847f,-0xc(%ebp)
    3696:	0f 86 64 ff ff ff    	jbe    3600 <sbrktest+0x340>
    wait(&st);
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    369c:	8d 45 c8             	lea    -0x38(%ebp),%eax
    369f:	89 04 24             	mov    %eax,(%esp)
    36a2:	e8 a6 0a 00 00       	call   414d <pipe>
    36a7:	85 c0                	test   %eax,%eax
    36a9:	74 20                	je     36cb <sbrktest+0x40b>
    printf(1, "pipe() failed\n");
    36ab:	c7 44 24 04 dd 49 00 	movl   $0x49dd,0x4(%esp)
    36b2:	00 
    36b3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    36ba:	e8 0e 0c 00 00       	call   42cd <printf>
    exit(1);
    36bf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    36c6:	e8 72 0a 00 00       	call   413d <exit>
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    36cb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    36d2:	e9 87 00 00 00       	jmp    375e <sbrktest+0x49e>
    if((pids[i] = fork()) == 0){
    36d7:	e8 59 0a 00 00       	call   4135 <fork>
    36dc:	8b 55 f0             	mov    -0x10(%ebp),%edx
    36df:	89 44 95 a0          	mov    %eax,-0x60(%ebp,%edx,4)
    36e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    36e6:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    36ea:	85 c0                	test   %eax,%eax
    36ec:	75 46                	jne    3734 <sbrktest+0x474>
      // allocate a lot of memory
      sbrk(BIG - (uint)sbrk(0));
    36ee:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    36f5:	e8 cb 0a 00 00       	call   41c5 <sbrk>
    36fa:	ba 00 00 40 06       	mov    $0x6400000,%edx
    36ff:	29 c2                	sub    %eax,%edx
    3701:	89 d0                	mov    %edx,%eax
    3703:	89 04 24             	mov    %eax,(%esp)
    3706:	e8 ba 0a 00 00       	call   41c5 <sbrk>
      write(fds[1], "x", 1);
    370b:	8b 45 cc             	mov    -0x34(%ebp),%eax
    370e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3715:	00 
    3716:	c7 44 24 04 42 4a 00 	movl   $0x4a42,0x4(%esp)
    371d:	00 
    371e:	89 04 24             	mov    %eax,(%esp)
    3721:	e8 37 0a 00 00       	call   415d <write>
      // sit around until killed
      for(;;) sleep(1000);
    3726:	c7 04 24 e8 03 00 00 	movl   $0x3e8,(%esp)
    372d:	e8 9b 0a 00 00       	call   41cd <sleep>
    3732:	eb f2                	jmp    3726 <sbrktest+0x466>
    }
    if(pids[i] != -1)
    3734:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3737:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    373b:	83 f8 ff             	cmp    $0xffffffff,%eax
    373e:	74 1a                	je     375a <sbrktest+0x49a>
      read(fds[0], &scratch, 1);
    3740:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3743:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    374a:	00 
    374b:	8d 55 9b             	lea    -0x65(%ebp),%edx
    374e:	89 54 24 04          	mov    %edx,0x4(%esp)
    3752:	89 04 24             	mov    %eax,(%esp)
    3755:	e8 fb 09 00 00       	call   4155 <read>
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit(1);
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    375a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    375e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3761:	83 f8 09             	cmp    $0x9,%eax
    3764:	0f 86 6d ff ff ff    	jbe    36d7 <sbrktest+0x417>
    if(pids[i] != -1)
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
    376a:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    3771:	e8 4f 0a 00 00       	call   41c5 <sbrk>
    3776:	89 45 e0             	mov    %eax,-0x20(%ebp)
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3779:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3780:	eb 2c                	jmp    37ae <sbrktest+0x4ee>
    if(pids[i] == -1)
    3782:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3785:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    3789:	83 f8 ff             	cmp    $0xffffffff,%eax
    378c:	75 02                	jne    3790 <sbrktest+0x4d0>
      continue;
    378e:	eb 1a                	jmp    37aa <sbrktest+0x4ea>
    kill(pids[i]);
    3790:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3793:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    3797:	89 04 24             	mov    %eax,(%esp)
    379a:	e8 ce 09 00 00       	call   416d <kill>
    wait(&st);
    379f:	8d 45 9c             	lea    -0x64(%ebp),%eax
    37a2:	89 04 24             	mov    %eax,(%esp)
    37a5:	e8 9b 09 00 00       	call   4145 <wait>
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    37aa:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    37ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
    37b1:	83 f8 09             	cmp    $0x9,%eax
    37b4:	76 cc                	jbe    3782 <sbrktest+0x4c2>
    if(pids[i] == -1)
      continue;
    kill(pids[i]);
    wait(&st);
  }
  if(c == (char*)0xffffffff){
    37b6:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
    37ba:	75 21                	jne    37dd <sbrktest+0x51d>
    printf(stdout, "failed sbrk leaked memory\n");
    37bc:	a1 f4 63 00 00       	mov    0x63f4,%eax
    37c1:	c7 44 24 04 fa 5a 00 	movl   $0x5afa,0x4(%esp)
    37c8:	00 
    37c9:	89 04 24             	mov    %eax,(%esp)
    37cc:	e8 fc 0a 00 00       	call   42cd <printf>
    exit(1);
    37d1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    37d8:	e8 60 09 00 00       	call   413d <exit>
  }

  if(sbrk(0) > oldbrk)
    37dd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    37e4:	e8 dc 09 00 00       	call   41c5 <sbrk>
    37e9:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    37ec:	76 1b                	jbe    3809 <sbrktest+0x549>
    sbrk(-(sbrk(0) - oldbrk));
    37ee:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    37f1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    37f8:	e8 c8 09 00 00       	call   41c5 <sbrk>
    37fd:	29 c3                	sub    %eax,%ebx
    37ff:	89 d8                	mov    %ebx,%eax
    3801:	89 04 24             	mov    %eax,(%esp)
    3804:	e8 bc 09 00 00       	call   41c5 <sbrk>

  printf(stdout, "sbrk test OK\n");
    3809:	a1 f4 63 00 00       	mov    0x63f4,%eax
    380e:	c7 44 24 04 15 5b 00 	movl   $0x5b15,0x4(%esp)
    3815:	00 
    3816:	89 04 24             	mov    %eax,(%esp)
    3819:	e8 af 0a 00 00       	call   42cd <printf>
}
    381e:	81 c4 84 00 00 00    	add    $0x84,%esp
    3824:	5b                   	pop    %ebx
    3825:	5d                   	pop    %ebp
    3826:	c3                   	ret    

00003827 <validateint>:

void
validateint(int *p)
{
    3827:	55                   	push   %ebp
    3828:	89 e5                	mov    %esp,%ebp
    382a:	53                   	push   %ebx
    382b:	83 ec 10             	sub    $0x10,%esp
  int res;
  asm("mov %%esp, %%ebx\n\t"
    382e:	b8 0d 00 00 00       	mov    $0xd,%eax
    3833:	8b 55 08             	mov    0x8(%ebp),%edx
    3836:	89 d1                	mov    %edx,%ecx
    3838:	89 e3                	mov    %esp,%ebx
    383a:	89 cc                	mov    %ecx,%esp
    383c:	cd 40                	int    $0x40
    383e:	89 dc                	mov    %ebx,%esp
    3840:	89 45 f8             	mov    %eax,-0x8(%ebp)
      "int %2\n\t"
      "mov %%ebx, %%esp" :
      "=a" (res) :
      "a" (SYS_sleep), "n" (T_SYSCALL), "c" (p) :
      "ebx");
}
    3843:	83 c4 10             	add    $0x10,%esp
    3846:	5b                   	pop    %ebx
    3847:	5d                   	pop    %ebp
    3848:	c3                   	ret    

00003849 <validatetest>:

void
validatetest(void)
{
    3849:	55                   	push   %ebp
    384a:	89 e5                	mov    %esp,%ebp
    384c:	83 ec 28             	sub    $0x28,%esp
  int hi, pid ,st;
  uint p;

  printf(stdout, "validate test\n");
    384f:	a1 f4 63 00 00       	mov    0x63f4,%eax
    3854:	c7 44 24 04 23 5b 00 	movl   $0x5b23,0x4(%esp)
    385b:	00 
    385c:	89 04 24             	mov    %eax,(%esp)
    385f:	e8 69 0a 00 00       	call   42cd <printf>
  hi = 1100*1024;
    3864:	c7 45 f0 00 30 11 00 	movl   $0x113000,-0x10(%ebp)

  for(p = 0; p <= (uint)hi; p += 4096){
    386b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3872:	e9 93 00 00 00       	jmp    390a <validatetest+0xc1>
    if((pid = fork()) == 0){
    3877:	e8 b9 08 00 00       	call   4135 <fork>
    387c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    387f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3883:	75 17                	jne    389c <validatetest+0x53>
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
    3885:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3888:	89 04 24             	mov    %eax,(%esp)
    388b:	e8 97 ff ff ff       	call   3827 <validateint>
      exit(1);
    3890:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3897:	e8 a1 08 00 00       	call   413d <exit>
    }
    sleep(0);
    389c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    38a3:	e8 25 09 00 00       	call   41cd <sleep>
    sleep(0);
    38a8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    38af:	e8 19 09 00 00       	call   41cd <sleep>
    kill(pid);
    38b4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    38b7:	89 04 24             	mov    %eax,(%esp)
    38ba:	e8 ae 08 00 00       	call   416d <kill>
    wait(&st);
    38bf:	8d 45 e8             	lea    -0x18(%ebp),%eax
    38c2:	89 04 24             	mov    %eax,(%esp)
    38c5:	e8 7b 08 00 00       	call   4145 <wait>

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
    38ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
    38cd:	89 44 24 04          	mov    %eax,0x4(%esp)
    38d1:	c7 04 24 32 5b 00 00 	movl   $0x5b32,(%esp)
    38d8:	e8 c0 08 00 00       	call   419d <link>
    38dd:	83 f8 ff             	cmp    $0xffffffff,%eax
    38e0:	74 21                	je     3903 <validatetest+0xba>
      printf(stdout, "link should not succeed\n");
    38e2:	a1 f4 63 00 00       	mov    0x63f4,%eax
    38e7:	c7 44 24 04 3d 5b 00 	movl   $0x5b3d,0x4(%esp)
    38ee:	00 
    38ef:	89 04 24             	mov    %eax,(%esp)
    38f2:	e8 d6 09 00 00       	call   42cd <printf>
      exit(1);
    38f7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    38fe:	e8 3a 08 00 00       	call   413d <exit>
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    3903:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
    390a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    390d:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3910:	0f 83 61 ff ff ff    	jae    3877 <validatetest+0x2e>
      printf(stdout, "link should not succeed\n");
      exit(1);
    }
  }

  printf(stdout, "validate ok\n");
    3916:	a1 f4 63 00 00       	mov    0x63f4,%eax
    391b:	c7 44 24 04 56 5b 00 	movl   $0x5b56,0x4(%esp)
    3922:	00 
    3923:	89 04 24             	mov    %eax,(%esp)
    3926:	e8 a2 09 00 00       	call   42cd <printf>
}
    392b:	c9                   	leave  
    392c:	c3                   	ret    

0000392d <bsstest>:

// does unintialized data start out zero?
char uninit[10000];
void
bsstest(void)
{
    392d:	55                   	push   %ebp
    392e:	89 e5                	mov    %esp,%ebp
    3930:	83 ec 28             	sub    $0x28,%esp
  int i;

  printf(stdout, "bss test\n");
    3933:	a1 f4 63 00 00       	mov    0x63f4,%eax
    3938:	c7 44 24 04 63 5b 00 	movl   $0x5b63,0x4(%esp)
    393f:	00 
    3940:	89 04 24             	mov    %eax,(%esp)
    3943:	e8 85 09 00 00       	call   42cd <printf>
  for(i = 0; i < sizeof(uninit); i++){
    3948:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    394f:	eb 34                	jmp    3985 <bsstest+0x58>
    if(uninit[i] != '\0'){
    3951:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3954:	05 c0 64 00 00       	add    $0x64c0,%eax
    3959:	0f b6 00             	movzbl (%eax),%eax
    395c:	84 c0                	test   %al,%al
    395e:	74 21                	je     3981 <bsstest+0x54>
      printf(stdout, "bss test failed\n");
    3960:	a1 f4 63 00 00       	mov    0x63f4,%eax
    3965:	c7 44 24 04 6d 5b 00 	movl   $0x5b6d,0x4(%esp)
    396c:	00 
    396d:	89 04 24             	mov    %eax,(%esp)
    3970:	e8 58 09 00 00       	call   42cd <printf>
      exit(1);
    3975:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    397c:	e8 bc 07 00 00       	call   413d <exit>
bsstest(void)
{
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    3981:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3985:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3988:	3d 0f 27 00 00       	cmp    $0x270f,%eax
    398d:	76 c2                	jbe    3951 <bsstest+0x24>
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
      exit(1);
    }
  }
  printf(stdout, "bss test ok\n");
    398f:	a1 f4 63 00 00       	mov    0x63f4,%eax
    3994:	c7 44 24 04 7e 5b 00 	movl   $0x5b7e,0x4(%esp)
    399b:	00 
    399c:	89 04 24             	mov    %eax,(%esp)
    399f:	e8 29 09 00 00       	call   42cd <printf>
}
    39a4:	c9                   	leave  
    39a5:	c3                   	ret    

000039a6 <bigargtest>:
// does exec return an error if the arguments
// are larger than a page? or does it write
// below the stack and wreck the instructions/data?
void
bigargtest(void)
{
    39a6:	55                   	push   %ebp
    39a7:	89 e5                	mov    %esp,%ebp
    39a9:	83 ec 28             	sub    $0x28,%esp
  int pid, fd ,st;

  unlink("bigarg-ok");
    39ac:	c7 04 24 8b 5b 00 00 	movl   $0x5b8b,(%esp)
    39b3:	e8 d5 07 00 00       	call   418d <unlink>
  pid = fork();
    39b8:	e8 78 07 00 00       	call   4135 <fork>
    39bd:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(pid == 0){
    39c0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    39c4:	0f 85 97 00 00 00    	jne    3a61 <bigargtest+0xbb>
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    39ca:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    39d1:	eb 12                	jmp    39e5 <bigargtest+0x3f>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    39d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    39d6:	c7 04 85 20 64 00 00 	movl   $0x5b98,0x6420(,%eax,4)
    39dd:	98 5b 00 00 
  unlink("bigarg-ok");
  pid = fork();
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    39e1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    39e5:	83 7d f4 1e          	cmpl   $0x1e,-0xc(%ebp)
    39e9:	7e e8                	jle    39d3 <bigargtest+0x2d>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    39eb:	c7 05 9c 64 00 00 00 	movl   $0x0,0x649c
    39f2:	00 00 00 
    printf(stdout, "bigarg test\n");
    39f5:	a1 f4 63 00 00       	mov    0x63f4,%eax
    39fa:	c7 44 24 04 75 5c 00 	movl   $0x5c75,0x4(%esp)
    3a01:	00 
    3a02:	89 04 24             	mov    %eax,(%esp)
    3a05:	e8 c3 08 00 00       	call   42cd <printf>
    exec("echo", args);
    3a0a:	c7 44 24 04 20 64 00 	movl   $0x6420,0x4(%esp)
    3a11:	00 
    3a12:	c7 04 24 9c 46 00 00 	movl   $0x469c,(%esp)
    3a19:	e8 57 07 00 00       	call   4175 <exec>
    printf(stdout, "bigarg test ok\n");
    3a1e:	a1 f4 63 00 00       	mov    0x63f4,%eax
    3a23:	c7 44 24 04 82 5c 00 	movl   $0x5c82,0x4(%esp)
    3a2a:	00 
    3a2b:	89 04 24             	mov    %eax,(%esp)
    3a2e:	e8 9a 08 00 00       	call   42cd <printf>
    fd = open("bigarg-ok", O_CREATE);
    3a33:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    3a3a:	00 
    3a3b:	c7 04 24 8b 5b 00 00 	movl   $0x5b8b,(%esp)
    3a42:	e8 36 07 00 00       	call   417d <open>
    3a47:	89 45 ec             	mov    %eax,-0x14(%ebp)
    close(fd);
    3a4a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3a4d:	89 04 24             	mov    %eax,(%esp)
    3a50:	e8 10 07 00 00       	call   4165 <close>
    exit(1);
    3a55:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3a5c:	e8 dc 06 00 00       	call   413d <exit>
  } else if(pid < 0){
    3a61:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3a65:	79 21                	jns    3a88 <bigargtest+0xe2>
    printf(stdout, "bigargtest: fork failed\n");
    3a67:	a1 f4 63 00 00       	mov    0x63f4,%eax
    3a6c:	c7 44 24 04 92 5c 00 	movl   $0x5c92,0x4(%esp)
    3a73:	00 
    3a74:	89 04 24             	mov    %eax,(%esp)
    3a77:	e8 51 08 00 00       	call   42cd <printf>
    exit(1);
    3a7c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3a83:	e8 b5 06 00 00       	call   413d <exit>
  }
  wait(&st);
    3a88:	8d 45 e8             	lea    -0x18(%ebp),%eax
    3a8b:	89 04 24             	mov    %eax,(%esp)
    3a8e:	e8 b2 06 00 00       	call   4145 <wait>
  fd = open("bigarg-ok", 0);
    3a93:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3a9a:	00 
    3a9b:	c7 04 24 8b 5b 00 00 	movl   $0x5b8b,(%esp)
    3aa2:	e8 d6 06 00 00       	call   417d <open>
    3aa7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
    3aaa:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3aae:	79 21                	jns    3ad1 <bigargtest+0x12b>
    printf(stdout, "bigarg test failed!\n");
    3ab0:	a1 f4 63 00 00       	mov    0x63f4,%eax
    3ab5:	c7 44 24 04 ab 5c 00 	movl   $0x5cab,0x4(%esp)
    3abc:	00 
    3abd:	89 04 24             	mov    %eax,(%esp)
    3ac0:	e8 08 08 00 00       	call   42cd <printf>
    exit(1);
    3ac5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3acc:	e8 6c 06 00 00       	call   413d <exit>
  }
  close(fd);
    3ad1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3ad4:	89 04 24             	mov    %eax,(%esp)
    3ad7:	e8 89 06 00 00       	call   4165 <close>
  unlink("bigarg-ok");
    3adc:	c7 04 24 8b 5b 00 00 	movl   $0x5b8b,(%esp)
    3ae3:	e8 a5 06 00 00       	call   418d <unlink>
}
    3ae8:	c9                   	leave  
    3ae9:	c3                   	ret    

00003aea <fsfull>:

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    3aea:	55                   	push   %ebp
    3aeb:	89 e5                	mov    %esp,%ebp
    3aed:	53                   	push   %ebx
    3aee:	83 ec 74             	sub    $0x74,%esp
  int nfiles;
  int fsblocks = 0;
    3af1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)

  printf(1, "fsfull test\n");
    3af8:	c7 44 24 04 c0 5c 00 	movl   $0x5cc0,0x4(%esp)
    3aff:	00 
    3b00:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3b07:	e8 c1 07 00 00       	call   42cd <printf>

  for(nfiles = 0; ; nfiles++){
    3b0c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    char name[64];
    name[0] = 'f';
    3b13:	c6 45 a4 66          	movb   $0x66,-0x5c(%ebp)
    name[1] = '0' + nfiles / 1000;
    3b17:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3b1a:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    3b1f:	89 c8                	mov    %ecx,%eax
    3b21:	f7 ea                	imul   %edx
    3b23:	c1 fa 06             	sar    $0x6,%edx
    3b26:	89 c8                	mov    %ecx,%eax
    3b28:	c1 f8 1f             	sar    $0x1f,%eax
    3b2b:	29 c2                	sub    %eax,%edx
    3b2d:	89 d0                	mov    %edx,%eax
    3b2f:	83 c0 30             	add    $0x30,%eax
    3b32:	88 45 a5             	mov    %al,-0x5b(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    3b35:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    3b38:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    3b3d:	89 d8                	mov    %ebx,%eax
    3b3f:	f7 ea                	imul   %edx
    3b41:	c1 fa 06             	sar    $0x6,%edx
    3b44:	89 d8                	mov    %ebx,%eax
    3b46:	c1 f8 1f             	sar    $0x1f,%eax
    3b49:	89 d1                	mov    %edx,%ecx
    3b4b:	29 c1                	sub    %eax,%ecx
    3b4d:	69 c1 e8 03 00 00    	imul   $0x3e8,%ecx,%eax
    3b53:	29 c3                	sub    %eax,%ebx
    3b55:	89 d9                	mov    %ebx,%ecx
    3b57:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    3b5c:	89 c8                	mov    %ecx,%eax
    3b5e:	f7 ea                	imul   %edx
    3b60:	c1 fa 05             	sar    $0x5,%edx
    3b63:	89 c8                	mov    %ecx,%eax
    3b65:	c1 f8 1f             	sar    $0x1f,%eax
    3b68:	29 c2                	sub    %eax,%edx
    3b6a:	89 d0                	mov    %edx,%eax
    3b6c:	83 c0 30             	add    $0x30,%eax
    3b6f:	88 45 a6             	mov    %al,-0x5a(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    3b72:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    3b75:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    3b7a:	89 d8                	mov    %ebx,%eax
    3b7c:	f7 ea                	imul   %edx
    3b7e:	c1 fa 05             	sar    $0x5,%edx
    3b81:	89 d8                	mov    %ebx,%eax
    3b83:	c1 f8 1f             	sar    $0x1f,%eax
    3b86:	89 d1                	mov    %edx,%ecx
    3b88:	29 c1                	sub    %eax,%ecx
    3b8a:	6b c1 64             	imul   $0x64,%ecx,%eax
    3b8d:	29 c3                	sub    %eax,%ebx
    3b8f:	89 d9                	mov    %ebx,%ecx
    3b91:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3b96:	89 c8                	mov    %ecx,%eax
    3b98:	f7 ea                	imul   %edx
    3b9a:	c1 fa 02             	sar    $0x2,%edx
    3b9d:	89 c8                	mov    %ecx,%eax
    3b9f:	c1 f8 1f             	sar    $0x1f,%eax
    3ba2:	29 c2                	sub    %eax,%edx
    3ba4:	89 d0                	mov    %edx,%eax
    3ba6:	83 c0 30             	add    $0x30,%eax
    3ba9:	88 45 a7             	mov    %al,-0x59(%ebp)
    name[4] = '0' + (nfiles % 10);
    3bac:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3baf:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3bb4:	89 c8                	mov    %ecx,%eax
    3bb6:	f7 ea                	imul   %edx
    3bb8:	c1 fa 02             	sar    $0x2,%edx
    3bbb:	89 c8                	mov    %ecx,%eax
    3bbd:	c1 f8 1f             	sar    $0x1f,%eax
    3bc0:	29 c2                	sub    %eax,%edx
    3bc2:	89 d0                	mov    %edx,%eax
    3bc4:	c1 e0 02             	shl    $0x2,%eax
    3bc7:	01 d0                	add    %edx,%eax
    3bc9:	01 c0                	add    %eax,%eax
    3bcb:	29 c1                	sub    %eax,%ecx
    3bcd:	89 ca                	mov    %ecx,%edx
    3bcf:	89 d0                	mov    %edx,%eax
    3bd1:	83 c0 30             	add    $0x30,%eax
    3bd4:	88 45 a8             	mov    %al,-0x58(%ebp)
    name[5] = '\0';
    3bd7:	c6 45 a9 00          	movb   $0x0,-0x57(%ebp)
    printf(1, "writing %s\n", name);
    3bdb:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3bde:	89 44 24 08          	mov    %eax,0x8(%esp)
    3be2:	c7 44 24 04 cd 5c 00 	movl   $0x5ccd,0x4(%esp)
    3be9:	00 
    3bea:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3bf1:	e8 d7 06 00 00       	call   42cd <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    3bf6:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    3bfd:	00 
    3bfe:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3c01:	89 04 24             	mov    %eax,(%esp)
    3c04:	e8 74 05 00 00       	call   417d <open>
    3c09:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(fd < 0){
    3c0c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    3c10:	79 1d                	jns    3c2f <fsfull+0x145>
      printf(1, "open %s failed\n", name);
    3c12:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3c15:	89 44 24 08          	mov    %eax,0x8(%esp)
    3c19:	c7 44 24 04 d9 5c 00 	movl   $0x5cd9,0x4(%esp)
    3c20:	00 
    3c21:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3c28:	e8 a0 06 00 00       	call   42cd <printf>
      break;
    3c2d:	eb 74                	jmp    3ca3 <fsfull+0x1b9>
    }
    int total = 0;
    3c2f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    while(1){
      int cc = write(fd, buf, 512);
    3c36:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    3c3d:	00 
    3c3e:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
    3c45:	00 
    3c46:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3c49:	89 04 24             	mov    %eax,(%esp)
    3c4c:	e8 0c 05 00 00       	call   415d <write>
    3c51:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if(cc < 512)
    3c54:	81 7d e4 ff 01 00 00 	cmpl   $0x1ff,-0x1c(%ebp)
    3c5b:	7f 2f                	jg     3c8c <fsfull+0x1a2>
        break;
    3c5d:	90                   	nop
      total += cc;
      fsblocks++;
    }
    printf(1, "wrote %d bytes\n", total);
    3c5e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3c61:	89 44 24 08          	mov    %eax,0x8(%esp)
    3c65:	c7 44 24 04 e9 5c 00 	movl   $0x5ce9,0x4(%esp)
    3c6c:	00 
    3c6d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3c74:	e8 54 06 00 00       	call   42cd <printf>
    close(fd);
    3c79:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3c7c:	89 04 24             	mov    %eax,(%esp)
    3c7f:	e8 e1 04 00 00       	call   4165 <close>
    if(total == 0)
    3c84:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3c88:	75 10                	jne    3c9a <fsfull+0x1b0>
    3c8a:	eb 0c                	jmp    3c98 <fsfull+0x1ae>
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
      if(cc < 512)
        break;
      total += cc;
    3c8c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3c8f:	01 45 ec             	add    %eax,-0x14(%ebp)
      fsblocks++;
    3c92:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    }
    3c96:	eb 9e                	jmp    3c36 <fsfull+0x14c>
    printf(1, "wrote %d bytes\n", total);
    close(fd);
    if(total == 0)
      break;
    3c98:	eb 09                	jmp    3ca3 <fsfull+0x1b9>
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    3c9a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    }
    printf(1, "wrote %d bytes\n", total);
    close(fd);
    if(total == 0)
      break;
  }
    3c9e:	e9 70 fe ff ff       	jmp    3b13 <fsfull+0x29>

  while(nfiles >= 0){
    3ca3:	e9 d7 00 00 00       	jmp    3d7f <fsfull+0x295>
    char name[64];
    name[0] = 'f';
    3ca8:	c6 45 a4 66          	movb   $0x66,-0x5c(%ebp)
    name[1] = '0' + nfiles / 1000;
    3cac:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3caf:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    3cb4:	89 c8                	mov    %ecx,%eax
    3cb6:	f7 ea                	imul   %edx
    3cb8:	c1 fa 06             	sar    $0x6,%edx
    3cbb:	89 c8                	mov    %ecx,%eax
    3cbd:	c1 f8 1f             	sar    $0x1f,%eax
    3cc0:	29 c2                	sub    %eax,%edx
    3cc2:	89 d0                	mov    %edx,%eax
    3cc4:	83 c0 30             	add    $0x30,%eax
    3cc7:	88 45 a5             	mov    %al,-0x5b(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    3cca:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    3ccd:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    3cd2:	89 d8                	mov    %ebx,%eax
    3cd4:	f7 ea                	imul   %edx
    3cd6:	c1 fa 06             	sar    $0x6,%edx
    3cd9:	89 d8                	mov    %ebx,%eax
    3cdb:	c1 f8 1f             	sar    $0x1f,%eax
    3cde:	89 d1                	mov    %edx,%ecx
    3ce0:	29 c1                	sub    %eax,%ecx
    3ce2:	69 c1 e8 03 00 00    	imul   $0x3e8,%ecx,%eax
    3ce8:	29 c3                	sub    %eax,%ebx
    3cea:	89 d9                	mov    %ebx,%ecx
    3cec:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    3cf1:	89 c8                	mov    %ecx,%eax
    3cf3:	f7 ea                	imul   %edx
    3cf5:	c1 fa 05             	sar    $0x5,%edx
    3cf8:	89 c8                	mov    %ecx,%eax
    3cfa:	c1 f8 1f             	sar    $0x1f,%eax
    3cfd:	29 c2                	sub    %eax,%edx
    3cff:	89 d0                	mov    %edx,%eax
    3d01:	83 c0 30             	add    $0x30,%eax
    3d04:	88 45 a6             	mov    %al,-0x5a(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    3d07:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    3d0a:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    3d0f:	89 d8                	mov    %ebx,%eax
    3d11:	f7 ea                	imul   %edx
    3d13:	c1 fa 05             	sar    $0x5,%edx
    3d16:	89 d8                	mov    %ebx,%eax
    3d18:	c1 f8 1f             	sar    $0x1f,%eax
    3d1b:	89 d1                	mov    %edx,%ecx
    3d1d:	29 c1                	sub    %eax,%ecx
    3d1f:	6b c1 64             	imul   $0x64,%ecx,%eax
    3d22:	29 c3                	sub    %eax,%ebx
    3d24:	89 d9                	mov    %ebx,%ecx
    3d26:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3d2b:	89 c8                	mov    %ecx,%eax
    3d2d:	f7 ea                	imul   %edx
    3d2f:	c1 fa 02             	sar    $0x2,%edx
    3d32:	89 c8                	mov    %ecx,%eax
    3d34:	c1 f8 1f             	sar    $0x1f,%eax
    3d37:	29 c2                	sub    %eax,%edx
    3d39:	89 d0                	mov    %edx,%eax
    3d3b:	83 c0 30             	add    $0x30,%eax
    3d3e:	88 45 a7             	mov    %al,-0x59(%ebp)
    name[4] = '0' + (nfiles % 10);
    3d41:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3d44:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3d49:	89 c8                	mov    %ecx,%eax
    3d4b:	f7 ea                	imul   %edx
    3d4d:	c1 fa 02             	sar    $0x2,%edx
    3d50:	89 c8                	mov    %ecx,%eax
    3d52:	c1 f8 1f             	sar    $0x1f,%eax
    3d55:	29 c2                	sub    %eax,%edx
    3d57:	89 d0                	mov    %edx,%eax
    3d59:	c1 e0 02             	shl    $0x2,%eax
    3d5c:	01 d0                	add    %edx,%eax
    3d5e:	01 c0                	add    %eax,%eax
    3d60:	29 c1                	sub    %eax,%ecx
    3d62:	89 ca                	mov    %ecx,%edx
    3d64:	89 d0                	mov    %edx,%eax
    3d66:	83 c0 30             	add    $0x30,%eax
    3d69:	88 45 a8             	mov    %al,-0x58(%ebp)
    name[5] = '\0';
    3d6c:	c6 45 a9 00          	movb   $0x0,-0x57(%ebp)
    unlink(name);
    3d70:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3d73:	89 04 24             	mov    %eax,(%esp)
    3d76:	e8 12 04 00 00       	call   418d <unlink>
    nfiles--;
    3d7b:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    close(fd);
    if(total == 0)
      break;
  }

  while(nfiles >= 0){
    3d7f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3d83:	0f 89 1f ff ff ff    	jns    3ca8 <fsfull+0x1be>
    name[5] = '\0';
    unlink(name);
    nfiles--;
  }

  printf(1, "fsfull test finished\n");
    3d89:	c7 44 24 04 f9 5c 00 	movl   $0x5cf9,0x4(%esp)
    3d90:	00 
    3d91:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3d98:	e8 30 05 00 00       	call   42cd <printf>
}
    3d9d:	83 c4 74             	add    $0x74,%esp
    3da0:	5b                   	pop    %ebx
    3da1:	5d                   	pop    %ebp
    3da2:	c3                   	ret    

00003da3 <rand>:

unsigned long randstate = 1;
unsigned int
rand()
{
    3da3:	55                   	push   %ebp
    3da4:	89 e5                	mov    %esp,%ebp
  randstate = randstate * 1664525 + 1013904223;
    3da6:	a1 f8 63 00 00       	mov    0x63f8,%eax
    3dab:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
    3db1:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    3db6:	a3 f8 63 00 00       	mov    %eax,0x63f8
  return randstate;
    3dbb:	a1 f8 63 00 00       	mov    0x63f8,%eax
}
    3dc0:	5d                   	pop    %ebp
    3dc1:	c3                   	ret    

00003dc2 <main>:

int
main(int argc, char *argv[])
{
    3dc2:	55                   	push   %ebp
    3dc3:	89 e5                	mov    %esp,%ebp
    3dc5:	83 e4 f0             	and    $0xfffffff0,%esp
    3dc8:	83 ec 10             	sub    $0x10,%esp
  printf(1, "usertests starting\n");
    3dcb:	c7 44 24 04 0f 5d 00 	movl   $0x5d0f,0x4(%esp)
    3dd2:	00 
    3dd3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3dda:	e8 ee 04 00 00       	call   42cd <printf>

  if(open("usertests.ran", 0) >= 0){
    3ddf:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3de6:	00 
    3de7:	c7 04 24 23 5d 00 00 	movl   $0x5d23,(%esp)
    3dee:	e8 8a 03 00 00       	call   417d <open>
    3df3:	85 c0                	test   %eax,%eax
    3df5:	78 20                	js     3e17 <main+0x55>
    printf(1, "already ran user tests -- rebuild fs.img\n");
    3df7:	c7 44 24 04 34 5d 00 	movl   $0x5d34,0x4(%esp)
    3dfe:	00 
    3dff:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3e06:	e8 c2 04 00 00       	call   42cd <printf>
    exit(1);
    3e0b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3e12:	e8 26 03 00 00       	call   413d <exit>
  }
  close(open("usertests.ran", O_CREATE));
    3e17:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    3e1e:	00 
    3e1f:	c7 04 24 23 5d 00 00 	movl   $0x5d23,(%esp)
    3e26:	e8 52 03 00 00       	call   417d <open>
    3e2b:	89 04 24             	mov    %eax,(%esp)
    3e2e:	e8 32 03 00 00       	call   4165 <close>

  bigargtest();
    3e33:	e8 6e fb ff ff       	call   39a6 <bigargtest>
  bigwrite();
    3e38:	e8 28 e9 ff ff       	call   2765 <bigwrite>
  bigargtest();
    3e3d:	e8 64 fb ff ff       	call   39a6 <bigargtest>
  bsstest();
    3e42:	e8 e6 fa ff ff       	call   392d <bsstest>
  sbrktest();
    3e47:	e8 74 f4 ff ff       	call   32c0 <sbrktest>
  validatetest();
    3e4c:	e8 f8 f9 ff ff       	call   3849 <validatetest>

  opentest();
    3e51:	e8 aa c1 ff ff       	call   0 <opentest>
  writetest();
    3e56:	e8 5e c2 ff ff       	call   b9 <writetest>
  writetest1();
    3e5b:	e8 98 c4 ff ff       	call   2f8 <writetest1>
  createtest();
    3e60:	e8 cf c6 ff ff       	call   534 <createtest>

  mem();
    3e65:	e8 dd cc ff ff       	call   b47 <mem>
  pipe1();
    3e6a:	e8 c9 c8 ff ff       	call   738 <pipe1>
  preempt();
    3e6f:	e8 da ca ff ff       	call   94e <preempt>
  exitwait();
    3e74:	e8 43 cc ff ff       	call   abc <exitwait>

  rmdot();
    3e79:	e8 dc ed ff ff       	call   2c5a <rmdot>
  fourteen();
    3e7e:	e8 57 ec ff ff       	call   2ada <fourteen>
  bigfile();
    3e83:	e8 f3 e9 ff ff       	call   287b <bigfile>
  subdir();
    3e88:	e8 8f e0 ff ff       	call   1f1c <subdir>
  concreate();
    3e8d:	e8 d2 d9 ff ff       	call   1864 <concreate>
  linkunlink();
    3e92:	e8 c1 dd ff ff       	call   1c58 <linkunlink>
  linktest();
    3e97:	e8 40 d7 ff ff       	call   15dc <linktest>
  unlinkread();
    3e9c:	e8 3c d5 ff ff       	call   13dd <unlinkread>
  createdelete();
    3ea1:	e8 48 d2 ff ff       	call   10ee <createdelete>
  twofiles();
    3ea6:	e8 a7 cf ff ff       	call   e52 <twofiles>
  sharedfd();
    3eab:	e8 90 cd ff ff       	call   c40 <sharedfd>
  dirfile();
    3eb0:	e8 55 ef ff ff       	call   2e0a <dirfile>
  iref();
    3eb5:	e8 d8 f1 ff ff       	call   3092 <iref>
  forktest();
    3eba:	e8 05 f3 ff ff       	call   31c4 <forktest>
  bigdir(); // slow
    3ebf:	e8 d6 de ff ff       	call   1d9a <bigdir>

  exectest();
    3ec4:	e8 19 c8 ff ff       	call   6e2 <exectest>

  exit(1);
    3ec9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3ed0:	e8 68 02 00 00       	call   413d <exit>

00003ed5 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    3ed5:	55                   	push   %ebp
    3ed6:	89 e5                	mov    %esp,%ebp
    3ed8:	57                   	push   %edi
    3ed9:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    3eda:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3edd:	8b 55 10             	mov    0x10(%ebp),%edx
    3ee0:	8b 45 0c             	mov    0xc(%ebp),%eax
    3ee3:	89 cb                	mov    %ecx,%ebx
    3ee5:	89 df                	mov    %ebx,%edi
    3ee7:	89 d1                	mov    %edx,%ecx
    3ee9:	fc                   	cld    
    3eea:	f3 aa                	rep stos %al,%es:(%edi)
    3eec:	89 ca                	mov    %ecx,%edx
    3eee:	89 fb                	mov    %edi,%ebx
    3ef0:	89 5d 08             	mov    %ebx,0x8(%ebp)
    3ef3:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    3ef6:	5b                   	pop    %ebx
    3ef7:	5f                   	pop    %edi
    3ef8:	5d                   	pop    %ebp
    3ef9:	c3                   	ret    

00003efa <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    3efa:	55                   	push   %ebp
    3efb:	89 e5                	mov    %esp,%ebp
    3efd:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    3f00:	8b 45 08             	mov    0x8(%ebp),%eax
    3f03:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    3f06:	90                   	nop
    3f07:	8b 45 08             	mov    0x8(%ebp),%eax
    3f0a:	8d 50 01             	lea    0x1(%eax),%edx
    3f0d:	89 55 08             	mov    %edx,0x8(%ebp)
    3f10:	8b 55 0c             	mov    0xc(%ebp),%edx
    3f13:	8d 4a 01             	lea    0x1(%edx),%ecx
    3f16:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    3f19:	0f b6 12             	movzbl (%edx),%edx
    3f1c:	88 10                	mov    %dl,(%eax)
    3f1e:	0f b6 00             	movzbl (%eax),%eax
    3f21:	84 c0                	test   %al,%al
    3f23:	75 e2                	jne    3f07 <strcpy+0xd>
    ;
  return os;
    3f25:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3f28:	c9                   	leave  
    3f29:	c3                   	ret    

00003f2a <strcmp>:

int
strcmp(const char *p, const char *q)
{
    3f2a:	55                   	push   %ebp
    3f2b:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    3f2d:	eb 08                	jmp    3f37 <strcmp+0xd>
    p++, q++;
    3f2f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    3f33:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3f37:	8b 45 08             	mov    0x8(%ebp),%eax
    3f3a:	0f b6 00             	movzbl (%eax),%eax
    3f3d:	84 c0                	test   %al,%al
    3f3f:	74 10                	je     3f51 <strcmp+0x27>
    3f41:	8b 45 08             	mov    0x8(%ebp),%eax
    3f44:	0f b6 10             	movzbl (%eax),%edx
    3f47:	8b 45 0c             	mov    0xc(%ebp),%eax
    3f4a:	0f b6 00             	movzbl (%eax),%eax
    3f4d:	38 c2                	cmp    %al,%dl
    3f4f:	74 de                	je     3f2f <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3f51:	8b 45 08             	mov    0x8(%ebp),%eax
    3f54:	0f b6 00             	movzbl (%eax),%eax
    3f57:	0f b6 d0             	movzbl %al,%edx
    3f5a:	8b 45 0c             	mov    0xc(%ebp),%eax
    3f5d:	0f b6 00             	movzbl (%eax),%eax
    3f60:	0f b6 c0             	movzbl %al,%eax
    3f63:	29 c2                	sub    %eax,%edx
    3f65:	89 d0                	mov    %edx,%eax
}
    3f67:	5d                   	pop    %ebp
    3f68:	c3                   	ret    

00003f69 <strlen>:

uint
strlen(char *s)
{
    3f69:	55                   	push   %ebp
    3f6a:	89 e5                	mov    %esp,%ebp
    3f6c:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    3f6f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    3f76:	eb 04                	jmp    3f7c <strlen+0x13>
    3f78:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    3f7c:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3f7f:	8b 45 08             	mov    0x8(%ebp),%eax
    3f82:	01 d0                	add    %edx,%eax
    3f84:	0f b6 00             	movzbl (%eax),%eax
    3f87:	84 c0                	test   %al,%al
    3f89:	75 ed                	jne    3f78 <strlen+0xf>
    ;
  return n;
    3f8b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3f8e:	c9                   	leave  
    3f8f:	c3                   	ret    

00003f90 <memset>:

void*
memset(void *dst, int c, uint n)
{
    3f90:	55                   	push   %ebp
    3f91:	89 e5                	mov    %esp,%ebp
    3f93:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    3f96:	8b 45 10             	mov    0x10(%ebp),%eax
    3f99:	89 44 24 08          	mov    %eax,0x8(%esp)
    3f9d:	8b 45 0c             	mov    0xc(%ebp),%eax
    3fa0:	89 44 24 04          	mov    %eax,0x4(%esp)
    3fa4:	8b 45 08             	mov    0x8(%ebp),%eax
    3fa7:	89 04 24             	mov    %eax,(%esp)
    3faa:	e8 26 ff ff ff       	call   3ed5 <stosb>
  return dst;
    3faf:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3fb2:	c9                   	leave  
    3fb3:	c3                   	ret    

00003fb4 <strchr>:

char*
strchr(const char *s, char c)
{
    3fb4:	55                   	push   %ebp
    3fb5:	89 e5                	mov    %esp,%ebp
    3fb7:	83 ec 04             	sub    $0x4,%esp
    3fba:	8b 45 0c             	mov    0xc(%ebp),%eax
    3fbd:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    3fc0:	eb 14                	jmp    3fd6 <strchr+0x22>
    if(*s == c)
    3fc2:	8b 45 08             	mov    0x8(%ebp),%eax
    3fc5:	0f b6 00             	movzbl (%eax),%eax
    3fc8:	3a 45 fc             	cmp    -0x4(%ebp),%al
    3fcb:	75 05                	jne    3fd2 <strchr+0x1e>
      return (char*)s;
    3fcd:	8b 45 08             	mov    0x8(%ebp),%eax
    3fd0:	eb 13                	jmp    3fe5 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    3fd2:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    3fd6:	8b 45 08             	mov    0x8(%ebp),%eax
    3fd9:	0f b6 00             	movzbl (%eax),%eax
    3fdc:	84 c0                	test   %al,%al
    3fde:	75 e2                	jne    3fc2 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    3fe0:	b8 00 00 00 00       	mov    $0x0,%eax
}
    3fe5:	c9                   	leave  
    3fe6:	c3                   	ret    

00003fe7 <gets>:

char*
gets(char *buf, int max)
{
    3fe7:	55                   	push   %ebp
    3fe8:	89 e5                	mov    %esp,%ebp
    3fea:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3fed:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3ff4:	eb 4c                	jmp    4042 <gets+0x5b>
    cc = read(0, &c, 1);
    3ff6:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3ffd:	00 
    3ffe:	8d 45 ef             	lea    -0x11(%ebp),%eax
    4001:	89 44 24 04          	mov    %eax,0x4(%esp)
    4005:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    400c:	e8 44 01 00 00       	call   4155 <read>
    4011:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    4014:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4018:	7f 02                	jg     401c <gets+0x35>
      break;
    401a:	eb 31                	jmp    404d <gets+0x66>
    buf[i++] = c;
    401c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    401f:	8d 50 01             	lea    0x1(%eax),%edx
    4022:	89 55 f4             	mov    %edx,-0xc(%ebp)
    4025:	89 c2                	mov    %eax,%edx
    4027:	8b 45 08             	mov    0x8(%ebp),%eax
    402a:	01 c2                	add    %eax,%edx
    402c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    4030:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    4032:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    4036:	3c 0a                	cmp    $0xa,%al
    4038:	74 13                	je     404d <gets+0x66>
    403a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    403e:	3c 0d                	cmp    $0xd,%al
    4040:	74 0b                	je     404d <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    4042:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4045:	83 c0 01             	add    $0x1,%eax
    4048:	3b 45 0c             	cmp    0xc(%ebp),%eax
    404b:	7c a9                	jl     3ff6 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    404d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    4050:	8b 45 08             	mov    0x8(%ebp),%eax
    4053:	01 d0                	add    %edx,%eax
    4055:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    4058:	8b 45 08             	mov    0x8(%ebp),%eax
}
    405b:	c9                   	leave  
    405c:	c3                   	ret    

0000405d <stat>:

int
stat(char *n, struct stat *st)
{
    405d:	55                   	push   %ebp
    405e:	89 e5                	mov    %esp,%ebp
    4060:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    4063:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    406a:	00 
    406b:	8b 45 08             	mov    0x8(%ebp),%eax
    406e:	89 04 24             	mov    %eax,(%esp)
    4071:	e8 07 01 00 00       	call   417d <open>
    4076:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    4079:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    407d:	79 07                	jns    4086 <stat+0x29>
    return -1;
    407f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4084:	eb 23                	jmp    40a9 <stat+0x4c>
  r = fstat(fd, st);
    4086:	8b 45 0c             	mov    0xc(%ebp),%eax
    4089:	89 44 24 04          	mov    %eax,0x4(%esp)
    408d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4090:	89 04 24             	mov    %eax,(%esp)
    4093:	e8 fd 00 00 00       	call   4195 <fstat>
    4098:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    409b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    409e:	89 04 24             	mov    %eax,(%esp)
    40a1:	e8 bf 00 00 00       	call   4165 <close>
  return r;
    40a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    40a9:	c9                   	leave  
    40aa:	c3                   	ret    

000040ab <atoi>:

int
atoi(const char *s)
{
    40ab:	55                   	push   %ebp
    40ac:	89 e5                	mov    %esp,%ebp
    40ae:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    40b1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    40b8:	eb 25                	jmp    40df <atoi+0x34>
    n = n*10 + *s++ - '0';
    40ba:	8b 55 fc             	mov    -0x4(%ebp),%edx
    40bd:	89 d0                	mov    %edx,%eax
    40bf:	c1 e0 02             	shl    $0x2,%eax
    40c2:	01 d0                	add    %edx,%eax
    40c4:	01 c0                	add    %eax,%eax
    40c6:	89 c1                	mov    %eax,%ecx
    40c8:	8b 45 08             	mov    0x8(%ebp),%eax
    40cb:	8d 50 01             	lea    0x1(%eax),%edx
    40ce:	89 55 08             	mov    %edx,0x8(%ebp)
    40d1:	0f b6 00             	movzbl (%eax),%eax
    40d4:	0f be c0             	movsbl %al,%eax
    40d7:	01 c8                	add    %ecx,%eax
    40d9:	83 e8 30             	sub    $0x30,%eax
    40dc:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    40df:	8b 45 08             	mov    0x8(%ebp),%eax
    40e2:	0f b6 00             	movzbl (%eax),%eax
    40e5:	3c 2f                	cmp    $0x2f,%al
    40e7:	7e 0a                	jle    40f3 <atoi+0x48>
    40e9:	8b 45 08             	mov    0x8(%ebp),%eax
    40ec:	0f b6 00             	movzbl (%eax),%eax
    40ef:	3c 39                	cmp    $0x39,%al
    40f1:	7e c7                	jle    40ba <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    40f3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    40f6:	c9                   	leave  
    40f7:	c3                   	ret    

000040f8 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    40f8:	55                   	push   %ebp
    40f9:	89 e5                	mov    %esp,%ebp
    40fb:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    40fe:	8b 45 08             	mov    0x8(%ebp),%eax
    4101:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    4104:	8b 45 0c             	mov    0xc(%ebp),%eax
    4107:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    410a:	eb 17                	jmp    4123 <memmove+0x2b>
    *dst++ = *src++;
    410c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    410f:	8d 50 01             	lea    0x1(%eax),%edx
    4112:	89 55 fc             	mov    %edx,-0x4(%ebp)
    4115:	8b 55 f8             	mov    -0x8(%ebp),%edx
    4118:	8d 4a 01             	lea    0x1(%edx),%ecx
    411b:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    411e:	0f b6 12             	movzbl (%edx),%edx
    4121:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    4123:	8b 45 10             	mov    0x10(%ebp),%eax
    4126:	8d 50 ff             	lea    -0x1(%eax),%edx
    4129:	89 55 10             	mov    %edx,0x10(%ebp)
    412c:	85 c0                	test   %eax,%eax
    412e:	7f dc                	jg     410c <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    4130:	8b 45 08             	mov    0x8(%ebp),%eax
}
    4133:	c9                   	leave  
    4134:	c3                   	ret    

00004135 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    4135:	b8 01 00 00 00       	mov    $0x1,%eax
    413a:	cd 40                	int    $0x40
    413c:	c3                   	ret    

0000413d <exit>:
SYSCALL(exit)
    413d:	b8 02 00 00 00       	mov    $0x2,%eax
    4142:	cd 40                	int    $0x40
    4144:	c3                   	ret    

00004145 <wait>:
SYSCALL(wait)
    4145:	b8 03 00 00 00       	mov    $0x3,%eax
    414a:	cd 40                	int    $0x40
    414c:	c3                   	ret    

0000414d <pipe>:
SYSCALL(pipe)
    414d:	b8 04 00 00 00       	mov    $0x4,%eax
    4152:	cd 40                	int    $0x40
    4154:	c3                   	ret    

00004155 <read>:
SYSCALL(read)
    4155:	b8 05 00 00 00       	mov    $0x5,%eax
    415a:	cd 40                	int    $0x40
    415c:	c3                   	ret    

0000415d <write>:
SYSCALL(write)
    415d:	b8 10 00 00 00       	mov    $0x10,%eax
    4162:	cd 40                	int    $0x40
    4164:	c3                   	ret    

00004165 <close>:
SYSCALL(close)
    4165:	b8 15 00 00 00       	mov    $0x15,%eax
    416a:	cd 40                	int    $0x40
    416c:	c3                   	ret    

0000416d <kill>:
SYSCALL(kill)
    416d:	b8 06 00 00 00       	mov    $0x6,%eax
    4172:	cd 40                	int    $0x40
    4174:	c3                   	ret    

00004175 <exec>:
SYSCALL(exec)
    4175:	b8 07 00 00 00       	mov    $0x7,%eax
    417a:	cd 40                	int    $0x40
    417c:	c3                   	ret    

0000417d <open>:
SYSCALL(open)
    417d:	b8 0f 00 00 00       	mov    $0xf,%eax
    4182:	cd 40                	int    $0x40
    4184:	c3                   	ret    

00004185 <mknod>:
SYSCALL(mknod)
    4185:	b8 11 00 00 00       	mov    $0x11,%eax
    418a:	cd 40                	int    $0x40
    418c:	c3                   	ret    

0000418d <unlink>:
SYSCALL(unlink)
    418d:	b8 12 00 00 00       	mov    $0x12,%eax
    4192:	cd 40                	int    $0x40
    4194:	c3                   	ret    

00004195 <fstat>:
SYSCALL(fstat)
    4195:	b8 08 00 00 00       	mov    $0x8,%eax
    419a:	cd 40                	int    $0x40
    419c:	c3                   	ret    

0000419d <link>:
SYSCALL(link)
    419d:	b8 13 00 00 00       	mov    $0x13,%eax
    41a2:	cd 40                	int    $0x40
    41a4:	c3                   	ret    

000041a5 <mkdir>:
SYSCALL(mkdir)
    41a5:	b8 14 00 00 00       	mov    $0x14,%eax
    41aa:	cd 40                	int    $0x40
    41ac:	c3                   	ret    

000041ad <chdir>:
SYSCALL(chdir)
    41ad:	b8 09 00 00 00       	mov    $0x9,%eax
    41b2:	cd 40                	int    $0x40
    41b4:	c3                   	ret    

000041b5 <dup>:
SYSCALL(dup)
    41b5:	b8 0a 00 00 00       	mov    $0xa,%eax
    41ba:	cd 40                	int    $0x40
    41bc:	c3                   	ret    

000041bd <getpid>:
SYSCALL(getpid)
    41bd:	b8 0b 00 00 00       	mov    $0xb,%eax
    41c2:	cd 40                	int    $0x40
    41c4:	c3                   	ret    

000041c5 <sbrk>:
SYSCALL(sbrk)
    41c5:	b8 0c 00 00 00       	mov    $0xc,%eax
    41ca:	cd 40                	int    $0x40
    41cc:	c3                   	ret    

000041cd <sleep>:
SYSCALL(sleep)
    41cd:	b8 0d 00 00 00       	mov    $0xd,%eax
    41d2:	cd 40                	int    $0x40
    41d4:	c3                   	ret    

000041d5 <uptime>:
SYSCALL(uptime)
    41d5:	b8 0e 00 00 00       	mov    $0xe,%eax
    41da:	cd 40                	int    $0x40
    41dc:	c3                   	ret    

000041dd <waitpid>:
SYSCALL(waitpid)
    41dd:	b8 16 00 00 00       	mov    $0x16,%eax
    41e2:	cd 40                	int    $0x40
    41e4:	c3                   	ret    

000041e5 <setprio>:
SYSCALL(setprio)
    41e5:	b8 17 00 00 00       	mov    $0x17,%eax
    41ea:	cd 40                	int    $0x40
    41ec:	c3                   	ret    

000041ed <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    41ed:	55                   	push   %ebp
    41ee:	89 e5                	mov    %esp,%ebp
    41f0:	83 ec 18             	sub    $0x18,%esp
    41f3:	8b 45 0c             	mov    0xc(%ebp),%eax
    41f6:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    41f9:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    4200:	00 
    4201:	8d 45 f4             	lea    -0xc(%ebp),%eax
    4204:	89 44 24 04          	mov    %eax,0x4(%esp)
    4208:	8b 45 08             	mov    0x8(%ebp),%eax
    420b:	89 04 24             	mov    %eax,(%esp)
    420e:	e8 4a ff ff ff       	call   415d <write>
}
    4213:	c9                   	leave  
    4214:	c3                   	ret    

00004215 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    4215:	55                   	push   %ebp
    4216:	89 e5                	mov    %esp,%ebp
    4218:	56                   	push   %esi
    4219:	53                   	push   %ebx
    421a:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    421d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    4224:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    4228:	74 17                	je     4241 <printint+0x2c>
    422a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    422e:	79 11                	jns    4241 <printint+0x2c>
    neg = 1;
    4230:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    4237:	8b 45 0c             	mov    0xc(%ebp),%eax
    423a:	f7 d8                	neg    %eax
    423c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    423f:	eb 06                	jmp    4247 <printint+0x32>
  } else {
    x = xx;
    4241:	8b 45 0c             	mov    0xc(%ebp),%eax
    4244:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    4247:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    424e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    4251:	8d 41 01             	lea    0x1(%ecx),%eax
    4254:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4257:	8b 5d 10             	mov    0x10(%ebp),%ebx
    425a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    425d:	ba 00 00 00 00       	mov    $0x0,%edx
    4262:	f7 f3                	div    %ebx
    4264:	89 d0                	mov    %edx,%eax
    4266:	0f b6 80 fc 63 00 00 	movzbl 0x63fc(%eax),%eax
    426d:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    4271:	8b 75 10             	mov    0x10(%ebp),%esi
    4274:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4277:	ba 00 00 00 00       	mov    $0x0,%edx
    427c:	f7 f6                	div    %esi
    427e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    4281:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    4285:	75 c7                	jne    424e <printint+0x39>
  if(neg)
    4287:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    428b:	74 10                	je     429d <printint+0x88>
    buf[i++] = '-';
    428d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4290:	8d 50 01             	lea    0x1(%eax),%edx
    4293:	89 55 f4             	mov    %edx,-0xc(%ebp)
    4296:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    429b:	eb 1f                	jmp    42bc <printint+0xa7>
    429d:	eb 1d                	jmp    42bc <printint+0xa7>
    putc(fd, buf[i]);
    429f:	8d 55 dc             	lea    -0x24(%ebp),%edx
    42a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    42a5:	01 d0                	add    %edx,%eax
    42a7:	0f b6 00             	movzbl (%eax),%eax
    42aa:	0f be c0             	movsbl %al,%eax
    42ad:	89 44 24 04          	mov    %eax,0x4(%esp)
    42b1:	8b 45 08             	mov    0x8(%ebp),%eax
    42b4:	89 04 24             	mov    %eax,(%esp)
    42b7:	e8 31 ff ff ff       	call   41ed <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    42bc:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    42c0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    42c4:	79 d9                	jns    429f <printint+0x8a>
    putc(fd, buf[i]);
}
    42c6:	83 c4 30             	add    $0x30,%esp
    42c9:	5b                   	pop    %ebx
    42ca:	5e                   	pop    %esi
    42cb:	5d                   	pop    %ebp
    42cc:	c3                   	ret    

000042cd <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    42cd:	55                   	push   %ebp
    42ce:	89 e5                	mov    %esp,%ebp
    42d0:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    42d3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    42da:	8d 45 0c             	lea    0xc(%ebp),%eax
    42dd:	83 c0 04             	add    $0x4,%eax
    42e0:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    42e3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    42ea:	e9 7c 01 00 00       	jmp    446b <printf+0x19e>
    c = fmt[i] & 0xff;
    42ef:	8b 55 0c             	mov    0xc(%ebp),%edx
    42f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    42f5:	01 d0                	add    %edx,%eax
    42f7:	0f b6 00             	movzbl (%eax),%eax
    42fa:	0f be c0             	movsbl %al,%eax
    42fd:	25 ff 00 00 00       	and    $0xff,%eax
    4302:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    4305:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    4309:	75 2c                	jne    4337 <printf+0x6a>
      if(c == '%'){
    430b:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    430f:	75 0c                	jne    431d <printf+0x50>
        state = '%';
    4311:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    4318:	e9 4a 01 00 00       	jmp    4467 <printf+0x19a>
      } else {
        putc(fd, c);
    431d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4320:	0f be c0             	movsbl %al,%eax
    4323:	89 44 24 04          	mov    %eax,0x4(%esp)
    4327:	8b 45 08             	mov    0x8(%ebp),%eax
    432a:	89 04 24             	mov    %eax,(%esp)
    432d:	e8 bb fe ff ff       	call   41ed <putc>
    4332:	e9 30 01 00 00       	jmp    4467 <printf+0x19a>
      }
    } else if(state == '%'){
    4337:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    433b:	0f 85 26 01 00 00    	jne    4467 <printf+0x19a>
      if(c == 'd'){
    4341:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    4345:	75 2d                	jne    4374 <printf+0xa7>
        printint(fd, *ap, 10, 1);
    4347:	8b 45 e8             	mov    -0x18(%ebp),%eax
    434a:	8b 00                	mov    (%eax),%eax
    434c:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    4353:	00 
    4354:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    435b:	00 
    435c:	89 44 24 04          	mov    %eax,0x4(%esp)
    4360:	8b 45 08             	mov    0x8(%ebp),%eax
    4363:	89 04 24             	mov    %eax,(%esp)
    4366:	e8 aa fe ff ff       	call   4215 <printint>
        ap++;
    436b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    436f:	e9 ec 00 00 00       	jmp    4460 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    4374:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    4378:	74 06                	je     4380 <printf+0xb3>
    437a:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    437e:	75 2d                	jne    43ad <printf+0xe0>
        printint(fd, *ap, 16, 0);
    4380:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4383:	8b 00                	mov    (%eax),%eax
    4385:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    438c:	00 
    438d:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    4394:	00 
    4395:	89 44 24 04          	mov    %eax,0x4(%esp)
    4399:	8b 45 08             	mov    0x8(%ebp),%eax
    439c:	89 04 24             	mov    %eax,(%esp)
    439f:	e8 71 fe ff ff       	call   4215 <printint>
        ap++;
    43a4:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    43a8:	e9 b3 00 00 00       	jmp    4460 <printf+0x193>
      } else if(c == 's'){
    43ad:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    43b1:	75 45                	jne    43f8 <printf+0x12b>
        s = (char*)*ap;
    43b3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    43b6:	8b 00                	mov    (%eax),%eax
    43b8:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    43bb:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    43bf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    43c3:	75 09                	jne    43ce <printf+0x101>
          s = "(null)";
    43c5:	c7 45 f4 5e 5d 00 00 	movl   $0x5d5e,-0xc(%ebp)
        while(*s != 0){
    43cc:	eb 1e                	jmp    43ec <printf+0x11f>
    43ce:	eb 1c                	jmp    43ec <printf+0x11f>
          putc(fd, *s);
    43d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    43d3:	0f b6 00             	movzbl (%eax),%eax
    43d6:	0f be c0             	movsbl %al,%eax
    43d9:	89 44 24 04          	mov    %eax,0x4(%esp)
    43dd:	8b 45 08             	mov    0x8(%ebp),%eax
    43e0:	89 04 24             	mov    %eax,(%esp)
    43e3:	e8 05 fe ff ff       	call   41ed <putc>
          s++;
    43e8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    43ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
    43ef:	0f b6 00             	movzbl (%eax),%eax
    43f2:	84 c0                	test   %al,%al
    43f4:	75 da                	jne    43d0 <printf+0x103>
    43f6:	eb 68                	jmp    4460 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    43f8:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    43fc:	75 1d                	jne    441b <printf+0x14e>
        putc(fd, *ap);
    43fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4401:	8b 00                	mov    (%eax),%eax
    4403:	0f be c0             	movsbl %al,%eax
    4406:	89 44 24 04          	mov    %eax,0x4(%esp)
    440a:	8b 45 08             	mov    0x8(%ebp),%eax
    440d:	89 04 24             	mov    %eax,(%esp)
    4410:	e8 d8 fd ff ff       	call   41ed <putc>
        ap++;
    4415:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    4419:	eb 45                	jmp    4460 <printf+0x193>
      } else if(c == '%'){
    441b:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    441f:	75 17                	jne    4438 <printf+0x16b>
        putc(fd, c);
    4421:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4424:	0f be c0             	movsbl %al,%eax
    4427:	89 44 24 04          	mov    %eax,0x4(%esp)
    442b:	8b 45 08             	mov    0x8(%ebp),%eax
    442e:	89 04 24             	mov    %eax,(%esp)
    4431:	e8 b7 fd ff ff       	call   41ed <putc>
    4436:	eb 28                	jmp    4460 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    4438:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    443f:	00 
    4440:	8b 45 08             	mov    0x8(%ebp),%eax
    4443:	89 04 24             	mov    %eax,(%esp)
    4446:	e8 a2 fd ff ff       	call   41ed <putc>
        putc(fd, c);
    444b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    444e:	0f be c0             	movsbl %al,%eax
    4451:	89 44 24 04          	mov    %eax,0x4(%esp)
    4455:	8b 45 08             	mov    0x8(%ebp),%eax
    4458:	89 04 24             	mov    %eax,(%esp)
    445b:	e8 8d fd ff ff       	call   41ed <putc>
      }
      state = 0;
    4460:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    4467:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    446b:	8b 55 0c             	mov    0xc(%ebp),%edx
    446e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4471:	01 d0                	add    %edx,%eax
    4473:	0f b6 00             	movzbl (%eax),%eax
    4476:	84 c0                	test   %al,%al
    4478:	0f 85 71 fe ff ff    	jne    42ef <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    447e:	c9                   	leave  
    447f:	c3                   	ret    

00004480 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    4480:	55                   	push   %ebp
    4481:	89 e5                	mov    %esp,%ebp
    4483:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    4486:	8b 45 08             	mov    0x8(%ebp),%eax
    4489:	83 e8 08             	sub    $0x8,%eax
    448c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    448f:	a1 a8 64 00 00       	mov    0x64a8,%eax
    4494:	89 45 fc             	mov    %eax,-0x4(%ebp)
    4497:	eb 24                	jmp    44bd <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    4499:	8b 45 fc             	mov    -0x4(%ebp),%eax
    449c:	8b 00                	mov    (%eax),%eax
    449e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    44a1:	77 12                	ja     44b5 <free+0x35>
    44a3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    44a6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    44a9:	77 24                	ja     44cf <free+0x4f>
    44ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
    44ae:	8b 00                	mov    (%eax),%eax
    44b0:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    44b3:	77 1a                	ja     44cf <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    44b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    44b8:	8b 00                	mov    (%eax),%eax
    44ba:	89 45 fc             	mov    %eax,-0x4(%ebp)
    44bd:	8b 45 f8             	mov    -0x8(%ebp),%eax
    44c0:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    44c3:	76 d4                	jbe    4499 <free+0x19>
    44c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    44c8:	8b 00                	mov    (%eax),%eax
    44ca:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    44cd:	76 ca                	jbe    4499 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    44cf:	8b 45 f8             	mov    -0x8(%ebp),%eax
    44d2:	8b 40 04             	mov    0x4(%eax),%eax
    44d5:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    44dc:	8b 45 f8             	mov    -0x8(%ebp),%eax
    44df:	01 c2                	add    %eax,%edx
    44e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    44e4:	8b 00                	mov    (%eax),%eax
    44e6:	39 c2                	cmp    %eax,%edx
    44e8:	75 24                	jne    450e <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    44ea:	8b 45 f8             	mov    -0x8(%ebp),%eax
    44ed:	8b 50 04             	mov    0x4(%eax),%edx
    44f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    44f3:	8b 00                	mov    (%eax),%eax
    44f5:	8b 40 04             	mov    0x4(%eax),%eax
    44f8:	01 c2                	add    %eax,%edx
    44fa:	8b 45 f8             	mov    -0x8(%ebp),%eax
    44fd:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    4500:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4503:	8b 00                	mov    (%eax),%eax
    4505:	8b 10                	mov    (%eax),%edx
    4507:	8b 45 f8             	mov    -0x8(%ebp),%eax
    450a:	89 10                	mov    %edx,(%eax)
    450c:	eb 0a                	jmp    4518 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    450e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4511:	8b 10                	mov    (%eax),%edx
    4513:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4516:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    4518:	8b 45 fc             	mov    -0x4(%ebp),%eax
    451b:	8b 40 04             	mov    0x4(%eax),%eax
    451e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    4525:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4528:	01 d0                	add    %edx,%eax
    452a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    452d:	75 20                	jne    454f <free+0xcf>
    p->s.size += bp->s.size;
    452f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4532:	8b 50 04             	mov    0x4(%eax),%edx
    4535:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4538:	8b 40 04             	mov    0x4(%eax),%eax
    453b:	01 c2                	add    %eax,%edx
    453d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4540:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    4543:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4546:	8b 10                	mov    (%eax),%edx
    4548:	8b 45 fc             	mov    -0x4(%ebp),%eax
    454b:	89 10                	mov    %edx,(%eax)
    454d:	eb 08                	jmp    4557 <free+0xd7>
  } else
    p->s.ptr = bp;
    454f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4552:	8b 55 f8             	mov    -0x8(%ebp),%edx
    4555:	89 10                	mov    %edx,(%eax)
  freep = p;
    4557:	8b 45 fc             	mov    -0x4(%ebp),%eax
    455a:	a3 a8 64 00 00       	mov    %eax,0x64a8
}
    455f:	c9                   	leave  
    4560:	c3                   	ret    

00004561 <morecore>:

static Header*
morecore(uint nu)
{
    4561:	55                   	push   %ebp
    4562:	89 e5                	mov    %esp,%ebp
    4564:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    4567:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    456e:	77 07                	ja     4577 <morecore+0x16>
    nu = 4096;
    4570:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    4577:	8b 45 08             	mov    0x8(%ebp),%eax
    457a:	c1 e0 03             	shl    $0x3,%eax
    457d:	89 04 24             	mov    %eax,(%esp)
    4580:	e8 40 fc ff ff       	call   41c5 <sbrk>
    4585:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    4588:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    458c:	75 07                	jne    4595 <morecore+0x34>
    return 0;
    458e:	b8 00 00 00 00       	mov    $0x0,%eax
    4593:	eb 22                	jmp    45b7 <morecore+0x56>
  hp = (Header*)p;
    4595:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4598:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    459b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    459e:	8b 55 08             	mov    0x8(%ebp),%edx
    45a1:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    45a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    45a7:	83 c0 08             	add    $0x8,%eax
    45aa:	89 04 24             	mov    %eax,(%esp)
    45ad:	e8 ce fe ff ff       	call   4480 <free>
  return freep;
    45b2:	a1 a8 64 00 00       	mov    0x64a8,%eax
}
    45b7:	c9                   	leave  
    45b8:	c3                   	ret    

000045b9 <malloc>:

void*
malloc(uint nbytes)
{
    45b9:	55                   	push   %ebp
    45ba:	89 e5                	mov    %esp,%ebp
    45bc:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    45bf:	8b 45 08             	mov    0x8(%ebp),%eax
    45c2:	83 c0 07             	add    $0x7,%eax
    45c5:	c1 e8 03             	shr    $0x3,%eax
    45c8:	83 c0 01             	add    $0x1,%eax
    45cb:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    45ce:	a1 a8 64 00 00       	mov    0x64a8,%eax
    45d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    45d6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    45da:	75 23                	jne    45ff <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    45dc:	c7 45 f0 a0 64 00 00 	movl   $0x64a0,-0x10(%ebp)
    45e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    45e6:	a3 a8 64 00 00       	mov    %eax,0x64a8
    45eb:	a1 a8 64 00 00       	mov    0x64a8,%eax
    45f0:	a3 a0 64 00 00       	mov    %eax,0x64a0
    base.s.size = 0;
    45f5:	c7 05 a4 64 00 00 00 	movl   $0x0,0x64a4
    45fc:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    45ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4602:	8b 00                	mov    (%eax),%eax
    4604:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    4607:	8b 45 f4             	mov    -0xc(%ebp),%eax
    460a:	8b 40 04             	mov    0x4(%eax),%eax
    460d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    4610:	72 4d                	jb     465f <malloc+0xa6>
      if(p->s.size == nunits)
    4612:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4615:	8b 40 04             	mov    0x4(%eax),%eax
    4618:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    461b:	75 0c                	jne    4629 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    461d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4620:	8b 10                	mov    (%eax),%edx
    4622:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4625:	89 10                	mov    %edx,(%eax)
    4627:	eb 26                	jmp    464f <malloc+0x96>
      else {
        p->s.size -= nunits;
    4629:	8b 45 f4             	mov    -0xc(%ebp),%eax
    462c:	8b 40 04             	mov    0x4(%eax),%eax
    462f:	2b 45 ec             	sub    -0x14(%ebp),%eax
    4632:	89 c2                	mov    %eax,%edx
    4634:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4637:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    463a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    463d:	8b 40 04             	mov    0x4(%eax),%eax
    4640:	c1 e0 03             	shl    $0x3,%eax
    4643:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    4646:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4649:	8b 55 ec             	mov    -0x14(%ebp),%edx
    464c:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    464f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4652:	a3 a8 64 00 00       	mov    %eax,0x64a8
      return (void*)(p + 1);
    4657:	8b 45 f4             	mov    -0xc(%ebp),%eax
    465a:	83 c0 08             	add    $0x8,%eax
    465d:	eb 38                	jmp    4697 <malloc+0xde>
    }
    if(p == freep)
    465f:	a1 a8 64 00 00       	mov    0x64a8,%eax
    4664:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    4667:	75 1b                	jne    4684 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    4669:	8b 45 ec             	mov    -0x14(%ebp),%eax
    466c:	89 04 24             	mov    %eax,(%esp)
    466f:	e8 ed fe ff ff       	call   4561 <morecore>
    4674:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4677:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    467b:	75 07                	jne    4684 <malloc+0xcb>
        return 0;
    467d:	b8 00 00 00 00       	mov    $0x0,%eax
    4682:	eb 13                	jmp    4697 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4684:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4687:	89 45 f0             	mov    %eax,-0x10(%ebp)
    468a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    468d:	8b 00                	mov    (%eax),%eax
    468f:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    4692:	e9 70 ff ff ff       	jmp    4607 <malloc+0x4e>
}
    4697:	c9                   	leave  
    4698:	c3                   	ret    
