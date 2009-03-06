From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kernel-doc tree with the tracing
 and timers trees
Date: Fri, 6 Mar 2009 13:21:04 +1100
Message-ID: <20090306132104.16a0af9d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37680 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751258AbZCFCVK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Mar 2009 21:21:10 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: linux-next@vger.kernel.org, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Pekka Enberg <penberg@cs.helsinki.fi>

Hi Randy,

Today's linux-next merge of the kernel-doc tree got a conflict in
Documentation/kernel-parameters.txt between commits
b9ce08c01020eb28bfbfa6faf1c740281c5f418e ("kmemtrace: Core
implementation") fron the tracing tree and
b98103a5597b87211a1c74077b06faeac554bedc ("x86: hpet: print HPET
registers during setup (if hpet=verbose is used)") from the timers tree
and commit 8e141e0b33e2fd17540881a1ead5103dd229bf81
("docum-kernprms-alpha3") from the kernel-doc tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc Documentation/kernel-parameters.txt
index 2475fb1,0725b91..0000000
--- a/Documentation/kernel-parameters.txt
+++ b/Documentation/kernel-parameters.txt
@@@ -814,6 -764,14 +768,16 @@@ and is between 256 and 4096 characters
  	hisax=		[HW,ISDN]
  			See Documentation/isdn/README.HiSax.
  
+ 	hlt		[BUGS=ARM,SH]
+ 
+ 	hpet=		[X86-32,HPET] option to control HPET usage
 -			Format: { enable (default) | disable | force }
++			Format: { enable (default) | disable | force |
++				verbose }
+ 			disable: disable HPET and use PIT instead
+ 			force: allow force enabled of undocumented chips (ICH4,
+ 			VIA, nVidia)
++			verbose: show contents of HPET registers during setup
+ 
  	hugepages=	[HW,X86-32,IA-64] HugeTLB pages to allocate at boot.
  	hugepagesz=	[HW,IA-64,PPC,X86-64] The size of the HugeTLB pages.
  			On x86-64 and powerpc, this option can be specified
@@@ -1056,27 -995,15 +1006,24 @@@
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
  
