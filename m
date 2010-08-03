From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Tue, 3 Aug 2010 10:26:55 +0200
Message-ID: <20100803082655.GA13029@lst.de>
References: <20100803131202.422af85f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.210]:45981 "EHLO verein.lst.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752651Ab0HCI1I (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 3 Aug 2010 04:27:08 -0400
Content-Disposition: inline
In-Reply-To: <20100803131202.422af85f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Yehuda Sadeh <yehuda@hq.newdream.net>, Sage Weil <sage@newdream.net>

On Tue, Aug 03, 2010 at 01:12:02PM +1000, Stephen Rothwell wrote:
> I applied the following merge fix patch (Christoph, I assume that this
> should be directly applicable to the ceph tree, right?):

Yes, it looks good.

> -		if (!blk_fs_request(rq) && !blk_barrier_rq(rq)) {
> +		if ((rq->cmd_type != REQ_TYPE_FS) &&
> +		    !(rq->cmd_flags & REQ_HARDBARRIER)) {
>  			__blk_end_request_all(rq, 0);
>  			goto next;

Although these days barriers are REQ_TYPE_FS anyway, so the second check
is superflous.
