From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arc tree with the arc-current tree
Date: Wed, 24 Feb 2016 09:05:46 +1100
Message-ID: <20160224090546.44ec25af@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35231 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755510AbcBWWFs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 23 Feb 2016 17:05:48 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Noam Camus <noamc@ezchip.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>

Hi Vineet,

Today's linux-next merge of the arc tree got a conflict in:

  arch/arc/Kconfig

between commit:

  3e5177c1919b ("arc: get rid of DEVTMPFS dependency on INITRAMFS_SOURCE")

from the arc-current tree and commit:

  38a39d18e7b4 ("ARC: clockevent: Prepare for DT based probe")

from the arc tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arc/Kconfig
index 8a188bc1786a,a37ab7dde4ba..000000000000
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@@ -10,8 -10,11 +10,9 @@@ config AR
  	def_bool y
  	select ARCH_SUPPORTS_ATOMIC_RMW if ARC_HAS_LLSC
  	select BUILDTIME_EXTABLE_SORT
- 	select COMMON_CLK
+ 	select CLKSRC_OF
  	select CLONE_BACKWARDS
+ 	select COMMON_CLK
 -	# ARC Busybox based initramfs absolutely relies on DEVTMPFS for /dev
 -	select DEVTMPFS if !INITRAMFS_SOURCE=""
  	select GENERIC_ATOMIC64
  	select GENERIC_CLOCKEVENTS
  	select GENERIC_FIND_FIRST_BIT
