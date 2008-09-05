From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: manual merge of the block tree
Date: Fri, 5 Sep 2008 08:22:38 +0200
Message-ID: <20080905062237.GM20055@kernel.dk>
References: <20080905161212.e3612601.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:56428 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752002AbYIEGWm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 5 Sep 2008 02:22:42 -0400
Content-Disposition: inline
In-Reply-To: <20080905161212.e3612601.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Mike Christie <michaelc@cs.wisc.edu>, James Bottomley <James.Bottomley@HansenPartnership.com>

On Fri, Sep 05 2008, Stephen Rothwell wrote:
> Hi Jens,
> 
> Today's linux-next merge of the block tree got a conflict in
> include/linux/bio.h and include/linux/blkdev.h between commit
> 81449f3f2013d92ec3bcb9d2c1877ce3140d2271 ("[SCSI] block: separate
> failfast into multiple bits") from the scsi tree and commit
> 5d112a624058caabe5b570d2c9827bce82c18be1 ("Add 'discard' request
> handling") from the block tree.
> 
> Overlapping changes/additions to some bit definitions.  I have fixed it
> up as best I can (see below) and can carry the fix.

James, would it not have been a lot better to carry the block bits in
the block tree instead??

-- 
Jens Axboe
