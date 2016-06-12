From: Xiong Zhou <xzhou@redhat.com>
Subject: Re: [PATCH] Fix reported kmemleak
Date: Sun, 12 Jun 2016 18:29:02 +0800
Message-ID: <20160612102902.GA16418@dhcp12-144.nay.redhat.com>
References: <1465316612-9649-1-git-send-email-shaun@tancheff.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:54974 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751420AbcFLK3K (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 12 Jun 2016 06:29:10 -0400
Content-Disposition: inline
In-Reply-To: <1465316612-9649-1-git-send-email-shaun@tancheff.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shaun Tancheff <shaun@tancheff.com>
Cc: linux-block@vger.kernel.org, Christoph Hellwig <hch@lst.de>, axboe@kernel.dk, David Drysdale <drysdale@google.com>, Xiong Zhou <xzhou@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-nvdimm@ml01.01.org, Larry Finger <Larry.Finger@lwfinger.net>, Catalin Marinas <catalin.marinas@arm.com>, LKML <linux-kernel@vger.kernel.org>, Jens Axboe <axboe@fb.com>, bart.vanassche@sandisk.com

Hi,

On Tue, Jun 07, 2016 at 11:23:30AM -0500, Shaun Tancheff wrote:
> This fixes a memory leak reported by a few people in 4.7-rc1
> 
> kmemleak report after 9082e87bfbf8 ("block: remove struct bio_batch")
> 
> This patch just formalizes the one in this discussion here:
> https://lkml.kernel.org/r/20160606112620.GA29910@e104818-lin.cambridge.arm.com
> 
> The same issue appears here:
> https://lkml.kernel.org/r/20160607102651.GA6480@dhcp12-144.nay.redhat.com
> 
> Patch is also available at:
> 
> https://github.com/stancheff/linux.git
> branch: v4.7-rc2+bio_put
> 
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: axboe@kernel.dk
> cc: David Drysdale <drysdale@google.com>
> Cc: Xiong Zhou <xzhou@redhat.com>

Thanks for the information!

> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: linux-next@vger.kernel.org
> Cc: linux-nvdimm@ml01.01.org
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Larry Finger <Larry.Finger@lwfinger.net>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: LKML <linux-kernel@vger.kernel.org>,
> Cc: Jens Axboe <axboe@fb.com>,
> Cc: bart.vanassche@sandisk.com
> 
> Shaun Tancheff (1):
>   Missing bio_put following submit_bio_wait
> 
>  block/blk-lib.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> -- 
> 2.8.1
> 
