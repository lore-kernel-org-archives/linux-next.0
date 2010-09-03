From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (powerpc
 related)
Date: Fri, 3 Sep 2010 13:24:10 +1000
Message-ID: <20100903132410.ede593ed.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44906 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755453Ab0ICDYN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 2 Sep 2010 23:24:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ian Munsie <imunsie@au1.ibm.com>

Hi all,

After merging the final tree, today's linux-next build
(powerpc64 allnoconfig) failed like this:

arch/powerpc/kernel/built-in.o: In function `.sys_call_table':
(.text+0x8d48): undefined reference to `.compat_sys_recv'

Caused by commit 86250b9d12caa1a3dee12a7cf638b7dd70eaadb6 ("powerpc: Wire
up direct socket system calls").

I have applied this patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 3 Sep 2010 13:19:04 +1000
Subject: [PATCH] powerpc: define a compat_sys_recv cond_syscall

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 kernel/sys_ni.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/kernel/sys_ni.c b/kernel/sys_ni.c
index bad369e..c782fe9 100644
--- a/kernel/sys_ni.c
+++ b/kernel/sys_ni.c
@@ -50,6 +50,7 @@ cond_syscall(compat_sys_sendmsg);
 cond_syscall(sys_recvmsg);
 cond_syscall(sys_recvmmsg);
 cond_syscall(compat_sys_recvmsg);
+cond_syscall(compat_sys_recv);
 cond_syscall(compat_sys_recvfrom);
 cond_syscall(compat_sys_recvmmsg);
 cond_syscall(sys_socketcall);
-- 
1.7.1


-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
