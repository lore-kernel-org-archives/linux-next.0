From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: manual merge of the akpm tree with the workqueues
 tree
Date: Wed, 13 Mar 2013 12:46:24 -0700
Message-ID: <20130313124624.1d51184d95d2c69c37daad0d@linux-foundation.org>
References: <20130313154905.59d00adb5b62d5169649aea0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:49590 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933226Ab3CMTq0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 13 Mar 2013 15:46:26 -0400
In-Reply-To: <20130313154905.59d00adb5b62d5169649aea0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>

On Wed, 13 Mar 2013 15:49:05 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the akpm tree got a conflict in
> kernel/workqueue.c between commit fa1b54e69bc6 ("workqueue: update
> synchronization rules on worker_pool_idr") from the workqueues tree and
> commit "workqueue: convert to idr_alloc()" from the akpm tree.
> 
> I fixed it up (I think - see below) and can carry the fix as necessary
> (no action is required).
> 

OK, thanks.  I have workqueue-convert-to-idr_alloc.patch queued for 3.9
so I moved it ahead of linux-next.patch and made a mess.

Tejun, can you please confirm that this is how worker_pool_assign_id()
should look in linux-next?


static int worker_pool_assign_id(struct worker_pool *pool)
{
	int ret;

	do {
		idr_preload(GFP_KERNEL);
		spin_lock_irq(&workqueue_lock);
		ret = idr_alloc(&worker_pool_idr, pool, 0, 0, GFP_NOWAIT);
		if (ret >= 0)
			pool->id = ret;
		spin_unlock_irq(&workqueue_lock);
	} while (ret == -EAGAIN);

	return ret < 0 ? ret : 0;
}
