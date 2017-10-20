
_rm:     file format elf32-i386


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

  if(argc < 2){
   9:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
   d:	7f 20                	jg     2f <main+0x2f>
    printf(2, "Usage: rm files...\n");
   f:	c7 44 24 04 61 08 00 	movl   $0x861,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 72 04 00 00       	call   495 <printf>
    exit(1);
  23:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  2a:	e8 d6 02 00 00       	call   305 <exit>
  }

  for(i = 1; i < argc; i++){
  2f:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  36:	00 
  37:	eb 4f                	jmp    88 <main+0x88>
    if(unlink(argv[i]) < 0){
  39:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  3d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  44:	8b 45 0c             	mov    0xc(%ebp),%eax
  47:	01 d0                	add    %edx,%eax
  49:	8b 00                	mov    (%eax),%eax
  4b:	89 04 24             	mov    %eax,(%esp)
  4e:	e8 02 03 00 00       	call   355 <unlink>
  53:	85 c0                	test   %eax,%eax
  55:	79 2c                	jns    83 <main+0x83>
      printf(2, "rm: %s failed to delete\n", argv[i]);
  57:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  5b:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  62:	8b 45 0c             	mov    0xc(%ebp),%eax
  65:	01 d0                	add    %edx,%eax
  67:	8b 00                	mov    (%eax),%eax
  69:	89 44 24 08          	mov    %eax,0x8(%esp)
  6d:	c7 44 24 04 75 08 00 	movl   $0x875,0x4(%esp)
  74:	00 
  75:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  7c:	e8 14 04 00 00       	call   495 <printf>
      break;
  81:	eb 0e                	jmp    91 <main+0x91>
  if(argc < 2){
    printf(2, "Usage: rm files...\n");
    exit(1);
  }

  for(i = 1; i < argc; i++){
  83:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  88:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  8c:	3b 45 08             	cmp    0x8(%ebp),%eax
  8f:	7c a8                	jl     39 <main+0x39>
      printf(2, "rm: %s failed to delete\n", argv[i]);
      break;
    }
  }

  exit(1);
  91:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  98:	e8 68 02 00 00       	call   305 <exit>

0000009d <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  9d:	55                   	push   %ebp
  9e:	89 e5                	mov    %esp,%ebp
  a0:	57                   	push   %edi
  a1:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  a2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  a5:	8b 55 10             	mov    0x10(%ebp),%edx
  a8:	8b 45 0c             	mov    0xc(%ebp),%eax
  ab:	89 cb                	mov    %ecx,%ebx
  ad:	89 df                	mov    %ebx,%edi
  af:	89 d1                	mov    %edx,%ecx
  b1:	fc                   	cld    
  b2:	f3 aa                	rep stos %al,%es:(%edi)
  b4:	89 ca                	mov    %ecx,%edx
  b6:	89 fb                	mov    %edi,%ebx
  b8:	89 5d 08             	mov    %ebx,0x8(%ebp)
  bb:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  be:	5b                   	pop    %ebx
  bf:	5f                   	pop    %edi
  c0:	5d                   	pop    %ebp
  c1:	c3                   	ret    

000000c2 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  c2:	55                   	push   %ebp
  c3:	89 e5                	mov    %esp,%ebp
  c5:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  c8:	8b 45 08             	mov    0x8(%ebp),%eax
  cb:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  ce:	90                   	nop
  cf:	8b 45 08             	mov    0x8(%ebp),%eax
  d2:	8d 50 01             	lea    0x1(%eax),%edx
  d5:	89 55 08             	mov    %edx,0x8(%ebp)
  d8:	8b 55 0c             	mov    0xc(%ebp),%edx
  db:	8d 4a 01             	lea    0x1(%edx),%ecx
  de:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  e1:	0f b6 12             	movzbl (%edx),%edx
  e4:	88 10                	mov    %dl,(%eax)
  e6:	0f b6 00             	movzbl (%eax),%eax
  e9:	84 c0                	test   %al,%al
  eb:	75 e2                	jne    cf <strcpy+0xd>
    ;
  return os;
  ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  f0:	c9                   	leave  
  f1:	c3                   	ret    

000000f2 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  f2:	55                   	push   %ebp
  f3:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  f5:	eb 08                	jmp    ff <strcmp+0xd>
    p++, q++;
  f7:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  fb:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  ff:	8b 45 08             	mov    0x8(%ebp),%eax
 102:	0f b6 00             	movzbl (%eax),%eax
 105:	84 c0                	test   %al,%al
 107:	74 10                	je     119 <strcmp+0x27>
 109:	8b 45 08             	mov    0x8(%ebp),%eax
 10c:	0f b6 10             	movzbl (%eax),%edx
 10f:	8b 45 0c             	mov    0xc(%ebp),%eax
 112:	0f b6 00             	movzbl (%eax),%eax
 115:	38 c2                	cmp    %al,%dl
 117:	74 de                	je     f7 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 119:	8b 45 08             	mov    0x8(%ebp),%eax
 11c:	0f b6 00             	movzbl (%eax),%eax
 11f:	0f b6 d0             	movzbl %al,%edx
 122:	8b 45 0c             	mov    0xc(%ebp),%eax
 125:	0f b6 00             	movzbl (%eax),%eax
 128:	0f b6 c0             	movzbl %al,%eax
 12b:	29 c2                	sub    %eax,%edx
 12d:	89 d0                	mov    %edx,%eax
}
 12f:	5d                   	pop    %ebp
 130:	c3                   	ret    

00000131 <strlen>:

uint
strlen(char *s)
{
 131:	55                   	push   %ebp
 132:	89 e5                	mov    %esp,%ebp
 134:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 137:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 13e:	eb 04                	jmp    144 <strlen+0x13>
 140:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 144:	8b 55 fc             	mov    -0x4(%ebp),%edx
 147:	8b 45 08             	mov    0x8(%ebp),%eax
 14a:	01 d0                	add    %edx,%eax
 14c:	0f b6 00             	movzbl (%eax),%eax
 14f:	84 c0                	test   %al,%al
 151:	75 ed                	jne    140 <strlen+0xf>
    ;
  return n;
 153:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 156:	c9                   	leave  
 157:	c3                   	ret    

00000158 <memset>:

void*
memset(void *dst, int c, uint n)
{
 158:	55                   	push   %ebp
 159:	89 e5                	mov    %esp,%ebp
 15b:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 15e:	8b 45 10             	mov    0x10(%ebp),%eax
 161:	89 44 24 08          	mov    %eax,0x8(%esp)
 165:	8b 45 0c             	mov    0xc(%ebp),%eax
 168:	89 44 24 04          	mov    %eax,0x4(%esp)
 16c:	8b 45 08             	mov    0x8(%ebp),%eax
 16f:	89 04 24             	mov    %eax,(%esp)
 172:	e8 26 ff ff ff       	call   9d <stosb>
  return dst;
 177:	8b 45 08             	mov    0x8(%ebp),%eax
}
 17a:	c9                   	leave  
 17b:	c3                   	ret    

0000017c <strchr>:

char*
strchr(const char *s, char c)
{
 17c:	55                   	push   %ebp
 17d:	89 e5                	mov    %esp,%ebp
 17f:	83 ec 04             	sub    $0x4,%esp
 182:	8b 45 0c             	mov    0xc(%ebp),%eax
 185:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 188:	eb 14                	jmp    19e <strchr+0x22>
    if(*s == c)
 18a:	8b 45 08             	mov    0x8(%ebp),%eax
 18d:	0f b6 00             	movzbl (%eax),%eax
 190:	3a 45 fc             	cmp    -0x4(%ebp),%al
 193:	75 05                	jne    19a <strchr+0x1e>
      return (char*)s;
 195:	8b 45 08             	mov    0x8(%ebp),%eax
 198:	eb 13                	jmp    1ad <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 19a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 19e:	8b 45 08             	mov    0x8(%ebp),%eax
 1a1:	0f b6 00             	movzbl (%eax),%eax
 1a4:	84 c0                	test   %al,%al
 1a6:	75 e2                	jne    18a <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 1a8:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1ad:	c9                   	leave  
 1ae:	c3                   	ret    

000001af <gets>:

char*
gets(char *buf, int max)
{
 1af:	55                   	push   %ebp
 1b0:	89 e5                	mov    %esp,%ebp
 1b2:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1b5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 1bc:	eb 4c                	jmp    20a <gets+0x5b>
    cc = read(0, &c, 1);
 1be:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1c5:	00 
 1c6:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1c9:	89 44 24 04          	mov    %eax,0x4(%esp)
 1cd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1d4:	e8 44 01 00 00       	call   31d <read>
 1d9:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1dc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1e0:	7f 02                	jg     1e4 <gets+0x35>
      break;
 1e2:	eb 31                	jmp    215 <gets+0x66>
    buf[i++] = c;
 1e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1e7:	8d 50 01             	lea    0x1(%eax),%edx
 1ea:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1ed:	89 c2                	mov    %eax,%edx
 1ef:	8b 45 08             	mov    0x8(%ebp),%eax
 1f2:	01 c2                	add    %eax,%edx
 1f4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1f8:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1fa:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1fe:	3c 0a                	cmp    $0xa,%al
 200:	74 13                	je     215 <gets+0x66>
 202:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 206:	3c 0d                	cmp    $0xd,%al
 208:	74 0b                	je     215 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 20a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 20d:	83 c0 01             	add    $0x1,%eax
 210:	3b 45 0c             	cmp    0xc(%ebp),%eax
 213:	7c a9                	jl     1be <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 215:	8b 55 f4             	mov    -0xc(%ebp),%edx
 218:	8b 45 08             	mov    0x8(%ebp),%eax
 21b:	01 d0                	add    %edx,%eax
 21d:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 220:	8b 45 08             	mov    0x8(%ebp),%eax
}
 223:	c9                   	leave  
 224:	c3                   	ret    

00000225 <stat>:

int
stat(char *n, struct stat *st)
{
 225:	55                   	push   %ebp
 226:	89 e5                	mov    %esp,%ebp
 228:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 22b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 232:	00 
 233:	8b 45 08             	mov    0x8(%ebp),%eax
 236:	89 04 24             	mov    %eax,(%esp)
 239:	e8 07 01 00 00       	call   345 <open>
 23e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 241:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 245:	79 07                	jns    24e <stat+0x29>
    return -1;
 247:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 24c:	eb 23                	jmp    271 <stat+0x4c>
  r = fstat(fd, st);
 24e:	8b 45 0c             	mov    0xc(%ebp),%eax
 251:	89 44 24 04          	mov    %eax,0x4(%esp)
 255:	8b 45 f4             	mov    -0xc(%ebp),%eax
 258:	89 04 24             	mov    %eax,(%esp)
 25b:	e8 fd 00 00 00       	call   35d <fstat>
 260:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 263:	8b 45 f4             	mov    -0xc(%ebp),%eax
 266:	89 04 24             	mov    %eax,(%esp)
 269:	e8 bf 00 00 00       	call   32d <close>
  return r;
 26e:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 271:	c9                   	leave  
 272:	c3                   	ret    

00000273 <atoi>:

int
atoi(const char *s)
{
 273:	55                   	push   %ebp
 274:	89 e5                	mov    %esp,%ebp
 276:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 279:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 280:	eb 25                	jmp    2a7 <atoi+0x34>
    n = n*10 + *s++ - '0';
 282:	8b 55 fc             	mov    -0x4(%ebp),%edx
 285:	89 d0                	mov    %edx,%eax
 287:	c1 e0 02             	shl    $0x2,%eax
 28a:	01 d0                	add    %edx,%eax
 28c:	01 c0                	add    %eax,%eax
 28e:	89 c1                	mov    %eax,%ecx
 290:	8b 45 08             	mov    0x8(%ebp),%eax
 293:	8d 50 01             	lea    0x1(%eax),%edx
 296:	89 55 08             	mov    %edx,0x8(%ebp)
 299:	0f b6 00             	movzbl (%eax),%eax
 29c:	0f be c0             	movsbl %al,%eax
 29f:	01 c8                	add    %ecx,%eax
 2a1:	83 e8 30             	sub    $0x30,%eax
 2a4:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2a7:	8b 45 08             	mov    0x8(%ebp),%eax
 2aa:	0f b6 00             	movzbl (%eax),%eax
 2ad:	3c 2f                	cmp    $0x2f,%al
 2af:	7e 0a                	jle    2bb <atoi+0x48>
 2b1:	8b 45 08             	mov    0x8(%ebp),%eax
 2b4:	0f b6 00             	movzbl (%eax),%eax
 2b7:	3c 39                	cmp    $0x39,%al
 2b9:	7e c7                	jle    282 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 2bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2be:	c9                   	leave  
 2bf:	c3                   	ret    

000002c0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 2c6:	8b 45 08             	mov    0x8(%ebp),%eax
 2c9:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 2cc:	8b 45 0c             	mov    0xc(%ebp),%eax
 2cf:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2d2:	eb 17                	jmp    2eb <memmove+0x2b>
    *dst++ = *src++;
 2d4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2d7:	8d 50 01             	lea    0x1(%eax),%edx
 2da:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2dd:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2e0:	8d 4a 01             	lea    0x1(%edx),%ecx
 2e3:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2e6:	0f b6 12             	movzbl (%edx),%edx
 2e9:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2eb:	8b 45 10             	mov    0x10(%ebp),%eax
 2ee:	8d 50 ff             	lea    -0x1(%eax),%edx
 2f1:	89 55 10             	mov    %edx,0x10(%ebp)
 2f4:	85 c0                	test   %eax,%eax
 2f6:	7f dc                	jg     2d4 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2f8:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2fb:	c9                   	leave  
 2fc:	c3                   	ret    

000002fd <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2fd:	b8 01 00 00 00       	mov    $0x1,%eax
 302:	cd 40                	int    $0x40
 304:	c3                   	ret    

00000305 <exit>:
SYSCALL(exit)
 305:	b8 02 00 00 00       	mov    $0x2,%eax
 30a:	cd 40                	int    $0x40
 30c:	c3                   	ret    

0000030d <wait>:
SYSCALL(wait)
 30d:	b8 03 00 00 00       	mov    $0x3,%eax
 312:	cd 40                	int    $0x40
 314:	c3                   	ret    

00000315 <pipe>:
SYSCALL(pipe)
 315:	b8 04 00 00 00       	mov    $0x4,%eax
 31a:	cd 40                	int    $0x40
 31c:	c3                   	ret    

0000031d <read>:
SYSCALL(read)
 31d:	b8 05 00 00 00       	mov    $0x5,%eax
 322:	cd 40                	int    $0x40
 324:	c3                   	ret    

00000325 <write>:
SYSCALL(write)
 325:	b8 10 00 00 00       	mov    $0x10,%eax
 32a:	cd 40                	int    $0x40
 32c:	c3                   	ret    

0000032d <close>:
SYSCALL(close)
 32d:	b8 15 00 00 00       	mov    $0x15,%eax
 332:	cd 40                	int    $0x40
 334:	c3                   	ret    

00000335 <kill>:
SYSCALL(kill)
 335:	b8 06 00 00 00       	mov    $0x6,%eax
 33a:	cd 40                	int    $0x40
 33c:	c3                   	ret    

0000033d <exec>:
SYSCALL(exec)
 33d:	b8 07 00 00 00       	mov    $0x7,%eax
 342:	cd 40                	int    $0x40
 344:	c3                   	ret    

00000345 <open>:
SYSCALL(open)
 345:	b8 0f 00 00 00       	mov    $0xf,%eax
 34a:	cd 40                	int    $0x40
 34c:	c3                   	ret    

0000034d <mknod>:
SYSCALL(mknod)
 34d:	b8 11 00 00 00       	mov    $0x11,%eax
 352:	cd 40                	int    $0x40
 354:	c3                   	ret    

00000355 <unlink>:
SYSCALL(unlink)
 355:	b8 12 00 00 00       	mov    $0x12,%eax
 35a:	cd 40                	int    $0x40
 35c:	c3                   	ret    

0000035d <fstat>:
SYSCALL(fstat)
 35d:	b8 08 00 00 00       	mov    $0x8,%eax
 362:	cd 40                	int    $0x40
 364:	c3                   	ret    

00000365 <link>:
SYSCALL(link)
 365:	b8 13 00 00 00       	mov    $0x13,%eax
 36a:	cd 40                	int    $0x40
 36c:	c3                   	ret    

0000036d <mkdir>:
SYSCALL(mkdir)
 36d:	b8 14 00 00 00       	mov    $0x14,%eax
 372:	cd 40                	int    $0x40
 374:	c3                   	ret    

00000375 <chdir>:
SYSCALL(chdir)
 375:	b8 09 00 00 00       	mov    $0x9,%eax
 37a:	cd 40                	int    $0x40
 37c:	c3                   	ret    

0000037d <dup>:
SYSCALL(dup)
 37d:	b8 0a 00 00 00       	mov    $0xa,%eax
 382:	cd 40                	int    $0x40
 384:	c3                   	ret    

00000385 <getpid>:
SYSCALL(getpid)
 385:	b8 0b 00 00 00       	mov    $0xb,%eax
 38a:	cd 40                	int    $0x40
 38c:	c3                   	ret    

0000038d <sbrk>:
SYSCALL(sbrk)
 38d:	b8 0c 00 00 00       	mov    $0xc,%eax
 392:	cd 40                	int    $0x40
 394:	c3                   	ret    

00000395 <sleep>:
SYSCALL(sleep)
 395:	b8 0d 00 00 00       	mov    $0xd,%eax
 39a:	cd 40                	int    $0x40
 39c:	c3                   	ret    

0000039d <uptime>:
SYSCALL(uptime)
 39d:	b8 0e 00 00 00       	mov    $0xe,%eax
 3a2:	cd 40                	int    $0x40
 3a4:	c3                   	ret    

000003a5 <waitpid>:
SYSCALL(waitpid)
 3a5:	b8 16 00 00 00       	mov    $0x16,%eax
 3aa:	cd 40                	int    $0x40
 3ac:	c3                   	ret    

000003ad <setprio>:
SYSCALL(setprio)
 3ad:	b8 17 00 00 00       	mov    $0x17,%eax
 3b2:	cd 40                	int    $0x40
 3b4:	c3                   	ret    

000003b5 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3b5:	55                   	push   %ebp
 3b6:	89 e5                	mov    %esp,%ebp
 3b8:	83 ec 18             	sub    $0x18,%esp
 3bb:	8b 45 0c             	mov    0xc(%ebp),%eax
 3be:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 3c1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3c8:	00 
 3c9:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3cc:	89 44 24 04          	mov    %eax,0x4(%esp)
 3d0:	8b 45 08             	mov    0x8(%ebp),%eax
 3d3:	89 04 24             	mov    %eax,(%esp)
 3d6:	e8 4a ff ff ff       	call   325 <write>
}
 3db:	c9                   	leave  
 3dc:	c3                   	ret    

000003dd <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3dd:	55                   	push   %ebp
 3de:	89 e5                	mov    %esp,%ebp
 3e0:	56                   	push   %esi
 3e1:	53                   	push   %ebx
 3e2:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3e5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3ec:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3f0:	74 17                	je     409 <printint+0x2c>
 3f2:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3f6:	79 11                	jns    409 <printint+0x2c>
    neg = 1;
 3f8:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3ff:	8b 45 0c             	mov    0xc(%ebp),%eax
 402:	f7 d8                	neg    %eax
 404:	89 45 ec             	mov    %eax,-0x14(%ebp)
 407:	eb 06                	jmp    40f <printint+0x32>
  } else {
    x = xx;
 409:	8b 45 0c             	mov    0xc(%ebp),%eax
 40c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 40f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 416:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 419:	8d 41 01             	lea    0x1(%ecx),%eax
 41c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 41f:	8b 5d 10             	mov    0x10(%ebp),%ebx
 422:	8b 45 ec             	mov    -0x14(%ebp),%eax
 425:	ba 00 00 00 00       	mov    $0x0,%edx
 42a:	f7 f3                	div    %ebx
 42c:	89 d0                	mov    %edx,%eax
 42e:	0f b6 80 dc 0a 00 00 	movzbl 0xadc(%eax),%eax
 435:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 439:	8b 75 10             	mov    0x10(%ebp),%esi
 43c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 43f:	ba 00 00 00 00       	mov    $0x0,%edx
 444:	f7 f6                	div    %esi
 446:	89 45 ec             	mov    %eax,-0x14(%ebp)
 449:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 44d:	75 c7                	jne    416 <printint+0x39>
  if(neg)
 44f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 453:	74 10                	je     465 <printint+0x88>
    buf[i++] = '-';
 455:	8b 45 f4             	mov    -0xc(%ebp),%eax
 458:	8d 50 01             	lea    0x1(%eax),%edx
 45b:	89 55 f4             	mov    %edx,-0xc(%ebp)
 45e:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 463:	eb 1f                	jmp    484 <printint+0xa7>
 465:	eb 1d                	jmp    484 <printint+0xa7>
    putc(fd, buf[i]);
 467:	8d 55 dc             	lea    -0x24(%ebp),%edx
 46a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 46d:	01 d0                	add    %edx,%eax
 46f:	0f b6 00             	movzbl (%eax),%eax
 472:	0f be c0             	movsbl %al,%eax
 475:	89 44 24 04          	mov    %eax,0x4(%esp)
 479:	8b 45 08             	mov    0x8(%ebp),%eax
 47c:	89 04 24             	mov    %eax,(%esp)
 47f:	e8 31 ff ff ff       	call   3b5 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 484:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 488:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 48c:	79 d9                	jns    467 <printint+0x8a>
    putc(fd, buf[i]);
}
 48e:	83 c4 30             	add    $0x30,%esp
 491:	5b                   	pop    %ebx
 492:	5e                   	pop    %esi
 493:	5d                   	pop    %ebp
 494:	c3                   	ret    

00000495 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 495:	55                   	push   %ebp
 496:	89 e5                	mov    %esp,%ebp
 498:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 49b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 4a2:	8d 45 0c             	lea    0xc(%ebp),%eax
 4a5:	83 c0 04             	add    $0x4,%eax
 4a8:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 4ab:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 4b2:	e9 7c 01 00 00       	jmp    633 <printf+0x19e>
    c = fmt[i] & 0xff;
 4b7:	8b 55 0c             	mov    0xc(%ebp),%edx
 4ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4bd:	01 d0                	add    %edx,%eax
 4bf:	0f b6 00             	movzbl (%eax),%eax
 4c2:	0f be c0             	movsbl %al,%eax
 4c5:	25 ff 00 00 00       	and    $0xff,%eax
 4ca:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 4cd:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4d1:	75 2c                	jne    4ff <printf+0x6a>
      if(c == '%'){
 4d3:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 4d7:	75 0c                	jne    4e5 <printf+0x50>
        state = '%';
 4d9:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 4e0:	e9 4a 01 00 00       	jmp    62f <printf+0x19a>
      } else {
        putc(fd, c);
 4e5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4e8:	0f be c0             	movsbl %al,%eax
 4eb:	89 44 24 04          	mov    %eax,0x4(%esp)
 4ef:	8b 45 08             	mov    0x8(%ebp),%eax
 4f2:	89 04 24             	mov    %eax,(%esp)
 4f5:	e8 bb fe ff ff       	call   3b5 <putc>
 4fa:	e9 30 01 00 00       	jmp    62f <printf+0x19a>
      }
    } else if(state == '%'){
 4ff:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 503:	0f 85 26 01 00 00    	jne    62f <printf+0x19a>
      if(c == 'd'){
 509:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 50d:	75 2d                	jne    53c <printf+0xa7>
        printint(fd, *ap, 10, 1);
 50f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 512:	8b 00                	mov    (%eax),%eax
 514:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 51b:	00 
 51c:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 523:	00 
 524:	89 44 24 04          	mov    %eax,0x4(%esp)
 528:	8b 45 08             	mov    0x8(%ebp),%eax
 52b:	89 04 24             	mov    %eax,(%esp)
 52e:	e8 aa fe ff ff       	call   3dd <printint>
        ap++;
 533:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 537:	e9 ec 00 00 00       	jmp    628 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 53c:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 540:	74 06                	je     548 <printf+0xb3>
 542:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 546:	75 2d                	jne    575 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 548:	8b 45 e8             	mov    -0x18(%ebp),%eax
 54b:	8b 00                	mov    (%eax),%eax
 54d:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 554:	00 
 555:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 55c:	00 
 55d:	89 44 24 04          	mov    %eax,0x4(%esp)
 561:	8b 45 08             	mov    0x8(%ebp),%eax
 564:	89 04 24             	mov    %eax,(%esp)
 567:	e8 71 fe ff ff       	call   3dd <printint>
        ap++;
 56c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 570:	e9 b3 00 00 00       	jmp    628 <printf+0x193>
      } else if(c == 's'){
 575:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 579:	75 45                	jne    5c0 <printf+0x12b>
        s = (char*)*ap;
 57b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 57e:	8b 00                	mov    (%eax),%eax
 580:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 583:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 587:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 58b:	75 09                	jne    596 <printf+0x101>
          s = "(null)";
 58d:	c7 45 f4 8e 08 00 00 	movl   $0x88e,-0xc(%ebp)
        while(*s != 0){
 594:	eb 1e                	jmp    5b4 <printf+0x11f>
 596:	eb 1c                	jmp    5b4 <printf+0x11f>
          putc(fd, *s);
 598:	8b 45 f4             	mov    -0xc(%ebp),%eax
 59b:	0f b6 00             	movzbl (%eax),%eax
 59e:	0f be c0             	movsbl %al,%eax
 5a1:	89 44 24 04          	mov    %eax,0x4(%esp)
 5a5:	8b 45 08             	mov    0x8(%ebp),%eax
 5a8:	89 04 24             	mov    %eax,(%esp)
 5ab:	e8 05 fe ff ff       	call   3b5 <putc>
          s++;
 5b0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5b7:	0f b6 00             	movzbl (%eax),%eax
 5ba:	84 c0                	test   %al,%al
 5bc:	75 da                	jne    598 <printf+0x103>
 5be:	eb 68                	jmp    628 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5c0:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 5c4:	75 1d                	jne    5e3 <printf+0x14e>
        putc(fd, *ap);
 5c6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5c9:	8b 00                	mov    (%eax),%eax
 5cb:	0f be c0             	movsbl %al,%eax
 5ce:	89 44 24 04          	mov    %eax,0x4(%esp)
 5d2:	8b 45 08             	mov    0x8(%ebp),%eax
 5d5:	89 04 24             	mov    %eax,(%esp)
 5d8:	e8 d8 fd ff ff       	call   3b5 <putc>
        ap++;
 5dd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5e1:	eb 45                	jmp    628 <printf+0x193>
      } else if(c == '%'){
 5e3:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5e7:	75 17                	jne    600 <printf+0x16b>
        putc(fd, c);
 5e9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5ec:	0f be c0             	movsbl %al,%eax
 5ef:	89 44 24 04          	mov    %eax,0x4(%esp)
 5f3:	8b 45 08             	mov    0x8(%ebp),%eax
 5f6:	89 04 24             	mov    %eax,(%esp)
 5f9:	e8 b7 fd ff ff       	call   3b5 <putc>
 5fe:	eb 28                	jmp    628 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 600:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 607:	00 
 608:	8b 45 08             	mov    0x8(%ebp),%eax
 60b:	89 04 24             	mov    %eax,(%esp)
 60e:	e8 a2 fd ff ff       	call   3b5 <putc>
        putc(fd, c);
 613:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 616:	0f be c0             	movsbl %al,%eax
 619:	89 44 24 04          	mov    %eax,0x4(%esp)
 61d:	8b 45 08             	mov    0x8(%ebp),%eax
 620:	89 04 24             	mov    %eax,(%esp)
 623:	e8 8d fd ff ff       	call   3b5 <putc>
      }
      state = 0;
 628:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 62f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 633:	8b 55 0c             	mov    0xc(%ebp),%edx
 636:	8b 45 f0             	mov    -0x10(%ebp),%eax
 639:	01 d0                	add    %edx,%eax
 63b:	0f b6 00             	movzbl (%eax),%eax
 63e:	84 c0                	test   %al,%al
 640:	0f 85 71 fe ff ff    	jne    4b7 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 646:	c9                   	leave  
 647:	c3                   	ret    

00000648 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 648:	55                   	push   %ebp
 649:	89 e5                	mov    %esp,%ebp
 64b:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 64e:	8b 45 08             	mov    0x8(%ebp),%eax
 651:	83 e8 08             	sub    $0x8,%eax
 654:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 657:	a1 f8 0a 00 00       	mov    0xaf8,%eax
 65c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 65f:	eb 24                	jmp    685 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 661:	8b 45 fc             	mov    -0x4(%ebp),%eax
 664:	8b 00                	mov    (%eax),%eax
 666:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 669:	77 12                	ja     67d <free+0x35>
 66b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 66e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 671:	77 24                	ja     697 <free+0x4f>
 673:	8b 45 fc             	mov    -0x4(%ebp),%eax
 676:	8b 00                	mov    (%eax),%eax
 678:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 67b:	77 1a                	ja     697 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 67d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 680:	8b 00                	mov    (%eax),%eax
 682:	89 45 fc             	mov    %eax,-0x4(%ebp)
 685:	8b 45 f8             	mov    -0x8(%ebp),%eax
 688:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 68b:	76 d4                	jbe    661 <free+0x19>
 68d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 690:	8b 00                	mov    (%eax),%eax
 692:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 695:	76 ca                	jbe    661 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 697:	8b 45 f8             	mov    -0x8(%ebp),%eax
 69a:	8b 40 04             	mov    0x4(%eax),%eax
 69d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6a4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6a7:	01 c2                	add    %eax,%edx
 6a9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ac:	8b 00                	mov    (%eax),%eax
 6ae:	39 c2                	cmp    %eax,%edx
 6b0:	75 24                	jne    6d6 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 6b2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6b5:	8b 50 04             	mov    0x4(%eax),%edx
 6b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6bb:	8b 00                	mov    (%eax),%eax
 6bd:	8b 40 04             	mov    0x4(%eax),%eax
 6c0:	01 c2                	add    %eax,%edx
 6c2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6c5:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 6c8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6cb:	8b 00                	mov    (%eax),%eax
 6cd:	8b 10                	mov    (%eax),%edx
 6cf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6d2:	89 10                	mov    %edx,(%eax)
 6d4:	eb 0a                	jmp    6e0 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 6d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d9:	8b 10                	mov    (%eax),%edx
 6db:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6de:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e3:	8b 40 04             	mov    0x4(%eax),%eax
 6e6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f0:	01 d0                	add    %edx,%eax
 6f2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6f5:	75 20                	jne    717 <free+0xcf>
    p->s.size += bp->s.size;
 6f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6fa:	8b 50 04             	mov    0x4(%eax),%edx
 6fd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 700:	8b 40 04             	mov    0x4(%eax),%eax
 703:	01 c2                	add    %eax,%edx
 705:	8b 45 fc             	mov    -0x4(%ebp),%eax
 708:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 70b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 70e:	8b 10                	mov    (%eax),%edx
 710:	8b 45 fc             	mov    -0x4(%ebp),%eax
 713:	89 10                	mov    %edx,(%eax)
 715:	eb 08                	jmp    71f <free+0xd7>
  } else
    p->s.ptr = bp;
 717:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71a:	8b 55 f8             	mov    -0x8(%ebp),%edx
 71d:	89 10                	mov    %edx,(%eax)
  freep = p;
 71f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 722:	a3 f8 0a 00 00       	mov    %eax,0xaf8
}
 727:	c9                   	leave  
 728:	c3                   	ret    

00000729 <morecore>:

static Header*
morecore(uint nu)
{
 729:	55                   	push   %ebp
 72a:	89 e5                	mov    %esp,%ebp
 72c:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 72f:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 736:	77 07                	ja     73f <morecore+0x16>
    nu = 4096;
 738:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 73f:	8b 45 08             	mov    0x8(%ebp),%eax
 742:	c1 e0 03             	shl    $0x3,%eax
 745:	89 04 24             	mov    %eax,(%esp)
 748:	e8 40 fc ff ff       	call   38d <sbrk>
 74d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 750:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 754:	75 07                	jne    75d <morecore+0x34>
    return 0;
 756:	b8 00 00 00 00       	mov    $0x0,%eax
 75b:	eb 22                	jmp    77f <morecore+0x56>
  hp = (Header*)p;
 75d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 760:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 763:	8b 45 f0             	mov    -0x10(%ebp),%eax
 766:	8b 55 08             	mov    0x8(%ebp),%edx
 769:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 76c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 76f:	83 c0 08             	add    $0x8,%eax
 772:	89 04 24             	mov    %eax,(%esp)
 775:	e8 ce fe ff ff       	call   648 <free>
  return freep;
 77a:	a1 f8 0a 00 00       	mov    0xaf8,%eax
}
 77f:	c9                   	leave  
 780:	c3                   	ret    

00000781 <malloc>:

void*
malloc(uint nbytes)
{
 781:	55                   	push   %ebp
 782:	89 e5                	mov    %esp,%ebp
 784:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 787:	8b 45 08             	mov    0x8(%ebp),%eax
 78a:	83 c0 07             	add    $0x7,%eax
 78d:	c1 e8 03             	shr    $0x3,%eax
 790:	83 c0 01             	add    $0x1,%eax
 793:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 796:	a1 f8 0a 00 00       	mov    0xaf8,%eax
 79b:	89 45 f0             	mov    %eax,-0x10(%ebp)
 79e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 7a2:	75 23                	jne    7c7 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 7a4:	c7 45 f0 f0 0a 00 00 	movl   $0xaf0,-0x10(%ebp)
 7ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7ae:	a3 f8 0a 00 00       	mov    %eax,0xaf8
 7b3:	a1 f8 0a 00 00       	mov    0xaf8,%eax
 7b8:	a3 f0 0a 00 00       	mov    %eax,0xaf0
    base.s.size = 0;
 7bd:	c7 05 f4 0a 00 00 00 	movl   $0x0,0xaf4
 7c4:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7ca:	8b 00                	mov    (%eax),%eax
 7cc:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 7cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d2:	8b 40 04             	mov    0x4(%eax),%eax
 7d5:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7d8:	72 4d                	jb     827 <malloc+0xa6>
      if(p->s.size == nunits)
 7da:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7dd:	8b 40 04             	mov    0x4(%eax),%eax
 7e0:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7e3:	75 0c                	jne    7f1 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 7e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e8:	8b 10                	mov    (%eax),%edx
 7ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7ed:	89 10                	mov    %edx,(%eax)
 7ef:	eb 26                	jmp    817 <malloc+0x96>
      else {
        p->s.size -= nunits;
 7f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f4:	8b 40 04             	mov    0x4(%eax),%eax
 7f7:	2b 45 ec             	sub    -0x14(%ebp),%eax
 7fa:	89 c2                	mov    %eax,%edx
 7fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ff:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 802:	8b 45 f4             	mov    -0xc(%ebp),%eax
 805:	8b 40 04             	mov    0x4(%eax),%eax
 808:	c1 e0 03             	shl    $0x3,%eax
 80b:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 80e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 811:	8b 55 ec             	mov    -0x14(%ebp),%edx
 814:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 817:	8b 45 f0             	mov    -0x10(%ebp),%eax
 81a:	a3 f8 0a 00 00       	mov    %eax,0xaf8
      return (void*)(p + 1);
 81f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 822:	83 c0 08             	add    $0x8,%eax
 825:	eb 38                	jmp    85f <malloc+0xde>
    }
    if(p == freep)
 827:	a1 f8 0a 00 00       	mov    0xaf8,%eax
 82c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 82f:	75 1b                	jne    84c <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 831:	8b 45 ec             	mov    -0x14(%ebp),%eax
 834:	89 04 24             	mov    %eax,(%esp)
 837:	e8 ed fe ff ff       	call   729 <morecore>
 83c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 83f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 843:	75 07                	jne    84c <malloc+0xcb>
        return 0;
 845:	b8 00 00 00 00       	mov    $0x0,%eax
 84a:	eb 13                	jmp    85f <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 84c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 84f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 852:	8b 45 f4             	mov    -0xc(%ebp),%eax
 855:	8b 00                	mov    (%eax),%eax
 857:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 85a:	e9 70 ff ff ff       	jmp    7cf <malloc+0x4e>
}
 85f:	c9                   	leave  
 860:	c3                   	ret    
