From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: manual merge of the block tree with the  tree
Date: Mon, 18 May 2009 08:27:47 +0200
Message-ID: <20090518062747.GF4140@kernel.dk>
References: <20090518145318.c199842e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from brick.kernel.dk ([93.163.65.50]:48315 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751700AbZERG1r (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 May 2009 02:27:47 -0400
Content-Disposition: inline
In-Reply-To: <20090518145318.c199842e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, Hannes Reinecke <hare@suse.de>, Tejun Heo <tj@kernel.org>

On Mon, May 18 2009, Stephen Rothwell wrote:
> Hi Jens, Rusty,
> 
> Today's linux-next merge of the block tree got a conflict in
> drivers/block/virtio_blk.c between commit
> fb8df56d3255396ff144a5f359f711e516e7d7b1 ("virtio_blk: SG_IO passthru
> support") from the rr tree and commit
> 40cbbb781d3eba5d6ac0860db078af490e5c7c6b ("block: implement and use [__]
> blk_end_request_all()") from the block tree.
> 
> I have no idea what the correct solution is here, so I used the version
> from the block tree for today.

Rusty, perhaps it would be easier if I took the SG_IO patch through the
block tree?

-- 
Jens Axboe
