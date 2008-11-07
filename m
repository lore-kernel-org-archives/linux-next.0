From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: manual merge of the block tree
Date: Fri, 7 Nov 2008 10:50:08 +0100
Message-ID: <20081107095007.GM21867@kernel.dk>
References: <20081107171005.31e2a08d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:33446 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751474AbYKGJvf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 7 Nov 2008 04:51:35 -0500
Content-Disposition: inline
In-Reply-To: <20081107171005.31e2a08d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Tejun Heo <tj@kernel.org>, Arnaldo Carvalho de Melo <acme@redhat.com>

On Fri, Nov 07 2008, Stephen Rothwell wrote:
> Hi Jens,
> 
> Today's linux-next merge of the block tree got a conflict in
> block/elevator.c between commit 2920ebbd65f3e80c318adf5191ac0987142bda80
> ("block: add timer on blkdev_dequeue_request() not elv_next_request()")
> from Linus' tree and commit 8b3806453dd25d15a7ca7d537124af14ba8546bc
> ("blktrace: port to tracepoints") from the block tree.
> 
> Just a context change.  I fixed it up (see below) and assume it will be
> fixed in your tree soon.

Both of these merge errors will go away very shortly, since I'll rebase
for-next on master again due to the recent merge.

-- 
Jens Axboe
