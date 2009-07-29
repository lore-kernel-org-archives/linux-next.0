From: Philipp Reisner <philipp.reisner@linbit.com>
Subject: Re: linux-next: drbd tree build failure
Date: Wed, 29 Jul 2009 17:13:09 +0200
Message-ID: <200907291713.09695.philipp.reisner@linbit.com>
References: <20090729152933.47664b18.sfr@canb.auug.org.au> <20090729062058.GE4148@kernel.dk>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754561AbZG2PNO@vger.kernel.org>
In-Reply-To: <20090729062058.GE4148@kernel.dk>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <jens.axboe@oracle.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wednesday 29 July 2009 08:20:58 Jens Axboe wrote:
> On Wed, Jul 29 2009, Stephen Rothwell wrote:
> > Hi Philipp,
> >
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> >
> > drivers/block/drbd/drbd_req.c: In function 'drbd_make_request_26':
> > drivers/block/drbd/drbd_req.c:1023: error: implicit declaration of
> > function 'bio_barrier' drivers/block/drbd/drbd_actlog.c: In function
> > '_drbd_md_sync_page_io': drivers/block/drbd/drbd_actlog.c:120: error:
> > implicit declaration of function 'bio_barrier'
> > drivers/block/drbd/drbd_main.c: In function 'drbd_send_dblock':
> > drivers/block/drbd/drbd_main.c:2373: error: implicit declaration of
> > function 'bio_barrier' drivers/block/drbd/drbd_main.c:2375: error:
> > implicit declaration of function 'bio_sync'
> >
> > Caused by commit d206aaff0c5ee065f382c626ea21c5166a3047a7 ("bio: first
> > step in sanitizing the bio->bi_rw flag testing") from the block tree.
> >
> > I applied the following patch for today.
>
> That fixup looks good, thanks Stephen.

Thanks,
I have commited that patch also to the drbd git tree. I think we have
now fixed all open issues (currently).

-phil
-- 
: Dipl-Ing Philipp Reisner
: LINBIT | Your Way to High Availability
: Tel: +43-1-8178292-50, Fax: +43-1-8178292-82
: http://www.linbit.com

DRBD(R) and LINBIT(R) are registered trademarks of LINBIT, Austria.
