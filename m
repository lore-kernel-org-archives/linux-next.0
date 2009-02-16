From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kernel-doc tree with the ftrace
 tree
Date: Mon, 16 Feb 2009 11:42:23 +1100
Message-ID: <20090216114223.818b16f5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46570 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752087AbZBPAma (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 15 Feb 2009 19:42:30 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: linux-next@vger.kernel.org, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Pekka Enberg <penberg@cs.helsinki.fi>

Hi Randy,

Today's linux-next merge of the kernel-doc tree got a conflict in
Documentation/kernel-parameters.txt between commit
b9ce08c01020eb28bfbfa6faf1c740281c5f418e ("kmemtrace: Core
implementation") from the ftrace tree and commit
f7e346e78be0c021495e9e21a0261903177aaecc ("docum-kernprms-alpha3") from
the kernel-doc tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc Documentation/kernel-parameters.txt
index 6d52acf,0725b91..0000000
--- a/Documentation/kernel-parameters.txt
+++ b/Documentation/kernel-parameters.txt
@@@ -1049,27 -995,15 +999,24 @@@ and is between 256 and 4096 characters
  			use the HighMem zone if it exists, and the Normal
  			zone if it does not.
  
+ 	kgdboc=		[HW] kgdb over consoles.
+ 			Requires a tty driver that supports console polling.
+ 			(only serial suported for now)
+ 			Format: <serial_device>[,baud]
+ 
+ 	kmac=		[MIPS] korina ethernet MAC address.
+ 			Configure the RouterBoard 532 series on-chip
+ 			Ethernet adapter MAC address.
+ 
 +	kmemtrace.enable=	[KNL,KMEMTRACE] Format: { yes | no }
 +				Controls whether kmemtrace is enabled
 +				at boot-time.
 +
 +	kmemtrace.subbufs=n	[KNL,KMEMTRACE] Overrides the number of
 +			subbufs kmemtrace's relay channel has. Set this
 +			higher than default (KMEMTRACE_N_SUBBUFS in code) if
 +			you experience buffer overruns.
 +
- 	movablecore=nn[KMG]	[KNL,X86-32,IA-64,PPC,X86-64] This parameter
- 			is similar to kernelcore except it specifies the
- 			amount of memory used for migratable allocations.
- 			If both kernelcore and movablecore is specified,
- 			then kernelcore will be at *least* the specified
- 			value but may be more. If movablecore on its own
- 			is specified, the administrator must be careful
- 			that the amount of memory usable for all allocations
- 			is not too small.
- 
- 	keepinitrd	[HW,ARM]
- 
  	kstack=N	[X86-32,X86-64] Print N words from the kernel stack
  			in oops dumps.
  
