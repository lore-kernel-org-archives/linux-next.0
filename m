From: Fengguang Wu <fengguang.wu@intel.com>
Subject: Re: patch reverts on linux-next - ioremap_uc() for atyfb
Date: Wed, 29 Jul 2015 08:59:18 +0800
Message-ID: <20150729005918.GB23184@wfg-t540p.sh.intel.com>
References: <20150728200549.GG30479@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:22683 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751817AbbG2BAH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Jul 2015 21:00:07 -0400
Content-Disposition: inline
In-Reply-To: <20150728200549.GG30479@wotan.suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Luis R. Rodriguez" <mcgrof@suse.com>
Cc: akpm@linux-foundation.org, Borislav Petkov <bp@suse.de>, mingo@kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

HI Luis,

On Tue, Jul 28, 2015 at 10:05:49PM +0200, Luis R. Rodriguez wrote:
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
> reverted like this ? Is it understood by others ? It was a bit of a surprise to
> me though as I was not able to verify things were going through to linux-next.
> Since Boris was also on vacation and since my trees do not get 0-day-tests
> it also meant I realied on the chain for issues to be found. I'll fix the
> fact that my trees do not get 0-day tests but it seems we should probably
> only put so many dev trees on 0-day test, I'll check with Fengguang Wu if
> he has bandwidth to put some of my trees.

Would you tell me your git URL? I'm always seeking to add more dev
trees to the 0-day test pool. Bandwidth is not a problem you need to
worry.

Thanks,
Fengguang
