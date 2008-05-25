From: Borislav Petkov <petkovbb@googlemail.com>
Subject: Re: linux-next: Tree for May 22
Date: Sun, 25 May 2008 10:03:22 +0200
Message-ID: <20080525080321.GA3582@gollum.tnic>
References: <20080522165209.ef2cb160.sfr@canb.auug.org.au> <200805230327.51067.rjw@sisk.pl> <200805252355.47860.bzolnier@gmail.com>
Reply-To: petkovbb@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.154]:61881 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752806AbYEYID3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 25 May 2008 04:03:29 -0400
Received: by fg-out-1718.google.com with SMTP id 19so900498fgg.17
        for <linux-next@vger.kernel.org>; Sun, 25 May 2008 01:03:27 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <200805252355.47860.bzolnier@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jens Axboe <jens.axboe@oracle.com>, FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>, Andrew Morton <akpm@linux-foundation.org>

On Sun, May 25, 2008 at 11:55:47PM +0200, Bartlomiej Zolnierkiewicz wro=
te:
>=20
> Hi,
>=20
> On Friday 23 May 2008, Rafael J. Wysocki wrote:
> > On Thursday, 22 of May 2008, Stephen Rothwell wrote:
> > > Hi all,
> > >=20
> > > Changes since next-20080522:
> > >=20
> > > The three patches reverted from the driver-core tree yesterday ha=
ve been
> > > removed from there.
> > >=20
> > > The net tree (actually the wireless tree) had a trivial conflict =
with the
> > > wireless-current tree.
> > >=20
> > > One of the sound tree build patches has been merged.
> > >=20
> > > The semaphore-removal tree still needed three patches reverted be=
cause similar
> > > patches were merged into upstream and the scsi-rc-fixes trees.
> > >=20
> > > The bkl-removal tree had a conflict with the arm tree because the=
 arm
> > > tree removed a file that was changed.
> > >=20
> > > I have applied the following temporary patch for known build prob=
lems:
> > >=20
> > > 	"Fix various 8390 builds" - the net tree broke builds on various
> > > architectures - hopefully this patch will go into the net tree sh=
ortly.
> > > 	"build failure with netfilter on __nf_ct_helper_find()" - breaka=
ge
> > > due to the moving of stuff from list.h to rculist.h
> >=20
> > This one and the previous linux-next can't resume from suspend to R=
AM on my
> > HP nx6325.  The problem is reliably reproducible 100% of the time.
> >=20
> > The patch that causes it to happen, as identified by bisection, is:
> >=20
> > commit 3dcefa9419f3b8a49921d2218c93a3ddba8e0855
> > Author: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
> > Date:   Thu May 22 10:40:19 2008 +1000
> >=20
> >     ide: use __generic_unplug_device() in ide_do_drive_cmd()
> >=20
> >     Cc: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
> >     Cc: Borislav Petkov <petkovbb@gmail.com>
> >     Cc: Jens Axboe <jens.axboe@oracle.com>
> >     Signed-off-by: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
>=20
> Thanks for narrowing it down.
>=20
> > Reverting it along with the next IDE patches (up to and including
> > commit fd42e6df0fd163411f5c655b4bde4fb6a8910edc
> > "ide: remove action argument in ide_do_drive_cmd") makes the proble=
m go away.
>=20
> Please check if the patch below (against IDE tree but should also app=
ly
> to the current linux-next) fixes the issue (for blk_pm_resume_request=
()
> the queue is stopped so we need to call ->request_fn explicitly).
>=20
> ---
>  block/blk-exec.c     |    3 +++
>  drivers/ide/ide-io.c |    3 +++
>  2 files changed, 6 insertions(+)
>=20
> Index: b/block/blk-exec.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- a/block/blk-exec.c
> +++ b/block/blk-exec.c
> @@ -57,6 +57,9 @@ void blk_execute_rq_nowait(struct reques
>  	spin_lock_irq(q->queue_lock);
>  	__elv_add_request(q, rq, where, 1);
>  	__generic_unplug_device(q);
> +	/* the queue is stopped so it won't be plugged+unplugged */
> +	if (blk_pm_resume_request(rq))
> +		q->request_fn(q);
>  	spin_unlock_irq(q->queue_lock);
>  }
>  EXPORT_SYMBOL_GPL(blk_execute_rq_nowait);
> Index: b/drivers/ide/ide-io.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- a/drivers/ide/ide-io.c
> +++ b/drivers/ide/ide-io.c
> @@ -1540,6 +1540,9 @@ void ide_do_drive_cmd(ide_drive_t *drive
>  	hwgroup->rq =3D NULL;
>  	__elv_add_request(drive->queue, rq, ELEVATOR_INSERT_FRONT, 1);
>  	__generic_unplug_device(drive->queue);
> +	/* the queue is stopped so it won't be plugged+unplugged */
> +	if (blk_pm_resume_request(rq))
> +		do_ide_request(drive->queue);
>  	spin_unlock_irqrestore(&ide_lock, flags);
>  }

I could reproduce the bug on my Asus M6B00N and can confirm that the pa=
tch fixes
it.

--=20
Regards/Gru=DF,
    Boris.
--
To unsubscribe from this list: send the line "unsubscribe linux-next" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
