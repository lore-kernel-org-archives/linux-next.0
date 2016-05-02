From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the tpmdd tree
Date: Mon, 2 May 2016 14:10:36 +0300
Message-ID: <20160502111036.GA9585@intel.com>
References: <20160428153232.0d6eb076@canb.auug.org.au>
 <1461834144.3482.4.camel@linux.intel.com>
 <20160501231222.42557edf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:7471 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753614AbcEBLKn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 May 2016 07:10:43 -0400
Content-Disposition: inline
In-Reply-To: <20160501231222.42557edf@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christophe Ricard <christophe.ricard@gmail.com>

On Sun, May 01, 2016 at 11:12:22PM +1000, Stephen Rothwell wrote:
> Hi Jarkko,
>=20
> On Thu, 28 Apr 2016 12:02:24 +0300 Jarkko Sakkinen <jarkko.sakkinen@l=
inux.intel.com> wrote:
> >
> > On Thu, 2016-04-28 at 15:32 +1000, Stephen Rothwell wrote:
> > > Hi Jarkko,
> > >=20
> > > After merging the tpmdd tree, today's linux-next build (powerpc
> > > allyesconfig) failed like this:
> > >=20
> > > In file included from /home/sfr/next/next/include/linux/rcupdate.=
h:38:0,
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0from /home/sfr=
/next/next/include/linux/idr.h:18,
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0from /home/sfr=
/next/next/include/linux/kernfs.h:14,
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0from /home/sfr=
/next/next/include/linux/sysfs.h:15,
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0from /home/sfr=
/next/next/include/linux/kobject.h:21,
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0from /home/sfr=
/next/next/include/linux/device.h:17,
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0from /home/sfr=
/next/next/include/linux/dma-mapping.h:6,
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0from /home/sfr=
/next/next/drivers/char/tpm/tpm_ibmvtpm.c:18:
> > > /home/sfr/next/next/drivers/char/tpm/tpm_ibmvtpm.c: In function '=
tpm_ibmvtpm_probe':
> > > /home/sfr/next/next/include/linux/spinlock.h:295:1: error: expect=
ed ';' before 'do'
> > > =A0do {=A0=A0=A0=A0=A0=A0=A0\
> > > =A0^
> > > /home/sfr/next/next/drivers/char/tpm/tpm_ibmvtpm.c:632:2: note: i=
n expansion of macro
> > > 'spin_lock_init'
> > > =A0 spin_lock_init(&ibmvtpm->rtce_lock);
> > > =A0 ^
> > >=20
> > > Caused by commit
> > >=20
> > > =A0 28157164b056 ("tpm: Remove useless priv field in struct tpm_v=
endor_specific")
> > >=20
> > > A ';' was missed.
> > >=20
> > > I added the following patch for today. =20
> >=20
> > Sorry about this and thank you.
> >=20
> > /Jarkko
> >=20
> > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Date: Thu, 28 Apr 2016 15:27:17 +1000
> > > Subject: [PATCH] tpm: fix for typo in tpm/tpm_ibmvtpm.c
> > >=20
> > > Fixes: 28157164b056 ("tpm: Remove useless priv field in struct tp=
m_vendor_specific")
> > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > ---
> > > =A0drivers/char/tpm/tpm_ibmvtpm.c | 2 +-
> > > =A01 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/char/tpm/tpm_ibmvtpm.c b/drivers/char/tpm/tp=
m_ibmvtpm.c
> > > index 6b22826f0e11..946025a7413b 100644
> > > --- a/drivers/char/tpm/tpm_ibmvtpm.c
> > > +++ b/drivers/char/tpm/tpm_ibmvtpm.c
> > > @@ -627,7 +627,7 @@ static int tpm_ibmvtpm_probe(struct vio_dev *=
vio_dev,
> > > =A0
> > > =A0	crq_q->index =3D 0;
> > > =A0
> > > -	dev_set_drvdata(&chip->dev, ibmvtpm)
> > > +	dev_set_drvdata(&chip->dev, ibmvtpm);
> > > =A0
> > > =A0	spin_lock_init(&ibmvtpm->rtce_lock);
> > > =A0
> > > --=A0
> > > 2.7.0
> > >  =20
>=20
> Ping?

Acked-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

I applied the fix and merged it.

> --=20
> Cheers,
> Stephen Rothwell

/Jarkko
