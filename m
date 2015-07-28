From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tip tree
Date: Tue, 28 Jul 2015 15:33:03 +1000
Message-ID: <20150728153303.2ba27786@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56650 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932074AbbG1FdG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Jul 2015 01:33:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Luis R. Rodriguez" <mcgrof@suse.com>

Hi all,

After merging the tip tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/video/fbdev/aty/atyfb_base.c: In function 'atyfb_setup_generic':
drivers/video/fbdev/aty/atyfb_base.c:3447:2: error: implicit declaration of function 'ioremap_uc' [-Werror=implicit-function-declaration]
  par->ati_regbase = ioremap_uc(info->fix.mmio_start, 0x1000);
  ^
drivers/video/fbdev/aty/atyfb_base.c:3447:19: warning: assignment makes pointer from integer without a cast
  par->ati_regbase = ioremap_uc(info->fix.mmio_start, 0x1000);
                   ^

Caused by commits

  3cc2dac5be3f ("drivers/video/fbdev/atyfb: Replace MTRR UC hole with strong UC")
  8c7ea50c010b ("x86/mm, asm-generic: Add IOMMU ioremap_uc() variant default")

The latter defines ioremap_uc() for x86 and those architectures that
use asm-generic/io.h - which is not all of them :-( .  The former commit
then uses ioremap_uc().

I have reverted commit 3cc2dac5be3f (and 7d89a3cb159a that follows it)
for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
