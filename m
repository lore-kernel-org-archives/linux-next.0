From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rtc tree with the tip tree
Date: Mon, 18 Jul 2016 17:55:46 +1000
Message-ID: <20160718175546.79c66373@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35887 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751531AbcGRHzt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Jul 2016 03:55:49 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Paul Gortmaker <paul.gortmaker@windriver.com>

Hi Alexandre,

Today's linux-next merge of the rtc tree got a conflict in:

  arch/x86/platform/efi/efi_64.c

between commit:

  cc3ae7b0af27 ("x86/platform: Audit and remove any unnecessary uses of module.h")

from the tip tree and commit:

  5ab788d73832 ("rtc: cmos: move mc146818rtc code out of asm-generic/rtc.h")

from the rtc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/x86/platform/efi/efi_64.c
index 04db6fbce96d,663c282801f3..000000000000
--- a/arch/x86/platform/efi/efi_64.c
+++ b/arch/x86/platform/efi/efi_64.c
@@@ -24,7 -24,8 +24,8 @@@
  #include <linux/spinlock.h>
  #include <linux/bootmem.h>
  #include <linux/ioport.h>
 -#include <linux/module.h>
 +#include <linux/init.h>
+ #include <linux/mc146818rtc.h>
  #include <linux/efi.h>
  #include <linux/uaccess.h>
  #include <linux/io.h>
