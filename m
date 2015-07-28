From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: patch reverts on linux-next - ioremap_uc() for atyfb
Date: Tue, 28 Jul 2015 13:44:28 -0700
Message-ID: <20150728134428.a35aaa92c1b4d45606fa9aba@linux-foundation.org>
References: <20150728200549.GG30479@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:53621 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752658AbbG1Uo3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 28 Jul 2015 16:44:29 -0400
In-Reply-To: <20150728200549.GG30479@wotan.suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Luis R. Rodriguez" <mcgrof@suse.com>
Cc: Borislav Petkov <bp@suse.de>, mingo@kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Fengguang Wu <fengguang.wu@intel.com>

On Tue, 28 Jul 2015 22:05:49 +0200 "Luis R. Rodriguez" <mcgrof@suse.com> wrote:

> I got a notice from Ingo on July 21 that one of my patches, "x86/mm,
> asm-generic: Add IOMMU ioremap_uc() variant default" was merged into tip. It
> was merged a long with other patches, for example:
> 
> http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/drivers/video/fbdev/aty/atyfb_base.c?id=3cc2dac5be3f23414a4efdee0b26d79bed297cac
> 
> I wrote this patch after Boris had my atyfb series bake on his tree
> as his tree receives 0-day tests. Then this patch for example makes use of
> ioremap_uc():
> 
> "drivers/video/fbdev/atyfb: Replace MTRR UC hole with strong UC"
> 
> I noticed though that on top there's a revert of that same patch:
> 
> http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/drivers/video/fbdev/aty/atyfb_base.c?id=4c090fb7209d523ef4cedb354192a190edd0d166
> 
> Revert "drivers/video/fbdev/atyfb: Replace MTRR UC hole with strong UC" akpm-base
> This reverts commit 3cc2dac5be3f23414a4efdee0b26d79bed297cac.

Stephen did this while preparing the linux-next release.  Note that he
reverted it "for today".




Begin forwarded message:

Date: Tue, 28 Jul 2015 15:33:03 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Luis R. Rodriguez" <mcgrof@suse.com>
Subject: linux-next: build failure after merge of the tip tree


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
