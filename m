From: Darren Hart <dvhart@infradead.org>
Subject: Re: linux-next: manual merge of the drivers-x86 tree with Linus' tree
Date: Tue, 2 Jun 2015 20:27:50 -0700
Message-ID: <20150603032750.GA49670@vmdeb7>
References: <20150602160723.3b519d63@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:43826 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751481AbbFCD2B (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Jun 2015 23:28:01 -0400
Content-Disposition: inline
In-Reply-To: <20150602160723.3b519d63@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Philippe Coval <philippe.coval@open.eurogiciel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Tunin <hanipouspilot@gmail.com>

On Tue, Jun 02, 2015 at 04:07:23PM +1000, Stephen Rothwell wrote:
> Hi Darren,
> 
> Today's linux-next merge of the drivers-x86 tree got a conflict in
> drivers/platform/x86/ideapad-laptop.c between commit 9b071a43553d
> ("ideapad_laptop: Add Lenovo G40-30 to devices without radio switch")
> from Linus' tree and commit 4fa9dabcffc8 ("ideapad_laptop: Lenovo
> G50-30 fix rfkill reports wireless blocked") from the drivers-x86 tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thanks for the heads' up. This happens because my -next branch is based on *-rc1
as I think was recommended at the last kernel summit. Since rc1 I sent Linus the
G50-30, but by rc6 I didn't feel good about sending the similar G50-30 fix, so
that is in my rc1 branch.

I am happy to rebase my -next on rc6 to avoid the conflict, but I believe the
rebase is considered poor practice.

You said no action required, but if there is something I can do to avoid this
kind of manual effort on your part (and a manual merge by Linus in the upcoming
merge window), I'm happy to update my process to accommodate.

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
