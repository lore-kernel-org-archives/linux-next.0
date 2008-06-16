From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: linux-next: ide build failure
Date: Mon, 16 Jun 2008 11:54:42 +0200
Message-ID: <200806161154.43011.bzolnier@gmail.com>
References: <20080616133817.83c9f304.sfr@canb.auug.org.au> <1213588543.8129.122.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from an-out-0708.google.com ([209.85.132.248]:56936 "EHLO
	an-out-0708.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757035AbYFPJxU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Jun 2008 05:53:20 -0400
Received: by an-out-0708.google.com with SMTP id d40so1178164and.103
        for <linux-next@vger.kernel.org>; Mon, 16 Jun 2008 02:53:17 -0700 (PDT)
In-Reply-To: <1213588543.8129.122.camel@pasglop>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: benh@kernel.crashing.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org


Hi,

On Monday 16 June 2008, Benjamin Herrenschmidt wrote:
> On Mon, 2008-06-16 at 13:38 +1000, Stephen Rothwell wrote:
> > Hi Bart,
> > 
> > Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> > 
> > drivers/ide/ppc/pmac.c: In function 'pmac_ide_cable_detect':
> > drivers/ide/ppc/pmac.c:926: error: implicit declaration of function 'drv_get_drvdata'
> > drivers/ide/ppc/pmac.c:926: warning: cast to pointer from integer of different size
> > drivers/ide/ppc/pmac.c: In function 'pmac_ide_init_dev':
> > drivers/ide/ppc/pmac.c:950: warning: cast to pointer from integer of different size
> > drivers/ide/ppc/pmac.c: In function 'pmac_ide_setup_device':
> > drivers/ide/ppc/pmac.c:1082: error: request for member 'irq' in something not a structure or union
> > drivers/ide/ppc/pmac.c: In function 'pmac_ide_pci_suspend':
> > drivers/ide/ppc/pmac.c:1321: error: 'hwif' undeclared (first use in this function)
> > drivers/ide/ppc/pmac.c:1321: error: (Each undeclared identifier is reported only once
> > drivers/ide/ppc/pmac.c:1321: error: for each function it appears in.)
> > drivers/ide/ppc/pmac.c:1316: warning: unused variable 'pmif'
> > drivers/ide/ppc/pmac.c: In function 'pmac_ide_pci_resume':
> > drivers/ide/ppc/pmac.c:1336: error: 'hwif' undeclared (first use in this function)
> > drivers/ide/ppc/pmac.c:1332: warning: unused variable 'pmif'
> > 
> > I applied the patch below ... (which clearly needs work)
> 
> Bart, I hadn't managed to review / test your new patches yet, but
> please, avoid putting anything touching the pmac stuff in your
> "next" tree until it's been fully acked by me. Stuff in linux-next

I must admit that I rushed things this time and I'm sorry for that.

[ However it may be connected with the fact that recently I've been
  waiting for _weeks_ for your feedback (sometimes to not get _any_). ]

> is stuff that is supposed to be -ready to be merged- upstream. Those
> patches definitely are not.

1 of 7 patches posted (3 were bugfixes, including regression bugfix)
had an obvious build problems and I indeed should have audited it
properly (the patch is still conceptually good and I need it in for
patches that will be posted for review / testing this week) so this
is an uncalled generalization.

[ I could be of course wrong and there may be real problems with other
  patches as well so please do review / test.  Thanks! ]

PS Stephen, thanks for fixing the build problems.

Bart

> Thanks !
> 
> Ben.
> 
> > -- 
> > Cheers,
> > Stephen Rothwell                    sfr@canb.auug.org.au
> > http://www.canb.auug.org.au/~sfr/
> > 
> > >From e23339391c5e18a12f2c5d51ca5032df92d9d978 Mon Sep 17 00:00:00 2001
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Mon, 16 Jun 2008 13:35:36 +1000
> > Subject: [PATCH] ide pmac fixes 1
> > 
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/ide/ppc/pmac.c |   16 ++++++++--------
> >  1 files changed, 8 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/ide/ppc/pmac.c b/drivers/ide/ppc/pmac.c
> > index 0671fb8..363bc4e 100644
> > --- a/drivers/ide/ppc/pmac.c
> > +++ b/drivers/ide/ppc/pmac.c
> > @@ -923,7 +923,7 @@ static int pmac_ide_do_resume(pmac_ide_hwif_t *pmif)
> >  static u8 pmac_ide_cable_detect(ide_hwif_t *hwif)
> >  {
> >  	pmac_ide_hwif_t *pmif =
> > -		(pmac_ide_hwif_t *)drv_get_drvdata(hwif->gendev.parent);
> > +		(pmac_ide_hwif_t *)dev_get_drvdata(hwif->gendev.parent);
> >  	struct device_node *np = pmif->node;
> >  	const char *cable = of_get_property(np, "cable-type", NULL);
> >  
> > @@ -947,7 +947,7 @@ static void pmac_ide_init_dev(ide_drive_t *drive)
> >  {
> >  	ide_hwif_t *hwif = drive->hwif;
> >  	pmac_ide_hwif_t *pmif =
> > -		(pmac_ide_hwif_t *)drv_get_drvdata(hwif->gendev.parent);
> > +		(pmac_ide_hwif_t *)dev_get_drvdata(hwif->gendev.parent);
> >  
> >  	if (pmif->mediabay) {
> >  #ifdef CONFIG_PMAC_MEDIABAY
> > @@ -1076,10 +1076,10 @@ static int __devinit pmac_ide_setup_device(pmac_ide_hwif_t *pmif, hw_regs_t *hw)
> >  		msleep(jiffies_to_msecs(IDE_WAKEUP_DELAY));
> >  	}
> >  
> > -	printk(KERN_INFO DRV_NAME ": Found Apple %s controller (%s), "
> > -			 "bus ID %d%s, irq %d\n", model_name[pmif->kind],
> > -			 pmif->mdev ? "MacIO" : "PCI", pmif->aapl_bus_id,
> > -			 pmif->mediabay ? " (mediabay)" : "", hw.irq);
> > +//	printk(KERN_INFO DRV_NAME ": Found Apple %s controller (%s), "
> > +//			 "bus ID %d%s, irq %d\n", model_name[pmif->kind],
> > +//			 pmif->mdev ? "MacIO" : "PCI", pmif->aapl_bus_id,
> > +//			 pmif->mediabay ? " (mediabay)" : "", hw.irq);
> >  
> >  	hwif = ide_find_port_slot(&d);
> >  	if (hwif == NULL)
> > @@ -1318,7 +1318,7 @@ pmac_ide_pci_suspend(struct pci_dev *pdev, pm_message_t mesg)
> >  
> >  	if (mesg.event != pdev->dev.power.power_state.event
> >  			&& (mesg.event & PM_EVENT_SLEEP)) {
> > -		rc = pmac_ide_do_suspend(hwif);
> > +		rc = pmac_ide_do_suspend(pmif);
> >  		if (rc == 0)
> >  			pdev->dev.power.power_state = mesg;
> >  	}
> > @@ -1333,7 +1333,7 @@ pmac_ide_pci_resume(struct pci_dev *pdev)
> >  	int rc = 0;
> >  
> >  	if (pdev->dev.power.power_state.event != PM_EVENT_ON) {
> > -		rc = pmac_ide_do_resume(hwif);
> > +		rc = pmac_ide_do_resume(pmif);
> >  		if (rc == 0)
> >  			pdev->dev.power.power_state = PMSG_ON;
> >  	}
