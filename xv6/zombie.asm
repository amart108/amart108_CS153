
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 10             	sub    $0x10,%esp
  if(fork() > 0)
   9:	e8 7c 02 00 00       	call   28a <fork>
   e:	85 c0                	test   %eax,%eax
  10:	7e 0c                	jle    1e <main+0x1e>
    sleep(5);  // Let child exit before parent.
  12:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  19:	e8 04 03 00 00       	call   322 <sleep>
  exit(1);
  1e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  25:	e8 68 02 00 00       	call   292 <exit>

0000002a <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  2a:	55                   	push   %ebp
  2b:	89 e5                	mov    %esp,%ebp
  2d:	57                   	push   %edi
  2e:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  2f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  32:	8b 55 10             	mov    0x10(%ebp),%edx
  35:	8b 45 0c             	mov    0xc(%ebp),%eax
  38:	89 cb                	mov    %ecx,%ebx
  3a:	89 df                	mov    %ebx,%edi
  3c:	89 d1                	mov    %edx,%ecx
  3e:	fc                   	cld    
  3f:	f3 aa                	rep stos %al,%es:(%edi)
  41:	89 ca                	mov    %ecx,%edx
  43:	89 fb                	mov    %edi,%ebx
  45:	89 5d 08             	mov    %ebx,0x8(%ebp)
  48:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  4b:	5b                   	pop    %ebx
  4c:	5f                   	pop    %edi
  4d:	5d                   	pop    %ebp
  4e:	c3                   	ret    

0000004f <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  4f:	55                   	push   %ebp
  50:	89 e5                	mov    %esp,%ebp
  52:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  55:	8b 45 08             	mov    0x8(%ebp),%eax
  58:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  5b:	90                   	nop
  5c:	8b 45 08             	mov    0x8(%ebp),%eax
  5f:	8d 50 01             	lea    0x1(%eax),%edx
  62:	89 55 08             	mov    %edx,0x8(%ebp)
  65:	8b 55 0c             	mov    0xc(%ebp),%edx
  68:	8d 4a 01             	lea    0x1(%edx),%ecx
  6b:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  6e:	0f b6 12             	movzbl (%edx),%edx
  71:	88 10                	mov    %dl,(%eax)
  73:	0f b6 00             	movzbl (%eax),%eax
  76:	84 c0                	test   %al,%al
  78:	75 e2                	jne    5c <strcpy+0xd>
    ;
  return os;
  7a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  7d:	c9                   	leave  
  7e:	c3                   	ret    

0000007f <strcmp>:

int
strcmp(const char *p, const char *q)
{
  7f:	55                   	push   %ebp
  80:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  82:	eb 08                	jmp    8c <strcmp+0xd>
    p++, q++;
  84:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  88:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  8c:	8b 45 08             	mov    0x8(%ebp),%eax
  8f:	0f b6 00             	movzbl (%eax),%eax
  92:	84 c0                	test   %al,%al
  94:	74 10                	je     a6 <strcmp+0x27>
  96:	8b 45 08             	mov    0x8(%ebp),%eax
  99:	0f b6 10             	movzbl (%eax),%edx
  9c:	8b 45 0c             	mov    0xc(%ebp),%eax
  9f:	0f b6 00             	movzbl (%eax),%eax
  a2:	38 c2                	cmp    %al,%dl
  a4:	74 de                	je     84 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  a6:	8b 45 08             	mov    0x8(%ebp),%eax
  a9:	0f b6 00             	movzbl (%eax),%eax
  ac:	0f b6 d0             	movzbl %al,%edx
  af:	8b 45 0c             	mov    0xc(%ebp),%eax
  b2:	0f b6 00             	movzbl (%eax),%eax
  b5:	0f b6 c0             	movzbl %al,%eax
  b8:	29 c2                	sub    %eax,%edx
  ba:	89 d0                	mov    %edx,%eax
}
  bc:	5d                   	pop    %ebp
  bd:	c3                   	ret    

000000be <strlen>:

uint
strlen(char *s)
{
  be:	55                   	push   %ebp
  bf:	89 e5                	mov    %esp,%ebp
  c1:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  c4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  cb:	eb 04                	jmp    d1 <strlen+0x13>
  cd:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  d1:	8b 55 fc             	mov    -0x4(%ebp),%edx
  d4:	8b 45 08             	mov    0x8(%ebp),%eax
  d7:	01 d0                	add    %edx,%eax
  d9:	0f b6 00             	movzbl (%eax),%eax
  dc:	84 c0                	test   %al,%al
  de:	75 ed                	jne    cd <strlen+0xf>
    ;
  return n;
  e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  e3:	c9                   	leave  
  e4:	c3                   	ret    

000000e5 <memset>:

void*
memset(void *dst, int c, uint n)
{
  e5:	55                   	push   %ebp
  e6:	89 e5                	mov    %esp,%ebp
  e8:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
  eb:	8b 45 10             	mov    0x10(%ebp),%eax
  ee:	89 44 24 08          	mov    %eax,0x8(%esp)
  f2:	8b 45 0c             	mov    0xc(%ebp),%eax
  f5:	89 44 24 04          	mov    %eax,0x4(%esp)
  f9:	8b 45 08             	mov    0x8(%ebp),%eax
  fc:	89 04 24             	mov    %eax,(%esp)
  ff:	e8 26 ff ff ff       	call   2a <stosb>
  return dst;
 104:	8b 45 08             	mov    0x8(%ebp),%eax
}
 107:	c9                   	leave  
 108:	c3                   	ret    

00000109 <strchr>:

char*
strchr(const char *s, char c)
{
 109:	55                   	push   %ebp
 10a:	89 e5                	mov    %esp,%ebp
 10c:	83 ec 04             	sub    $0x4,%esp
 10f:	8b 45 0c             	mov    0xc(%ebp),%eax
 112:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 115:	eb 14                	jmp    12b <strchr+0x22>
    if(*s == c)
 117:	8b 45 08             	mov    0x8(%ebp),%eax
 11a:	0f b6 00             	movzbl (%eax),%eax
 11d:	3a 45 fc             	cmp    -0x4(%ebp),%al
 120:	75 05                	jne    127 <strchr+0x1e>
      return (char*)s;
 122:	8b 45 08             	mov    0x8(%ebp),%eax
 125:	eb 13                	jmp    13a <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 127:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 12b:	8b 45 08             	mov    0x8(%ebp),%eax
 12e:	0f b6 00             	movzbl (%eax),%eax
 131:	84 c0                	test   %al,%al
 133:	75 e2                	jne    117 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 135:	b8 00 00 00 00       	mov    $0x0,%eax
}
 13a:	c9                   	leave  
 13b:	c3                   	ret    

0000013c <gets>:

char*
gets(char *buf, int max)
{
 13c:	55                   	push   %ebp
 13d:	89 e5                	mov    %esp,%ebp
 13f:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 142:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 149:	eb 4c                	jmp    197 <gets+0x5b>
    cc = read(0, &c, 1);
 14b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 152:	00 
 153:	8d 45 ef             	lea    -0x11(%ebp),%eax
 156:	89 44 24 04          	mov    %eax,0x4(%esp)
 15a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 161:	e8 44 01 00 00       	call   2aa <read>
 166:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 169:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 16d:	7f 02                	jg     171 <gets+0x35>
      break;
 16f:	eb 31                	jmp    1a2 <gets+0x66>
    buf[i++] = c;
 171:	8b 45 f4             	mov    -0xc(%ebp),%eax
 174:	8d 50 01             	lea    0x1(%eax),%edx
 177:	89 55 f4             	mov    %edx,-0xc(%ebp)
 17a:	89 c2                	mov    %eax,%edx
 17c:	8b 45 08             	mov    0x8(%ebp),%eax
 17f:	01 c2                	add    %eax,%edx
 181:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 185:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 187:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 18b:	3c 0a                	cmp    $0xa,%al
 18d:	74 13                	je     1a2 <gets+0x66>
 18f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 193:	3c 0d                	cmp    $0xd,%al
 195:	74 0b                	je     1a2 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 197:	8b 45 f4             	mov    -0xc(%ebp),%eax
 19a:	83 c0 01             	add    $0x1,%eax
 19d:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1a0:	7c a9                	jl     14b <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1a2:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1a5:	8b 45 08             	mov    0x8(%ebp),%eax
 1a8:	01 d0                	add    %edx,%eax
 1aa:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1ad:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1b0:	c9                   	leave  
 1b1:	c3                   	ret    

000001b2 <stat>:

int
stat(char *n, struct stat *st)
{
 1b2:	55                   	push   %ebp
 1b3:	89 e5                	mov    %esp,%ebp
 1b5:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1b8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1bf:	00 
 1c0:	8b 45 08             	mov    0x8(%ebp),%eax
 1c3:	89 04 24             	mov    %eax,(%esp)
 1c6:	e8 07 01 00 00       	call   2d2 <open>
 1cb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1ce:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1d2:	79 07                	jns    1db <stat+0x29>
    return -1;
 1d4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1d9:	eb 23                	jmp    1fe <stat+0x4c>
  r = fstat(fd, st);
 1db:	8b 45 0c             	mov    0xc(%ebp),%eax
 1de:	89 44 24 04          	mov    %eax,0x4(%esp)
 1e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1e5:	89 04 24             	mov    %eax,(%esp)
 1e8:	e8 fd 00 00 00       	call   2ea <fstat>
 1ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1f3:	89 04 24             	mov    %eax,(%esp)
 1f6:	e8 bf 00 00 00       	call   2ba <close>
  return r;
 1fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 1fe:	c9                   	leave  
 1ff:	c3                   	ret    

00000200 <atoi>:

int
atoi(const char *s)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 206:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 20d:	eb 25                	jmp    234 <atoi+0x34>
    n = n*10 + *s++ - '0';
 20f:	8b 55 fc             	mov    -0x4(%ebp),%edx
 212:	89 d0                	mov    %edx,%eax
 214:	c1 e0 02             	shl    $0x2,%eax
 217:	01 d0                	add    %edx,%eax
 219:	01 c0                	add    %eax,%eax
 21b:	89 c1                	mov    %eax,%ecx
 21d:	8b 45 08             	mov    0x8(%ebp),%eax
 220:	8d 50 01             	lea    0x1(%eax),%edx
 223:	89 55 08             	mov    %edx,0x8(%ebp)
 226:	0f b6 00             	movzbl (%eax),%eax
 229:	0f be c0             	movsbl %al,%eax
 22c:	01 c8                	add    %ecx,%eax
 22e:	83 e8 30             	sub    $0x30,%eax
 231:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 234:	8b 45 08             	mov    0x8(%ebp),%eax
 237:	0f b6 00             	movzbl (%eax),%eax
 23a:	3c 2f                	cmp    $0x2f,%al
 23c:	7e 0a                	jle    248 <atoi+0x48>
 23e:	8b 45 08             	mov    0x8(%ebp),%eax
 241:	0f b6 00             	movzbl (%eax),%eax
 244:	3c 39                	cmp    $0x39,%al
 246:	7e c7                	jle    20f <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 248:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 24b:	c9                   	leave  
 24c:	c3                   	ret    

0000024d <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 24d:	55                   	push   %ebp
 24e:	89 e5                	mov    %esp,%ebp
 250:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 253:	8b 45 08             	mov    0x8(%ebp),%eax
 256:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 259:	8b 45 0c             	mov    0xc(%ebp),%eax
 25c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 25f:	eb 17                	jmp    278 <memmove+0x2b>
    *dst++ = *src++;
 261:	8b 45 fc             	mov    -0x4(%ebp),%eax
 264:	8d 50 01             	lea    0x1(%eax),%edx
 267:	89 55 fc             	mov    %edx,-0x4(%ebp)
 26a:	8b 55 f8             	mov    -0x8(%ebp),%edx
 26d:	8d 4a 01             	lea    0x1(%edx),%ecx
 270:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 273:	0f b6 12             	movzbl (%edx),%edx
 276:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 278:	8b 45 10             	mov    0x10(%ebp),%eax
 27b:	8d 50 ff             	lea    -0x1(%eax),%edx
 27e:	89 55 10             	mov    %edx,0x10(%ebp)
 281:	85 c0                	test   %eax,%eax
 283:	7f dc                	jg     261 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 285:	8b 45 08             	mov    0x8(%ebp),%eax
}
 288:	c9                   	leave  
 289:	c3                   	ret    

0000028a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 28a:	b8 01 00 00 00       	mov    $0x1,%eax
 28f:	cd 40                	int    $0x40
 291:	c3                   	ret    

00000292 <exit>:
SYSCALL(exit)
 292:	b8 02 00 00 00       	mov    $0x2,%eax
 297:	cd 40                	int    $0x40
 299:	c3                   	ret    

0000029a <wait>:
SYSCALL(wait)
 29a:	b8 03 00 00 00       	mov    $0x3,%eax
 29f:	cd 40                	int    $0x40
 2a1:	c3                   	ret    

000002a2 <pipe>:
SYSCALL(pipe)
 2a2:	b8 04 00 00 00       	mov    $0x4,%eax
 2a7:	cd 40                	int    $0x40
 2a9:	c3                   	ret    

000002aa <read>:
SYSCALL(read)
 2aa:	b8 05 00 00 00       	mov    $0x5,%eax
 2af:	cd 40                	int    $0x40
 2b1:	c3                   	ret    

000002b2 <write>:
SYSCALL(write)
 2b2:	b8 10 00 00 00       	mov    $0x10,%eax
 2b7:	cd 40                	int    $0x40
 2b9:	c3                   	ret    

000002ba <close>:
SYSCALL(close)
 2ba:	b8 15 00 00 00       	mov    $0x15,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <kill>:
SYSCALL(kill)
 2c2:	b8 06 00 00 00       	mov    $0x6,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <exec>:
SYSCALL(exec)
 2ca:	b8 07 00 00 00       	mov    $0x7,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <open>:
SYSCALL(open)
 2d2:	b8 0f 00 00 00       	mov    $0xf,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <mknod>:
SYSCALL(mknod)
 2da:	b8 11 00 00 00       	mov    $0x11,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <unlink>:
SYSCALL(unlink)
 2e2:	b8 12 00 00 00       	mov    $0x12,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <fstat>:
SYSCALL(fstat)
 2ea:	b8 08 00 00 00       	mov    $0x8,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <link>:
SYSCALL(link)
 2f2:	b8 13 00 00 00       	mov    $0x13,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <mkdir>:
SYSCALL(mkdir)
 2fa:	b8 14 00 00 00       	mov    $0x14,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <chdir>:
SYSCALL(chdir)
 302:	b8 09 00 00 00       	mov    $0x9,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <dup>:
SYSCALL(dup)
 30a:	b8 0a 00 00 00       	mov    $0xa,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <getpid>:
SYSCALL(getpid)
 312:	b8 0b 00 00 00       	mov    $0xb,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <sbrk>:
SYSCALL(sbrk)
 31a:	b8 0c 00 00 00       	mov    $0xc,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <sleep>:
SYSCALL(sleep)
 322:	b8 0d 00 00 00       	mov    $0xd,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <uptime>:
SYSCALL(uptime)
 32a:	b8 0e 00 00 00       	mov    $0xe,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <waitpid>:
SYSCALL(waitpid)
 332:	b8 16 00 00 00       	mov    $0x16,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <setprio>:
SYSCALL(setprio)
 33a:	b8 17 00 00 00       	mov    $0x17,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 342:	55                   	push   %ebp
 343:	89 e5                	mov    %esp,%ebp
 345:	83 ec 18             	sub    $0x18,%esp
 348:	8b 45 0c             	mov    0xc(%ebp),%eax
 34b:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 34e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 355:	00 
 356:	8d 45 f4             	lea    -0xc(%ebp),%eax
 359:	89 44 24 04          	mov    %eax,0x4(%esp)
 35d:	8b 45 08             	mov    0x8(%ebp),%eax
 360:	89 04 24             	mov    %eax,(%esp)
 363:	e8 4a ff ff ff       	call   2b2 <write>
}
 368:	c9                   	leave  
 369:	c3                   	ret    

0000036a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 36a:	55                   	push   %ebp
 36b:	89 e5                	mov    %esp,%ebp
 36d:	56                   	push   %esi
 36e:	53                   	push   %ebx
 36f:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 372:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 379:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 37d:	74 17                	je     396 <printint+0x2c>
 37f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 383:	79 11                	jns    396 <printint+0x2c>
    neg = 1;
 385:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 38c:	8b 45 0c             	mov    0xc(%ebp),%eax
 38f:	f7 d8                	neg    %eax
 391:	89 45 ec             	mov    %eax,-0x14(%ebp)
 394:	eb 06                	jmp    39c <printint+0x32>
  } else {
    x = xx;
 396:	8b 45 0c             	mov    0xc(%ebp),%eax
 399:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 39c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 3a3:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 3a6:	8d 41 01             	lea    0x1(%ecx),%eax
 3a9:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3ac:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3af:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3b2:	ba 00 00 00 00       	mov    $0x0,%edx
 3b7:	f7 f3                	div    %ebx
 3b9:	89 d0                	mov    %edx,%eax
 3bb:	0f b6 80 3c 0a 00 00 	movzbl 0xa3c(%eax),%eax
 3c2:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 3c6:	8b 75 10             	mov    0x10(%ebp),%esi
 3c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3cc:	ba 00 00 00 00       	mov    $0x0,%edx
 3d1:	f7 f6                	div    %esi
 3d3:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3d6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 3da:	75 c7                	jne    3a3 <printint+0x39>
  if(neg)
 3dc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3e0:	74 10                	je     3f2 <printint+0x88>
    buf[i++] = '-';
 3e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3e5:	8d 50 01             	lea    0x1(%eax),%edx
 3e8:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3eb:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 3f0:	eb 1f                	jmp    411 <printint+0xa7>
 3f2:	eb 1d                	jmp    411 <printint+0xa7>
    putc(fd, buf[i]);
 3f4:	8d 55 dc             	lea    -0x24(%ebp),%edx
 3f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3fa:	01 d0                	add    %edx,%eax
 3fc:	0f b6 00             	movzbl (%eax),%eax
 3ff:	0f be c0             	movsbl %al,%eax
 402:	89 44 24 04          	mov    %eax,0x4(%esp)
 406:	8b 45 08             	mov    0x8(%ebp),%eax
 409:	89 04 24             	mov    %eax,(%esp)
 40c:	e8 31 ff ff ff       	call   342 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 411:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 415:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 419:	79 d9                	jns    3f4 <printint+0x8a>
    putc(fd, buf[i]);
}
 41b:	83 c4 30             	add    $0x30,%esp
 41e:	5b                   	pop    %ebx
 41f:	5e                   	pop    %esi
 420:	5d                   	pop    %ebp
 421:	c3                   	ret    

00000422 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 422:	55                   	push   %ebp
 423:	89 e5                	mov    %esp,%ebp
 425:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 428:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 42f:	8d 45 0c             	lea    0xc(%ebp),%eax
 432:	83 c0 04             	add    $0x4,%eax
 435:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 438:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 43f:	e9 7c 01 00 00       	jmp    5c0 <printf+0x19e>
    c = fmt[i] & 0xff;
 444:	8b 55 0c             	mov    0xc(%ebp),%edx
 447:	8b 45 f0             	mov    -0x10(%ebp),%eax
 44a:	01 d0                	add    %edx,%eax
 44c:	0f b6 00             	movzbl (%eax),%eax
 44f:	0f be c0             	movsbl %al,%eax
 452:	25 ff 00 00 00       	and    $0xff,%eax
 457:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 45a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 45e:	75 2c                	jne    48c <printf+0x6a>
      if(c == '%'){
 460:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 464:	75 0c                	jne    472 <printf+0x50>
        state = '%';
 466:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 46d:	e9 4a 01 00 00       	jmp    5bc <printf+0x19a>
      } else {
        putc(fd, c);
 472:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 475:	0f be c0             	movsbl %al,%eax
 478:	89 44 24 04          	mov    %eax,0x4(%esp)
 47c:	8b 45 08             	mov    0x8(%ebp),%eax
 47f:	89 04 24             	mov    %eax,(%esp)
 482:	e8 bb fe ff ff       	call   342 <putc>
 487:	e9 30 01 00 00       	jmp    5bc <printf+0x19a>
      }
    } else if(state == '%'){
 48c:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 490:	0f 85 26 01 00 00    	jne    5bc <printf+0x19a>
      if(c == 'd'){
 496:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 49a:	75 2d                	jne    4c9 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 49c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 49f:	8b 00                	mov    (%eax),%eax
 4a1:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 4a8:	00 
 4a9:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 4b0:	00 
 4b1:	89 44 24 04          	mov    %eax,0x4(%esp)
 4b5:	8b 45 08             	mov    0x8(%ebp),%eax
 4b8:	89 04 24             	mov    %eax,(%esp)
 4bb:	e8 aa fe ff ff       	call   36a <printint>
        ap++;
 4c0:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4c4:	e9 ec 00 00 00       	jmp    5b5 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 4c9:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 4cd:	74 06                	je     4d5 <printf+0xb3>
 4cf:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 4d3:	75 2d                	jne    502 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 4d5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4d8:	8b 00                	mov    (%eax),%eax
 4da:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 4e1:	00 
 4e2:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 4e9:	00 
 4ea:	89 44 24 04          	mov    %eax,0x4(%esp)
 4ee:	8b 45 08             	mov    0x8(%ebp),%eax
 4f1:	89 04 24             	mov    %eax,(%esp)
 4f4:	e8 71 fe ff ff       	call   36a <printint>
        ap++;
 4f9:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4fd:	e9 b3 00 00 00       	jmp    5b5 <printf+0x193>
      } else if(c == 's'){
 502:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 506:	75 45                	jne    54d <printf+0x12b>
        s = (char*)*ap;
 508:	8b 45 e8             	mov    -0x18(%ebp),%eax
 50b:	8b 00                	mov    (%eax),%eax
 50d:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 510:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 514:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 518:	75 09                	jne    523 <printf+0x101>
          s = "(null)";
 51a:	c7 45 f4 ee 07 00 00 	movl   $0x7ee,-0xc(%ebp)
        while(*s != 0){
 521:	eb 1e                	jmp    541 <printf+0x11f>
 523:	eb 1c                	jmp    541 <printf+0x11f>
          putc(fd, *s);
 525:	8b 45 f4             	mov    -0xc(%ebp),%eax
 528:	0f b6 00             	movzbl (%eax),%eax
 52b:	0f be c0             	movsbl %al,%eax
 52e:	89 44 24 04          	mov    %eax,0x4(%esp)
 532:	8b 45 08             	mov    0x8(%ebp),%eax
 535:	89 04 24             	mov    %eax,(%esp)
 538:	e8 05 fe ff ff       	call   342 <putc>
          s++;
 53d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 541:	8b 45 f4             	mov    -0xc(%ebp),%eax
 544:	0f b6 00             	movzbl (%eax),%eax
 547:	84 c0                	test   %al,%al
 549:	75 da                	jne    525 <printf+0x103>
 54b:	eb 68                	jmp    5b5 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 54d:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 551:	75 1d                	jne    570 <printf+0x14e>
        putc(fd, *ap);
 553:	8b 45 e8             	mov    -0x18(%ebp),%eax
 556:	8b 00                	mov    (%eax),%eax
 558:	0f be c0             	movsbl %al,%eax
 55b:	89 44 24 04          	mov    %eax,0x4(%esp)
 55f:	8b 45 08             	mov    0x8(%ebp),%eax
 562:	89 04 24             	mov    %eax,(%esp)
 565:	e8 d8 fd ff ff       	call   342 <putc>
        ap++;
 56a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 56e:	eb 45                	jmp    5b5 <printf+0x193>
      } else if(c == '%'){
 570:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 574:	75 17                	jne    58d <printf+0x16b>
        putc(fd, c);
 576:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 579:	0f be c0             	movsbl %al,%eax
 57c:	89 44 24 04          	mov    %eax,0x4(%esp)
 580:	8b 45 08             	mov    0x8(%ebp),%eax
 583:	89 04 24             	mov    %eax,(%esp)
 586:	e8 b7 fd ff ff       	call   342 <putc>
 58b:	eb 28                	jmp    5b5 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 58d:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 594:	00 
 595:	8b 45 08             	mov    0x8(%ebp),%eax
 598:	89 04 24             	mov    %eax,(%esp)
 59b:	e8 a2 fd ff ff       	call   342 <putc>
        putc(fd, c);
 5a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5a3:	0f be c0             	movsbl %al,%eax
 5a6:	89 44 24 04          	mov    %eax,0x4(%esp)
 5aa:	8b 45 08             	mov    0x8(%ebp),%eax
 5ad:	89 04 24             	mov    %eax,(%esp)
 5b0:	e8 8d fd ff ff       	call   342 <putc>
      }
      state = 0;
 5b5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5bc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 5c0:	8b 55 0c             	mov    0xc(%ebp),%edx
 5c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5c6:	01 d0                	add    %edx,%eax
 5c8:	0f b6 00             	movzbl (%eax),%eax
 5cb:	84 c0                	test   %al,%al
 5cd:	0f 85 71 fe ff ff    	jne    444 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5d3:	c9                   	leave  
 5d4:	c3                   	ret    

000005d5 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5d5:	55                   	push   %ebp
 5d6:	89 e5                	mov    %esp,%ebp
 5d8:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5db:	8b 45 08             	mov    0x8(%ebp),%eax
 5de:	83 e8 08             	sub    $0x8,%eax
 5e1:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5e4:	a1 58 0a 00 00       	mov    0xa58,%eax
 5e9:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5ec:	eb 24                	jmp    612 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5ee:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5f1:	8b 00                	mov    (%eax),%eax
 5f3:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5f6:	77 12                	ja     60a <free+0x35>
 5f8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5fb:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5fe:	77 24                	ja     624 <free+0x4f>
 600:	8b 45 fc             	mov    -0x4(%ebp),%eax
 603:	8b 00                	mov    (%eax),%eax
 605:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 608:	77 1a                	ja     624 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 60a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 60d:	8b 00                	mov    (%eax),%eax
 60f:	89 45 fc             	mov    %eax,-0x4(%ebp)
 612:	8b 45 f8             	mov    -0x8(%ebp),%eax
 615:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 618:	76 d4                	jbe    5ee <free+0x19>
 61a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 61d:	8b 00                	mov    (%eax),%eax
 61f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 622:	76 ca                	jbe    5ee <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 624:	8b 45 f8             	mov    -0x8(%ebp),%eax
 627:	8b 40 04             	mov    0x4(%eax),%eax
 62a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 631:	8b 45 f8             	mov    -0x8(%ebp),%eax
 634:	01 c2                	add    %eax,%edx
 636:	8b 45 fc             	mov    -0x4(%ebp),%eax
 639:	8b 00                	mov    (%eax),%eax
 63b:	39 c2                	cmp    %eax,%edx
 63d:	75 24                	jne    663 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 63f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 642:	8b 50 04             	mov    0x4(%eax),%edx
 645:	8b 45 fc             	mov    -0x4(%ebp),%eax
 648:	8b 00                	mov    (%eax),%eax
 64a:	8b 40 04             	mov    0x4(%eax),%eax
 64d:	01 c2                	add    %eax,%edx
 64f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 652:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 655:	8b 45 fc             	mov    -0x4(%ebp),%eax
 658:	8b 00                	mov    (%eax),%eax
 65a:	8b 10                	mov    (%eax),%edx
 65c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 65f:	89 10                	mov    %edx,(%eax)
 661:	eb 0a                	jmp    66d <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 663:	8b 45 fc             	mov    -0x4(%ebp),%eax
 666:	8b 10                	mov    (%eax),%edx
 668:	8b 45 f8             	mov    -0x8(%ebp),%eax
 66b:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 66d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 670:	8b 40 04             	mov    0x4(%eax),%eax
 673:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 67a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67d:	01 d0                	add    %edx,%eax
 67f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 682:	75 20                	jne    6a4 <free+0xcf>
    p->s.size += bp->s.size;
 684:	8b 45 fc             	mov    -0x4(%ebp),%eax
 687:	8b 50 04             	mov    0x4(%eax),%edx
 68a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 68d:	8b 40 04             	mov    0x4(%eax),%eax
 690:	01 c2                	add    %eax,%edx
 692:	8b 45 fc             	mov    -0x4(%ebp),%eax
 695:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 698:	8b 45 f8             	mov    -0x8(%ebp),%eax
 69b:	8b 10                	mov    (%eax),%edx
 69d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a0:	89 10                	mov    %edx,(%eax)
 6a2:	eb 08                	jmp    6ac <free+0xd7>
  } else
    p->s.ptr = bp;
 6a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a7:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6aa:	89 10                	mov    %edx,(%eax)
  freep = p;
 6ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6af:	a3 58 0a 00 00       	mov    %eax,0xa58
}
 6b4:	c9                   	leave  
 6b5:	c3                   	ret    

000006b6 <morecore>:

static Header*
morecore(uint nu)
{
 6b6:	55                   	push   %ebp
 6b7:	89 e5                	mov    %esp,%ebp
 6b9:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6bc:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6c3:	77 07                	ja     6cc <morecore+0x16>
    nu = 4096;
 6c5:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6cc:	8b 45 08             	mov    0x8(%ebp),%eax
 6cf:	c1 e0 03             	shl    $0x3,%eax
 6d2:	89 04 24             	mov    %eax,(%esp)
 6d5:	e8 40 fc ff ff       	call   31a <sbrk>
 6da:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 6dd:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 6e1:	75 07                	jne    6ea <morecore+0x34>
    return 0;
 6e3:	b8 00 00 00 00       	mov    $0x0,%eax
 6e8:	eb 22                	jmp    70c <morecore+0x56>
  hp = (Header*)p;
 6ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 6f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6f3:	8b 55 08             	mov    0x8(%ebp),%edx
 6f6:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 6f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6fc:	83 c0 08             	add    $0x8,%eax
 6ff:	89 04 24             	mov    %eax,(%esp)
 702:	e8 ce fe ff ff       	call   5d5 <free>
  return freep;
 707:	a1 58 0a 00 00       	mov    0xa58,%eax
}
 70c:	c9                   	leave  
 70d:	c3                   	ret    

0000070e <malloc>:

void*
malloc(uint nbytes)
{
 70e:	55                   	push   %ebp
 70f:	89 e5                	mov    %esp,%ebp
 711:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 714:	8b 45 08             	mov    0x8(%ebp),%eax
 717:	83 c0 07             	add    $0x7,%eax
 71a:	c1 e8 03             	shr    $0x3,%eax
 71d:	83 c0 01             	add    $0x1,%eax
 720:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 723:	a1 58 0a 00 00       	mov    0xa58,%eax
 728:	89 45 f0             	mov    %eax,-0x10(%ebp)
 72b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 72f:	75 23                	jne    754 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 731:	c7 45 f0 50 0a 00 00 	movl   $0xa50,-0x10(%ebp)
 738:	8b 45 f0             	mov    -0x10(%ebp),%eax
 73b:	a3 58 0a 00 00       	mov    %eax,0xa58
 740:	a1 58 0a 00 00       	mov    0xa58,%eax
 745:	a3 50 0a 00 00       	mov    %eax,0xa50
    base.s.size = 0;
 74a:	c7 05 54 0a 00 00 00 	movl   $0x0,0xa54
 751:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 754:	8b 45 f0             	mov    -0x10(%ebp),%eax
 757:	8b 00                	mov    (%eax),%eax
 759:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 75c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 75f:	8b 40 04             	mov    0x4(%eax),%eax
 762:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 765:	72 4d                	jb     7b4 <malloc+0xa6>
      if(p->s.size == nunits)
 767:	8b 45 f4             	mov    -0xc(%ebp),%eax
 76a:	8b 40 04             	mov    0x4(%eax),%eax
 76d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 770:	75 0c                	jne    77e <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 772:	8b 45 f4             	mov    -0xc(%ebp),%eax
 775:	8b 10                	mov    (%eax),%edx
 777:	8b 45 f0             	mov    -0x10(%ebp),%eax
 77a:	89 10                	mov    %edx,(%eax)
 77c:	eb 26                	jmp    7a4 <malloc+0x96>
      else {
        p->s.size -= nunits;
 77e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 781:	8b 40 04             	mov    0x4(%eax),%eax
 784:	2b 45 ec             	sub    -0x14(%ebp),%eax
 787:	89 c2                	mov    %eax,%edx
 789:	8b 45 f4             	mov    -0xc(%ebp),%eax
 78c:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 78f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 792:	8b 40 04             	mov    0x4(%eax),%eax
 795:	c1 e0 03             	shl    $0x3,%eax
 798:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 79b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 79e:	8b 55 ec             	mov    -0x14(%ebp),%edx
 7a1:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7a7:	a3 58 0a 00 00       	mov    %eax,0xa58
      return (void*)(p + 1);
 7ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7af:	83 c0 08             	add    $0x8,%eax
 7b2:	eb 38                	jmp    7ec <malloc+0xde>
    }
    if(p == freep)
 7b4:	a1 58 0a 00 00       	mov    0xa58,%eax
 7b9:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 7bc:	75 1b                	jne    7d9 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 7be:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7c1:	89 04 24             	mov    %eax,(%esp)
 7c4:	e8 ed fe ff ff       	call   6b6 <morecore>
 7c9:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7cc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7d0:	75 07                	jne    7d9 <malloc+0xcb>
        return 0;
 7d2:	b8 00 00 00 00       	mov    $0x0,%eax
 7d7:	eb 13                	jmp    7ec <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7dc:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7df:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e2:	8b 00                	mov    (%eax),%eax
 7e4:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 7e7:	e9 70 ff ff ff       	jmp    75c <malloc+0x4e>
}
 7ec:	c9                   	leave  
 7ed:	c3                   	ret    
