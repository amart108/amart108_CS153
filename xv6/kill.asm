
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int i;

  if(argc < 1){
   9:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
   d:	7f 20                	jg     2f <main+0x2f>
    printf(2, "usage: kill pid...\n");
   f:	c7 44 24 04 39 08 00 	movl   $0x839,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 4a 04 00 00       	call   46d <printf>
    exit(1);
  23:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  2a:	e8 ae 02 00 00       	call   2dd <exit>
  }
  for(i=1; i<argc; i++)
  2f:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  36:	00 
  37:	eb 27                	jmp    60 <main+0x60>
    kill(atoi(argv[i]));
  39:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  3d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  44:	8b 45 0c             	mov    0xc(%ebp),%eax
  47:	01 d0                	add    %edx,%eax
  49:	8b 00                	mov    (%eax),%eax
  4b:	89 04 24             	mov    %eax,(%esp)
  4e:	e8 f8 01 00 00       	call   24b <atoi>
  53:	89 04 24             	mov    %eax,(%esp)
  56:	e8 b2 02 00 00       	call   30d <kill>

  if(argc < 1){
    printf(2, "usage: kill pid...\n");
    exit(1);
  }
  for(i=1; i<argc; i++)
  5b:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  60:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  64:	3b 45 08             	cmp    0x8(%ebp),%eax
  67:	7c d0                	jl     39 <main+0x39>
    kill(atoi(argv[i]));
  exit(1);
  69:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  70:	e8 68 02 00 00       	call   2dd <exit>

00000075 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  75:	55                   	push   %ebp
  76:	89 e5                	mov    %esp,%ebp
  78:	57                   	push   %edi
  79:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  7a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  7d:	8b 55 10             	mov    0x10(%ebp),%edx
  80:	8b 45 0c             	mov    0xc(%ebp),%eax
  83:	89 cb                	mov    %ecx,%ebx
  85:	89 df                	mov    %ebx,%edi
  87:	89 d1                	mov    %edx,%ecx
  89:	fc                   	cld    
  8a:	f3 aa                	rep stos %al,%es:(%edi)
  8c:	89 ca                	mov    %ecx,%edx
  8e:	89 fb                	mov    %edi,%ebx
  90:	89 5d 08             	mov    %ebx,0x8(%ebp)
  93:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  96:	5b                   	pop    %ebx
  97:	5f                   	pop    %edi
  98:	5d                   	pop    %ebp
  99:	c3                   	ret    

0000009a <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  9a:	55                   	push   %ebp
  9b:	89 e5                	mov    %esp,%ebp
  9d:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  a0:	8b 45 08             	mov    0x8(%ebp),%eax
  a3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  a6:	90                   	nop
  a7:	8b 45 08             	mov    0x8(%ebp),%eax
  aa:	8d 50 01             	lea    0x1(%eax),%edx
  ad:	89 55 08             	mov    %edx,0x8(%ebp)
  b0:	8b 55 0c             	mov    0xc(%ebp),%edx
  b3:	8d 4a 01             	lea    0x1(%edx),%ecx
  b6:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  b9:	0f b6 12             	movzbl (%edx),%edx
  bc:	88 10                	mov    %dl,(%eax)
  be:	0f b6 00             	movzbl (%eax),%eax
  c1:	84 c0                	test   %al,%al
  c3:	75 e2                	jne    a7 <strcpy+0xd>
    ;
  return os;
  c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  c8:	c9                   	leave  
  c9:	c3                   	ret    

000000ca <strcmp>:

int
strcmp(const char *p, const char *q)
{
  ca:	55                   	push   %ebp
  cb:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  cd:	eb 08                	jmp    d7 <strcmp+0xd>
    p++, q++;
  cf:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  d3:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  d7:	8b 45 08             	mov    0x8(%ebp),%eax
  da:	0f b6 00             	movzbl (%eax),%eax
  dd:	84 c0                	test   %al,%al
  df:	74 10                	je     f1 <strcmp+0x27>
  e1:	8b 45 08             	mov    0x8(%ebp),%eax
  e4:	0f b6 10             	movzbl (%eax),%edx
  e7:	8b 45 0c             	mov    0xc(%ebp),%eax
  ea:	0f b6 00             	movzbl (%eax),%eax
  ed:	38 c2                	cmp    %al,%dl
  ef:	74 de                	je     cf <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  f1:	8b 45 08             	mov    0x8(%ebp),%eax
  f4:	0f b6 00             	movzbl (%eax),%eax
  f7:	0f b6 d0             	movzbl %al,%edx
  fa:	8b 45 0c             	mov    0xc(%ebp),%eax
  fd:	0f b6 00             	movzbl (%eax),%eax
 100:	0f b6 c0             	movzbl %al,%eax
 103:	29 c2                	sub    %eax,%edx
 105:	89 d0                	mov    %edx,%eax
}
 107:	5d                   	pop    %ebp
 108:	c3                   	ret    

00000109 <strlen>:

uint
strlen(char *s)
{
 109:	55                   	push   %ebp
 10a:	89 e5                	mov    %esp,%ebp
 10c:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 10f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 116:	eb 04                	jmp    11c <strlen+0x13>
 118:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 11c:	8b 55 fc             	mov    -0x4(%ebp),%edx
 11f:	8b 45 08             	mov    0x8(%ebp),%eax
 122:	01 d0                	add    %edx,%eax
 124:	0f b6 00             	movzbl (%eax),%eax
 127:	84 c0                	test   %al,%al
 129:	75 ed                	jne    118 <strlen+0xf>
    ;
  return n;
 12b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 12e:	c9                   	leave  
 12f:	c3                   	ret    

00000130 <memset>:

void*
memset(void *dst, int c, uint n)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 136:	8b 45 10             	mov    0x10(%ebp),%eax
 139:	89 44 24 08          	mov    %eax,0x8(%esp)
 13d:	8b 45 0c             	mov    0xc(%ebp),%eax
 140:	89 44 24 04          	mov    %eax,0x4(%esp)
 144:	8b 45 08             	mov    0x8(%ebp),%eax
 147:	89 04 24             	mov    %eax,(%esp)
 14a:	e8 26 ff ff ff       	call   75 <stosb>
  return dst;
 14f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 152:	c9                   	leave  
 153:	c3                   	ret    

00000154 <strchr>:

char*
strchr(const char *s, char c)
{
 154:	55                   	push   %ebp
 155:	89 e5                	mov    %esp,%ebp
 157:	83 ec 04             	sub    $0x4,%esp
 15a:	8b 45 0c             	mov    0xc(%ebp),%eax
 15d:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 160:	eb 14                	jmp    176 <strchr+0x22>
    if(*s == c)
 162:	8b 45 08             	mov    0x8(%ebp),%eax
 165:	0f b6 00             	movzbl (%eax),%eax
 168:	3a 45 fc             	cmp    -0x4(%ebp),%al
 16b:	75 05                	jne    172 <strchr+0x1e>
      return (char*)s;
 16d:	8b 45 08             	mov    0x8(%ebp),%eax
 170:	eb 13                	jmp    185 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 172:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 176:	8b 45 08             	mov    0x8(%ebp),%eax
 179:	0f b6 00             	movzbl (%eax),%eax
 17c:	84 c0                	test   %al,%al
 17e:	75 e2                	jne    162 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 180:	b8 00 00 00 00       	mov    $0x0,%eax
}
 185:	c9                   	leave  
 186:	c3                   	ret    

00000187 <gets>:

char*
gets(char *buf, int max)
{
 187:	55                   	push   %ebp
 188:	89 e5                	mov    %esp,%ebp
 18a:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 18d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 194:	eb 4c                	jmp    1e2 <gets+0x5b>
    cc = read(0, &c, 1);
 196:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 19d:	00 
 19e:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1a1:	89 44 24 04          	mov    %eax,0x4(%esp)
 1a5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1ac:	e8 44 01 00 00       	call   2f5 <read>
 1b1:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1b4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1b8:	7f 02                	jg     1bc <gets+0x35>
      break;
 1ba:	eb 31                	jmp    1ed <gets+0x66>
    buf[i++] = c;
 1bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1bf:	8d 50 01             	lea    0x1(%eax),%edx
 1c2:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1c5:	89 c2                	mov    %eax,%edx
 1c7:	8b 45 08             	mov    0x8(%ebp),%eax
 1ca:	01 c2                	add    %eax,%edx
 1cc:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1d0:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1d2:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1d6:	3c 0a                	cmp    $0xa,%al
 1d8:	74 13                	je     1ed <gets+0x66>
 1da:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1de:	3c 0d                	cmp    $0xd,%al
 1e0:	74 0b                	je     1ed <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1e5:	83 c0 01             	add    $0x1,%eax
 1e8:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1eb:	7c a9                	jl     196 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1ed:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1f0:	8b 45 08             	mov    0x8(%ebp),%eax
 1f3:	01 d0                	add    %edx,%eax
 1f5:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1f8:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1fb:	c9                   	leave  
 1fc:	c3                   	ret    

000001fd <stat>:

int
stat(char *n, struct stat *st)
{
 1fd:	55                   	push   %ebp
 1fe:	89 e5                	mov    %esp,%ebp
 200:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 203:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 20a:	00 
 20b:	8b 45 08             	mov    0x8(%ebp),%eax
 20e:	89 04 24             	mov    %eax,(%esp)
 211:	e8 07 01 00 00       	call   31d <open>
 216:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 219:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 21d:	79 07                	jns    226 <stat+0x29>
    return -1;
 21f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 224:	eb 23                	jmp    249 <stat+0x4c>
  r = fstat(fd, st);
 226:	8b 45 0c             	mov    0xc(%ebp),%eax
 229:	89 44 24 04          	mov    %eax,0x4(%esp)
 22d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 230:	89 04 24             	mov    %eax,(%esp)
 233:	e8 fd 00 00 00       	call   335 <fstat>
 238:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 23b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 23e:	89 04 24             	mov    %eax,(%esp)
 241:	e8 bf 00 00 00       	call   305 <close>
  return r;
 246:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 249:	c9                   	leave  
 24a:	c3                   	ret    

0000024b <atoi>:

int
atoi(const char *s)
{
 24b:	55                   	push   %ebp
 24c:	89 e5                	mov    %esp,%ebp
 24e:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 251:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 258:	eb 25                	jmp    27f <atoi+0x34>
    n = n*10 + *s++ - '0';
 25a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 25d:	89 d0                	mov    %edx,%eax
 25f:	c1 e0 02             	shl    $0x2,%eax
 262:	01 d0                	add    %edx,%eax
 264:	01 c0                	add    %eax,%eax
 266:	89 c1                	mov    %eax,%ecx
 268:	8b 45 08             	mov    0x8(%ebp),%eax
 26b:	8d 50 01             	lea    0x1(%eax),%edx
 26e:	89 55 08             	mov    %edx,0x8(%ebp)
 271:	0f b6 00             	movzbl (%eax),%eax
 274:	0f be c0             	movsbl %al,%eax
 277:	01 c8                	add    %ecx,%eax
 279:	83 e8 30             	sub    $0x30,%eax
 27c:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 27f:	8b 45 08             	mov    0x8(%ebp),%eax
 282:	0f b6 00             	movzbl (%eax),%eax
 285:	3c 2f                	cmp    $0x2f,%al
 287:	7e 0a                	jle    293 <atoi+0x48>
 289:	8b 45 08             	mov    0x8(%ebp),%eax
 28c:	0f b6 00             	movzbl (%eax),%eax
 28f:	3c 39                	cmp    $0x39,%al
 291:	7e c7                	jle    25a <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 293:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 296:	c9                   	leave  
 297:	c3                   	ret    

00000298 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 298:	55                   	push   %ebp
 299:	89 e5                	mov    %esp,%ebp
 29b:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 29e:	8b 45 08             	mov    0x8(%ebp),%eax
 2a1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 2a4:	8b 45 0c             	mov    0xc(%ebp),%eax
 2a7:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2aa:	eb 17                	jmp    2c3 <memmove+0x2b>
    *dst++ = *src++;
 2ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2af:	8d 50 01             	lea    0x1(%eax),%edx
 2b2:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2b5:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2b8:	8d 4a 01             	lea    0x1(%edx),%ecx
 2bb:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2be:	0f b6 12             	movzbl (%edx),%edx
 2c1:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2c3:	8b 45 10             	mov    0x10(%ebp),%eax
 2c6:	8d 50 ff             	lea    -0x1(%eax),%edx
 2c9:	89 55 10             	mov    %edx,0x10(%ebp)
 2cc:	85 c0                	test   %eax,%eax
 2ce:	7f dc                	jg     2ac <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2d0:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2d3:	c9                   	leave  
 2d4:	c3                   	ret    

000002d5 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2d5:	b8 01 00 00 00       	mov    $0x1,%eax
 2da:	cd 40                	int    $0x40
 2dc:	c3                   	ret    

000002dd <exit>:
SYSCALL(exit)
 2dd:	b8 02 00 00 00       	mov    $0x2,%eax
 2e2:	cd 40                	int    $0x40
 2e4:	c3                   	ret    

000002e5 <wait>:
SYSCALL(wait)
 2e5:	b8 03 00 00 00       	mov    $0x3,%eax
 2ea:	cd 40                	int    $0x40
 2ec:	c3                   	ret    

000002ed <pipe>:
SYSCALL(pipe)
 2ed:	b8 04 00 00 00       	mov    $0x4,%eax
 2f2:	cd 40                	int    $0x40
 2f4:	c3                   	ret    

000002f5 <read>:
SYSCALL(read)
 2f5:	b8 05 00 00 00       	mov    $0x5,%eax
 2fa:	cd 40                	int    $0x40
 2fc:	c3                   	ret    

000002fd <write>:
SYSCALL(write)
 2fd:	b8 10 00 00 00       	mov    $0x10,%eax
 302:	cd 40                	int    $0x40
 304:	c3                   	ret    

00000305 <close>:
SYSCALL(close)
 305:	b8 15 00 00 00       	mov    $0x15,%eax
 30a:	cd 40                	int    $0x40
 30c:	c3                   	ret    

0000030d <kill>:
SYSCALL(kill)
 30d:	b8 06 00 00 00       	mov    $0x6,%eax
 312:	cd 40                	int    $0x40
 314:	c3                   	ret    

00000315 <exec>:
SYSCALL(exec)
 315:	b8 07 00 00 00       	mov    $0x7,%eax
 31a:	cd 40                	int    $0x40
 31c:	c3                   	ret    

0000031d <open>:
SYSCALL(open)
 31d:	b8 0f 00 00 00       	mov    $0xf,%eax
 322:	cd 40                	int    $0x40
 324:	c3                   	ret    

00000325 <mknod>:
SYSCALL(mknod)
 325:	b8 11 00 00 00       	mov    $0x11,%eax
 32a:	cd 40                	int    $0x40
 32c:	c3                   	ret    

0000032d <unlink>:
SYSCALL(unlink)
 32d:	b8 12 00 00 00       	mov    $0x12,%eax
 332:	cd 40                	int    $0x40
 334:	c3                   	ret    

00000335 <fstat>:
SYSCALL(fstat)
 335:	b8 08 00 00 00       	mov    $0x8,%eax
 33a:	cd 40                	int    $0x40
 33c:	c3                   	ret    

0000033d <link>:
SYSCALL(link)
 33d:	b8 13 00 00 00       	mov    $0x13,%eax
 342:	cd 40                	int    $0x40
 344:	c3                   	ret    

00000345 <mkdir>:
SYSCALL(mkdir)
 345:	b8 14 00 00 00       	mov    $0x14,%eax
 34a:	cd 40                	int    $0x40
 34c:	c3                   	ret    

0000034d <chdir>:
SYSCALL(chdir)
 34d:	b8 09 00 00 00       	mov    $0x9,%eax
 352:	cd 40                	int    $0x40
 354:	c3                   	ret    

00000355 <dup>:
SYSCALL(dup)
 355:	b8 0a 00 00 00       	mov    $0xa,%eax
 35a:	cd 40                	int    $0x40
 35c:	c3                   	ret    

0000035d <getpid>:
SYSCALL(getpid)
 35d:	b8 0b 00 00 00       	mov    $0xb,%eax
 362:	cd 40                	int    $0x40
 364:	c3                   	ret    

00000365 <sbrk>:
SYSCALL(sbrk)
 365:	b8 0c 00 00 00       	mov    $0xc,%eax
 36a:	cd 40                	int    $0x40
 36c:	c3                   	ret    

0000036d <sleep>:
SYSCALL(sleep)
 36d:	b8 0d 00 00 00       	mov    $0xd,%eax
 372:	cd 40                	int    $0x40
 374:	c3                   	ret    

00000375 <uptime>:
SYSCALL(uptime)
 375:	b8 0e 00 00 00       	mov    $0xe,%eax
 37a:	cd 40                	int    $0x40
 37c:	c3                   	ret    

0000037d <waitpid>:
SYSCALL(waitpid)
 37d:	b8 16 00 00 00       	mov    $0x16,%eax
 382:	cd 40                	int    $0x40
 384:	c3                   	ret    

00000385 <setprio>:
SYSCALL(setprio)
 385:	b8 17 00 00 00       	mov    $0x17,%eax
 38a:	cd 40                	int    $0x40
 38c:	c3                   	ret    

0000038d <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 38d:	55                   	push   %ebp
 38e:	89 e5                	mov    %esp,%ebp
 390:	83 ec 18             	sub    $0x18,%esp
 393:	8b 45 0c             	mov    0xc(%ebp),%eax
 396:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 399:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3a0:	00 
 3a1:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3a4:	89 44 24 04          	mov    %eax,0x4(%esp)
 3a8:	8b 45 08             	mov    0x8(%ebp),%eax
 3ab:	89 04 24             	mov    %eax,(%esp)
 3ae:	e8 4a ff ff ff       	call   2fd <write>
}
 3b3:	c9                   	leave  
 3b4:	c3                   	ret    

000003b5 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3b5:	55                   	push   %ebp
 3b6:	89 e5                	mov    %esp,%ebp
 3b8:	56                   	push   %esi
 3b9:	53                   	push   %ebx
 3ba:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3bd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3c4:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3c8:	74 17                	je     3e1 <printint+0x2c>
 3ca:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3ce:	79 11                	jns    3e1 <printint+0x2c>
    neg = 1;
 3d0:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3d7:	8b 45 0c             	mov    0xc(%ebp),%eax
 3da:	f7 d8                	neg    %eax
 3dc:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3df:	eb 06                	jmp    3e7 <printint+0x32>
  } else {
    x = xx;
 3e1:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e4:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 3e7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 3ee:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 3f1:	8d 41 01             	lea    0x1(%ecx),%eax
 3f4:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3f7:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3fa:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3fd:	ba 00 00 00 00       	mov    $0x0,%edx
 402:	f7 f3                	div    %ebx
 404:	89 d0                	mov    %edx,%eax
 406:	0f b6 80 98 0a 00 00 	movzbl 0xa98(%eax),%eax
 40d:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 411:	8b 75 10             	mov    0x10(%ebp),%esi
 414:	8b 45 ec             	mov    -0x14(%ebp),%eax
 417:	ba 00 00 00 00       	mov    $0x0,%edx
 41c:	f7 f6                	div    %esi
 41e:	89 45 ec             	mov    %eax,-0x14(%ebp)
 421:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 425:	75 c7                	jne    3ee <printint+0x39>
  if(neg)
 427:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 42b:	74 10                	je     43d <printint+0x88>
    buf[i++] = '-';
 42d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 430:	8d 50 01             	lea    0x1(%eax),%edx
 433:	89 55 f4             	mov    %edx,-0xc(%ebp)
 436:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 43b:	eb 1f                	jmp    45c <printint+0xa7>
 43d:	eb 1d                	jmp    45c <printint+0xa7>
    putc(fd, buf[i]);
 43f:	8d 55 dc             	lea    -0x24(%ebp),%edx
 442:	8b 45 f4             	mov    -0xc(%ebp),%eax
 445:	01 d0                	add    %edx,%eax
 447:	0f b6 00             	movzbl (%eax),%eax
 44a:	0f be c0             	movsbl %al,%eax
 44d:	89 44 24 04          	mov    %eax,0x4(%esp)
 451:	8b 45 08             	mov    0x8(%ebp),%eax
 454:	89 04 24             	mov    %eax,(%esp)
 457:	e8 31 ff ff ff       	call   38d <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 45c:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 460:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 464:	79 d9                	jns    43f <printint+0x8a>
    putc(fd, buf[i]);
}
 466:	83 c4 30             	add    $0x30,%esp
 469:	5b                   	pop    %ebx
 46a:	5e                   	pop    %esi
 46b:	5d                   	pop    %ebp
 46c:	c3                   	ret    

0000046d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 46d:	55                   	push   %ebp
 46e:	89 e5                	mov    %esp,%ebp
 470:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 473:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 47a:	8d 45 0c             	lea    0xc(%ebp),%eax
 47d:	83 c0 04             	add    $0x4,%eax
 480:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 483:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 48a:	e9 7c 01 00 00       	jmp    60b <printf+0x19e>
    c = fmt[i] & 0xff;
 48f:	8b 55 0c             	mov    0xc(%ebp),%edx
 492:	8b 45 f0             	mov    -0x10(%ebp),%eax
 495:	01 d0                	add    %edx,%eax
 497:	0f b6 00             	movzbl (%eax),%eax
 49a:	0f be c0             	movsbl %al,%eax
 49d:	25 ff 00 00 00       	and    $0xff,%eax
 4a2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 4a5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4a9:	75 2c                	jne    4d7 <printf+0x6a>
      if(c == '%'){
 4ab:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 4af:	75 0c                	jne    4bd <printf+0x50>
        state = '%';
 4b1:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 4b8:	e9 4a 01 00 00       	jmp    607 <printf+0x19a>
      } else {
        putc(fd, c);
 4bd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4c0:	0f be c0             	movsbl %al,%eax
 4c3:	89 44 24 04          	mov    %eax,0x4(%esp)
 4c7:	8b 45 08             	mov    0x8(%ebp),%eax
 4ca:	89 04 24             	mov    %eax,(%esp)
 4cd:	e8 bb fe ff ff       	call   38d <putc>
 4d2:	e9 30 01 00 00       	jmp    607 <printf+0x19a>
      }
    } else if(state == '%'){
 4d7:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 4db:	0f 85 26 01 00 00    	jne    607 <printf+0x19a>
      if(c == 'd'){
 4e1:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 4e5:	75 2d                	jne    514 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 4e7:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4ea:	8b 00                	mov    (%eax),%eax
 4ec:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 4f3:	00 
 4f4:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 4fb:	00 
 4fc:	89 44 24 04          	mov    %eax,0x4(%esp)
 500:	8b 45 08             	mov    0x8(%ebp),%eax
 503:	89 04 24             	mov    %eax,(%esp)
 506:	e8 aa fe ff ff       	call   3b5 <printint>
        ap++;
 50b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 50f:	e9 ec 00 00 00       	jmp    600 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 514:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 518:	74 06                	je     520 <printf+0xb3>
 51a:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 51e:	75 2d                	jne    54d <printf+0xe0>
        printint(fd, *ap, 16, 0);
 520:	8b 45 e8             	mov    -0x18(%ebp),%eax
 523:	8b 00                	mov    (%eax),%eax
 525:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 52c:	00 
 52d:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 534:	00 
 535:	89 44 24 04          	mov    %eax,0x4(%esp)
 539:	8b 45 08             	mov    0x8(%ebp),%eax
 53c:	89 04 24             	mov    %eax,(%esp)
 53f:	e8 71 fe ff ff       	call   3b5 <printint>
        ap++;
 544:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 548:	e9 b3 00 00 00       	jmp    600 <printf+0x193>
      } else if(c == 's'){
 54d:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 551:	75 45                	jne    598 <printf+0x12b>
        s = (char*)*ap;
 553:	8b 45 e8             	mov    -0x18(%ebp),%eax
 556:	8b 00                	mov    (%eax),%eax
 558:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 55b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 55f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 563:	75 09                	jne    56e <printf+0x101>
          s = "(null)";
 565:	c7 45 f4 4d 08 00 00 	movl   $0x84d,-0xc(%ebp)
        while(*s != 0){
 56c:	eb 1e                	jmp    58c <printf+0x11f>
 56e:	eb 1c                	jmp    58c <printf+0x11f>
          putc(fd, *s);
 570:	8b 45 f4             	mov    -0xc(%ebp),%eax
 573:	0f b6 00             	movzbl (%eax),%eax
 576:	0f be c0             	movsbl %al,%eax
 579:	89 44 24 04          	mov    %eax,0x4(%esp)
 57d:	8b 45 08             	mov    0x8(%ebp),%eax
 580:	89 04 24             	mov    %eax,(%esp)
 583:	e8 05 fe ff ff       	call   38d <putc>
          s++;
 588:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 58c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 58f:	0f b6 00             	movzbl (%eax),%eax
 592:	84 c0                	test   %al,%al
 594:	75 da                	jne    570 <printf+0x103>
 596:	eb 68                	jmp    600 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 598:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 59c:	75 1d                	jne    5bb <printf+0x14e>
        putc(fd, *ap);
 59e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5a1:	8b 00                	mov    (%eax),%eax
 5a3:	0f be c0             	movsbl %al,%eax
 5a6:	89 44 24 04          	mov    %eax,0x4(%esp)
 5aa:	8b 45 08             	mov    0x8(%ebp),%eax
 5ad:	89 04 24             	mov    %eax,(%esp)
 5b0:	e8 d8 fd ff ff       	call   38d <putc>
        ap++;
 5b5:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5b9:	eb 45                	jmp    600 <printf+0x193>
      } else if(c == '%'){
 5bb:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5bf:	75 17                	jne    5d8 <printf+0x16b>
        putc(fd, c);
 5c1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5c4:	0f be c0             	movsbl %al,%eax
 5c7:	89 44 24 04          	mov    %eax,0x4(%esp)
 5cb:	8b 45 08             	mov    0x8(%ebp),%eax
 5ce:	89 04 24             	mov    %eax,(%esp)
 5d1:	e8 b7 fd ff ff       	call   38d <putc>
 5d6:	eb 28                	jmp    600 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5d8:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 5df:	00 
 5e0:	8b 45 08             	mov    0x8(%ebp),%eax
 5e3:	89 04 24             	mov    %eax,(%esp)
 5e6:	e8 a2 fd ff ff       	call   38d <putc>
        putc(fd, c);
 5eb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5ee:	0f be c0             	movsbl %al,%eax
 5f1:	89 44 24 04          	mov    %eax,0x4(%esp)
 5f5:	8b 45 08             	mov    0x8(%ebp),%eax
 5f8:	89 04 24             	mov    %eax,(%esp)
 5fb:	e8 8d fd ff ff       	call   38d <putc>
      }
      state = 0;
 600:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 607:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 60b:	8b 55 0c             	mov    0xc(%ebp),%edx
 60e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 611:	01 d0                	add    %edx,%eax
 613:	0f b6 00             	movzbl (%eax),%eax
 616:	84 c0                	test   %al,%al
 618:	0f 85 71 fe ff ff    	jne    48f <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 61e:	c9                   	leave  
 61f:	c3                   	ret    

00000620 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 620:	55                   	push   %ebp
 621:	89 e5                	mov    %esp,%ebp
 623:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 626:	8b 45 08             	mov    0x8(%ebp),%eax
 629:	83 e8 08             	sub    $0x8,%eax
 62c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 62f:	a1 b4 0a 00 00       	mov    0xab4,%eax
 634:	89 45 fc             	mov    %eax,-0x4(%ebp)
 637:	eb 24                	jmp    65d <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 639:	8b 45 fc             	mov    -0x4(%ebp),%eax
 63c:	8b 00                	mov    (%eax),%eax
 63e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 641:	77 12                	ja     655 <free+0x35>
 643:	8b 45 f8             	mov    -0x8(%ebp),%eax
 646:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 649:	77 24                	ja     66f <free+0x4f>
 64b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 64e:	8b 00                	mov    (%eax),%eax
 650:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 653:	77 1a                	ja     66f <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 655:	8b 45 fc             	mov    -0x4(%ebp),%eax
 658:	8b 00                	mov    (%eax),%eax
 65a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 65d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 660:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 663:	76 d4                	jbe    639 <free+0x19>
 665:	8b 45 fc             	mov    -0x4(%ebp),%eax
 668:	8b 00                	mov    (%eax),%eax
 66a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 66d:	76 ca                	jbe    639 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 66f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 672:	8b 40 04             	mov    0x4(%eax),%eax
 675:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 67c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 67f:	01 c2                	add    %eax,%edx
 681:	8b 45 fc             	mov    -0x4(%ebp),%eax
 684:	8b 00                	mov    (%eax),%eax
 686:	39 c2                	cmp    %eax,%edx
 688:	75 24                	jne    6ae <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 68a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 68d:	8b 50 04             	mov    0x4(%eax),%edx
 690:	8b 45 fc             	mov    -0x4(%ebp),%eax
 693:	8b 00                	mov    (%eax),%eax
 695:	8b 40 04             	mov    0x4(%eax),%eax
 698:	01 c2                	add    %eax,%edx
 69a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 69d:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 6a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a3:	8b 00                	mov    (%eax),%eax
 6a5:	8b 10                	mov    (%eax),%edx
 6a7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6aa:	89 10                	mov    %edx,(%eax)
 6ac:	eb 0a                	jmp    6b8 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 6ae:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b1:	8b 10                	mov    (%eax),%edx
 6b3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6b6:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6bb:	8b 40 04             	mov    0x4(%eax),%eax
 6be:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c8:	01 d0                	add    %edx,%eax
 6ca:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6cd:	75 20                	jne    6ef <free+0xcf>
    p->s.size += bp->s.size;
 6cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d2:	8b 50 04             	mov    0x4(%eax),%edx
 6d5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6d8:	8b 40 04             	mov    0x4(%eax),%eax
 6db:	01 c2                	add    %eax,%edx
 6dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e0:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6e3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6e6:	8b 10                	mov    (%eax),%edx
 6e8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6eb:	89 10                	mov    %edx,(%eax)
 6ed:	eb 08                	jmp    6f7 <free+0xd7>
  } else
    p->s.ptr = bp;
 6ef:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f2:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6f5:	89 10                	mov    %edx,(%eax)
  freep = p;
 6f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6fa:	a3 b4 0a 00 00       	mov    %eax,0xab4
}
 6ff:	c9                   	leave  
 700:	c3                   	ret    

00000701 <morecore>:

static Header*
morecore(uint nu)
{
 701:	55                   	push   %ebp
 702:	89 e5                	mov    %esp,%ebp
 704:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 707:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 70e:	77 07                	ja     717 <morecore+0x16>
    nu = 4096;
 710:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 717:	8b 45 08             	mov    0x8(%ebp),%eax
 71a:	c1 e0 03             	shl    $0x3,%eax
 71d:	89 04 24             	mov    %eax,(%esp)
 720:	e8 40 fc ff ff       	call   365 <sbrk>
 725:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 728:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 72c:	75 07                	jne    735 <morecore+0x34>
    return 0;
 72e:	b8 00 00 00 00       	mov    $0x0,%eax
 733:	eb 22                	jmp    757 <morecore+0x56>
  hp = (Header*)p;
 735:	8b 45 f4             	mov    -0xc(%ebp),%eax
 738:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 73b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 73e:	8b 55 08             	mov    0x8(%ebp),%edx
 741:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 744:	8b 45 f0             	mov    -0x10(%ebp),%eax
 747:	83 c0 08             	add    $0x8,%eax
 74a:	89 04 24             	mov    %eax,(%esp)
 74d:	e8 ce fe ff ff       	call   620 <free>
  return freep;
 752:	a1 b4 0a 00 00       	mov    0xab4,%eax
}
 757:	c9                   	leave  
 758:	c3                   	ret    

00000759 <malloc>:

void*
malloc(uint nbytes)
{
 759:	55                   	push   %ebp
 75a:	89 e5                	mov    %esp,%ebp
 75c:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 75f:	8b 45 08             	mov    0x8(%ebp),%eax
 762:	83 c0 07             	add    $0x7,%eax
 765:	c1 e8 03             	shr    $0x3,%eax
 768:	83 c0 01             	add    $0x1,%eax
 76b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 76e:	a1 b4 0a 00 00       	mov    0xab4,%eax
 773:	89 45 f0             	mov    %eax,-0x10(%ebp)
 776:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 77a:	75 23                	jne    79f <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 77c:	c7 45 f0 ac 0a 00 00 	movl   $0xaac,-0x10(%ebp)
 783:	8b 45 f0             	mov    -0x10(%ebp),%eax
 786:	a3 b4 0a 00 00       	mov    %eax,0xab4
 78b:	a1 b4 0a 00 00       	mov    0xab4,%eax
 790:	a3 ac 0a 00 00       	mov    %eax,0xaac
    base.s.size = 0;
 795:	c7 05 b0 0a 00 00 00 	movl   $0x0,0xab0
 79c:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 79f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7a2:	8b 00                	mov    (%eax),%eax
 7a4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 7a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7aa:	8b 40 04             	mov    0x4(%eax),%eax
 7ad:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7b0:	72 4d                	jb     7ff <malloc+0xa6>
      if(p->s.size == nunits)
 7b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b5:	8b 40 04             	mov    0x4(%eax),%eax
 7b8:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7bb:	75 0c                	jne    7c9 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 7bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c0:	8b 10                	mov    (%eax),%edx
 7c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7c5:	89 10                	mov    %edx,(%eax)
 7c7:	eb 26                	jmp    7ef <malloc+0x96>
      else {
        p->s.size -= nunits;
 7c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7cc:	8b 40 04             	mov    0x4(%eax),%eax
 7cf:	2b 45 ec             	sub    -0x14(%ebp),%eax
 7d2:	89 c2                	mov    %eax,%edx
 7d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d7:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7da:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7dd:	8b 40 04             	mov    0x4(%eax),%eax
 7e0:	c1 e0 03             	shl    $0x3,%eax
 7e3:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 7e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e9:	8b 55 ec             	mov    -0x14(%ebp),%edx
 7ec:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7f2:	a3 b4 0a 00 00       	mov    %eax,0xab4
      return (void*)(p + 1);
 7f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7fa:	83 c0 08             	add    $0x8,%eax
 7fd:	eb 38                	jmp    837 <malloc+0xde>
    }
    if(p == freep)
 7ff:	a1 b4 0a 00 00       	mov    0xab4,%eax
 804:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 807:	75 1b                	jne    824 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 809:	8b 45 ec             	mov    -0x14(%ebp),%eax
 80c:	89 04 24             	mov    %eax,(%esp)
 80f:	e8 ed fe ff ff       	call   701 <morecore>
 814:	89 45 f4             	mov    %eax,-0xc(%ebp)
 817:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 81b:	75 07                	jne    824 <malloc+0xcb>
        return 0;
 81d:	b8 00 00 00 00       	mov    $0x0,%eax
 822:	eb 13                	jmp    837 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 824:	8b 45 f4             	mov    -0xc(%ebp),%eax
 827:	89 45 f0             	mov    %eax,-0x10(%ebp)
 82a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 82d:	8b 00                	mov    (%eax),%eax
 82f:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 832:	e9 70 ff ff ff       	jmp    7a7 <malloc+0x4e>
}
 837:	c9                   	leave  
 838:	c3                   	ret    
