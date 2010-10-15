From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sound-asoc tree with Linus' tree
Date: Fri, 15 Oct 2010 11:52:51 +1100
Message-ID: <20101015115251.015b08d5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39199 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753183Ab0JOAwz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 14 Oct 2010 20:52:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@slimlogic.co.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Timur Tabi <timur@freescale.com>, Kumar Gala <galak@kernel.crashing.org>

Hi all,

Today's linux-next merge of the sound-asoc tree got a conflict in
arch/powerpc/platforms/85xx/p1022_ds.c between commit
dc1c41f450a5f201f1d8c19aef32319f3b84c273 ("powerpc/85xx: Fix compile
issue with p1022_ds due to lmb rename to memblock") from Linus' tree and
commit 2c184cd393d1410bb43ac656a6480849fe886b1d ("powerpc/85xx: add DIU
support to the Freecale P1022DS reference board") from the sound-asoc
tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/powerpc/platforms/85xx/p1022_ds.c
index 2b390d1,e984d4e..0000000
--- a/arch/powerpc/platforms/85xx/p1022_ds.c
+++ b/arch/powerpc/platforms/85xx/p1022_ds.c
@@@ -19,8 -18,9 +18,9 @@@
  
  #include <linux/pci.h>
  #include <linux/of_platform.h>
 -#include <linux/lmb.h>
  #include <linux/memblock.h>
 +
+ #include <asm/div64.h>
  #include <asm/mpic.h>
  #include <asm/swiotlb.h>
  
