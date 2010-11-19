From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: manual merge of the trivial tree with the  tree
Date: Fri, 19 Nov 2010 17:08:28 +0100 (CET)
Message-ID: <alpine.LNX.2.00.1011191708130.7420@pobox.suse.cz>
References: <20101109132725.2e17ae65.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:35222 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753925Ab0KSQIa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 19 Nov 2010 11:08:30 -0500
In-Reply-To: <20101109132725.2e17ae65.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, =?ISO-8859-15?Q?=22Uwe_Kleine-K=F6nig=22?= <u.kleine-koenig@pengutronix.de>, Mike Frysinger <vapier@gentoo.org>

On Tue, 9 Nov 2010, Stephen Rothwell wrote:

> Hi Jiri,
> 
> Today's linux-next merge of the trivial tree got a conflict in
> arch/blackfin/mach-bf538/include/mach/defBF539.h,
> arch/blackfin/mach-bf518/include/mach/defBF51x_base.h and
> arch/blackfin/mach-bf527/include/mach/defBF52x_base.h between various
> commits from the blackfin tree and commit
> b595076a180a56d1bb170e6eceda6eb9d76f4cd3 ("tree-wide: fix comment/printk
> typos") from the trivial tree.
> 
> I just used the versions from the blackfin tree for now since they moved
> large amounts of code around and deleted the latter 2 files.

I have reverted those hunks in my tree, so it should be conflict-less now.

Thanks,

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
