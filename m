From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: linux-next: build failure after merge of the wireless-drivers-next tree
Date: Fri, 19 Feb 2016 10:08:00 +0200
Message-ID: <87y4ahp1gf.fsf@kamboji.qca.qualcomm.com>
References: <20160219101035.44c84f2b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:50047 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1422756AbcBSIIH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 19 Feb 2016 03:08:07 -0500
In-Reply-To: <20160219101035.44c84f2b@canb.auug.org.au> (Stephen Rothwell's
	message of "Fri, 19 Feb 2016 10:10:35 +1100")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> After merging the wireless-drivers-next tree, today's linux-next build
> failed the same way as the net-next tree did yesterday (suprise! :-)).
>
> I have used the version from next-20160218 for today.

Yeah, not a surprise as yesterday I fast forwarded wireless-drivers-next
to current net-next (at the time). I understood from the discussion in
the other thread that this commit should fix it:

376471a7b6e9 bnx2x: Add missing HSI for big-endian machines

I now fast forwarded wireless-next-next again and it contains the commit
so everything should be ok again, I hope :) If not, please let me know.

-- 
Kalle Valo
