From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the iommu tree with the kernel-doc tree
Date: Thu, 19 Mar 2009 18:57:32 +1100
Message-ID: <20090319185732.b8cc98a8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48600 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751165AbZCSH5g (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Mar 2009 03:57:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Joerg Roedel <joerg.roedel@amd.com>, Randy Dunlap <randy.dunlap@oracle.com>

Hi Ingo,

Today's linux-next merge of the iommu tree got a conflict in
Documentation/kernel-parameters.txt between commit
8e141e0b33e2fd17540881a1ead5103dd229bf81 ("docum-kernprms-alpha3") from
the kernel-doc tree and commit 59d3daafa17265f01149df8eab3fb69b9b42cb2e
("dma-debug: add kernel command line parameters") from the iommu tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc Documentation/kernel-parameters.txt
index 114e162,0fa3c05..0000000
--- a/Documentation/kernel-parameters.txt
+++ b/Documentation/kernel-parameters.txt
@@@ -608,12 -684,8 +608,22 @@@ and is between 256 and 4096 characters
  			MTRR settings.  This parameter disables that behavior,
  			possibly causing your machine to run very slowly.
  
 +	disable_timer_pin_1 [i386,x86-64]
 +			Disable PIN 1 of APIC timer
 +			Can be useful to work around chipset bugs.
 +
  	dmasound=	[HW,OSS] Sound subsystem buffers
  
++	dma_debug=off	If the kernel is compiled with DMA_API_DEBUG support
++			this option disables the debugging code at boot.
++
++	dma_debug_entries=<number>
++			This option allows to tune the number of preallocated
++			entries for DMA-API debugging code. One entry is
++			required per DMA-API allocation. Use this if the
++			DMA-API debugging code disables itself because the
++			architectural default is too low.
++
  	dscc4.setup=	[NET]
  
  	dtc3181e=	[HW,SCSI]
