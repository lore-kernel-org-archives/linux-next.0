From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the limits tree with Linus' tree
Date: Mon, 14 Dec 2009 14:39:17 +1100
Message-ID: <20091214143917.f5b90e15.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754285AbZLNDjZ@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Slaby <jirislaby@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Neil Horman <nhorman@tuxdriver.com>
List-Id: linux-next.vger.kernel.org

Hi Jiri,

Today's linux-next merge of the limits tree got a conflict in
include/asm-generic/unistd.h between commits
9ab87644393d789b950ba984fa360f45c4df02e5 ("asm-generic: add sys_accept4
to unistd.h") and 3d7703870633dd454f6554e6d8d7f70441d0fd2d ("asm-generic:
add sys_recvmmsg to unistd.h") from Linus' tree and commit
cf8b57cd6af6ccbb8f6de90e677b1e5aca99c472 ("unistd: add __NR_[get|set]
prlimit syscall numbers") from the limits tree.

I fixed it up (see below) and can carry the fix for a while.  Jiri, you
should fix this by doing a merge of Linus' tree before asking him to pull
yours.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/asm-generic/unistd.h
index 6a0b30f,950587d..0000000
--- a/include/asm-generic/unistd.h
+++ b/include/asm-generic/unistd.h
@@@ -622,13 -622,13 +622,17 @@@ __SYSCALL(__NR_move_pages, sys_move_pag
  __SYSCALL(__NR_rt_tgsigqueueinfo, sys_rt_tgsigqueueinfo)
  #define __NR_perf_event_open 241
  __SYSCALL(__NR_perf_event_open, sys_perf_event_open)
 -#define __NR_getprlimit 242
 +#define __NR_accept4 242
 +__SYSCALL(__NR_accept4, sys_accept4)
 +#define __NR_recvmmsg 243
 +__SYSCALL(__NR_recvmmsg, sys_recvmmsg)
++#define __NR_getprlimit 244
+ __SYSCALL(__NR_getprlimit, sys_getprlimit)
 -#define __NR_setprlimit 243
++#define __NR_setprlimit 245
+ __SYSCALL(__NR_setprlimit, sys_setprlimit)
  
  #undef __NR_syscalls
--#define __NR_syscalls 244
++#define __NR_syscalls 246
  
  /*
   * All syscalls below here should go away really,
