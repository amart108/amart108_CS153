
_ln:     file format elf32-i386


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
   6:	83 ec 10             	sub    $0x10,%esp
  if(argc != 3){
   9:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
   d:	74 20                	je     2f <main+0x2f>
    printf(2, "Usage: ln old new\n");
   f:	c7 44 24 04 4b 08 00 	movl   $0x84b,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 5c 04 00 00       	call   47f <printf>
    exit(1);
  23:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  2a:	e8 c0 02 00 00       	call   2ef <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2f:	8b 45 0c             	mov    0xc(%ebp),%eax
  32:	83 c0 08             	add    $0x8,%eax
  35:	8b 10                	mov    (%eax),%edx
  37:	8b 45 0c             	mov    0xc(%ebp),%eax
  3a:	83 c0 04             	add    $0x4,%eax
  3d:	8b 00                	mov    (%eax),%eax
  3f:	89 54 24 04          	mov    %edx,0x4(%esp)
  43:	89 04 24             	mov    %eax,(%esp)
  46:	e8 04 03 00 00       	call   34f <link>
  4b:	85 c0                	test   %eax,%eax
  4d:	79 2c                	jns    7b <main+0x7b>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  4f:	8b 45 0c             	mov    0xc(%ebp),%eax
  52:	83 c0 08             	add    $0x8,%eax
  55:	8b 10                	mov    (%eax),%edx
  57:	8b 45 0c             	mov    0xc(%ebp),%eax
  5a:	83 c0 04             	add    $0x4,%eax
  5d:	8b 00                	mov    (%eax),%eax
  5f:	89 54 24 0c          	mov    %edx,0xc(%esp)
  63:	89 44 24 08          	mov    %eax,0x8(%esp)
  67:	c7 44 24 04 5e 08 00 	movl   $0x85e,0x4(%esp)
  6e:	00 
  6f:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  76:	e8 04 04 00 00       	call   47f <printf>
  exit(1);
  7b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  82:	e8 68 02 00 00       	call   2ef <exit>

00000087 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  87:	55                   	push   %ebp
  88:	89 e5                	mov    %esp,%ebp
  8a:	57                   	push   %edi
  8b:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  8c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8f:	8b 55 10             	mov    0x10(%ebp),%edx
  92:	8b 45 0c             	mov    0xc(%ebp),%eax
  95:	89 cb                	mov    %ecx,%ebx
  97:	89 df                	mov    %ebx,%edi
  99:	89 d1                	mov    %edx,%ecx
  9b:	fc                   	cld    
  9c:	f3 aa                	rep stos %al,%es:(%edi)
  9e:	89 ca                	mov    %ecx,%edx
  a0:	89 fb                	mov    %edi,%ebx
  a2:	89 5d 08             	mov    %ebx,0x8(%ebp)
  a5:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  a8:	5b                   	pop    %ebx
  a9:	5f                   	pop    %edi
  aa:	5d                   	pop    %ebp
  ab:	c3                   	ret    

000000ac <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  ac:	55                   	push   %ebp
  ad:	89 e5                	mov    %esp,%ebp
  af:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  b2:	8b 45 08             	mov    0x8(%ebp),%eax
  b5:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  b8:	90                   	nop
  b9:	8b 45 08             	mov    0x8(%ebp),%eax
  bc:	8d 50 01             	lea    0x1(%eax),%edx
  bf:	89 55 08             	mov    %edx,0x8(%ebp)
  c2:	8b 55 0c             	mov    0xc(%ebp),%edx
  c5:	8d 4a 01             	lea    0x1(%edx),%ecx
  c8:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  cb:	0f b6 12             	movzbl (%edx),%edx
  ce:	88 10                	mov    %dl,(%eax)
  d0:	0f b6 00             	movzbl (%eax),%eax
  d3:	84 c0                	test   %al,%al
  d5:	75 e2                	jne    b9 <strcpy+0xd>
    ;
  return os;
  d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  da:	c9                   	leave  
  db:	c3                   	ret    

000000dc <strcmp>:

int
strcmp(const char *p, const char *q)
{
  dc:	55                   	push   %ebp
  dd:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  df:	eb 08                	jmp    e9 <strcmp+0xd>
    p++, q++;
  e1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  e5:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  e9:	8b 45 08             	mov    0x8(%ebp),%eax
  ec:	0f b6 00             	movzbl (%eax),%eax
  ef:	84 c0                	test   %al,%al
  f1:	74 10                	je     103 <strcmp+0x27>
  f3:	8b 45 08             	mov    0x8(%ebp),%eax
  f6:	0f b6 10             	movzbl (%eax),%edx
  f9:	8b 45 0c             	mov    0xc(%ebp),%eax
  fc:	0f b6 00             	movzbl (%eax),%eax
  ff:	38 c2                	cmp    %al,%dl
 101:	74 de                	je     e1 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 103:	8b 45 08             	mov    0x8(%ebp),%eax
 106:	0f b6 00             	movzbl (%eax),%eax
 109:	0f b6 d0             	movzbl %al,%edx
 10c:	8b 45 0c             	mov    0xc(%ebp),%eax
 10f:	0f b6 00             	movzbl (%eax),%eax
 112:	0f b6 c0             	movzbl %al,%eax
 115:	29 c2                	sub    %eax,%edx
 117:	89 d0                	mov    %edx,%eax
}
 119:	5d                   	pop    %ebp
 11a:	c3                   	ret    

0000011b <strlen>:

uint
strlen(char *s)
{
 11b:	55                   	push   %ebp
 11c:	89 e5                	mov    %esp,%ebp
 11e:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 121:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 128:	eb 04                	jmp    12e <strlen+0x13>
 12a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 12e:	8b 55 fc             	mov    -0x4(%ebp),%edx
 131:	8b 45 08             	mov    0x8(%ebp),%eax
 134:	01 d0                	add    %edx,%eax
 136:	0f b6 00             	movzbl (%eax),%eax
 139:	84 c0                	test   %al,%al
 13b:	75 ed                	jne    12a <strlen+0xf>
    ;
  return n;
 13d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 140:	c9                   	leave  
 141:	c3                   	ret    

00000142 <memset>:

void*
memset(void *dst, int c, uint n)
{
 142:	55                   	push   %ebp
 143:	89 e5                	mov    %esp,%ebp
 145:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 148:	8b 45 10             	mov    0x10(%ebp),%eax
 14b:	89 44 24 08          	mov    %eax,0x8(%esp)
 14f:	8b 45 0c             	mov    0xc(%ebp),%eax
 152:	89 44 24 04          	mov    %eax,0x4(%esp)
 156:	8b 45 08             	mov    0x8(%ebp),%eax
 159:	89 04 24             	mov    %eax,(%esp)
 15c:	e8 26 ff ff ff       	call   87 <stosb>
  return dst;
 161:	8b 45 08             	mov    0x8(%ebp),%eax
}
 164:	c9                   	leave  
 165:	c3                   	ret    

00000166 <strchr>:

char*
strchr(const char *s, char c)
{
 166:	55                   	push   %ebp
 167:	89 e5                	mov    %esp,%ebp
 169:	83 ec 04             	sub    $0x4,%esp
 16c:	8b 45 0c             	mov    0xc(%ebp),%eax
 16f:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 172:	eb 14                	jmp    188 <strchr+0x22>
    if(*s == c)
 174:	8b 45 08             	mov    0x8(%ebp),%eax
 177:	0f b6 00             	movzbl (%eax),%eax
 17a:	3a 45 fc             	cmp    -0x4(%ebp),%al
 17d:	75 05                	jne    184 <strchr+0x1e>
      return (char*)s;
 17f:	8b 45 08             	mov    0x8(%ebp),%eax
 182:	eb 13                	jmp    197 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 184:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 188:	8b 45 08             	mov    0x8(%ebp),%eax
 18b:	0f b6 00             	movzbl (%eax),%eax
 18e:	84 c0                	test   %al,%al
 190:	75 e2                	jne    174 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 192:	b8 00 00 00 00       	mov    $0x0,%eax
}
 197:	c9                   	leave  
 198:	c3                   	ret    

00000199 <gets>:

char*
gets(char *buf, int max)
{
 199:	55                   	push   %ebp
 19a:	89 e5                	mov    %esp,%ebp
 19c:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 19f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 1a6:	eb 4c                	jmp    1f4 <gets+0x5b>
    cc = read(0, &c, 1);
 1a8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1af:	00 
 1b0:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1b3:	89 44 24 04          	mov    %eax,0x4(%esp)
 1b7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1be:	e8 44 01 00 00       	call   307 <read>
 1c3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1c6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1ca:	7f 02                	jg     1ce <gets+0x35>
      break;
 1cc:	eb 31                	jmp    1ff <gets+0x66>
    buf[i++] = c;
 1ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1d1:	8d 50 01             	lea    0x1(%eax),%edx
 1d4:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1d7:	89 c2                	mov    %eax,%edx
 1d9:	8b 45 08             	mov    0x8(%ebp),%eax
 1dc:	01 c2                	add    %eax,%edx
 1de:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1e2:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1e4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1e8:	3c 0a                	cmp    $0xa,%al
 1ea:	74 13                	je     1ff <gets+0x66>
 1ec:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1f0:	3c 0d                	cmp    $0xd,%al
 1f2:	74 0b                	je     1ff <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1f7:	83 c0 01             	add    $0x1,%eax
 1fa:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1fd:	7c a9                	jl     1a8 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1ff:	8b 55 f4             	mov    -0xc(%ebp),%edx
 202:	8b 45 08             	mov    0x8(%ebp),%eax
 205:	01 d0                	add    %edx,%eax
 207:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 20a:	8b 45 08             	mov    0x8(%ebp),%eax
}
 20d:	c9                   	leave  
 20e:	c3                   	ret    

0000020f <stat>:

int
stat(char *n, struct stat *st)
{
 20f:	55                   	push   %ebp
 210:	89 e5                	mov    %esp,%ebp
 212:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 215:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 21c:	00 
 21d:	8b 45 08             	mov    0x8(%ebp),%eax
 220:	89 04 24             	mov    %eax,(%esp)
 223:	e8 07 01 00 00       	call   32f <open>
 228:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 22b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 22f:	79 07                	jns    238 <stat+0x29>
    return -1;
 231:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 236:	eb 23                	jmp    25b <stat+0x4c>
  r = fstat(fd, st);
 238:	8b 45 0c             	mov    0xc(%ebp),%eax
 23b:	89 44 24 04          	mov    %eax,0x4(%esp)
 23f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 242:	89 04 24             	mov    %eax,(%esp)
 245:	e8 fd 00 00 00       	call   347 <fstat>
 24a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 24d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 250:	89 04 24             	mov    %eax,(%esp)
 253:	e8 bf 00 00 00       	call   317 <close>
  return r;
 258:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 25b:	c9                   	leave  
 25c:	c3                   	ret    

0000025d <atoi>:

int
atoi(const char *s)
{
 25d:	55                   	push   %ebp
 25e:	89 e5                	mov    %esp,%ebp
 260:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 263:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 26a:	eb 25                	jmp    291 <atoi+0x34>
    n = n*10 + *s++ - '0';
 26c:	8b 55 fc             	mov    -0x4(%ebp),%edx
 26f:	89 d0                	mov    %edx,%eax
 271:	c1 e0 02             	shl    $0x2,%eax
 274:	01 d0                	add    %edx,%eax
 276:	01 c0                	add    %eax,%eax
 278:	89 c1                	mov    %eax,%ecx
 27a:	8b 45 08             	mov    0x8(%ebp),%eax
 27d:	8d 50 01             	lea    0x1(%eax),%edx
 280:	89 55 08             	mov    %edx,0x8(%ebp)
 283:	0f b6 00             	movzbl (%eax),%eax
 286:	0f be c0             	movsbl %al,%eax
 289:	01 c8                	add    %ecx,%eax
 28b:	83 e8 30             	sub    $0x30,%eax
 28e:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 291:	8b 45 08             	mov    0x8(%ebp),%eax
 294:	0f b6 00             	movzbl (%eax),%eax
 297:	3c 2f                	cmp    $0x2f,%al
 299:	7e 0a                	jle    2a5 <atoi+0x48>
 29b:	8b 45 08             	mov    0x8(%ebp),%eax
 29e:	0f b6 00             	movzbl (%eax),%eax
 2a1:	3c 39                	cmp    $0x39,%al
 2a3:	7e c7                	jle    26c <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 2a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2a8:	c9                   	leave  
 2a9:	c3                   	ret    

000002aa <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 2aa:	55                   	push   %ebp
 2ab:	89 e5                	mov    %esp,%ebp
 2ad:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 2b0:	8b 45 08             	mov    0x8(%ebp),%eax
 2b3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 2b6:	8b 45 0c             	mov    0xc(%ebp),%eax
 2b9:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2bc:	eb 17                	jmp    2d5 <memmove+0x2b>
    *dst++ = *src++;
 2be:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2c1:	8d 50 01             	lea    0x1(%eax),%edx
 2c4:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2c7:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2ca:	8d 4a 01             	lea    0x1(%edx),%ecx
 2cd:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2d0:	0f b6 12             	movzbl (%edx),%edx
 2d3:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2d5:	8b 45 10             	mov    0x10(%ebp),%eax
 2d8:	8d 50 ff             	lea    -0x1(%eax),%edx
 2db:	89 55 10             	mov    %edx,0x10(%ebp)
 2de:	85 c0                	test   %eax,%eax
 2e0:	7f dc                	jg     2be <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2e2:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2e5:	c9                   	leave  
 2e6:	c3                   	ret    

000002e7 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2e7:	b8 01 00 00 00       	mov    $0x1,%eax
 2ec:	cd 40                	int    $0x40
 2ee:	c3                   	ret    

000002ef <exit>:
SYSCALL(exit)
 2ef:	b8 02 00 00 00       	mov    $0x2,%eax
 2f4:	cd 40                	int    $0x40
 2f6:	c3                   	ret    

000002f7 <wait>:
SYSCALL(wait)
 2f7:	b8 03 00 00 00       	mov    $0x3,%eax
 2fc:	cd 40                	int    $0x40
 2fe:	c3                   	ret    

000002ff <pipe>:
SYSCALL(pipe)
 2ff:	b8 04 00 00 00       	mov    $0x4,%eax
 304:	cd 40                	int    $0x40
 306:	c3                   	ret    

00000307 <read>:
SYSCALL(read)
 307:	b8 05 00 00 00       	mov    $0x5,%eax
 30c:	cd 40                	int    $0x40
 30e:	c3                   	ret    

0000030f <write>:
SYSCALL(write)
 30f:	b8 10 00 00 00       	mov    $0x10,%eax
 314:	cd 40                	int    $0x40
 316:	c3                   	ret    

00000317 <close>:
SYSCALL(close)
 317:	b8 15 00 00 00       	mov    $0x15,%eax
 31c:	cd 40                	int    $0x40
 31e:	c3                   	ret    

0000031f <kill>:
SYSCALL(kill)
 31f:	b8 06 00 00 00       	mov    $0x6,%eax
 324:	cd 40                	int    $0x40
 326:	c3                   	ret    

00000327 <exec>:
SYSCALL(exec)
 327:	b8 07 00 00 00       	mov    $0x7,%eax
 32c:	cd 40                	int    $0x40
 32e:	c3                   	ret    

0000032f <open>:
SYSCALL(open)
 32f:	b8 0f 00 00 00       	mov    $0xf,%eax
 334:	cd 40                	int    $0x40
 336:	c3                   	ret    

00000337 <mknod>:
SYSCALL(mknod)
 337:	b8 11 00 00 00       	mov    $0x11,%eax
 33c:	cd 40                	int    $0x40
 33e:	c3                   	ret    

0000033f <unlink>:
SYSCALL(unlink)
 33f:	b8 12 00 00 00       	mov    $0x12,%eax
 344:	cd 40                	int    $0x40
 346:	c3                   	ret    

00000347 <fstat>:
SYSCALL(fstat)
 347:	b8 08 00 00 00       	mov    $0x8,%eax
 34c:	cd 40                	int    $0x40
 34e:	c3                   	ret    

0000034f <link>:
SYSCALL(link)
 34f:	b8 13 00 00 00       	mov    $0x13,%eax
 354:	cd 40                	int    $0x40
 356:	c3                   	ret    

00000357 <mkdir>:
SYSCALL(mkdir)
 357:	b8 14 00 00 00       	mov    $0x14,%eax
 35c:	cd 40                	int    $0x40
 35e:	c3                   	ret    

0000035f <chdir>:
SYSCALL(chdir)
 35f:	b8 09 00 00 00       	mov    $0x9,%eax
 364:	cd 40                	int    $0x40
 366:	c3                   	ret    

00000367 <dup>:
SYSCALL(dup)
 367:	b8 0a 00 00 00       	mov    $0xa,%eax
 36c:	cd 40                	int    $0x40
 36e:	c3                   	ret    

0000036f <getpid>:
SYSCALL(getpid)
 36f:	b8 0b 00 00 00       	mov    $0xb,%eax
 374:	cd 40                	int    $0x40
 376:	c3                   	ret    

00000377 <sbrk>:
SYSCALL(sbrk)
 377:	b8 0c 00 00 00       	mov    $0xc,%eax
 37c:	cd 40                	int    $0x40
 37e:	c3                   	ret    

0000037f <sleep>:
SYSCALL(sleep)
 37f:	b8 0d 00 00 00       	mov    $0xd,%eax
 384:	cd 40                	int    $0x40
 386:	c3                   	ret    

00000387 <uptime>:
SYSCALL(uptime)
 387:	b8 0e 00 00 00       	mov    $0xe,%eax
 38c:	cd 40                	int    $0x40
 38e:	c3                   	ret    

0000038f <waitpid>:
SYSCALL(waitpid)
 38f:	b8 16 00 00 00       	mov    $0x16,%eax
 394:	cd 40                	int    $0x40
 396:	c3                   	ret    

00000397 <setprio>:
SYSCALL(setprio)
 397:	b8 17 00 00 00       	mov    $0x17,%eax
 39c:	cd 40                	int    $0x40
 39e:	c3                   	ret    

0000039f <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 39f:	55                   	push   %ebp
 3a0:	89 e5                	mov    %esp,%ebp
 3a2:	83 ec 18             	sub    $0x18,%esp
 3a5:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a8:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 3ab:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3b2:	00 
 3b3:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3b6:	89 44 24 04          	mov    %eax,0x4(%esp)
 3ba:	8b 45 08             	mov    0x8(%ebp),%eax
 3bd:	89 04 24             	mov    %eax,(%esp)
 3c0:	e8 4a ff ff ff       	call   30f <write>
}
 3c5:	c9                   	leave  
 3c6:	c3                   	ret    

000003c7 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3c7:	55                   	push   %ebp
 3c8:	89 e5                	mov    %esp,%ebp
 3ca:	56                   	push   %esi
 3cb:	53                   	push   %ebx
 3cc:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3cf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3d6:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3da:	74 17                	je     3f3 <printint+0x2c>
 3dc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3e0:	79 11                	jns    3f3 <printint+0x2c>
    neg = 1;
 3e2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3e9:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ec:	f7 d8                	neg    %eax
 3ee:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3f1:	eb 06                	jmp    3f9 <printint+0x32>
  } else {
    x = xx;
 3f3:	8b 45 0c             	mov    0xc(%ebp),%eax
 3f6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 3f9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 400:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 403:	8d 41 01             	lea    0x1(%ecx),%eax
 406:	89 45 f4             	mov    %eax,-0xc(%ebp)
 409:	8b 5d 10             	mov    0x10(%ebp),%ebx
 40c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 40f:	ba 00 00 00 00       	mov    $0x0,%edx
 414:	f7 f3                	div    %ebx
 416:	89 d0                	mov    %edx,%eax
 418:	0f b6 80 c0 0a 00 00 	movzbl 0xac0(%eax),%eax
 41f:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 423:	8b 75 10             	mov    0x10(%ebp),%esi
 426:	8b 45 ec             	mov    -0x14(%ebp),%eax
 429:	ba 00 00 00 00       	mov    $0x0,%edx
 42e:	f7 f6                	div    %esi
 430:	89 45 ec             	mov    %eax,-0x14(%ebp)
 433:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 437:	75 c7                	jne    400 <printint+0x39>
  if(neg)
 439:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 43d:	74 10                	je     44f <printint+0x88>
    buf[i++] = '-';
 43f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 442:	8d 50 01             	lea    0x1(%eax),%edx
 445:	89 55 f4             	mov    %edx,-0xc(%ebp)
 448:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 44d:	eb 1f                	jmp    46e <printint+0xa7>
 44f:	eb 1d                	jmp    46e <printint+0xa7>
    putc(fd, buf[i]);
 451:	8d 55 dc             	lea    -0x24(%ebp),%edx
 454:	8b 45 f4             	mov    -0xc(%ebp),%eax
 457:	01 d0                	add    %edx,%eax
 459:	0f b6 00             	movzbl (%eax),%eax
 45c:	0f be c0             	movsbl %al,%eax
 45f:	89 44 24 04          	mov    %eax,0x4(%esp)
 463:	8b 45 08             	mov    0x8(%ebp),%eax
 466:	89 04 24             	mov    %eax,(%esp)
 469:	e8 31 ff ff ff       	call   39f <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 46e:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 472:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 476:	79 d9                	jns    451 <printint+0x8a>
    putc(fd, buf[i]);
}
 478:	83 c4 30             	add    $0x30,%esp
 47b:	5b                   	pop    %ebx
 47c:	5e                   	pop    %esi
 47d:	5d                   	pop    %ebp
 47e:	c3                   	ret    

0000047f <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 47f:	55                   	push   %ebp
 480:	89 e5                	mov    %esp,%ebp
 482:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 485:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 48c:	8d 45 0c             	lea    0xc(%ebp),%eax
 48f:	83 c0 04             	add    $0x4,%eax
 492:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 495:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 49c:	e9 7c 01 00 00       	jmp    61d <printf+0x19e>
    c = fmt[i] & 0xff;
 4a1:	8b 55 0c             	mov    0xc(%ebp),%edx
 4a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4a7:	01 d0                	add    %edx,%eax
 4a9:	0f b6 00             	movzbl (%eax),%eax
 4ac:	0f be c0             	movsbl %al,%eax
 4af:	25 ff 00 00 00       	and    $0xff,%eax
 4b4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 4b7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4bb:	75 2c                	jne    4e9 <printf+0x6a>
      if(c == '%'){
 4bd:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 4c1:	75 0c                	jne    4cf <printf+0x50>
        state = '%';
 4c3:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 4ca:	e9 4a 01 00 00       	jmp    619 <printf+0x19a>
      } else {
        putc(fd, c);
 4cf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4d2:	0f be c0             	movsbl %al,%eax
 4d5:	89 44 24 04          	mov    %eax,0x4(%esp)
 4d9:	8b 45 08             	mov    0x8(%ebp),%eax
 4dc:	89 04 24             	mov    %eax,(%esp)
 4df:	e8 bb fe ff ff       	call   39f <putc>
 4e4:	e9 30 01 00 00       	jmp    619 <printf+0x19a>
      }
    } else if(state == '%'){
 4e9:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 4ed:	0f 85 26 01 00 00    	jne    619 <printf+0x19a>
      if(c == 'd'){
 4f3:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 4f7:	75 2d                	jne    526 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 4f9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4fc:	8b 00                	mov    (%eax),%eax
 4fe:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 505:	00 
 506:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 50d:	00 
 50e:	89 44 24 04          	mov    %eax,0x4(%esp)
 512:	8b 45 08             	mov    0x8(%ebp),%eax
 515:	89 04 24             	mov    %eax,(%esp)
 518:	e8 aa fe ff ff       	call   3c7 <printint>
        ap++;
 51d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 521:	e9 ec 00 00 00       	jmp    612 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 526:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 52a:	74 06                	je     532 <printf+0xb3>
 52c:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 530:	75 2d                	jne    55f <printf+0xe0>
        printint(fd, *ap, 16, 0);
 532:	8b 45 e8             	mov    -0x18(%ebp),%eax
 535:	8b 00                	mov    (%eax),%eax
 537:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 53e:	00 
 53f:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 546:	00 
 547:	89 44 24 04          	mov    %eax,0x4(%esp)
 54b:	8b 45 08             	mov    0x8(%ebp),%eax
 54e:	89 04 24             	mov    %eax,(%esp)
 551:	e8 71 fe ff ff       	call   3c7 <printint>
        ap++;
 556:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 55a:	e9 b3 00 00 00       	jmp    612 <printf+0x193>
      } else if(c == 's'){
 55f:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 563:	75 45                	jne    5aa <printf+0x12b>
        s = (char*)*ap;
 565:	8b 45 e8             	mov    -0x18(%ebp),%eax
 568:	8b 00                	mov    (%eax),%eax
 56a:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 56d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 571:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 575:	75 09                	jne    580 <printf+0x101>
          s = "(null)";
 577:	c7 45 f4 72 08 00 00 	movl   $0x872,-0xc(%ebp)
        while(*s != 0){
 57e:	eb 1e                	jmp    59e <printf+0x11f>
 580:	eb 1c                	jmp    59e <printf+0x11f>
          putc(fd, *s);
 582:	8b 45 f4             	mov    -0xc(%ebp),%eax
 585:	0f b6 00             	movzbl (%eax),%eax
 588:	0f be c0             	movsbl %al,%eax
 58b:	89 44 24 04          	mov    %eax,0x4(%esp)
 58f:	8b 45 08             	mov    0x8(%ebp),%eax
 592:	89 04 24             	mov    %eax,(%esp)
 595:	e8 05 fe ff ff       	call   39f <putc>
          s++;
 59a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 59e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5a1:	0f b6 00             	movzbl (%eax),%eax
 5a4:	84 c0                	test   %al,%al
 5a6:	75 da                	jne    582 <printf+0x103>
 5a8:	eb 68                	jmp    612 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5aa:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 5ae:	75 1d                	jne    5cd <printf+0x14e>
        putc(fd, *ap);
 5b0:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5b3:	8b 00                	mov    (%eax),%eax
 5b5:	0f be c0             	movsbl %al,%eax
 5b8:	89 44 24 04          	mov    %eax,0x4(%esp)
 5bc:	8b 45 08             	mov    0x8(%ebp),%eax
 5bf:	89 04 24             	mov    %eax,(%esp)
 5c2:	e8 d8 fd ff ff       	call   39f <putc>
        ap++;
 5c7:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5cb:	eb 45                	jmp    612 <printf+0x193>
      } else if(c == '%'){
 5cd:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5d1:	75 17                	jne    5ea <printf+0x16b>
        putc(fd, c);
 5d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5d6:	0f be c0             	movsbl %al,%eax
 5d9:	89 44 24 04          	mov    %eax,0x4(%esp)
 5dd:	8b 45 08             	mov    0x8(%ebp),%eax
 5e0:	89 04 24             	mov    %eax,(%esp)
 5e3:	e8 b7 fd ff ff       	call   39f <putc>
 5e8:	eb 28                	jmp    612 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5ea:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 5f1:	00 
 5f2:	8b 45 08             	mov    0x8(%ebp),%eax
 5f5:	89 04 24             	mov    %eax,(%esp)
 5f8:	e8 a2 fd ff ff       	call   39f <putc>
        putc(fd, c);
 5fd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 600:	0f be c0             	movsbl %al,%eax
 603:	89 44 24 04          	mov    %eax,0x4(%esp)
 607:	8b 45 08             	mov    0x8(%ebp),%eax
 60a:	89 04 24             	mov    %eax,(%esp)
 60d:	e8 8d fd ff ff       	call   39f <putc>
      }
      state = 0;
 612:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 619:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 61d:	8b 55 0c             	mov    0xc(%ebp),%edx
 620:	8b 45 f0             	mov    -0x10(%ebp),%eax
 623:	01 d0                	add    %edx,%eax
 625:	0f b6 00             	movzbl (%eax),%eax
 628:	84 c0                	test   %al,%al
 62a:	0f 85 71 fe ff ff    	jne    4a1 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 630:	c9                   	leave  
 631:	c3                   	ret    

00000632 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 632:	55                   	push   %ebp
 633:	89 e5                	mov    %esp,%ebp
 635:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 638:	8b 45 08             	mov    0x8(%ebp),%eax
 63b:	83 e8 08             	sub    $0x8,%eax
 63e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 641:	a1 dc 0a 00 00       	mov    0xadc,%eax
 646:	89 45 fc             	mov    %eax,-0x4(%ebp)
 649:	eb 24                	jmp    66f <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 64b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 64e:	8b 00                	mov    (%eax),%eax
 650:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 653:	77 12                	ja     667 <free+0x35>
 655:	8b 45 f8             	mov    -0x8(%ebp),%eax
 658:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 65b:	77 24                	ja     681 <free+0x4f>
 65d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 660:	8b 00                	mov    (%eax),%eax
 662:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 665:	77 1a                	ja     681 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 667:	8b 45 fc             	mov    -0x4(%ebp),%eax
 66a:	8b 00                	mov    (%eax),%eax
 66c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 66f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 672:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 675:	76 d4                	jbe    64b <free+0x19>
 677:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67a:	8b 00                	mov    (%eax),%eax
 67c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 67f:	76 ca                	jbe    64b <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 681:	8b 45 f8             	mov    -0x8(%ebp),%eax
 684:	8b 40 04             	mov    0x4(%eax),%eax
 687:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 68e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 691:	01 c2                	add    %eax,%edx
 693:	8b 45 fc             	mov    -0x4(%ebp),%eax
 696:	8b 00                	mov    (%eax),%eax
 698:	39 c2                	cmp    %eax,%edx
 69a:	75 24                	jne    6c0 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 69c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 69f:	8b 50 04             	mov    0x4(%eax),%edx
 6a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a5:	8b 00                	mov    (%eax),%eax
 6a7:	8b 40 04             	mov    0x4(%eax),%eax
 6aa:	01 c2                	add    %eax,%edx
 6ac:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6af:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 6b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b5:	8b 00                	mov    (%eax),%eax
 6b7:	8b 10                	mov    (%eax),%edx
 6b9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6bc:	89 10                	mov    %edx,(%eax)
 6be:	eb 0a                	jmp    6ca <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 6c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c3:	8b 10                	mov    (%eax),%edx
 6c5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6c8:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6cd:	8b 40 04             	mov    0x4(%eax),%eax
 6d0:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6da:	01 d0                	add    %edx,%eax
 6dc:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6df:	75 20                	jne    701 <free+0xcf>
    p->s.size += bp->s.size;
 6e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e4:	8b 50 04             	mov    0x4(%eax),%edx
 6e7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ea:	8b 40 04             	mov    0x4(%eax),%eax
 6ed:	01 c2                	add    %eax,%edx
 6ef:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6f5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6f8:	8b 10                	mov    (%eax),%edx
 6fa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6fd:	89 10                	mov    %edx,(%eax)
 6ff:	eb 08                	jmp    709 <free+0xd7>
  } else
    p->s.ptr = bp;
 701:	8b 45 fc             	mov    -0x4(%ebp),%eax
 704:	8b 55 f8             	mov    -0x8(%ebp),%edx
 707:	89 10                	mov    %edx,(%eax)
  freep = p;
 709:	8b 45 fc             	mov    -0x4(%ebp),%eax
 70c:	a3 dc 0a 00 00       	mov    %eax,0xadc
}
 711:	c9                   	leave  
 712:	c3                   	ret    

00000713 <morecore>:

static Header*
morecore(uint nu)
{
 713:	55                   	push   %ebp
 714:	89 e5                	mov    %esp,%ebp
 716:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 719:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 720:	77 07                	ja     729 <morecore+0x16>
    nu = 4096;
 722:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 729:	8b 45 08             	mov    0x8(%ebp),%eax
 72c:	c1 e0 03             	shl    $0x3,%eax
 72f:	89 04 24             	mov    %eax,(%esp)
 732:	e8 40 fc ff ff       	call   377 <sbrk>
 737:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 73a:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 73e:	75 07                	jne    747 <morecore+0x34>
    return 0;
 740:	b8 00 00 00 00       	mov    $0x0,%eax
 745:	eb 22                	jmp    769 <morecore+0x56>
  hp = (Header*)p;
 747:	8b 45 f4             	mov    -0xc(%ebp),%eax
 74a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 74d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 750:	8b 55 08             	mov    0x8(%ebp),%edx
 753:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 756:	8b 45 f0             	mov    -0x10(%ebp),%eax
 759:	83 c0 08             	add    $0x8,%eax
 75c:	89 04 24             	mov    %eax,(%esp)
 75f:	e8 ce fe ff ff       	call   632 <free>
  return freep;
 764:	a1 dc 0a 00 00       	mov    0xadc,%eax
}
 769:	c9                   	leave  
 76a:	c3                   	ret    

0000076b <malloc>:

void*
malloc(uint nbytes)
{
 76b:	55                   	push   %ebp
 76c:	89 e5                	mov    %esp,%ebp
 76e:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 771:	8b 45 08             	mov    0x8(%ebp),%eax
 774:	83 c0 07             	add    $0x7,%eax
 777:	c1 e8 03             	shr    $0x3,%eax
 77a:	83 c0 01             	add    $0x1,%eax
 77d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 780:	a1 dc 0a 00 00       	mov    0xadc,%eax
 785:	89 45 f0             	mov    %eax,-0x10(%ebp)
 788:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 78c:	75 23                	jne    7b1 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 78e:	c7 45 f0 d4 0a 00 00 	movl   $0xad4,-0x10(%ebp)
 795:	8b 45 f0             	mov    -0x10(%ebp),%eax
 798:	a3 dc 0a 00 00       	mov    %eax,0xadc
 79d:	a1 dc 0a 00 00       	mov    0xadc,%eax
 7a2:	a3 d4 0a 00 00       	mov    %eax,0xad4
    base.s.size = 0;
 7a7:	c7 05 d8 0a 00 00 00 	movl   $0x0,0xad8
 7ae:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7b4:	8b 00                	mov    (%eax),%eax
 7b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 7b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7bc:	8b 40 04             	mov    0x4(%eax),%eax
 7bf:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7c2:	72 4d                	jb     811 <malloc+0xa6>
      if(p->s.size == nunits)
 7c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c7:	8b 40 04             	mov    0x4(%eax),%eax
 7ca:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7cd:	75 0c                	jne    7db <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 7cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d2:	8b 10                	mov    (%eax),%edx
 7d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7d7:	89 10                	mov    %edx,(%eax)
 7d9:	eb 26                	jmp    801 <malloc+0x96>
      else {
        p->s.size -= nunits;
 7db:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7de:	8b 40 04             	mov    0x4(%eax),%eax
 7e1:	2b 45 ec             	sub    -0x14(%ebp),%eax
 7e4:	89 c2                	mov    %eax,%edx
 7e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ef:	8b 40 04             	mov    0x4(%eax),%eax
 7f2:	c1 e0 03             	shl    $0x3,%eax
 7f5:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 7f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7fb:	8b 55 ec             	mov    -0x14(%ebp),%edx
 7fe:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 801:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804:	a3 dc 0a 00 00       	mov    %eax,0xadc
      return (void*)(p + 1);
 809:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80c:	83 c0 08             	add    $0x8,%eax
 80f:	eb 38                	jmp    849 <malloc+0xde>
    }
    if(p == freep)
 811:	a1 dc 0a 00 00       	mov    0xadc,%eax
 816:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 819:	75 1b                	jne    836 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 81b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 81e:	89 04 24             	mov    %eax,(%esp)
 821:	e8 ed fe ff ff       	call   713 <morecore>
 826:	89 45 f4             	mov    %eax,-0xc(%ebp)
 829:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 82d:	75 07                	jne    836 <malloc+0xcb>
        return 0;
 82f:	b8 00 00 00 00       	mov    $0x0,%eax
 834:	eb 13                	jmp    849 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 836:	8b 45 f4             	mov    -0xc(%ebp),%eax
 839:	89 45 f0             	mov    %eax,-0x10(%ebp)
 83c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 83f:	8b 00                	mov    (%eax),%eax
 841:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 844:	e9 70 ff ff ff       	jmp    7b9 <malloc+0x4e>
}
 849:	c9                   	leave  
 84a:	c3                   	ret    
