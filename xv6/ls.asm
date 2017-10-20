
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <fmtname>:
#include "user.h"
#include "fs.h"

char*
fmtname(char *path)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 24             	sub    $0x24,%esp
  static char buf[DIRSIZ+1];
  char *p;
  
  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
   7:	8b 45 08             	mov    0x8(%ebp),%eax
   a:	89 04 24             	mov    %eax,(%esp)
   d:	e8 eb 03 00 00       	call   3fd <strlen>
  12:	8b 55 08             	mov    0x8(%ebp),%edx
  15:	01 d0                	add    %edx,%eax
  17:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1a:	eb 04                	jmp    20 <fmtname+0x20>
  1c:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  20:	8b 45 f4             	mov    -0xc(%ebp),%eax
  23:	3b 45 08             	cmp    0x8(%ebp),%eax
  26:	72 0a                	jb     32 <fmtname+0x32>
  28:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2b:	0f b6 00             	movzbl (%eax),%eax
  2e:	3c 2f                	cmp    $0x2f,%al
  30:	75 ea                	jne    1c <fmtname+0x1c>
    ;
  p++;
  32:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  
  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
  36:	8b 45 f4             	mov    -0xc(%ebp),%eax
  39:	89 04 24             	mov    %eax,(%esp)
  3c:	e8 bc 03 00 00       	call   3fd <strlen>
  41:	83 f8 0d             	cmp    $0xd,%eax
  44:	76 05                	jbe    4b <fmtname+0x4b>
    return p;
  46:	8b 45 f4             	mov    -0xc(%ebp),%eax
  49:	eb 5f                	jmp    aa <fmtname+0xaa>
  memmove(buf, p, strlen(p));
  4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  4e:	89 04 24             	mov    %eax,(%esp)
  51:	e8 a7 03 00 00       	call   3fd <strlen>
  56:	89 44 24 08          	mov    %eax,0x8(%esp)
  5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  5d:	89 44 24 04          	mov    %eax,0x4(%esp)
  61:	c7 04 24 2c 0e 00 00 	movl   $0xe2c,(%esp)
  68:	e8 1f 05 00 00       	call   58c <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  70:	89 04 24             	mov    %eax,(%esp)
  73:	e8 85 03 00 00       	call   3fd <strlen>
  78:	ba 0e 00 00 00       	mov    $0xe,%edx
  7d:	89 d3                	mov    %edx,%ebx
  7f:	29 c3                	sub    %eax,%ebx
  81:	8b 45 f4             	mov    -0xc(%ebp),%eax
  84:	89 04 24             	mov    %eax,(%esp)
  87:	e8 71 03 00 00       	call   3fd <strlen>
  8c:	05 2c 0e 00 00       	add    $0xe2c,%eax
  91:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  95:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  9c:	00 
  9d:	89 04 24             	mov    %eax,(%esp)
  a0:	e8 7f 03 00 00       	call   424 <memset>
  return buf;
  a5:	b8 2c 0e 00 00       	mov    $0xe2c,%eax
}
  aa:	83 c4 24             	add    $0x24,%esp
  ad:	5b                   	pop    %ebx
  ae:	5d                   	pop    %ebp
  af:	c3                   	ret    

000000b0 <ls>:

void
ls(char *path)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	57                   	push   %edi
  b4:	56                   	push   %esi
  b5:	53                   	push   %ebx
  b6:	81 ec 5c 02 00 00    	sub    $0x25c,%esp
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;
  
  if((fd = open(path, 0)) < 0){
  bc:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  c3:	00 
  c4:	8b 45 08             	mov    0x8(%ebp),%eax
  c7:	89 04 24             	mov    %eax,(%esp)
  ca:	e8 42 05 00 00       	call   611 <open>
  cf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  d2:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  d6:	79 20                	jns    f8 <ls+0x48>
    printf(2, "ls: cannot open %s\n", path);
  d8:	8b 45 08             	mov    0x8(%ebp),%eax
  db:	89 44 24 08          	mov    %eax,0x8(%esp)
  df:	c7 44 24 04 2d 0b 00 	movl   $0xb2d,0x4(%esp)
  e6:	00 
  e7:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  ee:	e8 6e 06 00 00       	call   761 <printf>
    return;
  f3:	e9 01 02 00 00       	jmp    2f9 <ls+0x249>
  }
  
  if(fstat(fd, &st) < 0){
  f8:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
  fe:	89 44 24 04          	mov    %eax,0x4(%esp)
 102:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 105:	89 04 24             	mov    %eax,(%esp)
 108:	e8 1c 05 00 00       	call   629 <fstat>
 10d:	85 c0                	test   %eax,%eax
 10f:	79 2b                	jns    13c <ls+0x8c>
    printf(2, "ls: cannot stat %s\n", path);
 111:	8b 45 08             	mov    0x8(%ebp),%eax
 114:	89 44 24 08          	mov    %eax,0x8(%esp)
 118:	c7 44 24 04 41 0b 00 	movl   $0xb41,0x4(%esp)
 11f:	00 
 120:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 127:	e8 35 06 00 00       	call   761 <printf>
    close(fd);
 12c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 12f:	89 04 24             	mov    %eax,(%esp)
 132:	e8 c2 04 00 00       	call   5f9 <close>
    return;
 137:	e9 bd 01 00 00       	jmp    2f9 <ls+0x249>
  }
  
  switch(st.type){
 13c:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 143:	98                   	cwtl   
 144:	83 f8 01             	cmp    $0x1,%eax
 147:	74 53                	je     19c <ls+0xec>
 149:	83 f8 02             	cmp    $0x2,%eax
 14c:	0f 85 9c 01 00 00    	jne    2ee <ls+0x23e>
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 152:	8b bd cc fd ff ff    	mov    -0x234(%ebp),%edi
 158:	8b b5 c4 fd ff ff    	mov    -0x23c(%ebp),%esi
 15e:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 165:	0f bf d8             	movswl %ax,%ebx
 168:	8b 45 08             	mov    0x8(%ebp),%eax
 16b:	89 04 24             	mov    %eax,(%esp)
 16e:	e8 8d fe ff ff       	call   0 <fmtname>
 173:	89 7c 24 14          	mov    %edi,0x14(%esp)
 177:	89 74 24 10          	mov    %esi,0x10(%esp)
 17b:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 17f:	89 44 24 08          	mov    %eax,0x8(%esp)
 183:	c7 44 24 04 55 0b 00 	movl   $0xb55,0x4(%esp)
 18a:	00 
 18b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 192:	e8 ca 05 00 00       	call   761 <printf>
    break;
 197:	e9 52 01 00 00       	jmp    2ee <ls+0x23e>
  
  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 19c:	8b 45 08             	mov    0x8(%ebp),%eax
 19f:	89 04 24             	mov    %eax,(%esp)
 1a2:	e8 56 02 00 00       	call   3fd <strlen>
 1a7:	83 c0 10             	add    $0x10,%eax
 1aa:	3d 00 02 00 00       	cmp    $0x200,%eax
 1af:	76 19                	jbe    1ca <ls+0x11a>
      printf(1, "ls: path too long\n");
 1b1:	c7 44 24 04 62 0b 00 	movl   $0xb62,0x4(%esp)
 1b8:	00 
 1b9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1c0:	e8 9c 05 00 00       	call   761 <printf>
      break;
 1c5:	e9 24 01 00 00       	jmp    2ee <ls+0x23e>
    }
    strcpy(buf, path);
 1ca:	8b 45 08             	mov    0x8(%ebp),%eax
 1cd:	89 44 24 04          	mov    %eax,0x4(%esp)
 1d1:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 1d7:	89 04 24             	mov    %eax,(%esp)
 1da:	e8 af 01 00 00       	call   38e <strcpy>
    p = buf+strlen(buf);
 1df:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 1e5:	89 04 24             	mov    %eax,(%esp)
 1e8:	e8 10 02 00 00       	call   3fd <strlen>
 1ed:	8d 95 e0 fd ff ff    	lea    -0x220(%ebp),%edx
 1f3:	01 d0                	add    %edx,%eax
 1f5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    *p++ = '/';
 1f8:	8b 45 e0             	mov    -0x20(%ebp),%eax
 1fb:	8d 50 01             	lea    0x1(%eax),%edx
 1fe:	89 55 e0             	mov    %edx,-0x20(%ebp)
 201:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 204:	e9 be 00 00 00       	jmp    2c7 <ls+0x217>
      if(de.inum == 0)
 209:	0f b7 85 d0 fd ff ff 	movzwl -0x230(%ebp),%eax
 210:	66 85 c0             	test   %ax,%ax
 213:	75 05                	jne    21a <ls+0x16a>
        continue;
 215:	e9 ad 00 00 00       	jmp    2c7 <ls+0x217>
      memmove(p, de.name, DIRSIZ);
 21a:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
 221:	00 
 222:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
 228:	83 c0 02             	add    $0x2,%eax
 22b:	89 44 24 04          	mov    %eax,0x4(%esp)
 22f:	8b 45 e0             	mov    -0x20(%ebp),%eax
 232:	89 04 24             	mov    %eax,(%esp)
 235:	e8 52 03 00 00       	call   58c <memmove>
      p[DIRSIZ] = 0;
 23a:	8b 45 e0             	mov    -0x20(%ebp),%eax
 23d:	83 c0 0e             	add    $0xe,%eax
 240:	c6 00 00             	movb   $0x0,(%eax)
      if(stat(buf, &st) < 0){
 243:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
 249:	89 44 24 04          	mov    %eax,0x4(%esp)
 24d:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 253:	89 04 24             	mov    %eax,(%esp)
 256:	e8 96 02 00 00       	call   4f1 <stat>
 25b:	85 c0                	test   %eax,%eax
 25d:	79 20                	jns    27f <ls+0x1cf>
        printf(1, "ls: cannot stat %s\n", buf);
 25f:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 265:	89 44 24 08          	mov    %eax,0x8(%esp)
 269:	c7 44 24 04 41 0b 00 	movl   $0xb41,0x4(%esp)
 270:	00 
 271:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 278:	e8 e4 04 00 00       	call   761 <printf>
        continue;
 27d:	eb 48                	jmp    2c7 <ls+0x217>
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 27f:	8b bd cc fd ff ff    	mov    -0x234(%ebp),%edi
 285:	8b b5 c4 fd ff ff    	mov    -0x23c(%ebp),%esi
 28b:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 292:	0f bf d8             	movswl %ax,%ebx
 295:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 29b:	89 04 24             	mov    %eax,(%esp)
 29e:	e8 5d fd ff ff       	call   0 <fmtname>
 2a3:	89 7c 24 14          	mov    %edi,0x14(%esp)
 2a7:	89 74 24 10          	mov    %esi,0x10(%esp)
 2ab:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 2af:	89 44 24 08          	mov    %eax,0x8(%esp)
 2b3:	c7 44 24 04 55 0b 00 	movl   $0xb55,0x4(%esp)
 2ba:	00 
 2bb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2c2:	e8 9a 04 00 00       	call   761 <printf>
      break;
    }
    strcpy(buf, path);
    p = buf+strlen(buf);
    *p++ = '/';
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 2c7:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 2ce:	00 
 2cf:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
 2d5:	89 44 24 04          	mov    %eax,0x4(%esp)
 2d9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 2dc:	89 04 24             	mov    %eax,(%esp)
 2df:	e8 05 03 00 00       	call   5e9 <read>
 2e4:	83 f8 10             	cmp    $0x10,%eax
 2e7:	0f 84 1c ff ff ff    	je     209 <ls+0x159>
        printf(1, "ls: cannot stat %s\n", buf);
        continue;
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
    }
    break;
 2ed:	90                   	nop
  }
  close(fd);
 2ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 2f1:	89 04 24             	mov    %eax,(%esp)
 2f4:	e8 00 03 00 00       	call   5f9 <close>
}
 2f9:	81 c4 5c 02 00 00    	add    $0x25c,%esp
 2ff:	5b                   	pop    %ebx
 300:	5e                   	pop    %esi
 301:	5f                   	pop    %edi
 302:	5d                   	pop    %ebp
 303:	c3                   	ret    

00000304 <main>:

int
main(int argc, char *argv[])
{
 304:	55                   	push   %ebp
 305:	89 e5                	mov    %esp,%ebp
 307:	83 e4 f0             	and    $0xfffffff0,%esp
 30a:	83 ec 20             	sub    $0x20,%esp
  int i;

  if(argc < 2){
 30d:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 311:	7f 18                	jg     32b <main+0x27>
    ls(".");
 313:	c7 04 24 75 0b 00 00 	movl   $0xb75,(%esp)
 31a:	e8 91 fd ff ff       	call   b0 <ls>
    exit(1);
 31f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 326:	e8 a6 02 00 00       	call   5d1 <exit>
  }
  for(i=1; i<argc; i++)
 32b:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
 332:	00 
 333:	eb 1f                	jmp    354 <main+0x50>
    ls(argv[i]);
 335:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 339:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 340:	8b 45 0c             	mov    0xc(%ebp),%eax
 343:	01 d0                	add    %edx,%eax
 345:	8b 00                	mov    (%eax),%eax
 347:	89 04 24             	mov    %eax,(%esp)
 34a:	e8 61 fd ff ff       	call   b0 <ls>

  if(argc < 2){
    ls(".");
    exit(1);
  }
  for(i=1; i<argc; i++)
 34f:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 354:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 358:	3b 45 08             	cmp    0x8(%ebp),%eax
 35b:	7c d8                	jl     335 <main+0x31>
    ls(argv[i]);
  exit(1);
 35d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 364:	e8 68 02 00 00       	call   5d1 <exit>

00000369 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 369:	55                   	push   %ebp
 36a:	89 e5                	mov    %esp,%ebp
 36c:	57                   	push   %edi
 36d:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 36e:	8b 4d 08             	mov    0x8(%ebp),%ecx
 371:	8b 55 10             	mov    0x10(%ebp),%edx
 374:	8b 45 0c             	mov    0xc(%ebp),%eax
 377:	89 cb                	mov    %ecx,%ebx
 379:	89 df                	mov    %ebx,%edi
 37b:	89 d1                	mov    %edx,%ecx
 37d:	fc                   	cld    
 37e:	f3 aa                	rep stos %al,%es:(%edi)
 380:	89 ca                	mov    %ecx,%edx
 382:	89 fb                	mov    %edi,%ebx
 384:	89 5d 08             	mov    %ebx,0x8(%ebp)
 387:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 38a:	5b                   	pop    %ebx
 38b:	5f                   	pop    %edi
 38c:	5d                   	pop    %ebp
 38d:	c3                   	ret    

0000038e <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 38e:	55                   	push   %ebp
 38f:	89 e5                	mov    %esp,%ebp
 391:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 394:	8b 45 08             	mov    0x8(%ebp),%eax
 397:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 39a:	90                   	nop
 39b:	8b 45 08             	mov    0x8(%ebp),%eax
 39e:	8d 50 01             	lea    0x1(%eax),%edx
 3a1:	89 55 08             	mov    %edx,0x8(%ebp)
 3a4:	8b 55 0c             	mov    0xc(%ebp),%edx
 3a7:	8d 4a 01             	lea    0x1(%edx),%ecx
 3aa:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 3ad:	0f b6 12             	movzbl (%edx),%edx
 3b0:	88 10                	mov    %dl,(%eax)
 3b2:	0f b6 00             	movzbl (%eax),%eax
 3b5:	84 c0                	test   %al,%al
 3b7:	75 e2                	jne    39b <strcpy+0xd>
    ;
  return os;
 3b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3bc:	c9                   	leave  
 3bd:	c3                   	ret    

000003be <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3be:	55                   	push   %ebp
 3bf:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 3c1:	eb 08                	jmp    3cb <strcmp+0xd>
    p++, q++;
 3c3:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3c7:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3cb:	8b 45 08             	mov    0x8(%ebp),%eax
 3ce:	0f b6 00             	movzbl (%eax),%eax
 3d1:	84 c0                	test   %al,%al
 3d3:	74 10                	je     3e5 <strcmp+0x27>
 3d5:	8b 45 08             	mov    0x8(%ebp),%eax
 3d8:	0f b6 10             	movzbl (%eax),%edx
 3db:	8b 45 0c             	mov    0xc(%ebp),%eax
 3de:	0f b6 00             	movzbl (%eax),%eax
 3e1:	38 c2                	cmp    %al,%dl
 3e3:	74 de                	je     3c3 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 3e5:	8b 45 08             	mov    0x8(%ebp),%eax
 3e8:	0f b6 00             	movzbl (%eax),%eax
 3eb:	0f b6 d0             	movzbl %al,%edx
 3ee:	8b 45 0c             	mov    0xc(%ebp),%eax
 3f1:	0f b6 00             	movzbl (%eax),%eax
 3f4:	0f b6 c0             	movzbl %al,%eax
 3f7:	29 c2                	sub    %eax,%edx
 3f9:	89 d0                	mov    %edx,%eax
}
 3fb:	5d                   	pop    %ebp
 3fc:	c3                   	ret    

000003fd <strlen>:

uint
strlen(char *s)
{
 3fd:	55                   	push   %ebp
 3fe:	89 e5                	mov    %esp,%ebp
 400:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 403:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 40a:	eb 04                	jmp    410 <strlen+0x13>
 40c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 410:	8b 55 fc             	mov    -0x4(%ebp),%edx
 413:	8b 45 08             	mov    0x8(%ebp),%eax
 416:	01 d0                	add    %edx,%eax
 418:	0f b6 00             	movzbl (%eax),%eax
 41b:	84 c0                	test   %al,%al
 41d:	75 ed                	jne    40c <strlen+0xf>
    ;
  return n;
 41f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 422:	c9                   	leave  
 423:	c3                   	ret    

00000424 <memset>:

void*
memset(void *dst, int c, uint n)
{
 424:	55                   	push   %ebp
 425:	89 e5                	mov    %esp,%ebp
 427:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 42a:	8b 45 10             	mov    0x10(%ebp),%eax
 42d:	89 44 24 08          	mov    %eax,0x8(%esp)
 431:	8b 45 0c             	mov    0xc(%ebp),%eax
 434:	89 44 24 04          	mov    %eax,0x4(%esp)
 438:	8b 45 08             	mov    0x8(%ebp),%eax
 43b:	89 04 24             	mov    %eax,(%esp)
 43e:	e8 26 ff ff ff       	call   369 <stosb>
  return dst;
 443:	8b 45 08             	mov    0x8(%ebp),%eax
}
 446:	c9                   	leave  
 447:	c3                   	ret    

00000448 <strchr>:

char*
strchr(const char *s, char c)
{
 448:	55                   	push   %ebp
 449:	89 e5                	mov    %esp,%ebp
 44b:	83 ec 04             	sub    $0x4,%esp
 44e:	8b 45 0c             	mov    0xc(%ebp),%eax
 451:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 454:	eb 14                	jmp    46a <strchr+0x22>
    if(*s == c)
 456:	8b 45 08             	mov    0x8(%ebp),%eax
 459:	0f b6 00             	movzbl (%eax),%eax
 45c:	3a 45 fc             	cmp    -0x4(%ebp),%al
 45f:	75 05                	jne    466 <strchr+0x1e>
      return (char*)s;
 461:	8b 45 08             	mov    0x8(%ebp),%eax
 464:	eb 13                	jmp    479 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 466:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 46a:	8b 45 08             	mov    0x8(%ebp),%eax
 46d:	0f b6 00             	movzbl (%eax),%eax
 470:	84 c0                	test   %al,%al
 472:	75 e2                	jne    456 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 474:	b8 00 00 00 00       	mov    $0x0,%eax
}
 479:	c9                   	leave  
 47a:	c3                   	ret    

0000047b <gets>:

char*
gets(char *buf, int max)
{
 47b:	55                   	push   %ebp
 47c:	89 e5                	mov    %esp,%ebp
 47e:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 481:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 488:	eb 4c                	jmp    4d6 <gets+0x5b>
    cc = read(0, &c, 1);
 48a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 491:	00 
 492:	8d 45 ef             	lea    -0x11(%ebp),%eax
 495:	89 44 24 04          	mov    %eax,0x4(%esp)
 499:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 4a0:	e8 44 01 00 00       	call   5e9 <read>
 4a5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 4a8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4ac:	7f 02                	jg     4b0 <gets+0x35>
      break;
 4ae:	eb 31                	jmp    4e1 <gets+0x66>
    buf[i++] = c;
 4b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4b3:	8d 50 01             	lea    0x1(%eax),%edx
 4b6:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4b9:	89 c2                	mov    %eax,%edx
 4bb:	8b 45 08             	mov    0x8(%ebp),%eax
 4be:	01 c2                	add    %eax,%edx
 4c0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4c4:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 4c6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4ca:	3c 0a                	cmp    $0xa,%al
 4cc:	74 13                	je     4e1 <gets+0x66>
 4ce:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4d2:	3c 0d                	cmp    $0xd,%al
 4d4:	74 0b                	je     4e1 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4d9:	83 c0 01             	add    $0x1,%eax
 4dc:	3b 45 0c             	cmp    0xc(%ebp),%eax
 4df:	7c a9                	jl     48a <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 4e1:	8b 55 f4             	mov    -0xc(%ebp),%edx
 4e4:	8b 45 08             	mov    0x8(%ebp),%eax
 4e7:	01 d0                	add    %edx,%eax
 4e9:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 4ec:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4ef:	c9                   	leave  
 4f0:	c3                   	ret    

000004f1 <stat>:

int
stat(char *n, struct stat *st)
{
 4f1:	55                   	push   %ebp
 4f2:	89 e5                	mov    %esp,%ebp
 4f4:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4f7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 4fe:	00 
 4ff:	8b 45 08             	mov    0x8(%ebp),%eax
 502:	89 04 24             	mov    %eax,(%esp)
 505:	e8 07 01 00 00       	call   611 <open>
 50a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 50d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 511:	79 07                	jns    51a <stat+0x29>
    return -1;
 513:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 518:	eb 23                	jmp    53d <stat+0x4c>
  r = fstat(fd, st);
 51a:	8b 45 0c             	mov    0xc(%ebp),%eax
 51d:	89 44 24 04          	mov    %eax,0x4(%esp)
 521:	8b 45 f4             	mov    -0xc(%ebp),%eax
 524:	89 04 24             	mov    %eax,(%esp)
 527:	e8 fd 00 00 00       	call   629 <fstat>
 52c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 52f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 532:	89 04 24             	mov    %eax,(%esp)
 535:	e8 bf 00 00 00       	call   5f9 <close>
  return r;
 53a:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 53d:	c9                   	leave  
 53e:	c3                   	ret    

0000053f <atoi>:

int
atoi(const char *s)
{
 53f:	55                   	push   %ebp
 540:	89 e5                	mov    %esp,%ebp
 542:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 545:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 54c:	eb 25                	jmp    573 <atoi+0x34>
    n = n*10 + *s++ - '0';
 54e:	8b 55 fc             	mov    -0x4(%ebp),%edx
 551:	89 d0                	mov    %edx,%eax
 553:	c1 e0 02             	shl    $0x2,%eax
 556:	01 d0                	add    %edx,%eax
 558:	01 c0                	add    %eax,%eax
 55a:	89 c1                	mov    %eax,%ecx
 55c:	8b 45 08             	mov    0x8(%ebp),%eax
 55f:	8d 50 01             	lea    0x1(%eax),%edx
 562:	89 55 08             	mov    %edx,0x8(%ebp)
 565:	0f b6 00             	movzbl (%eax),%eax
 568:	0f be c0             	movsbl %al,%eax
 56b:	01 c8                	add    %ecx,%eax
 56d:	83 e8 30             	sub    $0x30,%eax
 570:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 573:	8b 45 08             	mov    0x8(%ebp),%eax
 576:	0f b6 00             	movzbl (%eax),%eax
 579:	3c 2f                	cmp    $0x2f,%al
 57b:	7e 0a                	jle    587 <atoi+0x48>
 57d:	8b 45 08             	mov    0x8(%ebp),%eax
 580:	0f b6 00             	movzbl (%eax),%eax
 583:	3c 39                	cmp    $0x39,%al
 585:	7e c7                	jle    54e <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 587:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 58a:	c9                   	leave  
 58b:	c3                   	ret    

0000058c <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 58c:	55                   	push   %ebp
 58d:	89 e5                	mov    %esp,%ebp
 58f:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 592:	8b 45 08             	mov    0x8(%ebp),%eax
 595:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 598:	8b 45 0c             	mov    0xc(%ebp),%eax
 59b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 59e:	eb 17                	jmp    5b7 <memmove+0x2b>
    *dst++ = *src++;
 5a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5a3:	8d 50 01             	lea    0x1(%eax),%edx
 5a6:	89 55 fc             	mov    %edx,-0x4(%ebp)
 5a9:	8b 55 f8             	mov    -0x8(%ebp),%edx
 5ac:	8d 4a 01             	lea    0x1(%edx),%ecx
 5af:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 5b2:	0f b6 12             	movzbl (%edx),%edx
 5b5:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 5b7:	8b 45 10             	mov    0x10(%ebp),%eax
 5ba:	8d 50 ff             	lea    -0x1(%eax),%edx
 5bd:	89 55 10             	mov    %edx,0x10(%ebp)
 5c0:	85 c0                	test   %eax,%eax
 5c2:	7f dc                	jg     5a0 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 5c4:	8b 45 08             	mov    0x8(%ebp),%eax
}
 5c7:	c9                   	leave  
 5c8:	c3                   	ret    

000005c9 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5c9:	b8 01 00 00 00       	mov    $0x1,%eax
 5ce:	cd 40                	int    $0x40
 5d0:	c3                   	ret    

000005d1 <exit>:
SYSCALL(exit)
 5d1:	b8 02 00 00 00       	mov    $0x2,%eax
 5d6:	cd 40                	int    $0x40
 5d8:	c3                   	ret    

000005d9 <wait>:
SYSCALL(wait)
 5d9:	b8 03 00 00 00       	mov    $0x3,%eax
 5de:	cd 40                	int    $0x40
 5e0:	c3                   	ret    

000005e1 <pipe>:
SYSCALL(pipe)
 5e1:	b8 04 00 00 00       	mov    $0x4,%eax
 5e6:	cd 40                	int    $0x40
 5e8:	c3                   	ret    

000005e9 <read>:
SYSCALL(read)
 5e9:	b8 05 00 00 00       	mov    $0x5,%eax
 5ee:	cd 40                	int    $0x40
 5f0:	c3                   	ret    

000005f1 <write>:
SYSCALL(write)
 5f1:	b8 10 00 00 00       	mov    $0x10,%eax
 5f6:	cd 40                	int    $0x40
 5f8:	c3                   	ret    

000005f9 <close>:
SYSCALL(close)
 5f9:	b8 15 00 00 00       	mov    $0x15,%eax
 5fe:	cd 40                	int    $0x40
 600:	c3                   	ret    

00000601 <kill>:
SYSCALL(kill)
 601:	b8 06 00 00 00       	mov    $0x6,%eax
 606:	cd 40                	int    $0x40
 608:	c3                   	ret    

00000609 <exec>:
SYSCALL(exec)
 609:	b8 07 00 00 00       	mov    $0x7,%eax
 60e:	cd 40                	int    $0x40
 610:	c3                   	ret    

00000611 <open>:
SYSCALL(open)
 611:	b8 0f 00 00 00       	mov    $0xf,%eax
 616:	cd 40                	int    $0x40
 618:	c3                   	ret    

00000619 <mknod>:
SYSCALL(mknod)
 619:	b8 11 00 00 00       	mov    $0x11,%eax
 61e:	cd 40                	int    $0x40
 620:	c3                   	ret    

00000621 <unlink>:
SYSCALL(unlink)
 621:	b8 12 00 00 00       	mov    $0x12,%eax
 626:	cd 40                	int    $0x40
 628:	c3                   	ret    

00000629 <fstat>:
SYSCALL(fstat)
 629:	b8 08 00 00 00       	mov    $0x8,%eax
 62e:	cd 40                	int    $0x40
 630:	c3                   	ret    

00000631 <link>:
SYSCALL(link)
 631:	b8 13 00 00 00       	mov    $0x13,%eax
 636:	cd 40                	int    $0x40
 638:	c3                   	ret    

00000639 <mkdir>:
SYSCALL(mkdir)
 639:	b8 14 00 00 00       	mov    $0x14,%eax
 63e:	cd 40                	int    $0x40
 640:	c3                   	ret    

00000641 <chdir>:
SYSCALL(chdir)
 641:	b8 09 00 00 00       	mov    $0x9,%eax
 646:	cd 40                	int    $0x40
 648:	c3                   	ret    

00000649 <dup>:
SYSCALL(dup)
 649:	b8 0a 00 00 00       	mov    $0xa,%eax
 64e:	cd 40                	int    $0x40
 650:	c3                   	ret    

00000651 <getpid>:
SYSCALL(getpid)
 651:	b8 0b 00 00 00       	mov    $0xb,%eax
 656:	cd 40                	int    $0x40
 658:	c3                   	ret    

00000659 <sbrk>:
SYSCALL(sbrk)
 659:	b8 0c 00 00 00       	mov    $0xc,%eax
 65e:	cd 40                	int    $0x40
 660:	c3                   	ret    

00000661 <sleep>:
SYSCALL(sleep)
 661:	b8 0d 00 00 00       	mov    $0xd,%eax
 666:	cd 40                	int    $0x40
 668:	c3                   	ret    

00000669 <uptime>:
SYSCALL(uptime)
 669:	b8 0e 00 00 00       	mov    $0xe,%eax
 66e:	cd 40                	int    $0x40
 670:	c3                   	ret    

00000671 <waitpid>:
SYSCALL(waitpid)
 671:	b8 16 00 00 00       	mov    $0x16,%eax
 676:	cd 40                	int    $0x40
 678:	c3                   	ret    

00000679 <setprio>:
SYSCALL(setprio)
 679:	b8 17 00 00 00       	mov    $0x17,%eax
 67e:	cd 40                	int    $0x40
 680:	c3                   	ret    

00000681 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 681:	55                   	push   %ebp
 682:	89 e5                	mov    %esp,%ebp
 684:	83 ec 18             	sub    $0x18,%esp
 687:	8b 45 0c             	mov    0xc(%ebp),%eax
 68a:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 68d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 694:	00 
 695:	8d 45 f4             	lea    -0xc(%ebp),%eax
 698:	89 44 24 04          	mov    %eax,0x4(%esp)
 69c:	8b 45 08             	mov    0x8(%ebp),%eax
 69f:	89 04 24             	mov    %eax,(%esp)
 6a2:	e8 4a ff ff ff       	call   5f1 <write>
}
 6a7:	c9                   	leave  
 6a8:	c3                   	ret    

000006a9 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6a9:	55                   	push   %ebp
 6aa:	89 e5                	mov    %esp,%ebp
 6ac:	56                   	push   %esi
 6ad:	53                   	push   %ebx
 6ae:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 6b1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 6b8:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 6bc:	74 17                	je     6d5 <printint+0x2c>
 6be:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 6c2:	79 11                	jns    6d5 <printint+0x2c>
    neg = 1;
 6c4:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 6cb:	8b 45 0c             	mov    0xc(%ebp),%eax
 6ce:	f7 d8                	neg    %eax
 6d0:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6d3:	eb 06                	jmp    6db <printint+0x32>
  } else {
    x = xx;
 6d5:	8b 45 0c             	mov    0xc(%ebp),%eax
 6d8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 6db:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 6e2:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 6e5:	8d 41 01             	lea    0x1(%ecx),%eax
 6e8:	89 45 f4             	mov    %eax,-0xc(%ebp)
 6eb:	8b 5d 10             	mov    0x10(%ebp),%ebx
 6ee:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6f1:	ba 00 00 00 00       	mov    $0x0,%edx
 6f6:	f7 f3                	div    %ebx
 6f8:	89 d0                	mov    %edx,%eax
 6fa:	0f b6 80 18 0e 00 00 	movzbl 0xe18(%eax),%eax
 701:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 705:	8b 75 10             	mov    0x10(%ebp),%esi
 708:	8b 45 ec             	mov    -0x14(%ebp),%eax
 70b:	ba 00 00 00 00       	mov    $0x0,%edx
 710:	f7 f6                	div    %esi
 712:	89 45 ec             	mov    %eax,-0x14(%ebp)
 715:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 719:	75 c7                	jne    6e2 <printint+0x39>
  if(neg)
 71b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 71f:	74 10                	je     731 <printint+0x88>
    buf[i++] = '-';
 721:	8b 45 f4             	mov    -0xc(%ebp),%eax
 724:	8d 50 01             	lea    0x1(%eax),%edx
 727:	89 55 f4             	mov    %edx,-0xc(%ebp)
 72a:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 72f:	eb 1f                	jmp    750 <printint+0xa7>
 731:	eb 1d                	jmp    750 <printint+0xa7>
    putc(fd, buf[i]);
 733:	8d 55 dc             	lea    -0x24(%ebp),%edx
 736:	8b 45 f4             	mov    -0xc(%ebp),%eax
 739:	01 d0                	add    %edx,%eax
 73b:	0f b6 00             	movzbl (%eax),%eax
 73e:	0f be c0             	movsbl %al,%eax
 741:	89 44 24 04          	mov    %eax,0x4(%esp)
 745:	8b 45 08             	mov    0x8(%ebp),%eax
 748:	89 04 24             	mov    %eax,(%esp)
 74b:	e8 31 ff ff ff       	call   681 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 750:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 754:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 758:	79 d9                	jns    733 <printint+0x8a>
    putc(fd, buf[i]);
}
 75a:	83 c4 30             	add    $0x30,%esp
 75d:	5b                   	pop    %ebx
 75e:	5e                   	pop    %esi
 75f:	5d                   	pop    %ebp
 760:	c3                   	ret    

00000761 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 761:	55                   	push   %ebp
 762:	89 e5                	mov    %esp,%ebp
 764:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 767:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 76e:	8d 45 0c             	lea    0xc(%ebp),%eax
 771:	83 c0 04             	add    $0x4,%eax
 774:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 777:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 77e:	e9 7c 01 00 00       	jmp    8ff <printf+0x19e>
    c = fmt[i] & 0xff;
 783:	8b 55 0c             	mov    0xc(%ebp),%edx
 786:	8b 45 f0             	mov    -0x10(%ebp),%eax
 789:	01 d0                	add    %edx,%eax
 78b:	0f b6 00             	movzbl (%eax),%eax
 78e:	0f be c0             	movsbl %al,%eax
 791:	25 ff 00 00 00       	and    $0xff,%eax
 796:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 799:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 79d:	75 2c                	jne    7cb <printf+0x6a>
      if(c == '%'){
 79f:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 7a3:	75 0c                	jne    7b1 <printf+0x50>
        state = '%';
 7a5:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 7ac:	e9 4a 01 00 00       	jmp    8fb <printf+0x19a>
      } else {
        putc(fd, c);
 7b1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7b4:	0f be c0             	movsbl %al,%eax
 7b7:	89 44 24 04          	mov    %eax,0x4(%esp)
 7bb:	8b 45 08             	mov    0x8(%ebp),%eax
 7be:	89 04 24             	mov    %eax,(%esp)
 7c1:	e8 bb fe ff ff       	call   681 <putc>
 7c6:	e9 30 01 00 00       	jmp    8fb <printf+0x19a>
      }
    } else if(state == '%'){
 7cb:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 7cf:	0f 85 26 01 00 00    	jne    8fb <printf+0x19a>
      if(c == 'd'){
 7d5:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 7d9:	75 2d                	jne    808 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 7db:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7de:	8b 00                	mov    (%eax),%eax
 7e0:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 7e7:	00 
 7e8:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 7ef:	00 
 7f0:	89 44 24 04          	mov    %eax,0x4(%esp)
 7f4:	8b 45 08             	mov    0x8(%ebp),%eax
 7f7:	89 04 24             	mov    %eax,(%esp)
 7fa:	e8 aa fe ff ff       	call   6a9 <printint>
        ap++;
 7ff:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 803:	e9 ec 00 00 00       	jmp    8f4 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 808:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 80c:	74 06                	je     814 <printf+0xb3>
 80e:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 812:	75 2d                	jne    841 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 814:	8b 45 e8             	mov    -0x18(%ebp),%eax
 817:	8b 00                	mov    (%eax),%eax
 819:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 820:	00 
 821:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 828:	00 
 829:	89 44 24 04          	mov    %eax,0x4(%esp)
 82d:	8b 45 08             	mov    0x8(%ebp),%eax
 830:	89 04 24             	mov    %eax,(%esp)
 833:	e8 71 fe ff ff       	call   6a9 <printint>
        ap++;
 838:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 83c:	e9 b3 00 00 00       	jmp    8f4 <printf+0x193>
      } else if(c == 's'){
 841:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 845:	75 45                	jne    88c <printf+0x12b>
        s = (char*)*ap;
 847:	8b 45 e8             	mov    -0x18(%ebp),%eax
 84a:	8b 00                	mov    (%eax),%eax
 84c:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 84f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 853:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 857:	75 09                	jne    862 <printf+0x101>
          s = "(null)";
 859:	c7 45 f4 77 0b 00 00 	movl   $0xb77,-0xc(%ebp)
        while(*s != 0){
 860:	eb 1e                	jmp    880 <printf+0x11f>
 862:	eb 1c                	jmp    880 <printf+0x11f>
          putc(fd, *s);
 864:	8b 45 f4             	mov    -0xc(%ebp),%eax
 867:	0f b6 00             	movzbl (%eax),%eax
 86a:	0f be c0             	movsbl %al,%eax
 86d:	89 44 24 04          	mov    %eax,0x4(%esp)
 871:	8b 45 08             	mov    0x8(%ebp),%eax
 874:	89 04 24             	mov    %eax,(%esp)
 877:	e8 05 fe ff ff       	call   681 <putc>
          s++;
 87c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 880:	8b 45 f4             	mov    -0xc(%ebp),%eax
 883:	0f b6 00             	movzbl (%eax),%eax
 886:	84 c0                	test   %al,%al
 888:	75 da                	jne    864 <printf+0x103>
 88a:	eb 68                	jmp    8f4 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 88c:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 890:	75 1d                	jne    8af <printf+0x14e>
        putc(fd, *ap);
 892:	8b 45 e8             	mov    -0x18(%ebp),%eax
 895:	8b 00                	mov    (%eax),%eax
 897:	0f be c0             	movsbl %al,%eax
 89a:	89 44 24 04          	mov    %eax,0x4(%esp)
 89e:	8b 45 08             	mov    0x8(%ebp),%eax
 8a1:	89 04 24             	mov    %eax,(%esp)
 8a4:	e8 d8 fd ff ff       	call   681 <putc>
        ap++;
 8a9:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 8ad:	eb 45                	jmp    8f4 <printf+0x193>
      } else if(c == '%'){
 8af:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 8b3:	75 17                	jne    8cc <printf+0x16b>
        putc(fd, c);
 8b5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8b8:	0f be c0             	movsbl %al,%eax
 8bb:	89 44 24 04          	mov    %eax,0x4(%esp)
 8bf:	8b 45 08             	mov    0x8(%ebp),%eax
 8c2:	89 04 24             	mov    %eax,(%esp)
 8c5:	e8 b7 fd ff ff       	call   681 <putc>
 8ca:	eb 28                	jmp    8f4 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 8cc:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 8d3:	00 
 8d4:	8b 45 08             	mov    0x8(%ebp),%eax
 8d7:	89 04 24             	mov    %eax,(%esp)
 8da:	e8 a2 fd ff ff       	call   681 <putc>
        putc(fd, c);
 8df:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8e2:	0f be c0             	movsbl %al,%eax
 8e5:	89 44 24 04          	mov    %eax,0x4(%esp)
 8e9:	8b 45 08             	mov    0x8(%ebp),%eax
 8ec:	89 04 24             	mov    %eax,(%esp)
 8ef:	e8 8d fd ff ff       	call   681 <putc>
      }
      state = 0;
 8f4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8fb:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 8ff:	8b 55 0c             	mov    0xc(%ebp),%edx
 902:	8b 45 f0             	mov    -0x10(%ebp),%eax
 905:	01 d0                	add    %edx,%eax
 907:	0f b6 00             	movzbl (%eax),%eax
 90a:	84 c0                	test   %al,%al
 90c:	0f 85 71 fe ff ff    	jne    783 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 912:	c9                   	leave  
 913:	c3                   	ret    

00000914 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 914:	55                   	push   %ebp
 915:	89 e5                	mov    %esp,%ebp
 917:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 91a:	8b 45 08             	mov    0x8(%ebp),%eax
 91d:	83 e8 08             	sub    $0x8,%eax
 920:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 923:	a1 44 0e 00 00       	mov    0xe44,%eax
 928:	89 45 fc             	mov    %eax,-0x4(%ebp)
 92b:	eb 24                	jmp    951 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 92d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 930:	8b 00                	mov    (%eax),%eax
 932:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 935:	77 12                	ja     949 <free+0x35>
 937:	8b 45 f8             	mov    -0x8(%ebp),%eax
 93a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 93d:	77 24                	ja     963 <free+0x4f>
 93f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 942:	8b 00                	mov    (%eax),%eax
 944:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 947:	77 1a                	ja     963 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 949:	8b 45 fc             	mov    -0x4(%ebp),%eax
 94c:	8b 00                	mov    (%eax),%eax
 94e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 951:	8b 45 f8             	mov    -0x8(%ebp),%eax
 954:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 957:	76 d4                	jbe    92d <free+0x19>
 959:	8b 45 fc             	mov    -0x4(%ebp),%eax
 95c:	8b 00                	mov    (%eax),%eax
 95e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 961:	76 ca                	jbe    92d <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 963:	8b 45 f8             	mov    -0x8(%ebp),%eax
 966:	8b 40 04             	mov    0x4(%eax),%eax
 969:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 970:	8b 45 f8             	mov    -0x8(%ebp),%eax
 973:	01 c2                	add    %eax,%edx
 975:	8b 45 fc             	mov    -0x4(%ebp),%eax
 978:	8b 00                	mov    (%eax),%eax
 97a:	39 c2                	cmp    %eax,%edx
 97c:	75 24                	jne    9a2 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 97e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 981:	8b 50 04             	mov    0x4(%eax),%edx
 984:	8b 45 fc             	mov    -0x4(%ebp),%eax
 987:	8b 00                	mov    (%eax),%eax
 989:	8b 40 04             	mov    0x4(%eax),%eax
 98c:	01 c2                	add    %eax,%edx
 98e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 991:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 994:	8b 45 fc             	mov    -0x4(%ebp),%eax
 997:	8b 00                	mov    (%eax),%eax
 999:	8b 10                	mov    (%eax),%edx
 99b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 99e:	89 10                	mov    %edx,(%eax)
 9a0:	eb 0a                	jmp    9ac <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 9a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9a5:	8b 10                	mov    (%eax),%edx
 9a7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9aa:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 9ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9af:	8b 40 04             	mov    0x4(%eax),%eax
 9b2:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 9b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9bc:	01 d0                	add    %edx,%eax
 9be:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 9c1:	75 20                	jne    9e3 <free+0xcf>
    p->s.size += bp->s.size;
 9c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9c6:	8b 50 04             	mov    0x4(%eax),%edx
 9c9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9cc:	8b 40 04             	mov    0x4(%eax),%eax
 9cf:	01 c2                	add    %eax,%edx
 9d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9d4:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9d7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9da:	8b 10                	mov    (%eax),%edx
 9dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9df:	89 10                	mov    %edx,(%eax)
 9e1:	eb 08                	jmp    9eb <free+0xd7>
  } else
    p->s.ptr = bp;
 9e3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9e6:	8b 55 f8             	mov    -0x8(%ebp),%edx
 9e9:	89 10                	mov    %edx,(%eax)
  freep = p;
 9eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9ee:	a3 44 0e 00 00       	mov    %eax,0xe44
}
 9f3:	c9                   	leave  
 9f4:	c3                   	ret    

000009f5 <morecore>:

static Header*
morecore(uint nu)
{
 9f5:	55                   	push   %ebp
 9f6:	89 e5                	mov    %esp,%ebp
 9f8:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 9fb:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 a02:	77 07                	ja     a0b <morecore+0x16>
    nu = 4096;
 a04:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 a0b:	8b 45 08             	mov    0x8(%ebp),%eax
 a0e:	c1 e0 03             	shl    $0x3,%eax
 a11:	89 04 24             	mov    %eax,(%esp)
 a14:	e8 40 fc ff ff       	call   659 <sbrk>
 a19:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 a1c:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 a20:	75 07                	jne    a29 <morecore+0x34>
    return 0;
 a22:	b8 00 00 00 00       	mov    $0x0,%eax
 a27:	eb 22                	jmp    a4b <morecore+0x56>
  hp = (Header*)p;
 a29:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a2c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 a2f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a32:	8b 55 08             	mov    0x8(%ebp),%edx
 a35:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 a38:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a3b:	83 c0 08             	add    $0x8,%eax
 a3e:	89 04 24             	mov    %eax,(%esp)
 a41:	e8 ce fe ff ff       	call   914 <free>
  return freep;
 a46:	a1 44 0e 00 00       	mov    0xe44,%eax
}
 a4b:	c9                   	leave  
 a4c:	c3                   	ret    

00000a4d <malloc>:

void*
malloc(uint nbytes)
{
 a4d:	55                   	push   %ebp
 a4e:	89 e5                	mov    %esp,%ebp
 a50:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a53:	8b 45 08             	mov    0x8(%ebp),%eax
 a56:	83 c0 07             	add    $0x7,%eax
 a59:	c1 e8 03             	shr    $0x3,%eax
 a5c:	83 c0 01             	add    $0x1,%eax
 a5f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 a62:	a1 44 0e 00 00       	mov    0xe44,%eax
 a67:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a6a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a6e:	75 23                	jne    a93 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a70:	c7 45 f0 3c 0e 00 00 	movl   $0xe3c,-0x10(%ebp)
 a77:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a7a:	a3 44 0e 00 00       	mov    %eax,0xe44
 a7f:	a1 44 0e 00 00       	mov    0xe44,%eax
 a84:	a3 3c 0e 00 00       	mov    %eax,0xe3c
    base.s.size = 0;
 a89:	c7 05 40 0e 00 00 00 	movl   $0x0,0xe40
 a90:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a93:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a96:	8b 00                	mov    (%eax),%eax
 a98:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 a9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a9e:	8b 40 04             	mov    0x4(%eax),%eax
 aa1:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 aa4:	72 4d                	jb     af3 <malloc+0xa6>
      if(p->s.size == nunits)
 aa6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aa9:	8b 40 04             	mov    0x4(%eax),%eax
 aac:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 aaf:	75 0c                	jne    abd <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 ab1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ab4:	8b 10                	mov    (%eax),%edx
 ab6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ab9:	89 10                	mov    %edx,(%eax)
 abb:	eb 26                	jmp    ae3 <malloc+0x96>
      else {
        p->s.size -= nunits;
 abd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ac0:	8b 40 04             	mov    0x4(%eax),%eax
 ac3:	2b 45 ec             	sub    -0x14(%ebp),%eax
 ac6:	89 c2                	mov    %eax,%edx
 ac8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 acb:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 ace:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ad1:	8b 40 04             	mov    0x4(%eax),%eax
 ad4:	c1 e0 03             	shl    $0x3,%eax
 ad7:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 ada:	8b 45 f4             	mov    -0xc(%ebp),%eax
 add:	8b 55 ec             	mov    -0x14(%ebp),%edx
 ae0:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 ae3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ae6:	a3 44 0e 00 00       	mov    %eax,0xe44
      return (void*)(p + 1);
 aeb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aee:	83 c0 08             	add    $0x8,%eax
 af1:	eb 38                	jmp    b2b <malloc+0xde>
    }
    if(p == freep)
 af3:	a1 44 0e 00 00       	mov    0xe44,%eax
 af8:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 afb:	75 1b                	jne    b18 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 afd:	8b 45 ec             	mov    -0x14(%ebp),%eax
 b00:	89 04 24             	mov    %eax,(%esp)
 b03:	e8 ed fe ff ff       	call   9f5 <morecore>
 b08:	89 45 f4             	mov    %eax,-0xc(%ebp)
 b0b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 b0f:	75 07                	jne    b18 <malloc+0xcb>
        return 0;
 b11:	b8 00 00 00 00       	mov    $0x0,%eax
 b16:	eb 13                	jmp    b2b <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b18:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b1b:	89 45 f0             	mov    %eax,-0x10(%ebp)
 b1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b21:	8b 00                	mov    (%eax),%eax
 b23:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 b26:	e9 70 ff ff ff       	jmp    a9b <malloc+0x4e>
}
 b2b:	c9                   	leave  
 b2c:	c3                   	ret    
