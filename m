From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the i2c tree
Date: Mon, 29 Jan 2018 14:41:14 +1100
Message-ID: <20180129144114.2580e099@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60821 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750771AbeA2DlY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 28 Jan 2018 22:41:24 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Wolfram Sang <wsa@the-dreams.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Gregory CLEMENT <gregory.clement@free-electrons.com>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  MAINTAINERS

between commit:

  e38c85644e11 ("i2c: mv64xxx: Add myself as maintainer for this driver")

from the i2c tree and commit:

  8a95b74d5082 ("x86: Mark hpa as a "Designated Reviewer" for the time being")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index 0df7565ff14e,c2ed8dc7cb42..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -6641,22 -6624,6 +6648,12 @@@ L:	linux-i2c@vger.kernel.or
  S:	Maintained
  F:	drivers/i2c/i2c-stub.c
  
 +I2C MV64XXX MARVELL AND ALLWINNER DRIVER
 +M:	Gregory CLEMENT <gregory.clement@free-electrons.com>
 +L:	linux-i2c@vger.kernel.org
 +S:	Maintained
 +F:	drivers/i2c/busses/i2c-mv64xxx.c
 +
- i386 BOOT CODE
- M:	"H. Peter Anvin" <hpa@zytor.com>
- S:	Maintained
- F:	arch/x86/boot/
- 
- i386 SETUP CODE / CPU ERRATA WORKAROUNDS
- M:	"H. Peter Anvin" <hpa@zytor.com>
- T:	git git://git.kernel.org/pub/scm/linux/kernel/git/hpa/linux-2.6-x86setup.git
- S:	Maintained
- 
  IA64 (Itanium) PLATFORM
  M:	Tony Luck <tony.luck@intel.com>
  M:	Fenghua Yu <fenghua.yu@intel.com>
