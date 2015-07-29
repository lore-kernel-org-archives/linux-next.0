From: Ingo Molnar <mingo@kernel.org>
Subject: Re: patch reverts on linux-next - ioremap_uc() for atyfb
Date: Wed, 29 Jul 2015 10:05:18 +0200
Message-ID: <20150729080518.GA9277@gmail.com>
References: <20150728200549.GG30479@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:33299 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752253AbbG2IFX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 Jul 2015 04:05:23 -0400
Received: by wicmv11 with SMTP id mv11so208176274wic.0
        for <linux-next@vger.kernel.org>; Wed, 29 Jul 2015 01:05:22 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150728200549.GG30479@wotan.suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Luis R. Rodriguez" <mcgrof@suse.com>
Cc: akpm@linux-foundation.org, Borislav Petkov <bp@suse.de>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Fengguang Wu <fengguang.wu@intel.com>


* Luis R. Rodriguez <mcgrof@suse.com> wrote:

> Andrew,
> 
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
> 
> It doesn't explain why this was reverted though. Is it OK for things be
> reverted like this ?

The revert Stephen has done were only temporary, done for the throw-away 
linux-next integration branch, to make sure linux-next builds on the architectures 
your patch broke.

I've applied your fix to -tip, and after some testing will push it out to 
linux-next - at that point the temporary reverts will not be needed in linux-next 
anymore and will be dropped. They won't ever go upstream.

Thanks,

	Ingo
