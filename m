From: Martin Wilck <mwilck@suse.de>
Subject: Re: linux-next: manual merge of the scsi tree with the block tree
Date: Wed, 17 Apr 2019 21:11:11 +0200
Message-ID: <d01f3c2c68f9e852b15526904f8dfd8cbcece120.camel@suse.de>
References: <20190415155939.35325ef1@canb.auug.org.au>
         <84c02649-1eeb-3d28-6cc2-0a5d0f5f6b7d@acm.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <84c02649-1eeb-3d28-6cc2-0a5d0f5f6b7d@acm.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bart Van Assche <bvanassche@acm.org>, Stephen Rothwell <sfr@canb.auug.org.au>, James Bottomley <James.Bottomley@HansenPartnership.com>, Jens Axboe <axboe@kernel.dk>
Cc: Christoph Hellwig <hch@lst.de>, "Martin K. Petersen" <martin.petersen@oracle.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, 2019-04-15 at 06:48 -0700, Bart Van Assche wrote:
> On 4/14/19 10:59 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the scsi tree got a conflict in:
> > 
> >   drivers/scsi/sd.c
> > 
> > between commit:
> > 
> >   c92e2f04b359 ("block: disk_events: introduce event flags")
> > 
> > from the block tree and commit:
> > 
> >   21e6ba3f0e02 ("scsi: sd: Rely on the driver core for asynchronous
> > probing")
> >   d16ece577bf2 ("scsi: sd: Inline sd_probe_part2()")
> > 
> > from the scsi tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your
> > tree
> > is submitted for merging.  You may also want to consider
> > cooperating
> > with the maintainer of the conflicting tree to minimise any
> > particularly
> > complex conflicts.
> 
> Thanks Stephen for having resolved this conflict. The conflict
> resolution
> looks good to me.

Yes, it looks good to me as well.

Thanks,
Martin
