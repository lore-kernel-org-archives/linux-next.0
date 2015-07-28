From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Date: Tue, 28 Jul 2015 16:00:15 +1000
Message-ID: <20150728160015.142f588f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, Eric B Munson <emunson@akamai.com>, Andrea Arcangeli <aarcange@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/x86/entry/syscalls/syscall_32.tbl

between commit:

  9dea5dc921b5 ("x86/entry/syscalls: Wire up 32-bit direct socket calls")

from the tip tree and commit:

  0a36ab281187 ("userfaultfd: activate syscall")
  f721d9f04de4 ("mm: mlock: add new mlock, munlock, and munlockall system calls")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/x86/entry/syscalls/syscall_32.tbl
index 25e3cf1cd8fd,d68b13925aa4..000000000000
--- a/arch/x86/entry/syscalls/syscall_32.tbl
+++ b/arch/x86/entry/syscalls/syscall_32.tbl
@@@ -365,18 -365,7 +365,22 @@@
  356	i386	memfd_create		sys_memfd_create
  357	i386	bpf			sys_bpf
  358	i386	execveat		sys_execveat			stub32_execveat
 -359	i386	userfaultfd		sys_userfaultfd
 -360	i386	mlock2			sys_mlock2
 -361	i386	munlock2		sys_munlock2
 -362	i386	munlockall2		sys_munlockall2
 +359	i386	socket			sys_socket
 +360	i386	socketpair		sys_socketpair
 +361	i386	bind			sys_bind
 +362	i386	connect			sys_connect
 +363	i386	listen			sys_listen
 +364	i386	accept4			sys_accept4
 +365	i386	getsockopt		sys_getsockopt			compat_sys_getsockopt
 +366	i386	setsockopt		sys_setsockopt			compat_sys_setsockopt
 +367	i386	getsockname		sys_getsockname
 +368	i386	getpeername		sys_getpeername
 +369	i386	sendto			sys_sendto
 +370	i386	sendmsg			sys_sendmsg			compat_sys_sendmsg
 +371	i386	recvfrom		sys_recvfrom			compat_sys_recvfrom
 +372	i386	recvmsg			sys_recvmsg			compat_sys_recvmsg
 +373	i386	shutdown		sys_shutdown
++374	i386	userfaultfd		sys_userfaultfd
++375	i386	mlock2			sys_mlock2
++376	i386	munlock2		sys_munlock2
++377	i386	munlockall2		sys_munlockall2
