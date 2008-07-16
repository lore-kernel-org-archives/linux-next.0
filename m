From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the generic-ipi tree
Date: Wed, 16 Jul 2008 12:19:21 +0200
Message-ID: <20080716101921.GA16688@elte.hu>
References: <20080716194517.fc260962.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:43922 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753040AbYGPKTo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Jul 2008 06:19:44 -0400
Content-Disposition: inline
In-Reply-To: <20080716194517.fc260962.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <jens.axboe@oracle.com>, linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Jens, Ingo,
> 
> Today's linux-next merge of the generic-ipi tree got a conflict in
> arch/powerpc/Kconfig between commit
> 3affedc4e1ce837033b6c5e9289d2ce2f5a62d31 ("powerpc/dma: implement new
> dma_*map*_attrs() interfaces") and
> 7ff86b0317bc40c665aab62f3b7669713ade07c5 ("powerpc: Fix a build problem
> on ppc32 with new DMA_ATTRs") from the powerpc tree and commit
> 07d55acad88f25177559f81aec42179e00c50360 ("manual merge of generic-ipi")
> from the generic-ipi tree.
> 
> Some mixture of those and other commits.  I took a superset.  I guess 
> this will disappear tomorrow when things are more merged in Linus' 
> tree.

hm, generic-ipi is already in Linus's tree:

commit 59190f4213462f191fc0d22d39b1cf18ea39ca39
Merge: 64fd52a... f6f88e9...
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue Jul 15 14:02:33 2008 -0700

    Merge branch 'generic-ipi-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/linux-2.6-tip
    
    * 'generic-ipi-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/linux-2.6-tip: (22 commits)
    [...]

i hope i'll be able to update the auto-*-next branches soon - a lot of 
them got very empty ;-)

	Ingo
