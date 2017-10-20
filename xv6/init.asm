
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int pid, wpid, st;

  if(open("console", O_RDWR) < 0){
   9:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  10:	00 
  11:	c7 04 24 eb 08 00 00 	movl   $0x8eb,(%esp)
  18:	e8 af 03 00 00       	call   3cc <open>
  1d:	85 c0                	test   %eax,%eax
  1f:	79 30                	jns    51 <main+0x51>
    mknod("console", 1, 1);
  21:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  28:	00 
  29:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  30:	00 
  31:	c7 04 24 eb 08 00 00 	movl   $0x8eb,(%esp)
  38:	e8 97 03 00 00       	call   3d4 <mknod>
    open("console", O_RDWR);
  3d:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  44:	00 
  45:	c7 04 24 eb 08 00 00 	movl   $0x8eb,(%esp)
  4c:	e8 7b 03 00 00       	call   3cc <open>
  }
  dup(0);  // stdout
  51:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  58:	e8 a7 03 00 00       	call   404 <dup>
  dup(0);  // stderr
  5d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  64:	e8 9b 03 00 00       	call   404 <dup>

  for(;;){
    printf(1, "init: starting sh\n");
  69:	c7 44 24 04 f3 08 00 	movl   $0x8f3,0x4(%esp)
  70:	00 
  71:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  78:	e8 9f 04 00 00       	call   51c <printf>
    pid = fork();
  7d:	e8 02 03 00 00       	call   384 <fork>
  82:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    if(pid < 0){
  86:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  8b:	79 20                	jns    ad <main+0xad>
      printf(1, "init: fork failed\n");
  8d:	c7 44 24 04 06 09 00 	movl   $0x906,0x4(%esp)
  94:	00 
  95:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  9c:	e8 7b 04 00 00       	call   51c <printf>
      exit(1);
  a1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  a8:	e8 df 02 00 00       	call   38c <exit>
    }
    if(pid == 0){
  ad:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  b2:	75 34                	jne    e8 <main+0xe8>
      exec("sh", argv);
  b4:	c7 44 24 04 84 0b 00 	movl   $0xb84,0x4(%esp)
  bb:	00 
  bc:	c7 04 24 e8 08 00 00 	movl   $0x8e8,(%esp)
  c3:	e8 fc 02 00 00       	call   3c4 <exec>
      printf(1, "init: exec sh failed\n");
  c8:	c7 44 24 04 19 09 00 	movl   $0x919,0x4(%esp)
  cf:	00 
  d0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d7:	e8 40 04 00 00       	call   51c <printf>
      exit(1);
  dc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  e3:	e8 a4 02 00 00       	call   38c <exit>
    }
    while((wpid=wait(&st)) >= 0 && wpid != pid)
  e8:	eb 14                	jmp    fe <main+0xfe>
      printf(1, "zombie!\n");
  ea:	c7 44 24 04 2f 09 00 	movl   $0x92f,0x4(%esp)
  f1:	00 
  f2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  f9:	e8 1e 04 00 00       	call   51c <printf>
    if(pid == 0){
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit(1);
    }
    while((wpid=wait(&st)) >= 0 && wpid != pid)
  fe:	8d 44 24 14          	lea    0x14(%esp),%eax
 102:	89 04 24             	mov    %eax,(%esp)
 105:	e8 8a 02 00 00       	call   394 <wait>
 10a:	89 44 24 18          	mov    %eax,0x18(%esp)
 10e:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
 113:	78 0a                	js     11f <main+0x11f>
 115:	8b 44 24 18          	mov    0x18(%esp),%eax
 119:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
 11d:	75 cb                	jne    ea <main+0xea>
      printf(1, "zombie!\n");
  }
 11f:	e9 45 ff ff ff       	jmp    69 <main+0x69>

00000124 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 124:	55                   	push   %ebp
 125:	89 e5                	mov    %esp,%ebp
 127:	57                   	push   %edi
 128:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 129:	8b 4d 08             	mov    0x8(%ebp),%ecx
 12c:	8b 55 10             	mov    0x10(%ebp),%edx
 12f:	8b 45 0c             	mov    0xc(%ebp),%eax
 132:	89 cb                	mov    %ecx,%ebx
 134:	89 df                	mov    %ebx,%edi
 136:	89 d1                	mov    %edx,%ecx
 138:	fc                   	cld    
 139:	f3 aa                	rep stos %al,%es:(%edi)
 13b:	89 ca                	mov    %ecx,%edx
 13d:	89 fb                	mov    %edi,%ebx
 13f:	89 5d 08             	mov    %ebx,0x8(%ebp)
 142:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 145:	5b                   	pop    %ebx
 146:	5f                   	pop    %edi
 147:	5d                   	pop    %ebp
 148:	c3                   	ret    

00000149 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 149:	55                   	push   %ebp
 14a:	89 e5                	mov    %esp,%ebp
 14c:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 14f:	8b 45 08             	mov    0x8(%ebp),%eax
 152:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 155:	90                   	nop
 156:	8b 45 08             	mov    0x8(%ebp),%eax
 159:	8d 50 01             	lea    0x1(%eax),%edx
 15c:	89 55 08             	mov    %edx,0x8(%ebp)
 15f:	8b 55 0c             	mov    0xc(%ebp),%edx
 162:	8d 4a 01             	lea    0x1(%edx),%ecx
 165:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 168:	0f b6 12             	movzbl (%edx),%edx
 16b:	88 10                	mov    %dl,(%eax)
 16d:	0f b6 00             	movzbl (%eax),%eax
 170:	84 c0                	test   %al,%al
 172:	75 e2                	jne    156 <strcpy+0xd>
    ;
  return os;
 174:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 177:	c9                   	leave  
 178:	c3                   	ret    

00000179 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 179:	55                   	push   %ebp
 17a:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 17c:	eb 08                	jmp    186 <strcmp+0xd>
    p++, q++;
 17e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 182:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 186:	8b 45 08             	mov    0x8(%ebp),%eax
 189:	0f b6 00             	movzbl (%eax),%eax
 18c:	84 c0                	test   %al,%al
 18e:	74 10                	je     1a0 <strcmp+0x27>
 190:	8b 45 08             	mov    0x8(%ebp),%eax
 193:	0f b6 10             	movzbl (%eax),%edx
 196:	8b 45 0c             	mov    0xc(%ebp),%eax
 199:	0f b6 00             	movzbl (%eax),%eax
 19c:	38 c2                	cmp    %al,%dl
 19e:	74 de                	je     17e <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1a0:	8b 45 08             	mov    0x8(%ebp),%eax
 1a3:	0f b6 00             	movzbl (%eax),%eax
 1a6:	0f b6 d0             	movzbl %al,%edx
 1a9:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ac:	0f b6 00             	movzbl (%eax),%eax
 1af:	0f b6 c0             	movzbl %al,%eax
 1b2:	29 c2                	sub    %eax,%edx
 1b4:	89 d0                	mov    %edx,%eax
}
 1b6:	5d                   	pop    %ebp
 1b7:	c3                   	ret    

000001b8 <strlen>:

uint
strlen(char *s)
{
 1b8:	55                   	push   %ebp
 1b9:	89 e5                	mov    %esp,%ebp
 1bb:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1be:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1c5:	eb 04                	jmp    1cb <strlen+0x13>
 1c7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1cb:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1ce:	8b 45 08             	mov    0x8(%ebp),%eax
 1d1:	01 d0                	add    %edx,%eax
 1d3:	0f b6 00             	movzbl (%eax),%eax
 1d6:	84 c0                	test   %al,%al
 1d8:	75 ed                	jne    1c7 <strlen+0xf>
    ;
  return n;
 1da:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1dd:	c9                   	leave  
 1de:	c3                   	ret    

000001df <memset>:

void*
memset(void *dst, int c, uint n)
{
 1df:	55                   	push   %ebp
 1e0:	89 e5                	mov    %esp,%ebp
 1e2:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1e5:	8b 45 10             	mov    0x10(%ebp),%eax
 1e8:	89 44 24 08          	mov    %eax,0x8(%esp)
 1ec:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ef:	89 44 24 04          	mov    %eax,0x4(%esp)
 1f3:	8b 45 08             	mov    0x8(%ebp),%eax
 1f6:	89 04 24             	mov    %eax,(%esp)
 1f9:	e8 26 ff ff ff       	call   124 <stosb>
  return dst;
 1fe:	8b 45 08             	mov    0x8(%ebp),%eax
}
 201:	c9                   	leave  
 202:	c3                   	ret    

00000203 <strchr>:

char*
strchr(const char *s, char c)
{
 203:	55                   	push   %ebp
 204:	89 e5                	mov    %esp,%ebp
 206:	83 ec 04             	sub    $0x4,%esp
 209:	8b 45 0c             	mov    0xc(%ebp),%eax
 20c:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 20f:	eb 14                	jmp    225 <strchr+0x22>
    if(*s == c)
 211:	8b 45 08             	mov    0x8(%ebp),%eax
 214:	0f b6 00             	movzbl (%eax),%eax
 217:	3a 45 fc             	cmp    -0x4(%ebp),%al
 21a:	75 05                	jne    221 <strchr+0x1e>
      return (char*)s;
 21c:	8b 45 08             	mov    0x8(%ebp),%eax
 21f:	eb 13                	jmp    234 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 221:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 225:	8b 45 08             	mov    0x8(%ebp),%eax
 228:	0f b6 00             	movzbl (%eax),%eax
 22b:	84 c0                	test   %al,%al
 22d:	75 e2                	jne    211 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 22f:	b8 00 00 00 00       	mov    $0x0,%eax
}
 234:	c9                   	leave  
 235:	c3                   	ret    

00000236 <gets>:

char*
gets(char *buf, int max)
{
 236:	55                   	push   %ebp
 237:	89 e5                	mov    %esp,%ebp
 239:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 23c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 243:	eb 4c                	jmp    291 <gets+0x5b>
    cc = read(0, &c, 1);
 245:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 24c:	00 
 24d:	8d 45 ef             	lea    -0x11(%ebp),%eax
 250:	89 44 24 04          	mov    %eax,0x4(%esp)
 254:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 25b:	e8 44 01 00 00       	call   3a4 <read>
 260:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 263:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 267:	7f 02                	jg     26b <gets+0x35>
      break;
 269:	eb 31                	jmp    29c <gets+0x66>
    buf[i++] = c;
 26b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 26e:	8d 50 01             	lea    0x1(%eax),%edx
 271:	89 55 f4             	mov    %edx,-0xc(%ebp)
 274:	89 c2                	mov    %eax,%edx
 276:	8b 45 08             	mov    0x8(%ebp),%eax
 279:	01 c2                	add    %eax,%edx
 27b:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 27f:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 281:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 285:	3c 0a                	cmp    $0xa,%al
 287:	74 13                	je     29c <gets+0x66>
 289:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 28d:	3c 0d                	cmp    $0xd,%al
 28f:	74 0b                	je     29c <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 291:	8b 45 f4             	mov    -0xc(%ebp),%eax
 294:	83 c0 01             	add    $0x1,%eax
 297:	3b 45 0c             	cmp    0xc(%ebp),%eax
 29a:	7c a9                	jl     245 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 29c:	8b 55 f4             	mov    -0xc(%ebp),%edx
 29f:	8b 45 08             	mov    0x8(%ebp),%eax
 2a2:	01 d0                	add    %edx,%eax
 2a4:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 2a7:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2aa:	c9                   	leave  
 2ab:	c3                   	ret    

000002ac <stat>:

int
stat(char *n, struct stat *st)
{
 2ac:	55                   	push   %ebp
 2ad:	89 e5                	mov    %esp,%ebp
 2af:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2b2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2b9:	00 
 2ba:	8b 45 08             	mov    0x8(%ebp),%eax
 2bd:	89 04 24             	mov    %eax,(%esp)
 2c0:	e8 07 01 00 00       	call   3cc <open>
 2c5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2c8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2cc:	79 07                	jns    2d5 <stat+0x29>
    return -1;
 2ce:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2d3:	eb 23                	jmp    2f8 <stat+0x4c>
  r = fstat(fd, st);
 2d5:	8b 45 0c             	mov    0xc(%ebp),%eax
 2d8:	89 44 24 04          	mov    %eax,0x4(%esp)
 2dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2df:	89 04 24             	mov    %eax,(%esp)
 2e2:	e8 fd 00 00 00       	call   3e4 <fstat>
 2e7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2ed:	89 04 24             	mov    %eax,(%esp)
 2f0:	e8 bf 00 00 00       	call   3b4 <close>
  return r;
 2f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2f8:	c9                   	leave  
 2f9:	c3                   	ret    

000002fa <atoi>:

int
atoi(const char *s)
{
 2fa:	55                   	push   %ebp
 2fb:	89 e5                	mov    %esp,%ebp
 2fd:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 300:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 307:	eb 25                	jmp    32e <atoi+0x34>
    n = n*10 + *s++ - '0';
 309:	8b 55 fc             	mov    -0x4(%ebp),%edx
 30c:	89 d0                	mov    %edx,%eax
 30e:	c1 e0 02             	shl    $0x2,%eax
 311:	01 d0                	add    %edx,%eax
 313:	01 c0                	add    %eax,%eax
 315:	89 c1                	mov    %eax,%ecx
 317:	8b 45 08             	mov    0x8(%ebp),%eax
 31a:	8d 50 01             	lea    0x1(%eax),%edx
 31d:	89 55 08             	mov    %edx,0x8(%ebp)
 320:	0f b6 00             	movzbl (%eax),%eax
 323:	0f be c0             	movsbl %al,%eax
 326:	01 c8                	add    %ecx,%eax
 328:	83 e8 30             	sub    $0x30,%eax
 32b:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 32e:	8b 45 08             	mov    0x8(%ebp),%eax
 331:	0f b6 00             	movzbl (%eax),%eax
 334:	3c 2f                	cmp    $0x2f,%al
 336:	7e 0a                	jle    342 <atoi+0x48>
 338:	8b 45 08             	mov    0x8(%ebp),%eax
 33b:	0f b6 00             	movzbl (%eax),%eax
 33e:	3c 39                	cmp    $0x39,%al
 340:	7e c7                	jle    309 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 342:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 345:	c9                   	leave  
 346:	c3                   	ret    

00000347 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 347:	55                   	push   %ebp
 348:	89 e5                	mov    %esp,%ebp
 34a:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 34d:	8b 45 08             	mov    0x8(%ebp),%eax
 350:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 353:	8b 45 0c             	mov    0xc(%ebp),%eax
 356:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 359:	eb 17                	jmp    372 <memmove+0x2b>
    *dst++ = *src++;
 35b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 35e:	8d 50 01             	lea    0x1(%eax),%edx
 361:	89 55 fc             	mov    %edx,-0x4(%ebp)
 364:	8b 55 f8             	mov    -0x8(%ebp),%edx
 367:	8d 4a 01             	lea    0x1(%edx),%ecx
 36a:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 36d:	0f b6 12             	movzbl (%edx),%edx
 370:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 372:	8b 45 10             	mov    0x10(%ebp),%eax
 375:	8d 50 ff             	lea    -0x1(%eax),%edx
 378:	89 55 10             	mov    %edx,0x10(%ebp)
 37b:	85 c0                	test   %eax,%eax
 37d:	7f dc                	jg     35b <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 37f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 382:	c9                   	leave  
 383:	c3                   	ret    

00000384 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 384:	b8 01 00 00 00       	mov    $0x1,%eax
 389:	cd 40                	int    $0x40
 38b:	c3                   	ret    

0000038c <exit>:
SYSCALL(exit)
 38c:	b8 02 00 00 00       	mov    $0x2,%eax
 391:	cd 40                	int    $0x40
 393:	c3                   	ret    

00000394 <wait>:
SYSCALL(wait)
 394:	b8 03 00 00 00       	mov    $0x3,%eax
 399:	cd 40                	int    $0x40
 39b:	c3                   	ret    

0000039c <pipe>:
SYSCALL(pipe)
 39c:	b8 04 00 00 00       	mov    $0x4,%eax
 3a1:	cd 40                	int    $0x40
 3a3:	c3                   	ret    

000003a4 <read>:
SYSCALL(read)
 3a4:	b8 05 00 00 00       	mov    $0x5,%eax
 3a9:	cd 40                	int    $0x40
 3ab:	c3                   	ret    

000003ac <write>:
SYSCALL(write)
 3ac:	b8 10 00 00 00       	mov    $0x10,%eax
 3b1:	cd 40                	int    $0x40
 3b3:	c3                   	ret    

000003b4 <close>:
SYSCALL(close)
 3b4:	b8 15 00 00 00       	mov    $0x15,%eax
 3b9:	cd 40                	int    $0x40
 3bb:	c3                   	ret    

000003bc <kill>:
SYSCALL(kill)
 3bc:	b8 06 00 00 00       	mov    $0x6,%eax
 3c1:	cd 40                	int    $0x40
 3c3:	c3                   	ret    

000003c4 <exec>:
SYSCALL(exec)
 3c4:	b8 07 00 00 00       	mov    $0x7,%eax
 3c9:	cd 40                	int    $0x40
 3cb:	c3                   	ret    

000003cc <open>:
SYSCALL(open)
 3cc:	b8 0f 00 00 00       	mov    $0xf,%eax
 3d1:	cd 40                	int    $0x40
 3d3:	c3                   	ret    

000003d4 <mknod>:
SYSCALL(mknod)
 3d4:	b8 11 00 00 00       	mov    $0x11,%eax
 3d9:	cd 40                	int    $0x40
 3db:	c3                   	ret    

000003dc <unlink>:
SYSCALL(unlink)
 3dc:	b8 12 00 00 00       	mov    $0x12,%eax
 3e1:	cd 40                	int    $0x40
 3e3:	c3                   	ret    

000003e4 <fstat>:
SYSCALL(fstat)
 3e4:	b8 08 00 00 00       	mov    $0x8,%eax
 3e9:	cd 40                	int    $0x40
 3eb:	c3                   	ret    

000003ec <link>:
SYSCALL(link)
 3ec:	b8 13 00 00 00       	mov    $0x13,%eax
 3f1:	cd 40                	int    $0x40
 3f3:	c3                   	ret    

000003f4 <mkdir>:
SYSCALL(mkdir)
 3f4:	b8 14 00 00 00       	mov    $0x14,%eax
 3f9:	cd 40                	int    $0x40
 3fb:	c3                   	ret    

000003fc <chdir>:
SYSCALL(chdir)
 3fc:	b8 09 00 00 00       	mov    $0x9,%eax
 401:	cd 40                	int    $0x40
 403:	c3                   	ret    

00000404 <dup>:
SYSCALL(dup)
 404:	b8 0a 00 00 00       	mov    $0xa,%eax
 409:	cd 40                	int    $0x40
 40b:	c3                   	ret    

0000040c <getpid>:
SYSCALL(getpid)
 40c:	b8 0b 00 00 00       	mov    $0xb,%eax
 411:	cd 40                	int    $0x40
 413:	c3                   	ret    

00000414 <sbrk>:
SYSCALL(sbrk)
 414:	b8 0c 00 00 00       	mov    $0xc,%eax
 419:	cd 40                	int    $0x40
 41b:	c3                   	ret    

0000041c <sleep>:
SYSCALL(sleep)
 41c:	b8 0d 00 00 00       	mov    $0xd,%eax
 421:	cd 40                	int    $0x40
 423:	c3                   	ret    

00000424 <uptime>:
SYSCALL(uptime)
 424:	b8 0e 00 00 00       	mov    $0xe,%eax
 429:	cd 40                	int    $0x40
 42b:	c3                   	ret    

0000042c <waitpid>:
SYSCALL(waitpid)
 42c:	b8 16 00 00 00       	mov    $0x16,%eax
 431:	cd 40                	int    $0x40
 433:	c3                   	ret    

00000434 <setprio>:
SYSCALL(setprio)
 434:	b8 17 00 00 00       	mov    $0x17,%eax
 439:	cd 40                	int    $0x40
 43b:	c3                   	ret    

0000043c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 43c:	55                   	push   %ebp
 43d:	89 e5                	mov    %esp,%ebp
 43f:	83 ec 18             	sub    $0x18,%esp
 442:	8b 45 0c             	mov    0xc(%ebp),%eax
 445:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 448:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 44f:	00 
 450:	8d 45 f4             	lea    -0xc(%ebp),%eax
 453:	89 44 24 04          	mov    %eax,0x4(%esp)
 457:	8b 45 08             	mov    0x8(%ebp),%eax
 45a:	89 04 24             	mov    %eax,(%esp)
 45d:	e8 4a ff ff ff       	call   3ac <write>
}
 462:	c9                   	leave  
 463:	c3                   	ret    

00000464 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 464:	55                   	push   %ebp
 465:	89 e5                	mov    %esp,%ebp
 467:	56                   	push   %esi
 468:	53                   	push   %ebx
 469:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 46c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 473:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 477:	74 17                	je     490 <printint+0x2c>
 479:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 47d:	79 11                	jns    490 <printint+0x2c>
    neg = 1;
 47f:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 486:	8b 45 0c             	mov    0xc(%ebp),%eax
 489:	f7 d8                	neg    %eax
 48b:	89 45 ec             	mov    %eax,-0x14(%ebp)
 48e:	eb 06                	jmp    496 <printint+0x32>
  } else {
    x = xx;
 490:	8b 45 0c             	mov    0xc(%ebp),%eax
 493:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 496:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 49d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4a0:	8d 41 01             	lea    0x1(%ecx),%eax
 4a3:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4a6:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4a9:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4ac:	ba 00 00 00 00       	mov    $0x0,%edx
 4b1:	f7 f3                	div    %ebx
 4b3:	89 d0                	mov    %edx,%eax
 4b5:	0f b6 80 8c 0b 00 00 	movzbl 0xb8c(%eax),%eax
 4bc:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 4c0:	8b 75 10             	mov    0x10(%ebp),%esi
 4c3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4c6:	ba 00 00 00 00       	mov    $0x0,%edx
 4cb:	f7 f6                	div    %esi
 4cd:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4d0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4d4:	75 c7                	jne    49d <printint+0x39>
  if(neg)
 4d6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4da:	74 10                	je     4ec <printint+0x88>
    buf[i++] = '-';
 4dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4df:	8d 50 01             	lea    0x1(%eax),%edx
 4e2:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4e5:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 4ea:	eb 1f                	jmp    50b <printint+0xa7>
 4ec:	eb 1d                	jmp    50b <printint+0xa7>
    putc(fd, buf[i]);
 4ee:	8d 55 dc             	lea    -0x24(%ebp),%edx
 4f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4f4:	01 d0                	add    %edx,%eax
 4f6:	0f b6 00             	movzbl (%eax),%eax
 4f9:	0f be c0             	movsbl %al,%eax
 4fc:	89 44 24 04          	mov    %eax,0x4(%esp)
 500:	8b 45 08             	mov    0x8(%ebp),%eax
 503:	89 04 24             	mov    %eax,(%esp)
 506:	e8 31 ff ff ff       	call   43c <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 50b:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 50f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 513:	79 d9                	jns    4ee <printint+0x8a>
    putc(fd, buf[i]);
}
 515:	83 c4 30             	add    $0x30,%esp
 518:	5b                   	pop    %ebx
 519:	5e                   	pop    %esi
 51a:	5d                   	pop    %ebp
 51b:	c3                   	ret    

0000051c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 51c:	55                   	push   %ebp
 51d:	89 e5                	mov    %esp,%ebp
 51f:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 522:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 529:	8d 45 0c             	lea    0xc(%ebp),%eax
 52c:	83 c0 04             	add    $0x4,%eax
 52f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 532:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 539:	e9 7c 01 00 00       	jmp    6ba <printf+0x19e>
    c = fmt[i] & 0xff;
 53e:	8b 55 0c             	mov    0xc(%ebp),%edx
 541:	8b 45 f0             	mov    -0x10(%ebp),%eax
 544:	01 d0                	add    %edx,%eax
 546:	0f b6 00             	movzbl (%eax),%eax
 549:	0f be c0             	movsbl %al,%eax
 54c:	25 ff 00 00 00       	and    $0xff,%eax
 551:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 554:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 558:	75 2c                	jne    586 <printf+0x6a>
      if(c == '%'){
 55a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 55e:	75 0c                	jne    56c <printf+0x50>
        state = '%';
 560:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 567:	e9 4a 01 00 00       	jmp    6b6 <printf+0x19a>
      } else {
        putc(fd, c);
 56c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 56f:	0f be c0             	movsbl %al,%eax
 572:	89 44 24 04          	mov    %eax,0x4(%esp)
 576:	8b 45 08             	mov    0x8(%ebp),%eax
 579:	89 04 24             	mov    %eax,(%esp)
 57c:	e8 bb fe ff ff       	call   43c <putc>
 581:	e9 30 01 00 00       	jmp    6b6 <printf+0x19a>
      }
    } else if(state == '%'){
 586:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 58a:	0f 85 26 01 00 00    	jne    6b6 <printf+0x19a>
      if(c == 'd'){
 590:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 594:	75 2d                	jne    5c3 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 596:	8b 45 e8             	mov    -0x18(%ebp),%eax
 599:	8b 00                	mov    (%eax),%eax
 59b:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5a2:	00 
 5a3:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 5aa:	00 
 5ab:	89 44 24 04          	mov    %eax,0x4(%esp)
 5af:	8b 45 08             	mov    0x8(%ebp),%eax
 5b2:	89 04 24             	mov    %eax,(%esp)
 5b5:	e8 aa fe ff ff       	call   464 <printint>
        ap++;
 5ba:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5be:	e9 ec 00 00 00       	jmp    6af <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 5c3:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 5c7:	74 06                	je     5cf <printf+0xb3>
 5c9:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5cd:	75 2d                	jne    5fc <printf+0xe0>
        printint(fd, *ap, 16, 0);
 5cf:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5d2:	8b 00                	mov    (%eax),%eax
 5d4:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5db:	00 
 5dc:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5e3:	00 
 5e4:	89 44 24 04          	mov    %eax,0x4(%esp)
 5e8:	8b 45 08             	mov    0x8(%ebp),%eax
 5eb:	89 04 24             	mov    %eax,(%esp)
 5ee:	e8 71 fe ff ff       	call   464 <printint>
        ap++;
 5f3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5f7:	e9 b3 00 00 00       	jmp    6af <printf+0x193>
      } else if(c == 's'){
 5fc:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 600:	75 45                	jne    647 <printf+0x12b>
        s = (char*)*ap;
 602:	8b 45 e8             	mov    -0x18(%ebp),%eax
 605:	8b 00                	mov    (%eax),%eax
 607:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 60a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 60e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 612:	75 09                	jne    61d <printf+0x101>
          s = "(null)";
 614:	c7 45 f4 38 09 00 00 	movl   $0x938,-0xc(%ebp)
        while(*s != 0){
 61b:	eb 1e                	jmp    63b <printf+0x11f>
 61d:	eb 1c                	jmp    63b <printf+0x11f>
          putc(fd, *s);
 61f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 622:	0f b6 00             	movzbl (%eax),%eax
 625:	0f be c0             	movsbl %al,%eax
 628:	89 44 24 04          	mov    %eax,0x4(%esp)
 62c:	8b 45 08             	mov    0x8(%ebp),%eax
 62f:	89 04 24             	mov    %eax,(%esp)
 632:	e8 05 fe ff ff       	call   43c <putc>
          s++;
 637:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 63b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 63e:	0f b6 00             	movzbl (%eax),%eax
 641:	84 c0                	test   %al,%al
 643:	75 da                	jne    61f <printf+0x103>
 645:	eb 68                	jmp    6af <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 647:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 64b:	75 1d                	jne    66a <printf+0x14e>
        putc(fd, *ap);
 64d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 650:	8b 00                	mov    (%eax),%eax
 652:	0f be c0             	movsbl %al,%eax
 655:	89 44 24 04          	mov    %eax,0x4(%esp)
 659:	8b 45 08             	mov    0x8(%ebp),%eax
 65c:	89 04 24             	mov    %eax,(%esp)
 65f:	e8 d8 fd ff ff       	call   43c <putc>
        ap++;
 664:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 668:	eb 45                	jmp    6af <printf+0x193>
      } else if(c == '%'){
 66a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 66e:	75 17                	jne    687 <printf+0x16b>
        putc(fd, c);
 670:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 673:	0f be c0             	movsbl %al,%eax
 676:	89 44 24 04          	mov    %eax,0x4(%esp)
 67a:	8b 45 08             	mov    0x8(%ebp),%eax
 67d:	89 04 24             	mov    %eax,(%esp)
 680:	e8 b7 fd ff ff       	call   43c <putc>
 685:	eb 28                	jmp    6af <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 687:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 68e:	00 
 68f:	8b 45 08             	mov    0x8(%ebp),%eax
 692:	89 04 24             	mov    %eax,(%esp)
 695:	e8 a2 fd ff ff       	call   43c <putc>
        putc(fd, c);
 69a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 69d:	0f be c0             	movsbl %al,%eax
 6a0:	89 44 24 04          	mov    %eax,0x4(%esp)
 6a4:	8b 45 08             	mov    0x8(%ebp),%eax
 6a7:	89 04 24             	mov    %eax,(%esp)
 6aa:	e8 8d fd ff ff       	call   43c <putc>
      }
      state = 0;
 6af:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6b6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 6ba:	8b 55 0c             	mov    0xc(%ebp),%edx
 6bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6c0:	01 d0                	add    %edx,%eax
 6c2:	0f b6 00             	movzbl (%eax),%eax
 6c5:	84 c0                	test   %al,%al
 6c7:	0f 85 71 fe ff ff    	jne    53e <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 6cd:	c9                   	leave  
 6ce:	c3                   	ret    

000006cf <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6cf:	55                   	push   %ebp
 6d0:	89 e5                	mov    %esp,%ebp
 6d2:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6d5:	8b 45 08             	mov    0x8(%ebp),%eax
 6d8:	83 e8 08             	sub    $0x8,%eax
 6db:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6de:	a1 a8 0b 00 00       	mov    0xba8,%eax
 6e3:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6e6:	eb 24                	jmp    70c <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6e8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6eb:	8b 00                	mov    (%eax),%eax
 6ed:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6f0:	77 12                	ja     704 <free+0x35>
 6f2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6f5:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6f8:	77 24                	ja     71e <free+0x4f>
 6fa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6fd:	8b 00                	mov    (%eax),%eax
 6ff:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 702:	77 1a                	ja     71e <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 704:	8b 45 fc             	mov    -0x4(%ebp),%eax
 707:	8b 00                	mov    (%eax),%eax
 709:	89 45 fc             	mov    %eax,-0x4(%ebp)
 70c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 70f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 712:	76 d4                	jbe    6e8 <free+0x19>
 714:	8b 45 fc             	mov    -0x4(%ebp),%eax
 717:	8b 00                	mov    (%eax),%eax
 719:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 71c:	76 ca                	jbe    6e8 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 71e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 721:	8b 40 04             	mov    0x4(%eax),%eax
 724:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 72b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 72e:	01 c2                	add    %eax,%edx
 730:	8b 45 fc             	mov    -0x4(%ebp),%eax
 733:	8b 00                	mov    (%eax),%eax
 735:	39 c2                	cmp    %eax,%edx
 737:	75 24                	jne    75d <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 739:	8b 45 f8             	mov    -0x8(%ebp),%eax
 73c:	8b 50 04             	mov    0x4(%eax),%edx
 73f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 742:	8b 00                	mov    (%eax),%eax
 744:	8b 40 04             	mov    0x4(%eax),%eax
 747:	01 c2                	add    %eax,%edx
 749:	8b 45 f8             	mov    -0x8(%ebp),%eax
 74c:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 74f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 752:	8b 00                	mov    (%eax),%eax
 754:	8b 10                	mov    (%eax),%edx
 756:	8b 45 f8             	mov    -0x8(%ebp),%eax
 759:	89 10                	mov    %edx,(%eax)
 75b:	eb 0a                	jmp    767 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 75d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 760:	8b 10                	mov    (%eax),%edx
 762:	8b 45 f8             	mov    -0x8(%ebp),%eax
 765:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 767:	8b 45 fc             	mov    -0x4(%ebp),%eax
 76a:	8b 40 04             	mov    0x4(%eax),%eax
 76d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 774:	8b 45 fc             	mov    -0x4(%ebp),%eax
 777:	01 d0                	add    %edx,%eax
 779:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 77c:	75 20                	jne    79e <free+0xcf>
    p->s.size += bp->s.size;
 77e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 781:	8b 50 04             	mov    0x4(%eax),%edx
 784:	8b 45 f8             	mov    -0x8(%ebp),%eax
 787:	8b 40 04             	mov    0x4(%eax),%eax
 78a:	01 c2                	add    %eax,%edx
 78c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 792:	8b 45 f8             	mov    -0x8(%ebp),%eax
 795:	8b 10                	mov    (%eax),%edx
 797:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79a:	89 10                	mov    %edx,(%eax)
 79c:	eb 08                	jmp    7a6 <free+0xd7>
  } else
    p->s.ptr = bp;
 79e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a1:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7a4:	89 10                	mov    %edx,(%eax)
  freep = p;
 7a6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a9:	a3 a8 0b 00 00       	mov    %eax,0xba8
}
 7ae:	c9                   	leave  
 7af:	c3                   	ret    

000007b0 <morecore>:

static Header*
morecore(uint nu)
{
 7b0:	55                   	push   %ebp
 7b1:	89 e5                	mov    %esp,%ebp
 7b3:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7b6:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7bd:	77 07                	ja     7c6 <morecore+0x16>
    nu = 4096;
 7bf:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7c6:	8b 45 08             	mov    0x8(%ebp),%eax
 7c9:	c1 e0 03             	shl    $0x3,%eax
 7cc:	89 04 24             	mov    %eax,(%esp)
 7cf:	e8 40 fc ff ff       	call   414 <sbrk>
 7d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 7d7:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7db:	75 07                	jne    7e4 <morecore+0x34>
    return 0;
 7dd:	b8 00 00 00 00       	mov    $0x0,%eax
 7e2:	eb 22                	jmp    806 <morecore+0x56>
  hp = (Header*)p;
 7e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 7ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7ed:	8b 55 08             	mov    0x8(%ebp),%edx
 7f0:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7f6:	83 c0 08             	add    $0x8,%eax
 7f9:	89 04 24             	mov    %eax,(%esp)
 7fc:	e8 ce fe ff ff       	call   6cf <free>
  return freep;
 801:	a1 a8 0b 00 00       	mov    0xba8,%eax
}
 806:	c9                   	leave  
 807:	c3                   	ret    

00000808 <malloc>:

void*
malloc(uint nbytes)
{
 808:	55                   	push   %ebp
 809:	89 e5                	mov    %esp,%ebp
 80b:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 80e:	8b 45 08             	mov    0x8(%ebp),%eax
 811:	83 c0 07             	add    $0x7,%eax
 814:	c1 e8 03             	shr    $0x3,%eax
 817:	83 c0 01             	add    $0x1,%eax
 81a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 81d:	a1 a8 0b 00 00       	mov    0xba8,%eax
 822:	89 45 f0             	mov    %eax,-0x10(%ebp)
 825:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 829:	75 23                	jne    84e <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 82b:	c7 45 f0 a0 0b 00 00 	movl   $0xba0,-0x10(%ebp)
 832:	8b 45 f0             	mov    -0x10(%ebp),%eax
 835:	a3 a8 0b 00 00       	mov    %eax,0xba8
 83a:	a1 a8 0b 00 00       	mov    0xba8,%eax
 83f:	a3 a0 0b 00 00       	mov    %eax,0xba0
    base.s.size = 0;
 844:	c7 05 a4 0b 00 00 00 	movl   $0x0,0xba4
 84b:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 84e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 851:	8b 00                	mov    (%eax),%eax
 853:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 856:	8b 45 f4             	mov    -0xc(%ebp),%eax
 859:	8b 40 04             	mov    0x4(%eax),%eax
 85c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 85f:	72 4d                	jb     8ae <malloc+0xa6>
      if(p->s.size == nunits)
 861:	8b 45 f4             	mov    -0xc(%ebp),%eax
 864:	8b 40 04             	mov    0x4(%eax),%eax
 867:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 86a:	75 0c                	jne    878 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 86c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 86f:	8b 10                	mov    (%eax),%edx
 871:	8b 45 f0             	mov    -0x10(%ebp),%eax
 874:	89 10                	mov    %edx,(%eax)
 876:	eb 26                	jmp    89e <malloc+0x96>
      else {
        p->s.size -= nunits;
 878:	8b 45 f4             	mov    -0xc(%ebp),%eax
 87b:	8b 40 04             	mov    0x4(%eax),%eax
 87e:	2b 45 ec             	sub    -0x14(%ebp),%eax
 881:	89 c2                	mov    %eax,%edx
 883:	8b 45 f4             	mov    -0xc(%ebp),%eax
 886:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 889:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88c:	8b 40 04             	mov    0x4(%eax),%eax
 88f:	c1 e0 03             	shl    $0x3,%eax
 892:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 895:	8b 45 f4             	mov    -0xc(%ebp),%eax
 898:	8b 55 ec             	mov    -0x14(%ebp),%edx
 89b:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 89e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a1:	a3 a8 0b 00 00       	mov    %eax,0xba8
      return (void*)(p + 1);
 8a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a9:	83 c0 08             	add    $0x8,%eax
 8ac:	eb 38                	jmp    8e6 <malloc+0xde>
    }
    if(p == freep)
 8ae:	a1 a8 0b 00 00       	mov    0xba8,%eax
 8b3:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8b6:	75 1b                	jne    8d3 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 8b8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8bb:	89 04 24             	mov    %eax,(%esp)
 8be:	e8 ed fe ff ff       	call   7b0 <morecore>
 8c3:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8c6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8ca:	75 07                	jne    8d3 <malloc+0xcb>
        return 0;
 8cc:	b8 00 00 00 00       	mov    $0x0,%eax
 8d1:	eb 13                	jmp    8e6 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d6:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8dc:	8b 00                	mov    (%eax),%eax
 8de:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 8e1:	e9 70 ff ff ff       	jmp    856 <malloc+0x4e>
}
 8e6:	c9                   	leave  
 8e7:	c3                   	ret    
