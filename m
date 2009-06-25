From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: manual merge of the block tree with Linus' tree
Date: Thu, 25 Jun 2009 09:42:41 +0200
Message-ID: <20090625074241.GD31415@kernel.dk>
References: <20090625131517.d9adc935.sfr@canb.auug.org.au> <20090625133005.9f521529.sfr@canb.auug.org.au> <20090625063806.GC31415@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from brick.kernel.dk ([93.163.65.50]:48961 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754311AbZFYHmi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 25 Jun 2009 03:42:38 -0400
Content-Disposition: inline
In-Reply-To: <20090625063806.GC31415@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alasdair G Kergon <agk@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>

On Thu, Jun 25 2009, Jens Axboe wrote:
> On Thu, Jun 25 2009, Stephen Rothwell wrote:
> > On Thu, 25 Jun 2009 13:15:17 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > I can't see how to easily fix this up, so I have dropped the block tree
> > > for today (since it only contained 2.6.32 material, right?).
> > 
> > I also dropped the device-mapper tree for today as it was based on the
> > block tree (and dragged in what I had just dropped) and, in any case, all
> > its patches have been merged upstream.
> 
> OK to both, I'm fixing up the writeback conflicts right now.

Should be good to go again.

-- 
Jens Axboe
