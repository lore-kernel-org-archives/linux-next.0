From: "Luis R. Rodriguez" <mcgrof@suse.com>
Subject: Re: patch reverts on linux-next - ioremap_uc() for atyfb
Date: Thu, 6 Aug 2015 01:25:41 +0200
Message-ID: <20150805232541.GL30479@wotan.suse.de>
References: <20150728200549.GG30479@wotan.suse.de>
 <20150728134428.a35aaa92c1b4d45606fa9aba@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:36422 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751867AbbHEXZm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 5 Aug 2015 19:25:42 -0400
Content-Disposition: inline
In-Reply-To: <20150728134428.a35aaa92c1b4d45606fa9aba@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Borislav Petkov <bp@suse.de>, mingo@kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Fengguang Wu <fengguang.wu@intel.com>

On Tue, Jul 28, 2015 at 01:44:28PM -0700, Andrew Morton wrote:
> On Tue, 28 Jul 2015 22:05:49 +0200 "Luis R. Rodriguez" <mcgrof@suse.com> wrote:
> 
> > I got a notice from Ingo on July 21 that one of my patches, "x86/mm,
> > asm-generic: Add IOMMU ioremap_uc() variant default" was merged into tip. It
> > was merged a long with other patches, for example:
> > 
> > http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/drivers/video/fbdev/aty/atyfb_base.c?id=3cc2dac5be3f23414a4efdee0b26d79bed297cac
> > 
> > I wrote this patch after Boris had my atyfb series bake on his tree
> > as his tree receives 0-day tests. Then this patch for example makes use of
> > ioremap_uc():
> > 
> > "drivers/video/fbdev/atyfb: Replace MTRR UC hole with strong UC"
> > 
> > I noticed though that on top there's a revert of that same patch:
> > 
> > http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/drivers/video/fbdev/aty/atyfb_base.c?id=4c090fb7209d523ef4cedb354192a190edd0d166
> > 
> > Revert "drivers/video/fbdev/atyfb: Replace MTRR UC hole with strong UC" akpm-base
> > This reverts commit 3cc2dac5be3f23414a4efdee0b26d79bed297cac.
> 
> Stephen did this while preparing the linux-next release.  Note that he
> reverted it "for today".

Sorry for the noise folks... I'll be testing all my patches moving forward
behidn the 0-day bot prior to posting.

 Luis
