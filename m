From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: block/rcu merge build failure
Date: Fri, 13 Jun 2008 09:18:04 +0200
Message-ID: <20080613071803.GT20851@kernel.dk>
References: <20080613171351.9ad7e1df.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from brick.kernel.dk ([87.55.233.238]:21425 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753726AbYFMHSG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 13 Jun 2008 03:18:06 -0400
Content-Disposition: inline
In-Reply-To: <20080613171351.9ad7e1df.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Fri, Jun 13 2008, Stephen Rothwell wrote:
> Hi Jens,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> kernel/smp.c: In function 'generic_smp_call_function_interrupt':
> kernel/smp.c:106: error: implicit declaration of function 'list_for_each_entry_rcu'
> 
> This is caused by the merge of the rcu tree (contained in sched tree)
> with the block tree.  I have applied the following patch which I will
> carry as part of the block tree merge commit.

That patch is fine, I guess there's an rcu include splitup patch in
-next which clashes with this a bit. Thanks Stephen.

-- 
Jens Axboe

