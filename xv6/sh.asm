
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <runcmd>:
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
       6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
       a:	75 0c                	jne    18 <runcmd+0x18>
    exit(1);
       c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
      13:	e8 8c 0f 00 00       	call   fa4 <exit>
  
  switch(cmd->type){
      18:	8b 45 08             	mov    0x8(%ebp),%eax
      1b:	8b 00                	mov    (%eax),%eax
      1d:	83 f8 05             	cmp    $0x5,%eax
      20:	77 09                	ja     2b <runcmd+0x2b>
      22:	8b 04 85 2c 15 00 00 	mov    0x152c(,%eax,4),%eax
      29:	ff e0                	jmp    *%eax
  default:
    panic("runcmd");
      2b:	c7 04 24 00 15 00 00 	movl   $0x1500,(%esp)
      32:	e8 5c 03 00 00       	call   393 <panic>

  case EXEC:
    ecmd = (struct execcmd*)cmd;
      37:	8b 45 08             	mov    0x8(%ebp),%eax
      3a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(ecmd->argv[0] == 0)
      3d:	8b 45 f4             	mov    -0xc(%ebp),%eax
      40:	8b 40 04             	mov    0x4(%eax),%eax
      43:	85 c0                	test   %eax,%eax
      45:	75 0c                	jne    53 <runcmd+0x53>
      exit(1);
      47:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
      4e:	e8 51 0f 00 00       	call   fa4 <exit>
    exec(ecmd->argv[0], ecmd->argv);
      53:	8b 45 f4             	mov    -0xc(%ebp),%eax
      56:	8d 50 04             	lea    0x4(%eax),%edx
      59:	8b 45 f4             	mov    -0xc(%ebp),%eax
      5c:	8b 40 04             	mov    0x4(%eax),%eax
      5f:	89 54 24 04          	mov    %edx,0x4(%esp)
      63:	89 04 24             	mov    %eax,(%esp)
      66:	e8 71 0f 00 00       	call   fdc <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
      6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
      6e:	8b 40 04             	mov    0x4(%eax),%eax
      71:	89 44 24 08          	mov    %eax,0x8(%esp)
      75:	c7 44 24 04 07 15 00 	movl   $0x1507,0x4(%esp)
      7c:	00 
      7d:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
      84:	e8 ab 10 00 00       	call   1134 <printf>
    break;
      89:	e9 9f 01 00 00       	jmp    22d <runcmd+0x22d>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
      8e:	8b 45 08             	mov    0x8(%ebp),%eax
      91:	89 45 f0             	mov    %eax,-0x10(%ebp)
    close(rcmd->fd);
      94:	8b 45 f0             	mov    -0x10(%ebp),%eax
      97:	8b 40 14             	mov    0x14(%eax),%eax
      9a:	89 04 24             	mov    %eax,(%esp)
      9d:	e8 2a 0f 00 00       	call   fcc <close>
    if(open(rcmd->file, rcmd->mode) < 0){
      a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
      a5:	8b 50 10             	mov    0x10(%eax),%edx
      a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
      ab:	8b 40 08             	mov    0x8(%eax),%eax
      ae:	89 54 24 04          	mov    %edx,0x4(%esp)
      b2:	89 04 24             	mov    %eax,(%esp)
      b5:	e8 2a 0f 00 00       	call   fe4 <open>
      ba:	85 c0                	test   %eax,%eax
      bc:	79 2a                	jns    e8 <runcmd+0xe8>
      printf(2, "open %s failed\n", rcmd->file);
      be:	8b 45 f0             	mov    -0x10(%ebp),%eax
      c1:	8b 40 08             	mov    0x8(%eax),%eax
      c4:	89 44 24 08          	mov    %eax,0x8(%esp)
      c8:	c7 44 24 04 17 15 00 	movl   $0x1517,0x4(%esp)
      cf:	00 
      d0:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
      d7:	e8 58 10 00 00       	call   1134 <printf>
      exit(1);
      dc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
      e3:	e8 bc 0e 00 00       	call   fa4 <exit>
    }
    runcmd(rcmd->cmd);
      e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
      eb:	8b 40 04             	mov    0x4(%eax),%eax
      ee:	89 04 24             	mov    %eax,(%esp)
      f1:	e8 0a ff ff ff       	call   0 <runcmd>
    break;
      f6:	e9 32 01 00 00       	jmp    22d <runcmd+0x22d>

  case LIST:
    lcmd = (struct listcmd*)cmd;
      fb:	8b 45 08             	mov    0x8(%ebp),%eax
      fe:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(fork1() == 0)
     101:	e8 ba 02 00 00       	call   3c0 <fork1>
     106:	85 c0                	test   %eax,%eax
     108:	75 0e                	jne    118 <runcmd+0x118>
      runcmd(lcmd->left);
     10a:	8b 45 ec             	mov    -0x14(%ebp),%eax
     10d:	8b 40 04             	mov    0x4(%eax),%eax
     110:	89 04 24             	mov    %eax,(%esp)
     113:	e8 e8 fe ff ff       	call   0 <runcmd>
    wait(&st);
     118:	8d 45 d8             	lea    -0x28(%ebp),%eax
     11b:	89 04 24             	mov    %eax,(%esp)
     11e:	e8 89 0e 00 00       	call   fac <wait>
    runcmd(lcmd->right);
     123:	8b 45 ec             	mov    -0x14(%ebp),%eax
     126:	8b 40 08             	mov    0x8(%eax),%eax
     129:	89 04 24             	mov    %eax,(%esp)
     12c:	e8 cf fe ff ff       	call   0 <runcmd>
    break;
     131:	e9 f7 00 00 00       	jmp    22d <runcmd+0x22d>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
     136:	8b 45 08             	mov    0x8(%ebp),%eax
     139:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(pipe(p) < 0)
     13c:	8d 45 dc             	lea    -0x24(%ebp),%eax
     13f:	89 04 24             	mov    %eax,(%esp)
     142:	e8 6d 0e 00 00       	call   fb4 <pipe>
     147:	85 c0                	test   %eax,%eax
     149:	79 0c                	jns    157 <runcmd+0x157>
      panic("pipe");
     14b:	c7 04 24 27 15 00 00 	movl   $0x1527,(%esp)
     152:	e8 3c 02 00 00       	call   393 <panic>
    if(fork1() == 0){
     157:	e8 64 02 00 00       	call   3c0 <fork1>
     15c:	85 c0                	test   %eax,%eax
     15e:	75 3b                	jne    19b <runcmd+0x19b>
      close(1);
     160:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     167:	e8 60 0e 00 00       	call   fcc <close>
      dup(p[1]);
     16c:	8b 45 e0             	mov    -0x20(%ebp),%eax
     16f:	89 04 24             	mov    %eax,(%esp)
     172:	e8 a5 0e 00 00       	call   101c <dup>
      close(p[0]);
     177:	8b 45 dc             	mov    -0x24(%ebp),%eax
     17a:	89 04 24             	mov    %eax,(%esp)
     17d:	e8 4a 0e 00 00       	call   fcc <close>
      close(p[1]);
     182:	8b 45 e0             	mov    -0x20(%ebp),%eax
     185:	89 04 24             	mov    %eax,(%esp)
     188:	e8 3f 0e 00 00       	call   fcc <close>
      runcmd(pcmd->left);
     18d:	8b 45 e8             	mov    -0x18(%ebp),%eax
     190:	8b 40 04             	mov    0x4(%eax),%eax
     193:	89 04 24             	mov    %eax,(%esp)
     196:	e8 65 fe ff ff       	call   0 <runcmd>
    }
    if(fork1() == 0){
     19b:	e8 20 02 00 00       	call   3c0 <fork1>
     1a0:	85 c0                	test   %eax,%eax
     1a2:	75 3b                	jne    1df <runcmd+0x1df>
      close(0);
     1a4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     1ab:	e8 1c 0e 00 00       	call   fcc <close>
      dup(p[0]);
     1b0:	8b 45 dc             	mov    -0x24(%ebp),%eax
     1b3:	89 04 24             	mov    %eax,(%esp)
     1b6:	e8 61 0e 00 00       	call   101c <dup>
      close(p[0]);
     1bb:	8b 45 dc             	mov    -0x24(%ebp),%eax
     1be:	89 04 24             	mov    %eax,(%esp)
     1c1:	e8 06 0e 00 00       	call   fcc <close>
      close(p[1]);
     1c6:	8b 45 e0             	mov    -0x20(%ebp),%eax
     1c9:	89 04 24             	mov    %eax,(%esp)
     1cc:	e8 fb 0d 00 00       	call   fcc <close>
      runcmd(pcmd->right);
     1d1:	8b 45 e8             	mov    -0x18(%ebp),%eax
     1d4:	8b 40 08             	mov    0x8(%eax),%eax
     1d7:	89 04 24             	mov    %eax,(%esp)
     1da:	e8 21 fe ff ff       	call   0 <runcmd>
    }
    close(p[0]);
     1df:	8b 45 dc             	mov    -0x24(%ebp),%eax
     1e2:	89 04 24             	mov    %eax,(%esp)
     1e5:	e8 e2 0d 00 00       	call   fcc <close>
    close(p[1]);
     1ea:	8b 45 e0             	mov    -0x20(%ebp),%eax
     1ed:	89 04 24             	mov    %eax,(%esp)
     1f0:	e8 d7 0d 00 00       	call   fcc <close>
    wait(&st);
     1f5:	8d 45 d8             	lea    -0x28(%ebp),%eax
     1f8:	89 04 24             	mov    %eax,(%esp)
     1fb:	e8 ac 0d 00 00       	call   fac <wait>
    wait(&st);
     200:	8d 45 d8             	lea    -0x28(%ebp),%eax
     203:	89 04 24             	mov    %eax,(%esp)
     206:	e8 a1 0d 00 00       	call   fac <wait>
    break;
     20b:	eb 20                	jmp    22d <runcmd+0x22d>
    
  case BACK:
    bcmd = (struct backcmd*)cmd;
     20d:	8b 45 08             	mov    0x8(%ebp),%eax
     210:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(fork1() == 0)
     213:	e8 a8 01 00 00       	call   3c0 <fork1>
     218:	85 c0                	test   %eax,%eax
     21a:	75 10                	jne    22c <runcmd+0x22c>
      runcmd(bcmd->cmd);
     21c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     21f:	8b 40 04             	mov    0x4(%eax),%eax
     222:	89 04 24             	mov    %eax,(%esp)
     225:	e8 d6 fd ff ff       	call   0 <runcmd>
    break;
     22a:	eb 00                	jmp    22c <runcmd+0x22c>
     22c:	90                   	nop
  }
  exit(1);
     22d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     234:	e8 6b 0d 00 00       	call   fa4 <exit>

00000239 <getcmd>:
}

int
getcmd(char *buf, int nbuf)
{
     239:	55                   	push   %ebp
     23a:	89 e5                	mov    %esp,%ebp
     23c:	83 ec 18             	sub    $0x18,%esp
  printf(2, "$ ");
     23f:	c7 44 24 04 44 15 00 	movl   $0x1544,0x4(%esp)
     246:	00 
     247:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     24e:	e8 e1 0e 00 00       	call   1134 <printf>
  memset(buf, 0, nbuf);
     253:	8b 45 0c             	mov    0xc(%ebp),%eax
     256:	89 44 24 08          	mov    %eax,0x8(%esp)
     25a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     261:	00 
     262:	8b 45 08             	mov    0x8(%ebp),%eax
     265:	89 04 24             	mov    %eax,(%esp)
     268:	e8 8a 0b 00 00       	call   df7 <memset>
  gets(buf, nbuf);
     26d:	8b 45 0c             	mov    0xc(%ebp),%eax
     270:	89 44 24 04          	mov    %eax,0x4(%esp)
     274:	8b 45 08             	mov    0x8(%ebp),%eax
     277:	89 04 24             	mov    %eax,(%esp)
     27a:	e8 cf 0b 00 00       	call   e4e <gets>
  if(buf[0] == 0) // EOF
     27f:	8b 45 08             	mov    0x8(%ebp),%eax
     282:	0f b6 00             	movzbl (%eax),%eax
     285:	84 c0                	test   %al,%al
     287:	75 07                	jne    290 <getcmd+0x57>
    return -1;
     289:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     28e:	eb 05                	jmp    295 <getcmd+0x5c>
  return 0;
     290:	b8 00 00 00 00       	mov    $0x0,%eax
}
     295:	c9                   	leave  
     296:	c3                   	ret    

00000297 <main>:

int
main(void)
{
     297:	55                   	push   %ebp
     298:	89 e5                	mov    %esp,%ebp
     29a:	83 e4 f0             	and    $0xfffffff0,%esp
     29d:	83 ec 20             	sub    $0x20,%esp
  static char buf[100];
  int fd;
  int st;
  
  // Assumes three file descriptors open.
  while((fd = open("console", O_RDWR)) >= 0){
     2a0:	eb 15                	jmp    2b7 <main+0x20>
    if(fd >= 3){
     2a2:	83 7c 24 1c 02       	cmpl   $0x2,0x1c(%esp)
     2a7:	7e 0e                	jle    2b7 <main+0x20>
      close(fd);
     2a9:	8b 44 24 1c          	mov    0x1c(%esp),%eax
     2ad:	89 04 24             	mov    %eax,(%esp)
     2b0:	e8 17 0d 00 00       	call   fcc <close>
      break;
     2b5:	eb 1f                	jmp    2d6 <main+0x3f>
  static char buf[100];
  int fd;
  int st;
  
  // Assumes three file descriptors open.
  while((fd = open("console", O_RDWR)) >= 0){
     2b7:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
     2be:	00 
     2bf:	c7 04 24 47 15 00 00 	movl   $0x1547,(%esp)
     2c6:	e8 19 0d 00 00       	call   fe4 <open>
     2cb:	89 44 24 1c          	mov    %eax,0x1c(%esp)
     2cf:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
     2d4:	79 cc                	jns    2a2 <main+0xb>
      break;
    }
  }
  
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
     2d6:	e9 90 00 00 00       	jmp    36b <main+0xd4>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     2db:	0f b6 05 a0 1a 00 00 	movzbl 0x1aa0,%eax
     2e2:	3c 63                	cmp    $0x63,%al
     2e4:	75 5c                	jne    342 <main+0xab>
     2e6:	0f b6 05 a1 1a 00 00 	movzbl 0x1aa1,%eax
     2ed:	3c 64                	cmp    $0x64,%al
     2ef:	75 51                	jne    342 <main+0xab>
     2f1:	0f b6 05 a2 1a 00 00 	movzbl 0x1aa2,%eax
     2f8:	3c 20                	cmp    $0x20,%al
     2fa:	75 46                	jne    342 <main+0xab>
      // Clumsy but will have to do for now.
      // Chdir has no effect on the parent if run in the child.
      buf[strlen(buf)-1] = 0;  // chop \n
     2fc:	c7 04 24 a0 1a 00 00 	movl   $0x1aa0,(%esp)
     303:	e8 c8 0a 00 00       	call   dd0 <strlen>
     308:	83 e8 01             	sub    $0x1,%eax
     30b:	c6 80 a0 1a 00 00 00 	movb   $0x0,0x1aa0(%eax)
      if(chdir(buf+3) < 0)
     312:	c7 04 24 a3 1a 00 00 	movl   $0x1aa3,(%esp)
     319:	e8 f6 0c 00 00       	call   1014 <chdir>
     31e:	85 c0                	test   %eax,%eax
     320:	79 1e                	jns    340 <main+0xa9>
        printf(2, "cannot cd %s\n", buf+3);
     322:	c7 44 24 08 a3 1a 00 	movl   $0x1aa3,0x8(%esp)
     329:	00 
     32a:	c7 44 24 04 4f 15 00 	movl   $0x154f,0x4(%esp)
     331:	00 
     332:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     339:	e8 f6 0d 00 00       	call   1134 <printf>
      continue;
     33e:	eb 2b                	jmp    36b <main+0xd4>
     340:	eb 29                	jmp    36b <main+0xd4>
    }
    if(fork1() == 0)
     342:	e8 79 00 00 00       	call   3c0 <fork1>
     347:	85 c0                	test   %eax,%eax
     349:	75 14                	jne    35f <main+0xc8>
      runcmd(parsecmd(buf));
     34b:	c7 04 24 a0 1a 00 00 	movl   $0x1aa0,(%esp)
     352:	e8 de 03 00 00       	call   735 <parsecmd>
     357:	89 04 24             	mov    %eax,(%esp)
     35a:	e8 a1 fc ff ff       	call   0 <runcmd>
    wait(&st);
     35f:	8d 44 24 18          	lea    0x18(%esp),%eax
     363:	89 04 24             	mov    %eax,(%esp)
     366:	e8 41 0c 00 00       	call   fac <wait>
      break;
    }
  }
  
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
     36b:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
     372:	00 
     373:	c7 04 24 a0 1a 00 00 	movl   $0x1aa0,(%esp)
     37a:	e8 ba fe ff ff       	call   239 <getcmd>
     37f:	85 c0                	test   %eax,%eax
     381:	0f 89 54 ff ff ff    	jns    2db <main+0x44>
    }
    if(fork1() == 0)
      runcmd(parsecmd(buf));
    wait(&st);
  }
  exit(1);
     387:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     38e:	e8 11 0c 00 00       	call   fa4 <exit>

00000393 <panic>:
}

void
panic(char *s)
{
     393:	55                   	push   %ebp
     394:	89 e5                	mov    %esp,%ebp
     396:	83 ec 18             	sub    $0x18,%esp
  printf(2, "%s\n", s);
     399:	8b 45 08             	mov    0x8(%ebp),%eax
     39c:	89 44 24 08          	mov    %eax,0x8(%esp)
     3a0:	c7 44 24 04 5d 15 00 	movl   $0x155d,0x4(%esp)
     3a7:	00 
     3a8:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     3af:	e8 80 0d 00 00       	call   1134 <printf>
  exit(1);
     3b4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     3bb:	e8 e4 0b 00 00       	call   fa4 <exit>

000003c0 <fork1>:
}

int
fork1(void)
{
     3c0:	55                   	push   %ebp
     3c1:	89 e5                	mov    %esp,%ebp
     3c3:	83 ec 28             	sub    $0x28,%esp
  int pid;
  
  pid = fork();
     3c6:	e8 d1 0b 00 00       	call   f9c <fork>
     3cb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(pid == -1)
     3ce:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
     3d2:	75 0c                	jne    3e0 <fork1+0x20>
    panic("fork");
     3d4:	c7 04 24 61 15 00 00 	movl   $0x1561,(%esp)
     3db:	e8 b3 ff ff ff       	call   393 <panic>
  return pid;
     3e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     3e3:	c9                   	leave  
     3e4:	c3                   	ret    

000003e5 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     3e5:	55                   	push   %ebp
     3e6:	89 e5                	mov    %esp,%ebp
     3e8:	83 ec 28             	sub    $0x28,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3eb:	c7 04 24 54 00 00 00 	movl   $0x54,(%esp)
     3f2:	e8 29 10 00 00       	call   1420 <malloc>
     3f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     3fa:	c7 44 24 08 54 00 00 	movl   $0x54,0x8(%esp)
     401:	00 
     402:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     409:	00 
     40a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     40d:	89 04 24             	mov    %eax,(%esp)
     410:	e8 e2 09 00 00       	call   df7 <memset>
  cmd->type = EXEC;
     415:	8b 45 f4             	mov    -0xc(%ebp),%eax
     418:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  return (struct cmd*)cmd;
     41e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     421:	c9                   	leave  
     422:	c3                   	ret    

00000423 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     423:	55                   	push   %ebp
     424:	89 e5                	mov    %esp,%ebp
     426:	83 ec 28             	sub    $0x28,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     429:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
     430:	e8 eb 0f 00 00       	call   1420 <malloc>
     435:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     438:	c7 44 24 08 18 00 00 	movl   $0x18,0x8(%esp)
     43f:	00 
     440:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     447:	00 
     448:	8b 45 f4             	mov    -0xc(%ebp),%eax
     44b:	89 04 24             	mov    %eax,(%esp)
     44e:	e8 a4 09 00 00       	call   df7 <memset>
  cmd->type = REDIR;
     453:	8b 45 f4             	mov    -0xc(%ebp),%eax
     456:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  cmd->cmd = subcmd;
     45c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     45f:	8b 55 08             	mov    0x8(%ebp),%edx
     462:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->file = file;
     465:	8b 45 f4             	mov    -0xc(%ebp),%eax
     468:	8b 55 0c             	mov    0xc(%ebp),%edx
     46b:	89 50 08             	mov    %edx,0x8(%eax)
  cmd->efile = efile;
     46e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     471:	8b 55 10             	mov    0x10(%ebp),%edx
     474:	89 50 0c             	mov    %edx,0xc(%eax)
  cmd->mode = mode;
     477:	8b 45 f4             	mov    -0xc(%ebp),%eax
     47a:	8b 55 14             	mov    0x14(%ebp),%edx
     47d:	89 50 10             	mov    %edx,0x10(%eax)
  cmd->fd = fd;
     480:	8b 45 f4             	mov    -0xc(%ebp),%eax
     483:	8b 55 18             	mov    0x18(%ebp),%edx
     486:	89 50 14             	mov    %edx,0x14(%eax)
  return (struct cmd*)cmd;
     489:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     48c:	c9                   	leave  
     48d:	c3                   	ret    

0000048e <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     48e:	55                   	push   %ebp
     48f:	89 e5                	mov    %esp,%ebp
     491:	83 ec 28             	sub    $0x28,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     494:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     49b:	e8 80 0f 00 00       	call   1420 <malloc>
     4a0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     4a3:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
     4aa:	00 
     4ab:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     4b2:	00 
     4b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4b6:	89 04 24             	mov    %eax,(%esp)
     4b9:	e8 39 09 00 00       	call   df7 <memset>
  cmd->type = PIPE;
     4be:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4c1:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  cmd->left = left;
     4c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4ca:	8b 55 08             	mov    0x8(%ebp),%edx
     4cd:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     4d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4d3:	8b 55 0c             	mov    0xc(%ebp),%edx
     4d6:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     4d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     4dc:	c9                   	leave  
     4dd:	c3                   	ret    

000004de <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     4de:	55                   	push   %ebp
     4df:	89 e5                	mov    %esp,%ebp
     4e1:	83 ec 28             	sub    $0x28,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     4e4:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     4eb:	e8 30 0f 00 00       	call   1420 <malloc>
     4f0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     4f3:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
     4fa:	00 
     4fb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     502:	00 
     503:	8b 45 f4             	mov    -0xc(%ebp),%eax
     506:	89 04 24             	mov    %eax,(%esp)
     509:	e8 e9 08 00 00       	call   df7 <memset>
  cmd->type = LIST;
     50e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     511:	c7 00 04 00 00 00    	movl   $0x4,(%eax)
  cmd->left = left;
     517:	8b 45 f4             	mov    -0xc(%ebp),%eax
     51a:	8b 55 08             	mov    0x8(%ebp),%edx
     51d:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     520:	8b 45 f4             	mov    -0xc(%ebp),%eax
     523:	8b 55 0c             	mov    0xc(%ebp),%edx
     526:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     529:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     52c:	c9                   	leave  
     52d:	c3                   	ret    

0000052e <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     52e:	55                   	push   %ebp
     52f:	89 e5                	mov    %esp,%ebp
     531:	83 ec 28             	sub    $0x28,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     534:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     53b:	e8 e0 0e 00 00       	call   1420 <malloc>
     540:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     543:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
     54a:	00 
     54b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     552:	00 
     553:	8b 45 f4             	mov    -0xc(%ebp),%eax
     556:	89 04 24             	mov    %eax,(%esp)
     559:	e8 99 08 00 00       	call   df7 <memset>
  cmd->type = BACK;
     55e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     561:	c7 00 05 00 00 00    	movl   $0x5,(%eax)
  cmd->cmd = subcmd;
     567:	8b 45 f4             	mov    -0xc(%ebp),%eax
     56a:	8b 55 08             	mov    0x8(%ebp),%edx
     56d:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
     570:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     573:	c9                   	leave  
     574:	c3                   	ret    

00000575 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     575:	55                   	push   %ebp
     576:	89 e5                	mov    %esp,%ebp
     578:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int ret;
  
  s = *ps;
     57b:	8b 45 08             	mov    0x8(%ebp),%eax
     57e:	8b 00                	mov    (%eax),%eax
     580:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
     583:	eb 04                	jmp    589 <gettoken+0x14>
    s++;
     585:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
{
  char *s;
  int ret;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
     589:	8b 45 f4             	mov    -0xc(%ebp),%eax
     58c:	3b 45 0c             	cmp    0xc(%ebp),%eax
     58f:	73 1d                	jae    5ae <gettoken+0x39>
     591:	8b 45 f4             	mov    -0xc(%ebp),%eax
     594:	0f b6 00             	movzbl (%eax),%eax
     597:	0f be c0             	movsbl %al,%eax
     59a:	89 44 24 04          	mov    %eax,0x4(%esp)
     59e:	c7 04 24 78 1a 00 00 	movl   $0x1a78,(%esp)
     5a5:	e8 71 08 00 00       	call   e1b <strchr>
     5aa:	85 c0                	test   %eax,%eax
     5ac:	75 d7                	jne    585 <gettoken+0x10>
    s++;
  if(q)
     5ae:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     5b2:	74 08                	je     5bc <gettoken+0x47>
    *q = s;
     5b4:	8b 45 10             	mov    0x10(%ebp),%eax
     5b7:	8b 55 f4             	mov    -0xc(%ebp),%edx
     5ba:	89 10                	mov    %edx,(%eax)
  ret = *s;
     5bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
     5bf:	0f b6 00             	movzbl (%eax),%eax
     5c2:	0f be c0             	movsbl %al,%eax
     5c5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  switch(*s){
     5c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     5cb:	0f b6 00             	movzbl (%eax),%eax
     5ce:	0f be c0             	movsbl %al,%eax
     5d1:	83 f8 29             	cmp    $0x29,%eax
     5d4:	7f 14                	jg     5ea <gettoken+0x75>
     5d6:	83 f8 28             	cmp    $0x28,%eax
     5d9:	7d 28                	jge    603 <gettoken+0x8e>
     5db:	85 c0                	test   %eax,%eax
     5dd:	0f 84 94 00 00 00    	je     677 <gettoken+0x102>
     5e3:	83 f8 26             	cmp    $0x26,%eax
     5e6:	74 1b                	je     603 <gettoken+0x8e>
     5e8:	eb 3c                	jmp    626 <gettoken+0xb1>
     5ea:	83 f8 3e             	cmp    $0x3e,%eax
     5ed:	74 1a                	je     609 <gettoken+0x94>
     5ef:	83 f8 3e             	cmp    $0x3e,%eax
     5f2:	7f 0a                	jg     5fe <gettoken+0x89>
     5f4:	83 e8 3b             	sub    $0x3b,%eax
     5f7:	83 f8 01             	cmp    $0x1,%eax
     5fa:	77 2a                	ja     626 <gettoken+0xb1>
     5fc:	eb 05                	jmp    603 <gettoken+0x8e>
     5fe:	83 f8 7c             	cmp    $0x7c,%eax
     601:	75 23                	jne    626 <gettoken+0xb1>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
     603:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
     607:	eb 6f                	jmp    678 <gettoken+0x103>
  case '>':
    s++;
     609:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(*s == '>'){
     60d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     610:	0f b6 00             	movzbl (%eax),%eax
     613:	3c 3e                	cmp    $0x3e,%al
     615:	75 0d                	jne    624 <gettoken+0xaf>
      ret = '+';
     617:	c7 45 f0 2b 00 00 00 	movl   $0x2b,-0x10(%ebp)
      s++;
     61e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    }
    break;
     622:	eb 54                	jmp    678 <gettoken+0x103>
     624:	eb 52                	jmp    678 <gettoken+0x103>
  default:
    ret = 'a';
     626:	c7 45 f0 61 00 00 00 	movl   $0x61,-0x10(%ebp)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     62d:	eb 04                	jmp    633 <gettoken+0xbe>
      s++;
     62f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     633:	8b 45 f4             	mov    -0xc(%ebp),%eax
     636:	3b 45 0c             	cmp    0xc(%ebp),%eax
     639:	73 3a                	jae    675 <gettoken+0x100>
     63b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     63e:	0f b6 00             	movzbl (%eax),%eax
     641:	0f be c0             	movsbl %al,%eax
     644:	89 44 24 04          	mov    %eax,0x4(%esp)
     648:	c7 04 24 78 1a 00 00 	movl   $0x1a78,(%esp)
     64f:	e8 c7 07 00 00       	call   e1b <strchr>
     654:	85 c0                	test   %eax,%eax
     656:	75 1d                	jne    675 <gettoken+0x100>
     658:	8b 45 f4             	mov    -0xc(%ebp),%eax
     65b:	0f b6 00             	movzbl (%eax),%eax
     65e:	0f be c0             	movsbl %al,%eax
     661:	89 44 24 04          	mov    %eax,0x4(%esp)
     665:	c7 04 24 7e 1a 00 00 	movl   $0x1a7e,(%esp)
     66c:	e8 aa 07 00 00       	call   e1b <strchr>
     671:	85 c0                	test   %eax,%eax
     673:	74 ba                	je     62f <gettoken+0xba>
      s++;
    break;
     675:	eb 01                	jmp    678 <gettoken+0x103>
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
  case 0:
    break;
     677:	90                   	nop
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     678:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     67c:	74 0a                	je     688 <gettoken+0x113>
    *eq = s;
     67e:	8b 45 14             	mov    0x14(%ebp),%eax
     681:	8b 55 f4             	mov    -0xc(%ebp),%edx
     684:	89 10                	mov    %edx,(%eax)
  
  while(s < es && strchr(whitespace, *s))
     686:	eb 06                	jmp    68e <gettoken+0x119>
     688:	eb 04                	jmp    68e <gettoken+0x119>
    s++;
     68a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
  }
  if(eq)
    *eq = s;
  
  while(s < es && strchr(whitespace, *s))
     68e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     691:	3b 45 0c             	cmp    0xc(%ebp),%eax
     694:	73 1d                	jae    6b3 <gettoken+0x13e>
     696:	8b 45 f4             	mov    -0xc(%ebp),%eax
     699:	0f b6 00             	movzbl (%eax),%eax
     69c:	0f be c0             	movsbl %al,%eax
     69f:	89 44 24 04          	mov    %eax,0x4(%esp)
     6a3:	c7 04 24 78 1a 00 00 	movl   $0x1a78,(%esp)
     6aa:	e8 6c 07 00 00       	call   e1b <strchr>
     6af:	85 c0                	test   %eax,%eax
     6b1:	75 d7                	jne    68a <gettoken+0x115>
    s++;
  *ps = s;
     6b3:	8b 45 08             	mov    0x8(%ebp),%eax
     6b6:	8b 55 f4             	mov    -0xc(%ebp),%edx
     6b9:	89 10                	mov    %edx,(%eax)
  return ret;
     6bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     6be:	c9                   	leave  
     6bf:	c3                   	ret    

000006c0 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     6c0:	55                   	push   %ebp
     6c1:	89 e5                	mov    %esp,%ebp
     6c3:	83 ec 28             	sub    $0x28,%esp
  char *s;
  
  s = *ps;
     6c6:	8b 45 08             	mov    0x8(%ebp),%eax
     6c9:	8b 00                	mov    (%eax),%eax
     6cb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
     6ce:	eb 04                	jmp    6d4 <peek+0x14>
    s++;
     6d0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
peek(char **ps, char *es, char *toks)
{
  char *s;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
     6d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6d7:	3b 45 0c             	cmp    0xc(%ebp),%eax
     6da:	73 1d                	jae    6f9 <peek+0x39>
     6dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6df:	0f b6 00             	movzbl (%eax),%eax
     6e2:	0f be c0             	movsbl %al,%eax
     6e5:	89 44 24 04          	mov    %eax,0x4(%esp)
     6e9:	c7 04 24 78 1a 00 00 	movl   $0x1a78,(%esp)
     6f0:	e8 26 07 00 00       	call   e1b <strchr>
     6f5:	85 c0                	test   %eax,%eax
     6f7:	75 d7                	jne    6d0 <peek+0x10>
    s++;
  *ps = s;
     6f9:	8b 45 08             	mov    0x8(%ebp),%eax
     6fc:	8b 55 f4             	mov    -0xc(%ebp),%edx
     6ff:	89 10                	mov    %edx,(%eax)
  return *s && strchr(toks, *s);
     701:	8b 45 f4             	mov    -0xc(%ebp),%eax
     704:	0f b6 00             	movzbl (%eax),%eax
     707:	84 c0                	test   %al,%al
     709:	74 23                	je     72e <peek+0x6e>
     70b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     70e:	0f b6 00             	movzbl (%eax),%eax
     711:	0f be c0             	movsbl %al,%eax
     714:	89 44 24 04          	mov    %eax,0x4(%esp)
     718:	8b 45 10             	mov    0x10(%ebp),%eax
     71b:	89 04 24             	mov    %eax,(%esp)
     71e:	e8 f8 06 00 00       	call   e1b <strchr>
     723:	85 c0                	test   %eax,%eax
     725:	74 07                	je     72e <peek+0x6e>
     727:	b8 01 00 00 00       	mov    $0x1,%eax
     72c:	eb 05                	jmp    733 <peek+0x73>
     72e:	b8 00 00 00 00       	mov    $0x0,%eax
}
     733:	c9                   	leave  
     734:	c3                   	ret    

00000735 <parsecmd>:
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
     735:	55                   	push   %ebp
     736:	89 e5                	mov    %esp,%ebp
     738:	53                   	push   %ebx
     739:	83 ec 24             	sub    $0x24,%esp
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     73c:	8b 5d 08             	mov    0x8(%ebp),%ebx
     73f:	8b 45 08             	mov    0x8(%ebp),%eax
     742:	89 04 24             	mov    %eax,(%esp)
     745:	e8 86 06 00 00       	call   dd0 <strlen>
     74a:	01 d8                	add    %ebx,%eax
     74c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  cmd = parseline(&s, es);
     74f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     752:	89 44 24 04          	mov    %eax,0x4(%esp)
     756:	8d 45 08             	lea    0x8(%ebp),%eax
     759:	89 04 24             	mov    %eax,(%esp)
     75c:	e8 60 00 00 00       	call   7c1 <parseline>
     761:	89 45 f0             	mov    %eax,-0x10(%ebp)
  peek(&s, es, "");
     764:	c7 44 24 08 66 15 00 	movl   $0x1566,0x8(%esp)
     76b:	00 
     76c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     76f:	89 44 24 04          	mov    %eax,0x4(%esp)
     773:	8d 45 08             	lea    0x8(%ebp),%eax
     776:	89 04 24             	mov    %eax,(%esp)
     779:	e8 42 ff ff ff       	call   6c0 <peek>
  if(s != es){
     77e:	8b 45 08             	mov    0x8(%ebp),%eax
     781:	3b 45 f4             	cmp    -0xc(%ebp),%eax
     784:	74 27                	je     7ad <parsecmd+0x78>
    printf(2, "leftovers: %s\n", s);
     786:	8b 45 08             	mov    0x8(%ebp),%eax
     789:	89 44 24 08          	mov    %eax,0x8(%esp)
     78d:	c7 44 24 04 67 15 00 	movl   $0x1567,0x4(%esp)
     794:	00 
     795:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     79c:	e8 93 09 00 00       	call   1134 <printf>
    panic("syntax");
     7a1:	c7 04 24 76 15 00 00 	movl   $0x1576,(%esp)
     7a8:	e8 e6 fb ff ff       	call   393 <panic>
  }
  nulterminate(cmd);
     7ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
     7b0:	89 04 24             	mov    %eax,(%esp)
     7b3:	e8 a3 04 00 00       	call   c5b <nulterminate>
  return cmd;
     7b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     7bb:	83 c4 24             	add    $0x24,%esp
     7be:	5b                   	pop    %ebx
     7bf:	5d                   	pop    %ebp
     7c0:	c3                   	ret    

000007c1 <parseline>:

struct cmd*
parseline(char **ps, char *es)
{
     7c1:	55                   	push   %ebp
     7c2:	89 e5                	mov    %esp,%ebp
     7c4:	83 ec 28             	sub    $0x28,%esp
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     7c7:	8b 45 0c             	mov    0xc(%ebp),%eax
     7ca:	89 44 24 04          	mov    %eax,0x4(%esp)
     7ce:	8b 45 08             	mov    0x8(%ebp),%eax
     7d1:	89 04 24             	mov    %eax,(%esp)
     7d4:	e8 bc 00 00 00       	call   895 <parsepipe>
     7d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(peek(ps, es, "&")){
     7dc:	eb 30                	jmp    80e <parseline+0x4d>
    gettoken(ps, es, 0, 0);
     7de:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     7e5:	00 
     7e6:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     7ed:	00 
     7ee:	8b 45 0c             	mov    0xc(%ebp),%eax
     7f1:	89 44 24 04          	mov    %eax,0x4(%esp)
     7f5:	8b 45 08             	mov    0x8(%ebp),%eax
     7f8:	89 04 24             	mov    %eax,(%esp)
     7fb:	e8 75 fd ff ff       	call   575 <gettoken>
    cmd = backcmd(cmd);
     800:	8b 45 f4             	mov    -0xc(%ebp),%eax
     803:	89 04 24             	mov    %eax,(%esp)
     806:	e8 23 fd ff ff       	call   52e <backcmd>
     80b:	89 45 f4             	mov    %eax,-0xc(%ebp)
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
     80e:	c7 44 24 08 7d 15 00 	movl   $0x157d,0x8(%esp)
     815:	00 
     816:	8b 45 0c             	mov    0xc(%ebp),%eax
     819:	89 44 24 04          	mov    %eax,0x4(%esp)
     81d:	8b 45 08             	mov    0x8(%ebp),%eax
     820:	89 04 24             	mov    %eax,(%esp)
     823:	e8 98 fe ff ff       	call   6c0 <peek>
     828:	85 c0                	test   %eax,%eax
     82a:	75 b2                	jne    7de <parseline+0x1d>
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
     82c:	c7 44 24 08 7f 15 00 	movl   $0x157f,0x8(%esp)
     833:	00 
     834:	8b 45 0c             	mov    0xc(%ebp),%eax
     837:	89 44 24 04          	mov    %eax,0x4(%esp)
     83b:	8b 45 08             	mov    0x8(%ebp),%eax
     83e:	89 04 24             	mov    %eax,(%esp)
     841:	e8 7a fe ff ff       	call   6c0 <peek>
     846:	85 c0                	test   %eax,%eax
     848:	74 46                	je     890 <parseline+0xcf>
    gettoken(ps, es, 0, 0);
     84a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     851:	00 
     852:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     859:	00 
     85a:	8b 45 0c             	mov    0xc(%ebp),%eax
     85d:	89 44 24 04          	mov    %eax,0x4(%esp)
     861:	8b 45 08             	mov    0x8(%ebp),%eax
     864:	89 04 24             	mov    %eax,(%esp)
     867:	e8 09 fd ff ff       	call   575 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     86c:	8b 45 0c             	mov    0xc(%ebp),%eax
     86f:	89 44 24 04          	mov    %eax,0x4(%esp)
     873:	8b 45 08             	mov    0x8(%ebp),%eax
     876:	89 04 24             	mov    %eax,(%esp)
     879:	e8 43 ff ff ff       	call   7c1 <parseline>
     87e:	89 44 24 04          	mov    %eax,0x4(%esp)
     882:	8b 45 f4             	mov    -0xc(%ebp),%eax
     885:	89 04 24             	mov    %eax,(%esp)
     888:	e8 51 fc ff ff       	call   4de <listcmd>
     88d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
     890:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     893:	c9                   	leave  
     894:	c3                   	ret    

00000895 <parsepipe>:

struct cmd*
parsepipe(char **ps, char *es)
{
     895:	55                   	push   %ebp
     896:	89 e5                	mov    %esp,%ebp
     898:	83 ec 28             	sub    $0x28,%esp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     89b:	8b 45 0c             	mov    0xc(%ebp),%eax
     89e:	89 44 24 04          	mov    %eax,0x4(%esp)
     8a2:	8b 45 08             	mov    0x8(%ebp),%eax
     8a5:	89 04 24             	mov    %eax,(%esp)
     8a8:	e8 68 02 00 00       	call   b15 <parseexec>
     8ad:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(peek(ps, es, "|")){
     8b0:	c7 44 24 08 81 15 00 	movl   $0x1581,0x8(%esp)
     8b7:	00 
     8b8:	8b 45 0c             	mov    0xc(%ebp),%eax
     8bb:	89 44 24 04          	mov    %eax,0x4(%esp)
     8bf:	8b 45 08             	mov    0x8(%ebp),%eax
     8c2:	89 04 24             	mov    %eax,(%esp)
     8c5:	e8 f6 fd ff ff       	call   6c0 <peek>
     8ca:	85 c0                	test   %eax,%eax
     8cc:	74 46                	je     914 <parsepipe+0x7f>
    gettoken(ps, es, 0, 0);
     8ce:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     8d5:	00 
     8d6:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     8dd:	00 
     8de:	8b 45 0c             	mov    0xc(%ebp),%eax
     8e1:	89 44 24 04          	mov    %eax,0x4(%esp)
     8e5:	8b 45 08             	mov    0x8(%ebp),%eax
     8e8:	89 04 24             	mov    %eax,(%esp)
     8eb:	e8 85 fc ff ff       	call   575 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     8f0:	8b 45 0c             	mov    0xc(%ebp),%eax
     8f3:	89 44 24 04          	mov    %eax,0x4(%esp)
     8f7:	8b 45 08             	mov    0x8(%ebp),%eax
     8fa:	89 04 24             	mov    %eax,(%esp)
     8fd:	e8 93 ff ff ff       	call   895 <parsepipe>
     902:	89 44 24 04          	mov    %eax,0x4(%esp)
     906:	8b 45 f4             	mov    -0xc(%ebp),%eax
     909:	89 04 24             	mov    %eax,(%esp)
     90c:	e8 7d fb ff ff       	call   48e <pipecmd>
     911:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
     914:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     917:	c9                   	leave  
     918:	c3                   	ret    

00000919 <parseredirs>:

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     919:	55                   	push   %ebp
     91a:	89 e5                	mov    %esp,%ebp
     91c:	83 ec 38             	sub    $0x38,%esp
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     91f:	e9 f6 00 00 00       	jmp    a1a <parseredirs+0x101>
    tok = gettoken(ps, es, 0, 0);
     924:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     92b:	00 
     92c:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     933:	00 
     934:	8b 45 10             	mov    0x10(%ebp),%eax
     937:	89 44 24 04          	mov    %eax,0x4(%esp)
     93b:	8b 45 0c             	mov    0xc(%ebp),%eax
     93e:	89 04 24             	mov    %eax,(%esp)
     941:	e8 2f fc ff ff       	call   575 <gettoken>
     946:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(gettoken(ps, es, &q, &eq) != 'a')
     949:	8d 45 ec             	lea    -0x14(%ebp),%eax
     94c:	89 44 24 0c          	mov    %eax,0xc(%esp)
     950:	8d 45 f0             	lea    -0x10(%ebp),%eax
     953:	89 44 24 08          	mov    %eax,0x8(%esp)
     957:	8b 45 10             	mov    0x10(%ebp),%eax
     95a:	89 44 24 04          	mov    %eax,0x4(%esp)
     95e:	8b 45 0c             	mov    0xc(%ebp),%eax
     961:	89 04 24             	mov    %eax,(%esp)
     964:	e8 0c fc ff ff       	call   575 <gettoken>
     969:	83 f8 61             	cmp    $0x61,%eax
     96c:	74 0c                	je     97a <parseredirs+0x61>
      panic("missing file for redirection");
     96e:	c7 04 24 83 15 00 00 	movl   $0x1583,(%esp)
     975:	e8 19 fa ff ff       	call   393 <panic>
    switch(tok){
     97a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     97d:	83 f8 3c             	cmp    $0x3c,%eax
     980:	74 0f                	je     991 <parseredirs+0x78>
     982:	83 f8 3e             	cmp    $0x3e,%eax
     985:	74 38                	je     9bf <parseredirs+0xa6>
     987:	83 f8 2b             	cmp    $0x2b,%eax
     98a:	74 61                	je     9ed <parseredirs+0xd4>
     98c:	e9 89 00 00 00       	jmp    a1a <parseredirs+0x101>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     991:	8b 55 ec             	mov    -0x14(%ebp),%edx
     994:	8b 45 f0             	mov    -0x10(%ebp),%eax
     997:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     99e:	00 
     99f:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     9a6:	00 
     9a7:	89 54 24 08          	mov    %edx,0x8(%esp)
     9ab:	89 44 24 04          	mov    %eax,0x4(%esp)
     9af:	8b 45 08             	mov    0x8(%ebp),%eax
     9b2:	89 04 24             	mov    %eax,(%esp)
     9b5:	e8 69 fa ff ff       	call   423 <redircmd>
     9ba:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     9bd:	eb 5b                	jmp    a1a <parseredirs+0x101>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     9bf:	8b 55 ec             	mov    -0x14(%ebp),%edx
     9c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
     9c5:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
     9cc:	00 
     9cd:	c7 44 24 0c 01 02 00 	movl   $0x201,0xc(%esp)
     9d4:	00 
     9d5:	89 54 24 08          	mov    %edx,0x8(%esp)
     9d9:	89 44 24 04          	mov    %eax,0x4(%esp)
     9dd:	8b 45 08             	mov    0x8(%ebp),%eax
     9e0:	89 04 24             	mov    %eax,(%esp)
     9e3:	e8 3b fa ff ff       	call   423 <redircmd>
     9e8:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     9eb:	eb 2d                	jmp    a1a <parseredirs+0x101>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     9ed:	8b 55 ec             	mov    -0x14(%ebp),%edx
     9f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
     9f3:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
     9fa:	00 
     9fb:	c7 44 24 0c 01 02 00 	movl   $0x201,0xc(%esp)
     a02:	00 
     a03:	89 54 24 08          	mov    %edx,0x8(%esp)
     a07:	89 44 24 04          	mov    %eax,0x4(%esp)
     a0b:	8b 45 08             	mov    0x8(%ebp),%eax
     a0e:	89 04 24             	mov    %eax,(%esp)
     a11:	e8 0d fa ff ff       	call   423 <redircmd>
     a16:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     a19:	90                   	nop
parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     a1a:	c7 44 24 08 a0 15 00 	movl   $0x15a0,0x8(%esp)
     a21:	00 
     a22:	8b 45 10             	mov    0x10(%ebp),%eax
     a25:	89 44 24 04          	mov    %eax,0x4(%esp)
     a29:	8b 45 0c             	mov    0xc(%ebp),%eax
     a2c:	89 04 24             	mov    %eax,(%esp)
     a2f:	e8 8c fc ff ff       	call   6c0 <peek>
     a34:	85 c0                	test   %eax,%eax
     a36:	0f 85 e8 fe ff ff    	jne    924 <parseredirs+0xb>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
     a3c:	8b 45 08             	mov    0x8(%ebp),%eax
}
     a3f:	c9                   	leave  
     a40:	c3                   	ret    

00000a41 <parseblock>:

struct cmd*
parseblock(char **ps, char *es)
{
     a41:	55                   	push   %ebp
     a42:	89 e5                	mov    %esp,%ebp
     a44:	83 ec 28             	sub    $0x28,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
     a47:	c7 44 24 08 a3 15 00 	movl   $0x15a3,0x8(%esp)
     a4e:	00 
     a4f:	8b 45 0c             	mov    0xc(%ebp),%eax
     a52:	89 44 24 04          	mov    %eax,0x4(%esp)
     a56:	8b 45 08             	mov    0x8(%ebp),%eax
     a59:	89 04 24             	mov    %eax,(%esp)
     a5c:	e8 5f fc ff ff       	call   6c0 <peek>
     a61:	85 c0                	test   %eax,%eax
     a63:	75 0c                	jne    a71 <parseblock+0x30>
    panic("parseblock");
     a65:	c7 04 24 a5 15 00 00 	movl   $0x15a5,(%esp)
     a6c:	e8 22 f9 ff ff       	call   393 <panic>
  gettoken(ps, es, 0, 0);
     a71:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     a78:	00 
     a79:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     a80:	00 
     a81:	8b 45 0c             	mov    0xc(%ebp),%eax
     a84:	89 44 24 04          	mov    %eax,0x4(%esp)
     a88:	8b 45 08             	mov    0x8(%ebp),%eax
     a8b:	89 04 24             	mov    %eax,(%esp)
     a8e:	e8 e2 fa ff ff       	call   575 <gettoken>
  cmd = parseline(ps, es);
     a93:	8b 45 0c             	mov    0xc(%ebp),%eax
     a96:	89 44 24 04          	mov    %eax,0x4(%esp)
     a9a:	8b 45 08             	mov    0x8(%ebp),%eax
     a9d:	89 04 24             	mov    %eax,(%esp)
     aa0:	e8 1c fd ff ff       	call   7c1 <parseline>
     aa5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(!peek(ps, es, ")"))
     aa8:	c7 44 24 08 b0 15 00 	movl   $0x15b0,0x8(%esp)
     aaf:	00 
     ab0:	8b 45 0c             	mov    0xc(%ebp),%eax
     ab3:	89 44 24 04          	mov    %eax,0x4(%esp)
     ab7:	8b 45 08             	mov    0x8(%ebp),%eax
     aba:	89 04 24             	mov    %eax,(%esp)
     abd:	e8 fe fb ff ff       	call   6c0 <peek>
     ac2:	85 c0                	test   %eax,%eax
     ac4:	75 0c                	jne    ad2 <parseblock+0x91>
    panic("syntax - missing )");
     ac6:	c7 04 24 b2 15 00 00 	movl   $0x15b2,(%esp)
     acd:	e8 c1 f8 ff ff       	call   393 <panic>
  gettoken(ps, es, 0, 0);
     ad2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     ad9:	00 
     ada:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     ae1:	00 
     ae2:	8b 45 0c             	mov    0xc(%ebp),%eax
     ae5:	89 44 24 04          	mov    %eax,0x4(%esp)
     ae9:	8b 45 08             	mov    0x8(%ebp),%eax
     aec:	89 04 24             	mov    %eax,(%esp)
     aef:	e8 81 fa ff ff       	call   575 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     af4:	8b 45 0c             	mov    0xc(%ebp),%eax
     af7:	89 44 24 08          	mov    %eax,0x8(%esp)
     afb:	8b 45 08             	mov    0x8(%ebp),%eax
     afe:	89 44 24 04          	mov    %eax,0x4(%esp)
     b02:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b05:	89 04 24             	mov    %eax,(%esp)
     b08:	e8 0c fe ff ff       	call   919 <parseredirs>
     b0d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  return cmd;
     b10:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     b13:	c9                   	leave  
     b14:	c3                   	ret    

00000b15 <parseexec>:

struct cmd*
parseexec(char **ps, char *es)
{
     b15:	55                   	push   %ebp
     b16:	89 e5                	mov    %esp,%ebp
     b18:	83 ec 38             	sub    $0x38,%esp
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
     b1b:	c7 44 24 08 a3 15 00 	movl   $0x15a3,0x8(%esp)
     b22:	00 
     b23:	8b 45 0c             	mov    0xc(%ebp),%eax
     b26:	89 44 24 04          	mov    %eax,0x4(%esp)
     b2a:	8b 45 08             	mov    0x8(%ebp),%eax
     b2d:	89 04 24             	mov    %eax,(%esp)
     b30:	e8 8b fb ff ff       	call   6c0 <peek>
     b35:	85 c0                	test   %eax,%eax
     b37:	74 17                	je     b50 <parseexec+0x3b>
    return parseblock(ps, es);
     b39:	8b 45 0c             	mov    0xc(%ebp),%eax
     b3c:	89 44 24 04          	mov    %eax,0x4(%esp)
     b40:	8b 45 08             	mov    0x8(%ebp),%eax
     b43:	89 04 24             	mov    %eax,(%esp)
     b46:	e8 f6 fe ff ff       	call   a41 <parseblock>
     b4b:	e9 09 01 00 00       	jmp    c59 <parseexec+0x144>

  ret = execcmd();
     b50:	e8 90 f8 ff ff       	call   3e5 <execcmd>
     b55:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cmd = (struct execcmd*)ret;
     b58:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b5b:	89 45 ec             	mov    %eax,-0x14(%ebp)

  argc = 0;
     b5e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  ret = parseredirs(ret, ps, es);
     b65:	8b 45 0c             	mov    0xc(%ebp),%eax
     b68:	89 44 24 08          	mov    %eax,0x8(%esp)
     b6c:	8b 45 08             	mov    0x8(%ebp),%eax
     b6f:	89 44 24 04          	mov    %eax,0x4(%esp)
     b73:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b76:	89 04 24             	mov    %eax,(%esp)
     b79:	e8 9b fd ff ff       	call   919 <parseredirs>
     b7e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while(!peek(ps, es, "|)&;")){
     b81:	e9 8f 00 00 00       	jmp    c15 <parseexec+0x100>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     b86:	8d 45 e0             	lea    -0x20(%ebp),%eax
     b89:	89 44 24 0c          	mov    %eax,0xc(%esp)
     b8d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     b90:	89 44 24 08          	mov    %eax,0x8(%esp)
     b94:	8b 45 0c             	mov    0xc(%ebp),%eax
     b97:	89 44 24 04          	mov    %eax,0x4(%esp)
     b9b:	8b 45 08             	mov    0x8(%ebp),%eax
     b9e:	89 04 24             	mov    %eax,(%esp)
     ba1:	e8 cf f9 ff ff       	call   575 <gettoken>
     ba6:	89 45 e8             	mov    %eax,-0x18(%ebp)
     ba9:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     bad:	75 05                	jne    bb4 <parseexec+0x9f>
      break;
     baf:	e9 83 00 00 00       	jmp    c37 <parseexec+0x122>
    if(tok != 'a')
     bb4:	83 7d e8 61          	cmpl   $0x61,-0x18(%ebp)
     bb8:	74 0c                	je     bc6 <parseexec+0xb1>
      panic("syntax");
     bba:	c7 04 24 76 15 00 00 	movl   $0x1576,(%esp)
     bc1:	e8 cd f7 ff ff       	call   393 <panic>
    cmd->argv[argc] = q;
     bc6:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
     bc9:	8b 45 ec             	mov    -0x14(%ebp),%eax
     bcc:	8b 55 f4             	mov    -0xc(%ebp),%edx
     bcf:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    cmd->eargv[argc] = eq;
     bd3:	8b 55 e0             	mov    -0x20(%ebp),%edx
     bd6:	8b 45 ec             	mov    -0x14(%ebp),%eax
     bd9:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     bdc:	83 c1 08             	add    $0x8,%ecx
     bdf:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    argc++;
     be3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(argc >= MAXARGS)
     be7:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
     beb:	7e 0c                	jle    bf9 <parseexec+0xe4>
      panic("too many args");
     bed:	c7 04 24 c5 15 00 00 	movl   $0x15c5,(%esp)
     bf4:	e8 9a f7 ff ff       	call   393 <panic>
    ret = parseredirs(ret, ps, es);
     bf9:	8b 45 0c             	mov    0xc(%ebp),%eax
     bfc:	89 44 24 08          	mov    %eax,0x8(%esp)
     c00:	8b 45 08             	mov    0x8(%ebp),%eax
     c03:	89 44 24 04          	mov    %eax,0x4(%esp)
     c07:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c0a:	89 04 24             	mov    %eax,(%esp)
     c0d:	e8 07 fd ff ff       	call   919 <parseredirs>
     c12:	89 45 f0             	mov    %eax,-0x10(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
     c15:	c7 44 24 08 d3 15 00 	movl   $0x15d3,0x8(%esp)
     c1c:	00 
     c1d:	8b 45 0c             	mov    0xc(%ebp),%eax
     c20:	89 44 24 04          	mov    %eax,0x4(%esp)
     c24:	8b 45 08             	mov    0x8(%ebp),%eax
     c27:	89 04 24             	mov    %eax,(%esp)
     c2a:	e8 91 fa ff ff       	call   6c0 <peek>
     c2f:	85 c0                	test   %eax,%eax
     c31:	0f 84 4f ff ff ff    	je     b86 <parseexec+0x71>
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
     c37:	8b 45 ec             	mov    -0x14(%ebp),%eax
     c3a:	8b 55 f4             	mov    -0xc(%ebp),%edx
     c3d:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
     c44:	00 
  cmd->eargv[argc] = 0;
     c45:	8b 45 ec             	mov    -0x14(%ebp),%eax
     c48:	8b 55 f4             	mov    -0xc(%ebp),%edx
     c4b:	83 c2 08             	add    $0x8,%edx
     c4e:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
     c55:	00 
  return ret;
     c56:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     c59:	c9                   	leave  
     c5a:	c3                   	ret    

00000c5b <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     c5b:	55                   	push   %ebp
     c5c:	89 e5                	mov    %esp,%ebp
     c5e:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     c61:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     c65:	75 0a                	jne    c71 <nulterminate+0x16>
    return 0;
     c67:	b8 00 00 00 00       	mov    $0x0,%eax
     c6c:	e9 c9 00 00 00       	jmp    d3a <nulterminate+0xdf>
  
  switch(cmd->type){
     c71:	8b 45 08             	mov    0x8(%ebp),%eax
     c74:	8b 00                	mov    (%eax),%eax
     c76:	83 f8 05             	cmp    $0x5,%eax
     c79:	0f 87 b8 00 00 00    	ja     d37 <nulterminate+0xdc>
     c7f:	8b 04 85 d8 15 00 00 	mov    0x15d8(,%eax,4),%eax
     c86:	ff e0                	jmp    *%eax
  case EXEC:
    ecmd = (struct execcmd*)cmd;
     c88:	8b 45 08             	mov    0x8(%ebp),%eax
     c8b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    for(i=0; ecmd->argv[i]; i++)
     c8e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     c95:	eb 14                	jmp    cab <nulterminate+0x50>
      *ecmd->eargv[i] = 0;
     c97:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c9a:	8b 55 f4             	mov    -0xc(%ebp),%edx
     c9d:	83 c2 08             	add    $0x8,%edx
     ca0:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
     ca4:	c6 00 00             	movb   $0x0,(%eax)
    return 0;
  
  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     ca7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     cab:	8b 45 f0             	mov    -0x10(%ebp),%eax
     cae:	8b 55 f4             	mov    -0xc(%ebp),%edx
     cb1:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
     cb5:	85 c0                	test   %eax,%eax
     cb7:	75 de                	jne    c97 <nulterminate+0x3c>
      *ecmd->eargv[i] = 0;
    break;
     cb9:	eb 7c                	jmp    d37 <nulterminate+0xdc>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
     cbb:	8b 45 08             	mov    0x8(%ebp),%eax
     cbe:	89 45 ec             	mov    %eax,-0x14(%ebp)
    nulterminate(rcmd->cmd);
     cc1:	8b 45 ec             	mov    -0x14(%ebp),%eax
     cc4:	8b 40 04             	mov    0x4(%eax),%eax
     cc7:	89 04 24             	mov    %eax,(%esp)
     cca:	e8 8c ff ff ff       	call   c5b <nulterminate>
    *rcmd->efile = 0;
     ccf:	8b 45 ec             	mov    -0x14(%ebp),%eax
     cd2:	8b 40 0c             	mov    0xc(%eax),%eax
     cd5:	c6 00 00             	movb   $0x0,(%eax)
    break;
     cd8:	eb 5d                	jmp    d37 <nulterminate+0xdc>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
     cda:	8b 45 08             	mov    0x8(%ebp),%eax
     cdd:	89 45 e8             	mov    %eax,-0x18(%ebp)
    nulterminate(pcmd->left);
     ce0:	8b 45 e8             	mov    -0x18(%ebp),%eax
     ce3:	8b 40 04             	mov    0x4(%eax),%eax
     ce6:	89 04 24             	mov    %eax,(%esp)
     ce9:	e8 6d ff ff ff       	call   c5b <nulterminate>
    nulterminate(pcmd->right);
     cee:	8b 45 e8             	mov    -0x18(%ebp),%eax
     cf1:	8b 40 08             	mov    0x8(%eax),%eax
     cf4:	89 04 24             	mov    %eax,(%esp)
     cf7:	e8 5f ff ff ff       	call   c5b <nulterminate>
    break;
     cfc:	eb 39                	jmp    d37 <nulterminate+0xdc>
    
  case LIST:
    lcmd = (struct listcmd*)cmd;
     cfe:	8b 45 08             	mov    0x8(%ebp),%eax
     d01:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    nulterminate(lcmd->left);
     d04:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     d07:	8b 40 04             	mov    0x4(%eax),%eax
     d0a:	89 04 24             	mov    %eax,(%esp)
     d0d:	e8 49 ff ff ff       	call   c5b <nulterminate>
    nulterminate(lcmd->right);
     d12:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     d15:	8b 40 08             	mov    0x8(%eax),%eax
     d18:	89 04 24             	mov    %eax,(%esp)
     d1b:	e8 3b ff ff ff       	call   c5b <nulterminate>
    break;
     d20:	eb 15                	jmp    d37 <nulterminate+0xdc>

  case BACK:
    bcmd = (struct backcmd*)cmd;
     d22:	8b 45 08             	mov    0x8(%ebp),%eax
     d25:	89 45 e0             	mov    %eax,-0x20(%ebp)
    nulterminate(bcmd->cmd);
     d28:	8b 45 e0             	mov    -0x20(%ebp),%eax
     d2b:	8b 40 04             	mov    0x4(%eax),%eax
     d2e:	89 04 24             	mov    %eax,(%esp)
     d31:	e8 25 ff ff ff       	call   c5b <nulterminate>
    break;
     d36:	90                   	nop
  }
  return cmd;
     d37:	8b 45 08             	mov    0x8(%ebp),%eax
}
     d3a:	c9                   	leave  
     d3b:	c3                   	ret    

00000d3c <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
     d3c:	55                   	push   %ebp
     d3d:	89 e5                	mov    %esp,%ebp
     d3f:	57                   	push   %edi
     d40:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
     d41:	8b 4d 08             	mov    0x8(%ebp),%ecx
     d44:	8b 55 10             	mov    0x10(%ebp),%edx
     d47:	8b 45 0c             	mov    0xc(%ebp),%eax
     d4a:	89 cb                	mov    %ecx,%ebx
     d4c:	89 df                	mov    %ebx,%edi
     d4e:	89 d1                	mov    %edx,%ecx
     d50:	fc                   	cld    
     d51:	f3 aa                	rep stos %al,%es:(%edi)
     d53:	89 ca                	mov    %ecx,%edx
     d55:	89 fb                	mov    %edi,%ebx
     d57:	89 5d 08             	mov    %ebx,0x8(%ebp)
     d5a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
     d5d:	5b                   	pop    %ebx
     d5e:	5f                   	pop    %edi
     d5f:	5d                   	pop    %ebp
     d60:	c3                   	ret    

00000d61 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     d61:	55                   	push   %ebp
     d62:	89 e5                	mov    %esp,%ebp
     d64:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
     d67:	8b 45 08             	mov    0x8(%ebp),%eax
     d6a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
     d6d:	90                   	nop
     d6e:	8b 45 08             	mov    0x8(%ebp),%eax
     d71:	8d 50 01             	lea    0x1(%eax),%edx
     d74:	89 55 08             	mov    %edx,0x8(%ebp)
     d77:	8b 55 0c             	mov    0xc(%ebp),%edx
     d7a:	8d 4a 01             	lea    0x1(%edx),%ecx
     d7d:	89 4d 0c             	mov    %ecx,0xc(%ebp)
     d80:	0f b6 12             	movzbl (%edx),%edx
     d83:	88 10                	mov    %dl,(%eax)
     d85:	0f b6 00             	movzbl (%eax),%eax
     d88:	84 c0                	test   %al,%al
     d8a:	75 e2                	jne    d6e <strcpy+0xd>
    ;
  return os;
     d8c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     d8f:	c9                   	leave  
     d90:	c3                   	ret    

00000d91 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     d91:	55                   	push   %ebp
     d92:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
     d94:	eb 08                	jmp    d9e <strcmp+0xd>
    p++, q++;
     d96:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     d9a:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     d9e:	8b 45 08             	mov    0x8(%ebp),%eax
     da1:	0f b6 00             	movzbl (%eax),%eax
     da4:	84 c0                	test   %al,%al
     da6:	74 10                	je     db8 <strcmp+0x27>
     da8:	8b 45 08             	mov    0x8(%ebp),%eax
     dab:	0f b6 10             	movzbl (%eax),%edx
     dae:	8b 45 0c             	mov    0xc(%ebp),%eax
     db1:	0f b6 00             	movzbl (%eax),%eax
     db4:	38 c2                	cmp    %al,%dl
     db6:	74 de                	je     d96 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     db8:	8b 45 08             	mov    0x8(%ebp),%eax
     dbb:	0f b6 00             	movzbl (%eax),%eax
     dbe:	0f b6 d0             	movzbl %al,%edx
     dc1:	8b 45 0c             	mov    0xc(%ebp),%eax
     dc4:	0f b6 00             	movzbl (%eax),%eax
     dc7:	0f b6 c0             	movzbl %al,%eax
     dca:	29 c2                	sub    %eax,%edx
     dcc:	89 d0                	mov    %edx,%eax
}
     dce:	5d                   	pop    %ebp
     dcf:	c3                   	ret    

00000dd0 <strlen>:

uint
strlen(char *s)
{
     dd0:	55                   	push   %ebp
     dd1:	89 e5                	mov    %esp,%ebp
     dd3:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
     dd6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     ddd:	eb 04                	jmp    de3 <strlen+0x13>
     ddf:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     de3:	8b 55 fc             	mov    -0x4(%ebp),%edx
     de6:	8b 45 08             	mov    0x8(%ebp),%eax
     de9:	01 d0                	add    %edx,%eax
     deb:	0f b6 00             	movzbl (%eax),%eax
     dee:	84 c0                	test   %al,%al
     df0:	75 ed                	jne    ddf <strlen+0xf>
    ;
  return n;
     df2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     df5:	c9                   	leave  
     df6:	c3                   	ret    

00000df7 <memset>:

void*
memset(void *dst, int c, uint n)
{
     df7:	55                   	push   %ebp
     df8:	89 e5                	mov    %esp,%ebp
     dfa:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
     dfd:	8b 45 10             	mov    0x10(%ebp),%eax
     e00:	89 44 24 08          	mov    %eax,0x8(%esp)
     e04:	8b 45 0c             	mov    0xc(%ebp),%eax
     e07:	89 44 24 04          	mov    %eax,0x4(%esp)
     e0b:	8b 45 08             	mov    0x8(%ebp),%eax
     e0e:	89 04 24             	mov    %eax,(%esp)
     e11:	e8 26 ff ff ff       	call   d3c <stosb>
  return dst;
     e16:	8b 45 08             	mov    0x8(%ebp),%eax
}
     e19:	c9                   	leave  
     e1a:	c3                   	ret    

00000e1b <strchr>:

char*
strchr(const char *s, char c)
{
     e1b:	55                   	push   %ebp
     e1c:	89 e5                	mov    %esp,%ebp
     e1e:	83 ec 04             	sub    $0x4,%esp
     e21:	8b 45 0c             	mov    0xc(%ebp),%eax
     e24:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
     e27:	eb 14                	jmp    e3d <strchr+0x22>
    if(*s == c)
     e29:	8b 45 08             	mov    0x8(%ebp),%eax
     e2c:	0f b6 00             	movzbl (%eax),%eax
     e2f:	3a 45 fc             	cmp    -0x4(%ebp),%al
     e32:	75 05                	jne    e39 <strchr+0x1e>
      return (char*)s;
     e34:	8b 45 08             	mov    0x8(%ebp),%eax
     e37:	eb 13                	jmp    e4c <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     e39:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     e3d:	8b 45 08             	mov    0x8(%ebp),%eax
     e40:	0f b6 00             	movzbl (%eax),%eax
     e43:	84 c0                	test   %al,%al
     e45:	75 e2                	jne    e29 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
     e47:	b8 00 00 00 00       	mov    $0x0,%eax
}
     e4c:	c9                   	leave  
     e4d:	c3                   	ret    

00000e4e <gets>:

char*
gets(char *buf, int max)
{
     e4e:	55                   	push   %ebp
     e4f:	89 e5                	mov    %esp,%ebp
     e51:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     e54:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     e5b:	eb 4c                	jmp    ea9 <gets+0x5b>
    cc = read(0, &c, 1);
     e5d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     e64:	00 
     e65:	8d 45 ef             	lea    -0x11(%ebp),%eax
     e68:	89 44 24 04          	mov    %eax,0x4(%esp)
     e6c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     e73:	e8 44 01 00 00       	call   fbc <read>
     e78:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
     e7b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     e7f:	7f 02                	jg     e83 <gets+0x35>
      break;
     e81:	eb 31                	jmp    eb4 <gets+0x66>
    buf[i++] = c;
     e83:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e86:	8d 50 01             	lea    0x1(%eax),%edx
     e89:	89 55 f4             	mov    %edx,-0xc(%ebp)
     e8c:	89 c2                	mov    %eax,%edx
     e8e:	8b 45 08             	mov    0x8(%ebp),%eax
     e91:	01 c2                	add    %eax,%edx
     e93:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     e97:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
     e99:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     e9d:	3c 0a                	cmp    $0xa,%al
     e9f:	74 13                	je     eb4 <gets+0x66>
     ea1:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     ea5:	3c 0d                	cmp    $0xd,%al
     ea7:	74 0b                	je     eb4 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     ea9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     eac:	83 c0 01             	add    $0x1,%eax
     eaf:	3b 45 0c             	cmp    0xc(%ebp),%eax
     eb2:	7c a9                	jl     e5d <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     eb4:	8b 55 f4             	mov    -0xc(%ebp),%edx
     eb7:	8b 45 08             	mov    0x8(%ebp),%eax
     eba:	01 d0                	add    %edx,%eax
     ebc:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
     ebf:	8b 45 08             	mov    0x8(%ebp),%eax
}
     ec2:	c9                   	leave  
     ec3:	c3                   	ret    

00000ec4 <stat>:

int
stat(char *n, struct stat *st)
{
     ec4:	55                   	push   %ebp
     ec5:	89 e5                	mov    %esp,%ebp
     ec7:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     eca:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     ed1:	00 
     ed2:	8b 45 08             	mov    0x8(%ebp),%eax
     ed5:	89 04 24             	mov    %eax,(%esp)
     ed8:	e8 07 01 00 00       	call   fe4 <open>
     edd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
     ee0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     ee4:	79 07                	jns    eed <stat+0x29>
    return -1;
     ee6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     eeb:	eb 23                	jmp    f10 <stat+0x4c>
  r = fstat(fd, st);
     eed:	8b 45 0c             	mov    0xc(%ebp),%eax
     ef0:	89 44 24 04          	mov    %eax,0x4(%esp)
     ef4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ef7:	89 04 24             	mov    %eax,(%esp)
     efa:	e8 fd 00 00 00       	call   ffc <fstat>
     eff:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
     f02:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f05:	89 04 24             	mov    %eax,(%esp)
     f08:	e8 bf 00 00 00       	call   fcc <close>
  return r;
     f0d:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     f10:	c9                   	leave  
     f11:	c3                   	ret    

00000f12 <atoi>:

int
atoi(const char *s)
{
     f12:	55                   	push   %ebp
     f13:	89 e5                	mov    %esp,%ebp
     f15:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
     f18:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
     f1f:	eb 25                	jmp    f46 <atoi+0x34>
    n = n*10 + *s++ - '0';
     f21:	8b 55 fc             	mov    -0x4(%ebp),%edx
     f24:	89 d0                	mov    %edx,%eax
     f26:	c1 e0 02             	shl    $0x2,%eax
     f29:	01 d0                	add    %edx,%eax
     f2b:	01 c0                	add    %eax,%eax
     f2d:	89 c1                	mov    %eax,%ecx
     f2f:	8b 45 08             	mov    0x8(%ebp),%eax
     f32:	8d 50 01             	lea    0x1(%eax),%edx
     f35:	89 55 08             	mov    %edx,0x8(%ebp)
     f38:	0f b6 00             	movzbl (%eax),%eax
     f3b:	0f be c0             	movsbl %al,%eax
     f3e:	01 c8                	add    %ecx,%eax
     f40:	83 e8 30             	sub    $0x30,%eax
     f43:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     f46:	8b 45 08             	mov    0x8(%ebp),%eax
     f49:	0f b6 00             	movzbl (%eax),%eax
     f4c:	3c 2f                	cmp    $0x2f,%al
     f4e:	7e 0a                	jle    f5a <atoi+0x48>
     f50:	8b 45 08             	mov    0x8(%ebp),%eax
     f53:	0f b6 00             	movzbl (%eax),%eax
     f56:	3c 39                	cmp    $0x39,%al
     f58:	7e c7                	jle    f21 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
     f5a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     f5d:	c9                   	leave  
     f5e:	c3                   	ret    

00000f5f <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     f5f:	55                   	push   %ebp
     f60:	89 e5                	mov    %esp,%ebp
     f62:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
     f65:	8b 45 08             	mov    0x8(%ebp),%eax
     f68:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
     f6b:	8b 45 0c             	mov    0xc(%ebp),%eax
     f6e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
     f71:	eb 17                	jmp    f8a <memmove+0x2b>
    *dst++ = *src++;
     f73:	8b 45 fc             	mov    -0x4(%ebp),%eax
     f76:	8d 50 01             	lea    0x1(%eax),%edx
     f79:	89 55 fc             	mov    %edx,-0x4(%ebp)
     f7c:	8b 55 f8             	mov    -0x8(%ebp),%edx
     f7f:	8d 4a 01             	lea    0x1(%edx),%ecx
     f82:	89 4d f8             	mov    %ecx,-0x8(%ebp)
     f85:	0f b6 12             	movzbl (%edx),%edx
     f88:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     f8a:	8b 45 10             	mov    0x10(%ebp),%eax
     f8d:	8d 50 ff             	lea    -0x1(%eax),%edx
     f90:	89 55 10             	mov    %edx,0x10(%ebp)
     f93:	85 c0                	test   %eax,%eax
     f95:	7f dc                	jg     f73 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
     f97:	8b 45 08             	mov    0x8(%ebp),%eax
}
     f9a:	c9                   	leave  
     f9b:	c3                   	ret    

00000f9c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     f9c:	b8 01 00 00 00       	mov    $0x1,%eax
     fa1:	cd 40                	int    $0x40
     fa3:	c3                   	ret    

00000fa4 <exit>:
SYSCALL(exit)
     fa4:	b8 02 00 00 00       	mov    $0x2,%eax
     fa9:	cd 40                	int    $0x40
     fab:	c3                   	ret    

00000fac <wait>:
SYSCALL(wait)
     fac:	b8 03 00 00 00       	mov    $0x3,%eax
     fb1:	cd 40                	int    $0x40
     fb3:	c3                   	ret    

00000fb4 <pipe>:
SYSCALL(pipe)
     fb4:	b8 04 00 00 00       	mov    $0x4,%eax
     fb9:	cd 40                	int    $0x40
     fbb:	c3                   	ret    

00000fbc <read>:
SYSCALL(read)
     fbc:	b8 05 00 00 00       	mov    $0x5,%eax
     fc1:	cd 40                	int    $0x40
     fc3:	c3                   	ret    

00000fc4 <write>:
SYSCALL(write)
     fc4:	b8 10 00 00 00       	mov    $0x10,%eax
     fc9:	cd 40                	int    $0x40
     fcb:	c3                   	ret    

00000fcc <close>:
SYSCALL(close)
     fcc:	b8 15 00 00 00       	mov    $0x15,%eax
     fd1:	cd 40                	int    $0x40
     fd3:	c3                   	ret    

00000fd4 <kill>:
SYSCALL(kill)
     fd4:	b8 06 00 00 00       	mov    $0x6,%eax
     fd9:	cd 40                	int    $0x40
     fdb:	c3                   	ret    

00000fdc <exec>:
SYSCALL(exec)
     fdc:	b8 07 00 00 00       	mov    $0x7,%eax
     fe1:	cd 40                	int    $0x40
     fe3:	c3                   	ret    

00000fe4 <open>:
SYSCALL(open)
     fe4:	b8 0f 00 00 00       	mov    $0xf,%eax
     fe9:	cd 40                	int    $0x40
     feb:	c3                   	ret    

00000fec <mknod>:
SYSCALL(mknod)
     fec:	b8 11 00 00 00       	mov    $0x11,%eax
     ff1:	cd 40                	int    $0x40
     ff3:	c3                   	ret    

00000ff4 <unlink>:
SYSCALL(unlink)
     ff4:	b8 12 00 00 00       	mov    $0x12,%eax
     ff9:	cd 40                	int    $0x40
     ffb:	c3                   	ret    

00000ffc <fstat>:
SYSCALL(fstat)
     ffc:	b8 08 00 00 00       	mov    $0x8,%eax
    1001:	cd 40                	int    $0x40
    1003:	c3                   	ret    

00001004 <link>:
SYSCALL(link)
    1004:	b8 13 00 00 00       	mov    $0x13,%eax
    1009:	cd 40                	int    $0x40
    100b:	c3                   	ret    

0000100c <mkdir>:
SYSCALL(mkdir)
    100c:	b8 14 00 00 00       	mov    $0x14,%eax
    1011:	cd 40                	int    $0x40
    1013:	c3                   	ret    

00001014 <chdir>:
SYSCALL(chdir)
    1014:	b8 09 00 00 00       	mov    $0x9,%eax
    1019:	cd 40                	int    $0x40
    101b:	c3                   	ret    

0000101c <dup>:
SYSCALL(dup)
    101c:	b8 0a 00 00 00       	mov    $0xa,%eax
    1021:	cd 40                	int    $0x40
    1023:	c3                   	ret    

00001024 <getpid>:
SYSCALL(getpid)
    1024:	b8 0b 00 00 00       	mov    $0xb,%eax
    1029:	cd 40                	int    $0x40
    102b:	c3                   	ret    

0000102c <sbrk>:
SYSCALL(sbrk)
    102c:	b8 0c 00 00 00       	mov    $0xc,%eax
    1031:	cd 40                	int    $0x40
    1033:	c3                   	ret    

00001034 <sleep>:
SYSCALL(sleep)
    1034:	b8 0d 00 00 00       	mov    $0xd,%eax
    1039:	cd 40                	int    $0x40
    103b:	c3                   	ret    

0000103c <uptime>:
SYSCALL(uptime)
    103c:	b8 0e 00 00 00       	mov    $0xe,%eax
    1041:	cd 40                	int    $0x40
    1043:	c3                   	ret    

00001044 <waitpid>:
SYSCALL(waitpid)
    1044:	b8 16 00 00 00       	mov    $0x16,%eax
    1049:	cd 40                	int    $0x40
    104b:	c3                   	ret    

0000104c <setprio>:
SYSCALL(setprio)
    104c:	b8 17 00 00 00       	mov    $0x17,%eax
    1051:	cd 40                	int    $0x40
    1053:	c3                   	ret    

00001054 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    1054:	55                   	push   %ebp
    1055:	89 e5                	mov    %esp,%ebp
    1057:	83 ec 18             	sub    $0x18,%esp
    105a:	8b 45 0c             	mov    0xc(%ebp),%eax
    105d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    1060:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1067:	00 
    1068:	8d 45 f4             	lea    -0xc(%ebp),%eax
    106b:	89 44 24 04          	mov    %eax,0x4(%esp)
    106f:	8b 45 08             	mov    0x8(%ebp),%eax
    1072:	89 04 24             	mov    %eax,(%esp)
    1075:	e8 4a ff ff ff       	call   fc4 <write>
}
    107a:	c9                   	leave  
    107b:	c3                   	ret    

0000107c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    107c:	55                   	push   %ebp
    107d:	89 e5                	mov    %esp,%ebp
    107f:	56                   	push   %esi
    1080:	53                   	push   %ebx
    1081:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    1084:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    108b:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    108f:	74 17                	je     10a8 <printint+0x2c>
    1091:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    1095:	79 11                	jns    10a8 <printint+0x2c>
    neg = 1;
    1097:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    109e:	8b 45 0c             	mov    0xc(%ebp),%eax
    10a1:	f7 d8                	neg    %eax
    10a3:	89 45 ec             	mov    %eax,-0x14(%ebp)
    10a6:	eb 06                	jmp    10ae <printint+0x32>
  } else {
    x = xx;
    10a8:	8b 45 0c             	mov    0xc(%ebp),%eax
    10ab:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    10ae:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    10b5:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    10b8:	8d 41 01             	lea    0x1(%ecx),%eax
    10bb:	89 45 f4             	mov    %eax,-0xc(%ebp)
    10be:	8b 5d 10             	mov    0x10(%ebp),%ebx
    10c1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    10c4:	ba 00 00 00 00       	mov    $0x0,%edx
    10c9:	f7 f3                	div    %ebx
    10cb:	89 d0                	mov    %edx,%eax
    10cd:	0f b6 80 86 1a 00 00 	movzbl 0x1a86(%eax),%eax
    10d4:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    10d8:	8b 75 10             	mov    0x10(%ebp),%esi
    10db:	8b 45 ec             	mov    -0x14(%ebp),%eax
    10de:	ba 00 00 00 00       	mov    $0x0,%edx
    10e3:	f7 f6                	div    %esi
    10e5:	89 45 ec             	mov    %eax,-0x14(%ebp)
    10e8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    10ec:	75 c7                	jne    10b5 <printint+0x39>
  if(neg)
    10ee:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    10f2:	74 10                	je     1104 <printint+0x88>
    buf[i++] = '-';
    10f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10f7:	8d 50 01             	lea    0x1(%eax),%edx
    10fa:	89 55 f4             	mov    %edx,-0xc(%ebp)
    10fd:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    1102:	eb 1f                	jmp    1123 <printint+0xa7>
    1104:	eb 1d                	jmp    1123 <printint+0xa7>
    putc(fd, buf[i]);
    1106:	8d 55 dc             	lea    -0x24(%ebp),%edx
    1109:	8b 45 f4             	mov    -0xc(%ebp),%eax
    110c:	01 d0                	add    %edx,%eax
    110e:	0f b6 00             	movzbl (%eax),%eax
    1111:	0f be c0             	movsbl %al,%eax
    1114:	89 44 24 04          	mov    %eax,0x4(%esp)
    1118:	8b 45 08             	mov    0x8(%ebp),%eax
    111b:	89 04 24             	mov    %eax,(%esp)
    111e:	e8 31 ff ff ff       	call   1054 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    1123:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    1127:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    112b:	79 d9                	jns    1106 <printint+0x8a>
    putc(fd, buf[i]);
}
    112d:	83 c4 30             	add    $0x30,%esp
    1130:	5b                   	pop    %ebx
    1131:	5e                   	pop    %esi
    1132:	5d                   	pop    %ebp
    1133:	c3                   	ret    

00001134 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    1134:	55                   	push   %ebp
    1135:	89 e5                	mov    %esp,%ebp
    1137:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    113a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    1141:	8d 45 0c             	lea    0xc(%ebp),%eax
    1144:	83 c0 04             	add    $0x4,%eax
    1147:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    114a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1151:	e9 7c 01 00 00       	jmp    12d2 <printf+0x19e>
    c = fmt[i] & 0xff;
    1156:	8b 55 0c             	mov    0xc(%ebp),%edx
    1159:	8b 45 f0             	mov    -0x10(%ebp),%eax
    115c:	01 d0                	add    %edx,%eax
    115e:	0f b6 00             	movzbl (%eax),%eax
    1161:	0f be c0             	movsbl %al,%eax
    1164:	25 ff 00 00 00       	and    $0xff,%eax
    1169:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    116c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1170:	75 2c                	jne    119e <printf+0x6a>
      if(c == '%'){
    1172:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    1176:	75 0c                	jne    1184 <printf+0x50>
        state = '%';
    1178:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    117f:	e9 4a 01 00 00       	jmp    12ce <printf+0x19a>
      } else {
        putc(fd, c);
    1184:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1187:	0f be c0             	movsbl %al,%eax
    118a:	89 44 24 04          	mov    %eax,0x4(%esp)
    118e:	8b 45 08             	mov    0x8(%ebp),%eax
    1191:	89 04 24             	mov    %eax,(%esp)
    1194:	e8 bb fe ff ff       	call   1054 <putc>
    1199:	e9 30 01 00 00       	jmp    12ce <printf+0x19a>
      }
    } else if(state == '%'){
    119e:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    11a2:	0f 85 26 01 00 00    	jne    12ce <printf+0x19a>
      if(c == 'd'){
    11a8:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    11ac:	75 2d                	jne    11db <printf+0xa7>
        printint(fd, *ap, 10, 1);
    11ae:	8b 45 e8             	mov    -0x18(%ebp),%eax
    11b1:	8b 00                	mov    (%eax),%eax
    11b3:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    11ba:	00 
    11bb:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    11c2:	00 
    11c3:	89 44 24 04          	mov    %eax,0x4(%esp)
    11c7:	8b 45 08             	mov    0x8(%ebp),%eax
    11ca:	89 04 24             	mov    %eax,(%esp)
    11cd:	e8 aa fe ff ff       	call   107c <printint>
        ap++;
    11d2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    11d6:	e9 ec 00 00 00       	jmp    12c7 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    11db:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    11df:	74 06                	je     11e7 <printf+0xb3>
    11e1:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    11e5:	75 2d                	jne    1214 <printf+0xe0>
        printint(fd, *ap, 16, 0);
    11e7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    11ea:	8b 00                	mov    (%eax),%eax
    11ec:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    11f3:	00 
    11f4:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    11fb:	00 
    11fc:	89 44 24 04          	mov    %eax,0x4(%esp)
    1200:	8b 45 08             	mov    0x8(%ebp),%eax
    1203:	89 04 24             	mov    %eax,(%esp)
    1206:	e8 71 fe ff ff       	call   107c <printint>
        ap++;
    120b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    120f:	e9 b3 00 00 00       	jmp    12c7 <printf+0x193>
      } else if(c == 's'){
    1214:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    1218:	75 45                	jne    125f <printf+0x12b>
        s = (char*)*ap;
    121a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    121d:	8b 00                	mov    (%eax),%eax
    121f:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    1222:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    1226:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    122a:	75 09                	jne    1235 <printf+0x101>
          s = "(null)";
    122c:	c7 45 f4 f0 15 00 00 	movl   $0x15f0,-0xc(%ebp)
        while(*s != 0){
    1233:	eb 1e                	jmp    1253 <printf+0x11f>
    1235:	eb 1c                	jmp    1253 <printf+0x11f>
          putc(fd, *s);
    1237:	8b 45 f4             	mov    -0xc(%ebp),%eax
    123a:	0f b6 00             	movzbl (%eax),%eax
    123d:	0f be c0             	movsbl %al,%eax
    1240:	89 44 24 04          	mov    %eax,0x4(%esp)
    1244:	8b 45 08             	mov    0x8(%ebp),%eax
    1247:	89 04 24             	mov    %eax,(%esp)
    124a:	e8 05 fe ff ff       	call   1054 <putc>
          s++;
    124f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    1253:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1256:	0f b6 00             	movzbl (%eax),%eax
    1259:	84 c0                	test   %al,%al
    125b:	75 da                	jne    1237 <printf+0x103>
    125d:	eb 68                	jmp    12c7 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    125f:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    1263:	75 1d                	jne    1282 <printf+0x14e>
        putc(fd, *ap);
    1265:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1268:	8b 00                	mov    (%eax),%eax
    126a:	0f be c0             	movsbl %al,%eax
    126d:	89 44 24 04          	mov    %eax,0x4(%esp)
    1271:	8b 45 08             	mov    0x8(%ebp),%eax
    1274:	89 04 24             	mov    %eax,(%esp)
    1277:	e8 d8 fd ff ff       	call   1054 <putc>
        ap++;
    127c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    1280:	eb 45                	jmp    12c7 <printf+0x193>
      } else if(c == '%'){
    1282:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    1286:	75 17                	jne    129f <printf+0x16b>
        putc(fd, c);
    1288:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    128b:	0f be c0             	movsbl %al,%eax
    128e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1292:	8b 45 08             	mov    0x8(%ebp),%eax
    1295:	89 04 24             	mov    %eax,(%esp)
    1298:	e8 b7 fd ff ff       	call   1054 <putc>
    129d:	eb 28                	jmp    12c7 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    129f:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    12a6:	00 
    12a7:	8b 45 08             	mov    0x8(%ebp),%eax
    12aa:	89 04 24             	mov    %eax,(%esp)
    12ad:	e8 a2 fd ff ff       	call   1054 <putc>
        putc(fd, c);
    12b2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    12b5:	0f be c0             	movsbl %al,%eax
    12b8:	89 44 24 04          	mov    %eax,0x4(%esp)
    12bc:	8b 45 08             	mov    0x8(%ebp),%eax
    12bf:	89 04 24             	mov    %eax,(%esp)
    12c2:	e8 8d fd ff ff       	call   1054 <putc>
      }
      state = 0;
    12c7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    12ce:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    12d2:	8b 55 0c             	mov    0xc(%ebp),%edx
    12d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    12d8:	01 d0                	add    %edx,%eax
    12da:	0f b6 00             	movzbl (%eax),%eax
    12dd:	84 c0                	test   %al,%al
    12df:	0f 85 71 fe ff ff    	jne    1156 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    12e5:	c9                   	leave  
    12e6:	c3                   	ret    

000012e7 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    12e7:	55                   	push   %ebp
    12e8:	89 e5                	mov    %esp,%ebp
    12ea:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    12ed:	8b 45 08             	mov    0x8(%ebp),%eax
    12f0:	83 e8 08             	sub    $0x8,%eax
    12f3:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    12f6:	a1 0c 1b 00 00       	mov    0x1b0c,%eax
    12fb:	89 45 fc             	mov    %eax,-0x4(%ebp)
    12fe:	eb 24                	jmp    1324 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1300:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1303:	8b 00                	mov    (%eax),%eax
    1305:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1308:	77 12                	ja     131c <free+0x35>
    130a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    130d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1310:	77 24                	ja     1336 <free+0x4f>
    1312:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1315:	8b 00                	mov    (%eax),%eax
    1317:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    131a:	77 1a                	ja     1336 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    131c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    131f:	8b 00                	mov    (%eax),%eax
    1321:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1324:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1327:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    132a:	76 d4                	jbe    1300 <free+0x19>
    132c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    132f:	8b 00                	mov    (%eax),%eax
    1331:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1334:	76 ca                	jbe    1300 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    1336:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1339:	8b 40 04             	mov    0x4(%eax),%eax
    133c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    1343:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1346:	01 c2                	add    %eax,%edx
    1348:	8b 45 fc             	mov    -0x4(%ebp),%eax
    134b:	8b 00                	mov    (%eax),%eax
    134d:	39 c2                	cmp    %eax,%edx
    134f:	75 24                	jne    1375 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    1351:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1354:	8b 50 04             	mov    0x4(%eax),%edx
    1357:	8b 45 fc             	mov    -0x4(%ebp),%eax
    135a:	8b 00                	mov    (%eax),%eax
    135c:	8b 40 04             	mov    0x4(%eax),%eax
    135f:	01 c2                	add    %eax,%edx
    1361:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1364:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    1367:	8b 45 fc             	mov    -0x4(%ebp),%eax
    136a:	8b 00                	mov    (%eax),%eax
    136c:	8b 10                	mov    (%eax),%edx
    136e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1371:	89 10                	mov    %edx,(%eax)
    1373:	eb 0a                	jmp    137f <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    1375:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1378:	8b 10                	mov    (%eax),%edx
    137a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    137d:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    137f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1382:	8b 40 04             	mov    0x4(%eax),%eax
    1385:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    138c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    138f:	01 d0                	add    %edx,%eax
    1391:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1394:	75 20                	jne    13b6 <free+0xcf>
    p->s.size += bp->s.size;
    1396:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1399:	8b 50 04             	mov    0x4(%eax),%edx
    139c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    139f:	8b 40 04             	mov    0x4(%eax),%eax
    13a2:	01 c2                	add    %eax,%edx
    13a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    13a7:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    13aa:	8b 45 f8             	mov    -0x8(%ebp),%eax
    13ad:	8b 10                	mov    (%eax),%edx
    13af:	8b 45 fc             	mov    -0x4(%ebp),%eax
    13b2:	89 10                	mov    %edx,(%eax)
    13b4:	eb 08                	jmp    13be <free+0xd7>
  } else
    p->s.ptr = bp;
    13b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    13b9:	8b 55 f8             	mov    -0x8(%ebp),%edx
    13bc:	89 10                	mov    %edx,(%eax)
  freep = p;
    13be:	8b 45 fc             	mov    -0x4(%ebp),%eax
    13c1:	a3 0c 1b 00 00       	mov    %eax,0x1b0c
}
    13c6:	c9                   	leave  
    13c7:	c3                   	ret    

000013c8 <morecore>:

static Header*
morecore(uint nu)
{
    13c8:	55                   	push   %ebp
    13c9:	89 e5                	mov    %esp,%ebp
    13cb:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    13ce:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    13d5:	77 07                	ja     13de <morecore+0x16>
    nu = 4096;
    13d7:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    13de:	8b 45 08             	mov    0x8(%ebp),%eax
    13e1:	c1 e0 03             	shl    $0x3,%eax
    13e4:	89 04 24             	mov    %eax,(%esp)
    13e7:	e8 40 fc ff ff       	call   102c <sbrk>
    13ec:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    13ef:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    13f3:	75 07                	jne    13fc <morecore+0x34>
    return 0;
    13f5:	b8 00 00 00 00       	mov    $0x0,%eax
    13fa:	eb 22                	jmp    141e <morecore+0x56>
  hp = (Header*)p;
    13fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13ff:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    1402:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1405:	8b 55 08             	mov    0x8(%ebp),%edx
    1408:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    140b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    140e:	83 c0 08             	add    $0x8,%eax
    1411:	89 04 24             	mov    %eax,(%esp)
    1414:	e8 ce fe ff ff       	call   12e7 <free>
  return freep;
    1419:	a1 0c 1b 00 00       	mov    0x1b0c,%eax
}
    141e:	c9                   	leave  
    141f:	c3                   	ret    

00001420 <malloc>:

void*
malloc(uint nbytes)
{
    1420:	55                   	push   %ebp
    1421:	89 e5                	mov    %esp,%ebp
    1423:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1426:	8b 45 08             	mov    0x8(%ebp),%eax
    1429:	83 c0 07             	add    $0x7,%eax
    142c:	c1 e8 03             	shr    $0x3,%eax
    142f:	83 c0 01             	add    $0x1,%eax
    1432:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    1435:	a1 0c 1b 00 00       	mov    0x1b0c,%eax
    143a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    143d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1441:	75 23                	jne    1466 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    1443:	c7 45 f0 04 1b 00 00 	movl   $0x1b04,-0x10(%ebp)
    144a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    144d:	a3 0c 1b 00 00       	mov    %eax,0x1b0c
    1452:	a1 0c 1b 00 00       	mov    0x1b0c,%eax
    1457:	a3 04 1b 00 00       	mov    %eax,0x1b04
    base.s.size = 0;
    145c:	c7 05 08 1b 00 00 00 	movl   $0x0,0x1b08
    1463:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1466:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1469:	8b 00                	mov    (%eax),%eax
    146b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    146e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1471:	8b 40 04             	mov    0x4(%eax),%eax
    1474:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1477:	72 4d                	jb     14c6 <malloc+0xa6>
      if(p->s.size == nunits)
    1479:	8b 45 f4             	mov    -0xc(%ebp),%eax
    147c:	8b 40 04             	mov    0x4(%eax),%eax
    147f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1482:	75 0c                	jne    1490 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    1484:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1487:	8b 10                	mov    (%eax),%edx
    1489:	8b 45 f0             	mov    -0x10(%ebp),%eax
    148c:	89 10                	mov    %edx,(%eax)
    148e:	eb 26                	jmp    14b6 <malloc+0x96>
      else {
        p->s.size -= nunits;
    1490:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1493:	8b 40 04             	mov    0x4(%eax),%eax
    1496:	2b 45 ec             	sub    -0x14(%ebp),%eax
    1499:	89 c2                	mov    %eax,%edx
    149b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    149e:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    14a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14a4:	8b 40 04             	mov    0x4(%eax),%eax
    14a7:	c1 e0 03             	shl    $0x3,%eax
    14aa:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    14ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14b0:	8b 55 ec             	mov    -0x14(%ebp),%edx
    14b3:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    14b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    14b9:	a3 0c 1b 00 00       	mov    %eax,0x1b0c
      return (void*)(p + 1);
    14be:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14c1:	83 c0 08             	add    $0x8,%eax
    14c4:	eb 38                	jmp    14fe <malloc+0xde>
    }
    if(p == freep)
    14c6:	a1 0c 1b 00 00       	mov    0x1b0c,%eax
    14cb:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    14ce:	75 1b                	jne    14eb <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    14d0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    14d3:	89 04 24             	mov    %eax,(%esp)
    14d6:	e8 ed fe ff ff       	call   13c8 <morecore>
    14db:	89 45 f4             	mov    %eax,-0xc(%ebp)
    14de:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    14e2:	75 07                	jne    14eb <malloc+0xcb>
        return 0;
    14e4:	b8 00 00 00 00       	mov    $0x0,%eax
    14e9:	eb 13                	jmp    14fe <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    14eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14ee:	89 45 f0             	mov    %eax,-0x10(%ebp)
    14f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14f4:	8b 00                	mov    (%eax),%eax
    14f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    14f9:	e9 70 ff ff ff       	jmp    146e <malloc+0x4e>
}
    14fe:	c9                   	leave  
    14ff:	c3                   	ret    
