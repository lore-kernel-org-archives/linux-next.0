From: "John W. Linville" <linville@tuxdriver.com>
Subject: Re: linux-next: manual merge of the wireless tree with Linus' tree
Date: Tue, 20 Sep 2011 08:55:16 -0400
Message-ID: <20110920125516.GA7800@tuxdriver.com>
References: <20110920132814.16d957ac9ddccb2e47ece1c2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from charlotte.tuxdriver.com ([70.61.120.58]:53965 "EHLO
	smtp.tuxdriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751338Ab1ITNAi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 20 Sep 2011 09:00:38 -0400
Content-Disposition: inline
In-Reply-To: <20110920132814.16d957ac9ddccb2e47ece1c2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Luciano Coelho <coelho@ti.com>

On Tue, Sep 20, 2011 at 01:28:14PM +1000, Stephen Rothwell wrote:
> Hi John,
> 
> Today's linux-next merge of the wireless tree got a conflict in
> drivers/net/wireless/wl12xx/main.c between commit 7a5e4877c14d ("wl12xx:
> add max_sched_scan_ssids value to the hw description") from Linus' tree
> and commit 221737d24f88 ("wl12xx: increase number of allowed SSIDs in
> sched_scan") from the wireless tree.
> 
> I fixed it up (I used the wireless tree version) and can carry the fix as
> necessary.
> 
> John, maybe you could merge the wireless-current tree (or the part of it
> that has already been merged into Linus' tree) into the wireless tree and
> fix these merge issues.

Yes, I will -- I'm trying to get resynced w/ Dave...

-- 
John W. Linville		Someday the world will need a hero, and you
linville@tuxdriver.com			might be all we have.  Be ready.
