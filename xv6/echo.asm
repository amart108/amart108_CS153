
_echo:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int i;

  for(i = 1; i < argc; i++)
   9:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  10:	00 
  11:	eb 4b                	jmp    5e <main+0x5e>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  13:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  17:	83 c0 01             	add    $0x1,%eax
  1a:	3b 45 08             	cmp    0x8(%ebp),%eax
  1d:	7d 07                	jge    26 <main+0x26>
  1f:	b8 37 08 00 00       	mov    $0x837,%eax
  24:	eb 05                	jmp    2b <main+0x2b>
  26:	b8 39 08 00 00       	mov    $0x839,%eax
  2b:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  2f:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
  36:	8b 55 0c             	mov    0xc(%ebp),%edx
  39:	01 ca                	add    %ecx,%edx
  3b:	8b 12                	mov    (%edx),%edx
  3d:	89 44 24 0c          	mov    %eax,0xc(%esp)
  41:	89 54 24 08          	mov    %edx,0x8(%esp)
  45:	c7 44 24 04 3b 08 00 	movl   $0x83b,0x4(%esp)
  4c:	00 
  4d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  54:	e8 12 04 00 00       	call   46b <printf>
int
main(int argc, char *argv[])
{
  int i;

  for(i = 1; i < argc; i++)
  59:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  5e:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  62:	3b 45 08             	cmp    0x8(%ebp),%eax
  65:	7c ac                	jl     13 <main+0x13>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  exit(0);
  67:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  6e:	e8 68 02 00 00       	call   2db <exit>

00000073 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  73:	55                   	push   %ebp
  74:	89 e5                	mov    %esp,%ebp
  76:	57                   	push   %edi
  77:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  78:	8b 4d 08             	mov    0x8(%ebp),%ecx
  7b:	8b 55 10             	mov    0x10(%ebp),%edx
  7e:	8b 45 0c             	mov    0xc(%ebp),%eax
  81:	89 cb                	mov    %ecx,%ebx
  83:	89 df                	mov    %ebx,%edi
  85:	89 d1                	mov    %edx,%ecx
  87:	fc                   	cld    
  88:	f3 aa                	rep stos %al,%es:(%edi)
  8a:	89 ca                	mov    %ecx,%edx
  8c:	89 fb                	mov    %edi,%ebx
  8e:	89 5d 08             	mov    %ebx,0x8(%ebp)
  91:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  94:	5b                   	pop    %ebx
  95:	5f                   	pop    %edi
  96:	5d                   	pop    %ebp
  97:	c3                   	ret    

00000098 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  98:	55                   	push   %ebp
  99:	89 e5                	mov    %esp,%ebp
  9b:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  9e:	8b 45 08             	mov    0x8(%ebp),%eax
  a1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  a4:	90                   	nop
  a5:	8b 45 08             	mov    0x8(%ebp),%eax
  a8:	8d 50 01             	lea    0x1(%eax),%edx
  ab:	89 55 08             	mov    %edx,0x8(%ebp)
  ae:	8b 55 0c             	mov    0xc(%ebp),%edx
  b1:	8d 4a 01             	lea    0x1(%edx),%ecx
  b4:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  b7:	0f b6 12             	movzbl (%edx),%edx
  ba:	88 10                	mov    %dl,(%eax)
  bc:	0f b6 00             	movzbl (%eax),%eax
  bf:	84 c0                	test   %al,%al
  c1:	75 e2                	jne    a5 <strcpy+0xd>
    ;
  return os;
  c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  c6:	c9                   	leave  
  c7:	c3                   	ret    

000000c8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  c8:	55                   	push   %ebp
  c9:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  cb:	eb 08                	jmp    d5 <strcmp+0xd>
    p++, q++;
  cd:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  d1:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  d5:	8b 45 08             	mov    0x8(%ebp),%eax
  d8:	0f b6 00             	movzbl (%eax),%eax
  db:	84 c0                	test   %al,%al
  dd:	74 10                	je     ef <strcmp+0x27>
  df:	8b 45 08             	mov    0x8(%ebp),%eax
  e2:	0f b6 10             	movzbl (%eax),%edx
  e5:	8b 45 0c             	mov    0xc(%ebp),%eax
  e8:	0f b6 00             	movzbl (%eax),%eax
  eb:	38 c2                	cmp    %al,%dl
  ed:	74 de                	je     cd <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  ef:	8b 45 08             	mov    0x8(%ebp),%eax
  f2:	0f b6 00             	movzbl (%eax),%eax
  f5:	0f b6 d0             	movzbl %al,%edx
  f8:	8b 45 0c             	mov    0xc(%ebp),%eax
  fb:	0f b6 00             	movzbl (%eax),%eax
  fe:	0f b6 c0             	movzbl %al,%eax
 101:	29 c2                	sub    %eax,%edx
 103:	89 d0                	mov    %edx,%eax
}
 105:	5d                   	pop    %ebp
 106:	c3                   	ret    

00000107 <strlen>:

uint
strlen(char *s)
{
 107:	55                   	push   %ebp
 108:	89 e5                	mov    %esp,%ebp
 10a:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 10d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 114:	eb 04                	jmp    11a <strlen+0x13>
 116:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 11a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 11d:	8b 45 08             	mov    0x8(%ebp),%eax
 120:	01 d0                	add    %edx,%eax
 122:	0f b6 00             	movzbl (%eax),%eax
 125:	84 c0                	test   %al,%al
 127:	75 ed                	jne    116 <strlen+0xf>
    ;
  return n;
 129:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 12c:	c9                   	leave  
 12d:	c3                   	ret    

0000012e <memset>:

void*
memset(void *dst, int c, uint n)
{
 12e:	55                   	push   %ebp
 12f:	89 e5                	mov    %esp,%ebp
 131:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 134:	8b 45 10             	mov    0x10(%ebp),%eax
 137:	89 44 24 08          	mov    %eax,0x8(%esp)
 13b:	8b 45 0c             	mov    0xc(%ebp),%eax
 13e:	89 44 24 04          	mov    %eax,0x4(%esp)
 142:	8b 45 08             	mov    0x8(%ebp),%eax
 145:	89 04 24             	mov    %eax,(%esp)
 148:	e8 26 ff ff ff       	call   73 <stosb>
  return dst;
 14d:	8b 45 08             	mov    0x8(%ebp),%eax
}
 150:	c9                   	leave  
 151:	c3                   	ret    

00000152 <strchr>:

char*
strchr(const char *s, char c)
{
 152:	55                   	push   %ebp
 153:	89 e5                	mov    %esp,%ebp
 155:	83 ec 04             	sub    $0x4,%esp
 158:	8b 45 0c             	mov    0xc(%ebp),%eax
 15b:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 15e:	eb 14                	jmp    174 <strchr+0x22>
    if(*s == c)
 160:	8b 45 08             	mov    0x8(%ebp),%eax
 163:	0f b6 00             	movzbl (%eax),%eax
 166:	3a 45 fc             	cmp    -0x4(%ebp),%al
 169:	75 05                	jne    170 <strchr+0x1e>
      return (char*)s;
 16b:	8b 45 08             	mov    0x8(%ebp),%eax
 16e:	eb 13                	jmp    183 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 170:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 174:	8b 45 08             	mov    0x8(%ebp),%eax
 177:	0f b6 00             	movzbl (%eax),%eax
 17a:	84 c0                	test   %al,%al
 17c:	75 e2                	jne    160 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 17e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 183:	c9                   	leave  
 184:	c3                   	ret    

00000185 <gets>:

char*
gets(char *buf, int max)
{
 185:	55                   	push   %ebp
 186:	89 e5                	mov    %esp,%ebp
 188:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 18b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 192:	eb 4c                	jmp    1e0 <gets+0x5b>
    cc = read(0, &c, 1);
 194:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 19b:	00 
 19c:	8d 45 ef             	lea    -0x11(%ebp),%eax
 19f:	89 44 24 04          	mov    %eax,0x4(%esp)
 1a3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1aa:	e8 44 01 00 00       	call   2f3 <read>
 1af:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1b2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1b6:	7f 02                	jg     1ba <gets+0x35>
      break;
 1b8:	eb 31                	jmp    1eb <gets+0x66>
    buf[i++] = c;
 1ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1bd:	8d 50 01             	lea    0x1(%eax),%edx
 1c0:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1c3:	89 c2                	mov    %eax,%edx
 1c5:	8b 45 08             	mov    0x8(%ebp),%eax
 1c8:	01 c2                	add    %eax,%edx
 1ca:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1ce:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1d0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1d4:	3c 0a                	cmp    $0xa,%al
 1d6:	74 13                	je     1eb <gets+0x66>
 1d8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1dc:	3c 0d                	cmp    $0xd,%al
 1de:	74 0b                	je     1eb <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1e3:	83 c0 01             	add    $0x1,%eax
 1e6:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1e9:	7c a9                	jl     194 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1eb:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1ee:	8b 45 08             	mov    0x8(%ebp),%eax
 1f1:	01 d0                	add    %edx,%eax
 1f3:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1f6:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1f9:	c9                   	leave  
 1fa:	c3                   	ret    

000001fb <stat>:

int
stat(char *n, struct stat *st)
{
 1fb:	55                   	push   %ebp
 1fc:	89 e5                	mov    %esp,%ebp
 1fe:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 201:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 208:	00 
 209:	8b 45 08             	mov    0x8(%ebp),%eax
 20c:	89 04 24             	mov    %eax,(%esp)
 20f:	e8 07 01 00 00       	call   31b <open>
 214:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 217:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 21b:	79 07                	jns    224 <stat+0x29>
    return -1;
 21d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 222:	eb 23                	jmp    247 <stat+0x4c>
  r = fstat(fd, st);
 224:	8b 45 0c             	mov    0xc(%ebp),%eax
 227:	89 44 24 04          	mov    %eax,0x4(%esp)
 22b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 22e:	89 04 24             	mov    %eax,(%esp)
 231:	e8 fd 00 00 00       	call   333 <fstat>
 236:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 239:	8b 45 f4             	mov    -0xc(%ebp),%eax
 23c:	89 04 24             	mov    %eax,(%esp)
 23f:	e8 bf 00 00 00       	call   303 <close>
  return r;
 244:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 247:	c9                   	leave  
 248:	c3                   	ret    

00000249 <atoi>:

int
atoi(const char *s)
{
 249:	55                   	push   %ebp
 24a:	89 e5                	mov    %esp,%ebp
 24c:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 24f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 256:	eb 25                	jmp    27d <atoi+0x34>
    n = n*10 + *s++ - '0';
 258:	8b 55 fc             	mov    -0x4(%ebp),%edx
 25b:	89 d0                	mov    %edx,%eax
 25d:	c1 e0 02             	shl    $0x2,%eax
 260:	01 d0                	add    %edx,%eax
 262:	01 c0                	add    %eax,%eax
 264:	89 c1                	mov    %eax,%ecx
 266:	8b 45 08             	mov    0x8(%ebp),%eax
 269:	8d 50 01             	lea    0x1(%eax),%edx
 26c:	89 55 08             	mov    %edx,0x8(%ebp)
 26f:	0f b6 00             	movzbl (%eax),%eax
 272:	0f be c0             	movsbl %al,%eax
 275:	01 c8                	add    %ecx,%eax
 277:	83 e8 30             	sub    $0x30,%eax
 27a:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 27d:	8b 45 08             	mov    0x8(%ebp),%eax
 280:	0f b6 00             	movzbl (%eax),%eax
 283:	3c 2f                	cmp    $0x2f,%al
 285:	7e 0a                	jle    291 <atoi+0x48>
 287:	8b 45 08             	mov    0x8(%ebp),%eax
 28a:	0f b6 00             	movzbl (%eax),%eax
 28d:	3c 39                	cmp    $0x39,%al
 28f:	7e c7                	jle    258 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 291:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 294:	c9                   	leave  
 295:	c3                   	ret    

00000296 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 296:	55                   	push   %ebp
 297:	89 e5                	mov    %esp,%ebp
 299:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 29c:	8b 45 08             	mov    0x8(%ebp),%eax
 29f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 2a2:	8b 45 0c             	mov    0xc(%ebp),%eax
 2a5:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2a8:	eb 17                	jmp    2c1 <memmove+0x2b>
    *dst++ = *src++;
 2aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2ad:	8d 50 01             	lea    0x1(%eax),%edx
 2b0:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2b3:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2b6:	8d 4a 01             	lea    0x1(%edx),%ecx
 2b9:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2bc:	0f b6 12             	movzbl (%edx),%edx
 2bf:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2c1:	8b 45 10             	mov    0x10(%ebp),%eax
 2c4:	8d 50 ff             	lea    -0x1(%eax),%edx
 2c7:	89 55 10             	mov    %edx,0x10(%ebp)
 2ca:	85 c0                	test   %eax,%eax
 2cc:	7f dc                	jg     2aa <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2ce:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2d1:	c9                   	leave  
 2d2:	c3                   	ret    

000002d3 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2d3:	b8 01 00 00 00       	mov    $0x1,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <exit>:
SYSCALL(exit)
 2db:	b8 02 00 00 00       	mov    $0x2,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <wait>:
SYSCALL(wait)
 2e3:	b8 03 00 00 00       	mov    $0x3,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <pipe>:
SYSCALL(pipe)
 2eb:	b8 04 00 00 00       	mov    $0x4,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <read>:
SYSCALL(read)
 2f3:	b8 05 00 00 00       	mov    $0x5,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <write>:
SYSCALL(write)
 2fb:	b8 10 00 00 00       	mov    $0x10,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <close>:
SYSCALL(close)
 303:	b8 15 00 00 00       	mov    $0x15,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <kill>:
SYSCALL(kill)
 30b:	b8 06 00 00 00       	mov    $0x6,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <exec>:
SYSCALL(exec)
 313:	b8 07 00 00 00       	mov    $0x7,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <open>:
SYSCALL(open)
 31b:	b8 0f 00 00 00       	mov    $0xf,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <mknod>:
SYSCALL(mknod)
 323:	b8 11 00 00 00       	mov    $0x11,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <unlink>:
SYSCALL(unlink)
 32b:	b8 12 00 00 00       	mov    $0x12,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <fstat>:
SYSCALL(fstat)
 333:	b8 08 00 00 00       	mov    $0x8,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <link>:
SYSCALL(link)
 33b:	b8 13 00 00 00       	mov    $0x13,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <mkdir>:
SYSCALL(mkdir)
 343:	b8 14 00 00 00       	mov    $0x14,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <chdir>:
SYSCALL(chdir)
 34b:	b8 09 00 00 00       	mov    $0x9,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <dup>:
SYSCALL(dup)
 353:	b8 0a 00 00 00       	mov    $0xa,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <getpid>:
SYSCALL(getpid)
 35b:	b8 0b 00 00 00       	mov    $0xb,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <sbrk>:
SYSCALL(sbrk)
 363:	b8 0c 00 00 00       	mov    $0xc,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <sleep>:
SYSCALL(sleep)
 36b:	b8 0d 00 00 00       	mov    $0xd,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <uptime>:
SYSCALL(uptime)
 373:	b8 0e 00 00 00       	mov    $0xe,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <waitpid>:
SYSCALL(waitpid)
 37b:	b8 16 00 00 00       	mov    $0x16,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret    

00000383 <setprio>:
SYSCALL(setprio)
 383:	b8 17 00 00 00       	mov    $0x17,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 38b:	55                   	push   %ebp
 38c:	89 e5                	mov    %esp,%ebp
 38e:	83 ec 18             	sub    $0x18,%esp
 391:	8b 45 0c             	mov    0xc(%ebp),%eax
 394:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 397:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 39e:	00 
 39f:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3a2:	89 44 24 04          	mov    %eax,0x4(%esp)
 3a6:	8b 45 08             	mov    0x8(%ebp),%eax
 3a9:	89 04 24             	mov    %eax,(%esp)
 3ac:	e8 4a ff ff ff       	call   2fb <write>
}
 3b1:	c9                   	leave  
 3b2:	c3                   	ret    

000003b3 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3b3:	55                   	push   %ebp
 3b4:	89 e5                	mov    %esp,%ebp
 3b6:	56                   	push   %esi
 3b7:	53                   	push   %ebx
 3b8:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3bb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3c2:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3c6:	74 17                	je     3df <printint+0x2c>
 3c8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3cc:	79 11                	jns    3df <printint+0x2c>
    neg = 1;
 3ce:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3d5:	8b 45 0c             	mov    0xc(%ebp),%eax
 3d8:	f7 d8                	neg    %eax
 3da:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3dd:	eb 06                	jmp    3e5 <printint+0x32>
  } else {
    x = xx;
 3df:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 3e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 3ec:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 3ef:	8d 41 01             	lea    0x1(%ecx),%eax
 3f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3f5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3fb:	ba 00 00 00 00       	mov    $0x0,%edx
 400:	f7 f3                	div    %ebx
 402:	89 d0                	mov    %edx,%eax
 404:	0f b6 80 8c 0a 00 00 	movzbl 0xa8c(%eax),%eax
 40b:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 40f:	8b 75 10             	mov    0x10(%ebp),%esi
 412:	8b 45 ec             	mov    -0x14(%ebp),%eax
 415:	ba 00 00 00 00       	mov    $0x0,%edx
 41a:	f7 f6                	div    %esi
 41c:	89 45 ec             	mov    %eax,-0x14(%ebp)
 41f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 423:	75 c7                	jne    3ec <printint+0x39>
  if(neg)
 425:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 429:	74 10                	je     43b <printint+0x88>
    buf[i++] = '-';
 42b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 42e:	8d 50 01             	lea    0x1(%eax),%edx
 431:	89 55 f4             	mov    %edx,-0xc(%ebp)
 434:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 439:	eb 1f                	jmp    45a <printint+0xa7>
 43b:	eb 1d                	jmp    45a <printint+0xa7>
    putc(fd, buf[i]);
 43d:	8d 55 dc             	lea    -0x24(%ebp),%edx
 440:	8b 45 f4             	mov    -0xc(%ebp),%eax
 443:	01 d0                	add    %edx,%eax
 445:	0f b6 00             	movzbl (%eax),%eax
 448:	0f be c0             	movsbl %al,%eax
 44b:	89 44 24 04          	mov    %eax,0x4(%esp)
 44f:	8b 45 08             	mov    0x8(%ebp),%eax
 452:	89 04 24             	mov    %eax,(%esp)
 455:	e8 31 ff ff ff       	call   38b <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 45a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 45e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 462:	79 d9                	jns    43d <printint+0x8a>
    putc(fd, buf[i]);
}
 464:	83 c4 30             	add    $0x30,%esp
 467:	5b                   	pop    %ebx
 468:	5e                   	pop    %esi
 469:	5d                   	pop    %ebp
 46a:	c3                   	ret    

0000046b <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 46b:	55                   	push   %ebp
 46c:	89 e5                	mov    %esp,%ebp
 46e:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 471:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 478:	8d 45 0c             	lea    0xc(%ebp),%eax
 47b:	83 c0 04             	add    $0x4,%eax
 47e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 481:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 488:	e9 7c 01 00 00       	jmp    609 <printf+0x19e>
    c = fmt[i] & 0xff;
 48d:	8b 55 0c             	mov    0xc(%ebp),%edx
 490:	8b 45 f0             	mov    -0x10(%ebp),%eax
 493:	01 d0                	add    %edx,%eax
 495:	0f b6 00             	movzbl (%eax),%eax
 498:	0f be c0             	movsbl %al,%eax
 49b:	25 ff 00 00 00       	and    $0xff,%eax
 4a0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 4a3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4a7:	75 2c                	jne    4d5 <printf+0x6a>
      if(c == '%'){
 4a9:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 4ad:	75 0c                	jne    4bb <printf+0x50>
        state = '%';
 4af:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 4b6:	e9 4a 01 00 00       	jmp    605 <printf+0x19a>
      } else {
        putc(fd, c);
 4bb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4be:	0f be c0             	movsbl %al,%eax
 4c1:	89 44 24 04          	mov    %eax,0x4(%esp)
 4c5:	8b 45 08             	mov    0x8(%ebp),%eax
 4c8:	89 04 24             	mov    %eax,(%esp)
 4cb:	e8 bb fe ff ff       	call   38b <putc>
 4d0:	e9 30 01 00 00       	jmp    605 <printf+0x19a>
      }
    } else if(state == '%'){
 4d5:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 4d9:	0f 85 26 01 00 00    	jne    605 <printf+0x19a>
      if(c == 'd'){
 4df:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 4e3:	75 2d                	jne    512 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 4e5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4e8:	8b 00                	mov    (%eax),%eax
 4ea:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 4f1:	00 
 4f2:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 4f9:	00 
 4fa:	89 44 24 04          	mov    %eax,0x4(%esp)
 4fe:	8b 45 08             	mov    0x8(%ebp),%eax
 501:	89 04 24             	mov    %eax,(%esp)
 504:	e8 aa fe ff ff       	call   3b3 <printint>
        ap++;
 509:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 50d:	e9 ec 00 00 00       	jmp    5fe <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 512:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 516:	74 06                	je     51e <printf+0xb3>
 518:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 51c:	75 2d                	jne    54b <printf+0xe0>
        printint(fd, *ap, 16, 0);
 51e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 521:	8b 00                	mov    (%eax),%eax
 523:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 52a:	00 
 52b:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 532:	00 
 533:	89 44 24 04          	mov    %eax,0x4(%esp)
 537:	8b 45 08             	mov    0x8(%ebp),%eax
 53a:	89 04 24             	mov    %eax,(%esp)
 53d:	e8 71 fe ff ff       	call   3b3 <printint>
        ap++;
 542:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 546:	e9 b3 00 00 00       	jmp    5fe <printf+0x193>
      } else if(c == 's'){
 54b:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 54f:	75 45                	jne    596 <printf+0x12b>
        s = (char*)*ap;
 551:	8b 45 e8             	mov    -0x18(%ebp),%eax
 554:	8b 00                	mov    (%eax),%eax
 556:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 559:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 55d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 561:	75 09                	jne    56c <printf+0x101>
          s = "(null)";
 563:	c7 45 f4 40 08 00 00 	movl   $0x840,-0xc(%ebp)
        while(*s != 0){
 56a:	eb 1e                	jmp    58a <printf+0x11f>
 56c:	eb 1c                	jmp    58a <printf+0x11f>
          putc(fd, *s);
 56e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 571:	0f b6 00             	movzbl (%eax),%eax
 574:	0f be c0             	movsbl %al,%eax
 577:	89 44 24 04          	mov    %eax,0x4(%esp)
 57b:	8b 45 08             	mov    0x8(%ebp),%eax
 57e:	89 04 24             	mov    %eax,(%esp)
 581:	e8 05 fe ff ff       	call   38b <putc>
          s++;
 586:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 58a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 58d:	0f b6 00             	movzbl (%eax),%eax
 590:	84 c0                	test   %al,%al
 592:	75 da                	jne    56e <printf+0x103>
 594:	eb 68                	jmp    5fe <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 596:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 59a:	75 1d                	jne    5b9 <printf+0x14e>
        putc(fd, *ap);
 59c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 59f:	8b 00                	mov    (%eax),%eax
 5a1:	0f be c0             	movsbl %al,%eax
 5a4:	89 44 24 04          	mov    %eax,0x4(%esp)
 5a8:	8b 45 08             	mov    0x8(%ebp),%eax
 5ab:	89 04 24             	mov    %eax,(%esp)
 5ae:	e8 d8 fd ff ff       	call   38b <putc>
        ap++;
 5b3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5b7:	eb 45                	jmp    5fe <printf+0x193>
      } else if(c == '%'){
 5b9:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5bd:	75 17                	jne    5d6 <printf+0x16b>
        putc(fd, c);
 5bf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5c2:	0f be c0             	movsbl %al,%eax
 5c5:	89 44 24 04          	mov    %eax,0x4(%esp)
 5c9:	8b 45 08             	mov    0x8(%ebp),%eax
 5cc:	89 04 24             	mov    %eax,(%esp)
 5cf:	e8 b7 fd ff ff       	call   38b <putc>
 5d4:	eb 28                	jmp    5fe <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5d6:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 5dd:	00 
 5de:	8b 45 08             	mov    0x8(%ebp),%eax
 5e1:	89 04 24             	mov    %eax,(%esp)
 5e4:	e8 a2 fd ff ff       	call   38b <putc>
        putc(fd, c);
 5e9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5ec:	0f be c0             	movsbl %al,%eax
 5ef:	89 44 24 04          	mov    %eax,0x4(%esp)
 5f3:	8b 45 08             	mov    0x8(%ebp),%eax
 5f6:	89 04 24             	mov    %eax,(%esp)
 5f9:	e8 8d fd ff ff       	call   38b <putc>
      }
      state = 0;
 5fe:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 605:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 609:	8b 55 0c             	mov    0xc(%ebp),%edx
 60c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 60f:	01 d0                	add    %edx,%eax
 611:	0f b6 00             	movzbl (%eax),%eax
 614:	84 c0                	test   %al,%al
 616:	0f 85 71 fe ff ff    	jne    48d <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 61c:	c9                   	leave  
 61d:	c3                   	ret    

0000061e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 61e:	55                   	push   %ebp
 61f:	89 e5                	mov    %esp,%ebp
 621:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 624:	8b 45 08             	mov    0x8(%ebp),%eax
 627:	83 e8 08             	sub    $0x8,%eax
 62a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 62d:	a1 a8 0a 00 00       	mov    0xaa8,%eax
 632:	89 45 fc             	mov    %eax,-0x4(%ebp)
 635:	eb 24                	jmp    65b <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 637:	8b 45 fc             	mov    -0x4(%ebp),%eax
 63a:	8b 00                	mov    (%eax),%eax
 63c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 63f:	77 12                	ja     653 <free+0x35>
 641:	8b 45 f8             	mov    -0x8(%ebp),%eax
 644:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 647:	77 24                	ja     66d <free+0x4f>
 649:	8b 45 fc             	mov    -0x4(%ebp),%eax
 64c:	8b 00                	mov    (%eax),%eax
 64e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 651:	77 1a                	ja     66d <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 653:	8b 45 fc             	mov    -0x4(%ebp),%eax
 656:	8b 00                	mov    (%eax),%eax
 658:	89 45 fc             	mov    %eax,-0x4(%ebp)
 65b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 65e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 661:	76 d4                	jbe    637 <free+0x19>
 663:	8b 45 fc             	mov    -0x4(%ebp),%eax
 666:	8b 00                	mov    (%eax),%eax
 668:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 66b:	76 ca                	jbe    637 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 66d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 670:	8b 40 04             	mov    0x4(%eax),%eax
 673:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 67a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 67d:	01 c2                	add    %eax,%edx
 67f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 682:	8b 00                	mov    (%eax),%eax
 684:	39 c2                	cmp    %eax,%edx
 686:	75 24                	jne    6ac <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 688:	8b 45 f8             	mov    -0x8(%ebp),%eax
 68b:	8b 50 04             	mov    0x4(%eax),%edx
 68e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 691:	8b 00                	mov    (%eax),%eax
 693:	8b 40 04             	mov    0x4(%eax),%eax
 696:	01 c2                	add    %eax,%edx
 698:	8b 45 f8             	mov    -0x8(%ebp),%eax
 69b:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 69e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a1:	8b 00                	mov    (%eax),%eax
 6a3:	8b 10                	mov    (%eax),%edx
 6a5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6a8:	89 10                	mov    %edx,(%eax)
 6aa:	eb 0a                	jmp    6b6 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 6ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6af:	8b 10                	mov    (%eax),%edx
 6b1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6b4:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b9:	8b 40 04             	mov    0x4(%eax),%eax
 6bc:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c6:	01 d0                	add    %edx,%eax
 6c8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6cb:	75 20                	jne    6ed <free+0xcf>
    p->s.size += bp->s.size;
 6cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d0:	8b 50 04             	mov    0x4(%eax),%edx
 6d3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6d6:	8b 40 04             	mov    0x4(%eax),%eax
 6d9:	01 c2                	add    %eax,%edx
 6db:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6de:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6e1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6e4:	8b 10                	mov    (%eax),%edx
 6e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e9:	89 10                	mov    %edx,(%eax)
 6eb:	eb 08                	jmp    6f5 <free+0xd7>
  } else
    p->s.ptr = bp;
 6ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f0:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6f3:	89 10                	mov    %edx,(%eax)
  freep = p;
 6f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f8:	a3 a8 0a 00 00       	mov    %eax,0xaa8
}
 6fd:	c9                   	leave  
 6fe:	c3                   	ret    

000006ff <morecore>:

static Header*
morecore(uint nu)
{
 6ff:	55                   	push   %ebp
 700:	89 e5                	mov    %esp,%ebp
 702:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 705:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 70c:	77 07                	ja     715 <morecore+0x16>
    nu = 4096;
 70e:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 715:	8b 45 08             	mov    0x8(%ebp),%eax
 718:	c1 e0 03             	shl    $0x3,%eax
 71b:	89 04 24             	mov    %eax,(%esp)
 71e:	e8 40 fc ff ff       	call   363 <sbrk>
 723:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 726:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 72a:	75 07                	jne    733 <morecore+0x34>
    return 0;
 72c:	b8 00 00 00 00       	mov    $0x0,%eax
 731:	eb 22                	jmp    755 <morecore+0x56>
  hp = (Header*)p;
 733:	8b 45 f4             	mov    -0xc(%ebp),%eax
 736:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 739:	8b 45 f0             	mov    -0x10(%ebp),%eax
 73c:	8b 55 08             	mov    0x8(%ebp),%edx
 73f:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 742:	8b 45 f0             	mov    -0x10(%ebp),%eax
 745:	83 c0 08             	add    $0x8,%eax
 748:	89 04 24             	mov    %eax,(%esp)
 74b:	e8 ce fe ff ff       	call   61e <free>
  return freep;
 750:	a1 a8 0a 00 00       	mov    0xaa8,%eax
}
 755:	c9                   	leave  
 756:	c3                   	ret    

00000757 <malloc>:

void*
malloc(uint nbytes)
{
 757:	55                   	push   %ebp
 758:	89 e5                	mov    %esp,%ebp
 75a:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 75d:	8b 45 08             	mov    0x8(%ebp),%eax
 760:	83 c0 07             	add    $0x7,%eax
 763:	c1 e8 03             	shr    $0x3,%eax
 766:	83 c0 01             	add    $0x1,%eax
 769:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 76c:	a1 a8 0a 00 00       	mov    0xaa8,%eax
 771:	89 45 f0             	mov    %eax,-0x10(%ebp)
 774:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 778:	75 23                	jne    79d <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 77a:	c7 45 f0 a0 0a 00 00 	movl   $0xaa0,-0x10(%ebp)
 781:	8b 45 f0             	mov    -0x10(%ebp),%eax
 784:	a3 a8 0a 00 00       	mov    %eax,0xaa8
 789:	a1 a8 0a 00 00       	mov    0xaa8,%eax
 78e:	a3 a0 0a 00 00       	mov    %eax,0xaa0
    base.s.size = 0;
 793:	c7 05 a4 0a 00 00 00 	movl   $0x0,0xaa4
 79a:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 79d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7a0:	8b 00                	mov    (%eax),%eax
 7a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 7a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a8:	8b 40 04             	mov    0x4(%eax),%eax
 7ab:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7ae:	72 4d                	jb     7fd <malloc+0xa6>
      if(p->s.size == nunits)
 7b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b3:	8b 40 04             	mov    0x4(%eax),%eax
 7b6:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7b9:	75 0c                	jne    7c7 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 7bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7be:	8b 10                	mov    (%eax),%edx
 7c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7c3:	89 10                	mov    %edx,(%eax)
 7c5:	eb 26                	jmp    7ed <malloc+0x96>
      else {
        p->s.size -= nunits;
 7c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ca:	8b 40 04             	mov    0x4(%eax),%eax
 7cd:	2b 45 ec             	sub    -0x14(%ebp),%eax
 7d0:	89 c2                	mov    %eax,%edx
 7d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7db:	8b 40 04             	mov    0x4(%eax),%eax
 7de:	c1 e0 03             	shl    $0x3,%eax
 7e1:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 7e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e7:	8b 55 ec             	mov    -0x14(%ebp),%edx
 7ea:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7f0:	a3 a8 0a 00 00       	mov    %eax,0xaa8
      return (void*)(p + 1);
 7f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f8:	83 c0 08             	add    $0x8,%eax
 7fb:	eb 38                	jmp    835 <malloc+0xde>
    }
    if(p == freep)
 7fd:	a1 a8 0a 00 00       	mov    0xaa8,%eax
 802:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 805:	75 1b                	jne    822 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 807:	8b 45 ec             	mov    -0x14(%ebp),%eax
 80a:	89 04 24             	mov    %eax,(%esp)
 80d:	e8 ed fe ff ff       	call   6ff <morecore>
 812:	89 45 f4             	mov    %eax,-0xc(%ebp)
 815:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 819:	75 07                	jne    822 <malloc+0xcb>
        return 0;
 81b:	b8 00 00 00 00       	mov    $0x0,%eax
 820:	eb 13                	jmp    835 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 822:	8b 45 f4             	mov    -0xc(%ebp),%eax
 825:	89 45 f0             	mov    %eax,-0x10(%ebp)
 828:	8b 45 f4             	mov    -0xc(%ebp),%eax
 82b:	8b 00                	mov    (%eax),%eax
 82d:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 830:	e9 70 ff ff ff       	jmp    7a5 <malloc+0x4e>
}
 835:	c9                   	leave  
 836:	c3                   	ret    
