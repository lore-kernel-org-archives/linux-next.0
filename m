From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with Linus' tree
Date: Mon, 15 Aug 2011 14:52:51 +1000
Message-ID: <20110815145251.d7c8089b567687d0da59e2dc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54579 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751634Ab1HOEw5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Aug 2011 00:52:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@mit.edu>, Christopher Yeoh <cyeoh@au1.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in
arch/x86/include/asm/unistd_64.h between commit fce8dc06423d ("x86-64:
Wire up getcpu syscall") from Linus' tree and commit  ("Add x86_64
specific wire up") from the akpm tree.

I have fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --git a/arch/x86/include/asm/unistd_64.h b/arch/x86/include/asm/unistd_64.h
index d92641c..f9fff6a 100644
--- a/arch/x86/include/asm/unistd_64.h
+++ b/arch/x86/include/asm/unistd_64.h
@@ -683,6 +683,10 @@ __SYSCALL(__NR_sendmmsg, sys_sendmmsg)
 __SYSCALL(__NR_setns, sys_setns)
 #define __NR_getcpu				309
 __SYSCALL(__NR_getcpu, sys_getcpu)
+#define __NR_process_vm_readv			310
+__SYSCALL(__NR_process_vm_readv, sys_process_vm_readv)
+#define __NR_process_vm_writev			311
+__SYSCALL(__NR_process_vm_writev, sys_process_vm_writev)
 
 #ifndef __NO_STUBS
 #define __ARCH_WANT_OLD_READDIR
