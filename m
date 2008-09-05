From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: linux-next: manual merge of the block tree
Date: Fri, 05 Sep 2008 08:58:27 -0500
Message-ID: <1220623107.3331.0.camel@localhost.localdomain>
References: <20080905161212.e3612601.sfr@canb.auug.org.au>
	 <20080905062237.GM20055@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from accolon.hansenpartnership.com ([76.243.235.52]:47328 "EHLO
	accolon.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752781AbYIEN6d (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 5 Sep 2008 09:58:33 -0400
In-Reply-To: <20080905062237.GM20055@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Mike Christie <michaelc@cs.wisc.edu>

On Fri, 2008-09-05 at 08:22 +0200, Jens Axboe wrote:
> On Fri, Sep 05 2008, Stephen Rothwell wrote:
> > Hi Jens,
> > 
> > Today's linux-next merge of the block tree got a conflict in
> > include/linux/bio.h and include/linux/blkdev.h between commit
> > 81449f3f2013d92ec3bcb9d2c1877ce3140d2271 ("[SCSI] block: separate
> > failfast into multiple bits") from the scsi tree and commit
> > 5d112a624058caabe5b570d2c9827bce82c18be1 ("Add 'discard' request
> > handling") from the block tree.
> > 
> > Overlapping changes/additions to some bit definitions.  I have fixed it
> > up as best I can (see below) and can carry the fix.
> 
> James, would it not have been a lot better to carry the block bits in
> the block tree instead??

They're only a tiny piece of all of this ... and without them, my SCSI
tree won't compile.  I'll separate them into a post merge tree again to
resolve the conflicts.

However, this time, I really need linux-next to work out how it handles
post merge trees ... this will be the third time I've asked.

James
