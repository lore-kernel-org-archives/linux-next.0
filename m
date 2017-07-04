From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Wed, 5 Jul 2017 07:40:18 +1000
Message-ID: <20170705074018.5cfee177@canb.auug.org.au>
References: <20170613205409.4b7e06f9@canb.auug.org.au>
        <20170704151557.GA22088@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36471 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752248AbdGDVkV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 4 Jul 2017 17:40:21 -0400
In-Reply-To: <20170704151557.GA22088@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jens Axboe <axboe@kernel.dk>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Sebastian Ott <sebott@linux.vnet.ibm.com>

Hi Guenter,

On Tue, 4 Jul 2017 08:15:57 -0700 Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Tue, Jun 13, 2017 at 08:54:09PM +1000, Stephen Rothwell wrote:
> > 
> > After merging the block tree, today's linux-next build (s390x
> > s390-defconfig) failed like this:
> > 
> > drivers/s390/block/scm_blk.c:293:10: error: 'BLK_MQ_RQ_QUEUE_BUSY' undeclared (first use in this function)
> > drivers/s390/block/scm_blk.c:327:9: error: 'BLK_MQ_RQ_QUEUE_OK' undeclared (first use in this function)
> > 
> > Caused by commit
> > 
> >   fc17b6534eb8 ("blk-mq: switch ->queue_rq return value to blk_status_t")
> > 
> > interacting with commit
> > 
> >   12d907626539 ("s390/scm: convert to blk-mq")
> > 
> > from the s390 tree.
> > 
> > Is the following the correct merge fixup?
> >   
> 
> The failure made int into Linus' tree, but the fix didn't. Is the fix pending
> in some other queue or does it have to be (re-)submitted ?

It will be my in fixes tree today and until it appears in Linus' or the
s390 tree.

-- 
Cheers,
Stephen Rothwell
