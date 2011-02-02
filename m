From: David Brown <davidb@codeaurora.org>
Subject: Re: linux-next: manual merge of the msm tree with the arm tree
Date: Wed, 02 Feb 2011 10:29:14 -0800
Message-ID: <8ya4o8m70jp.fsf@huya.qualcomm.com>
References: <20110131131401.5d6c7646.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251]:61061 "EHLO
	wolverine02.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754852Ab1BBS3O (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Feb 2011 13:29:14 -0500
In-Reply-To: <20110131131401.5d6c7646.sfr@canb.auug.org.au> (Stephen
	Rothwell's message of "Mon, 31 Jan 2011 13:14:01 +1100")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>, Stepan Moskovchenko <stepanm@codeaurora.org>

On Sun, Jan 30 2011, Stephen Rothwell wrote:

> Hi David,
>
> Today's linux-next merge of the msm tree got conflicts in
> arch/arm/mach-msm/board-msm7x27.c, arch/arm/mach-msm/board-msm7x30.c,
> arch/arm/mach-msm/board-qsd8x50.c and arch/arm/mach-msm/board-sapphire.c
> between commit eda53d6d032effb653410b79e1b49e652a881744 ("ARM: P2V: avoid
> initializers and assembly using PHYS_OFFSET") from the arm tree and
> commit 07a3cc4814f790354d4c7be2c9dc6143a714a07a ("msm: Clean up useless
> ifdefs") from the msm tree.
>
> I fixed it up (see below) and can carry the fix as necessary.

What is the best way to resolve this?  I can't really merge against
Russell's tree, since he may need to rebase his tree before the merge
window?  Or is it best to just have you carry the conflict resolution in
linux-next, and I make the resolution during the next merge window?

Thanks,
David

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
