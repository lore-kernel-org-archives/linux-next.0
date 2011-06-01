From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Wed, 1 Jun 2011 09:43:47 -0400
Message-ID: <20110601134347.GB4081@dumpdata.com>
References: <20110601110132.5485aba4.sfr@canb.auug.org.au>
 <4DE5DB95.8010106@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:36787 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753879Ab1FANoS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 1 Jun 2011 09:44:18 -0400
Content-Disposition: inline
In-Reply-To: <4DE5DB95.8010106@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Carpenter <error27@gmail.com>

On Wed, Jun 01, 2011 at 08:26:29AM +0200, Jens Axboe wrote:
> On 2011-06-01 03:01, Stephen Rothwell wrote:
> > Hi Jens,
> > 
> > After merging the block tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > drivers/block/xen-blkback/blkback.c: In function 'xen_blkif_init':
> > drivers/block/xen-blkback/blkback.c:812:6: error: 'blkback' undeclared (first use in this function)
> > 
> > Caused by commit 2a46117c6050 ("xen/blkback: potential null dereference
> > in error handling").
> > 
> > I have used the block tree from next-20110530 for today.
> 
> Damn, sorry Stephen. Konrad, I'm rolling my tree back as not to
> introduce bisection breakage in the tree. JFYI, so rebase yours as well
> and lets try again.

Done. Sorry about that - I pushed the right tree minutes after I sent the git
pull email, but it took forever.... anyhow just pushed it and rebased on your for-linux.
Will send out a seperate email for the git pull.
