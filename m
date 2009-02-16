From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemleak tree with the kernel-doc
 tree
Date: Mon, 16 Feb 2009 16:12:00 +1100
Message-ID: <20090216161200.1352e939.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50660 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750812AbZBPFMG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Feb 2009 00:12:06 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, Randy Dunlap <randy.dunlap@oracle.com>

Hi Catalin,

Today's linux-next merge of the kmemleak tree got a conflict in
Documentation/kernel-parameters.txt between commit
f7e346e78be0c021495e9e21a0261903177aaecc ("docum-kernprms-alpha3") from
the kernel-doc tree and commit 3f4883f9b04c1b48effc7b3050b2f83ab8e056b9
("kmemleak: Add documentation on the memory leak detector") from the
kmemleak tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc Documentation/kernel-parameters.txt
index 9f574c7,f148662..0000000
--- a/Documentation/kernel-parameters.txt
+++ b/Documentation/kernel-parameters.txt
@@@ -1020,18 -1067,10 +1020,22 @@@ and is between 256 and 4096 characters
  			Configure the RouterBoard 532 series on-chip
  			Ethernet adapter MAC address.
  
+ 	kmemleak=	[KNL] Boot-time kmemleak enable/disable
+ 			Valid arguments: on, off
+ 			Default: on
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
 +	kstack=N	[X86-32,X86-64] Print N words from the kernel stack
 +			in oops dumps.
 +
  	l2cr=		[PPC]
  
  	l3cr=		[PPC]
