From: "Luis R. Rodriguez" <mcgrof@suse.com>
Subject: patch reverts on linux-next - ioremap_uc() for atyfb
Date: Tue, 28 Jul 2015 22:05:49 +0200
Message-ID: <20150728200549.GG30479@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:49047 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752209AbbG1UFw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Jul 2015 16:05:52 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: Borislav Petkov <bp@suse.de>, mingo@kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Fengguang Wu <fengguang.wu@intel.com>

Andrew,

I got a notice from Ingo on July 21 that one of my patches, "x86/mm,
asm-generic: Add IOMMU ioremap_uc() variant default" was merged into tip. It
was merged a long with other patches, for example:

http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/drivers/video/fbdev/aty/atyfb_base.c?id=3cc2dac5be3f23414a4efdee0b26d79bed297cac

I wrote this patch after Boris had my atyfb series bake on his tree
as his tree receives 0-day tests. Then this patch for example makes use of
ioremap_uc():

"drivers/video/fbdev/atyfb: Replace MTRR UC hole with strong UC"

I noticed though that on top there's a revert of that same patch:

http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/drivers/video/fbdev/aty/atyfb_base.c?id=4c090fb7209d523ef4cedb354192a190edd0d166

Revert "drivers/video/fbdev/atyfb: Replace MTRR UC hole with strong UC" akpm-base
This reverts commit 3cc2dac5be3f23414a4efdee0b26d79bed297cac.

It doesn't explain why this was reverted though. Is it OK for things be
reverted like this ? Is it understood by others ? It was a bit of a surprise to
me though as I was not able to verify things were going through to linux-next.
Since Boris was also on vacation and since my trees do not get 0-day-tests
it also meant I realied on the chain for issues to be found. I'll fix the
fact that my trees do not get 0-day tests but it seems we should probably
only put so many dev trees on 0-day test, I'll check with Fengguang Wu if
he has bandwidth to put some of my trees.

I was just not sure what was going on since although I got a notice from Ingo
the patch was merged into tip I did not happen to see it until *today* on
linux-next.

I guess because it also trickled through other test machines today Stephen
Rothwell found one issue with this patch for missing iorenmap_uc() calls for
architectures that do not include asm-generic/io.h. Since I got this report
today I sent a prompt follow up fix up as soon as I saw and understood the
report but the report did come with a delay as the patch was being reverted and
I hadn't gotten any notice of it being excluded from linux-next or why. It got
through today, but not sure why, and I think my patch fixes the issue.

What criteria is being used for patches to be reverted to your tree? Since
your tree gets merged to linux-next it means outbound users cannot test
the 'real' linux-next, but since we get no notification it unfortunatley
also means we can't know about the issues unless all dev trees are on
0-day testing which of course seems a bit overkill right now.

Sorry if I screwed up, just want to know what is proper here and if I need
to get my trees tested with 0-day bot I'll try to make arrangements with
Fengguang Wu if his machines have coverage.

  Luis
