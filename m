From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: manual merge of the block tree with the  tree
Date: Mon, 18 May 2009 14:42:32 +0200
Message-ID: <20090518124232.GJ4140@kernel.dk>
References: <20090518145318.c199842e.sfr@canb.auug.org.au> <20090518062747.GF4140@kernel.dk> <200905182204.54512.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from brick.kernel.dk ([93.163.65.50]:59482 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752230AbZERMmb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 May 2009 08:42:31 -0400
Content-Disposition: inline
In-Reply-To: <200905182204.54512.rusty@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Hannes Reinecke <hare@suse.de>, Tejun Heo <tj@kernel.org>

On Mon, May 18 2009, Rusty Russell wrote:
> On Mon, 18 May 2009 03:57:47 pm Jens Axboe wrote:
> > On Mon, May 18 2009, Stephen Rothwell wrote:
> > Rusty, perhaps it would be easier if I took the SG_IO patch through the
> > block tree?
> 
> Thanks; they're orthogonal to the rest of my changes anyway.
> 
> Here are the two patches (first one is a prereq).  I've attached them, or you 
> can grab them out of linux-next or my patchqueue.

I've massaged them into the block tree now.

-- 
Jens Axboe
