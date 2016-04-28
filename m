From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the tpmdd tree
Date: Thu, 28 Apr 2016 12:02:24 +0300
Message-ID: <1461834144.3482.4.camel@linux.intel.com>
References: <20160428153232.0d6eb076@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160428153232.0d6eb076@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christophe Ricard <christophe.ricard@gmail.com>
List-Id: linux-next.vger.kernel.org

On Thu, 2016-04-28 at 15:32 +1000, Stephen Rothwell wrote:
> Hi Jarkko,
>=20
> After merging the tpmdd tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>=20
> In file included from /home/sfr/next/next/include/linux/rcupdate.h:38=
:0,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from /home/sfr/next/next/include/linux=
/idr.h:18,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from /home/sfr/next/next/include/linux=
/kernfs.h:14,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from /home/sfr/next/next/include/linux=
/sysfs.h:15,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from /home/sfr/next/next/include/linux=
/kobject.h:21,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from /home/sfr/next/next/include/linux=
/device.h:17,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from /home/sfr/next/next/include/linux=
/dma-mapping.h:6,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from /home/sfr/next/next/drivers/char/=
tpm/tpm_ibmvtpm.c:18:
> /home/sfr/next/next/drivers/char/tpm/tpm_ibmvtpm.c: In function 'tpm_=
ibmvtpm_probe':
> /home/sfr/next/next/include/linux/spinlock.h:295:1: error: expected '=
;' before 'do'
> =C2=A0do {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0\
> =C2=A0^
> /home/sfr/next/next/drivers/char/tpm/tpm_ibmvtpm.c:632:2: note: in ex=
pansion of macro
> 'spin_lock_init'
> =C2=A0 spin_lock_init(&ibmvtpm->rtce_lock);
> =C2=A0 ^
>=20
> Caused by commit
>=20
> =C2=A0 28157164b056 ("tpm: Remove useless priv field in struct tpm_ve=
ndor_specific")
>=20
> A ';' was missed.
>=20
> I added the following patch for today.

Sorry about this and thank you.

/Jarkko

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 28 Apr 2016 15:27:17 +1000
> Subject: [PATCH] tpm: fix for typo in tpm/tpm_ibmvtpm.c
>=20
> Fixes: 28157164b056 ("tpm: Remove useless priv field in struct tpm_ve=
ndor_specific")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
> =C2=A0drivers/char/tpm/tpm_ibmvtpm.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/char/tpm/tpm_ibmvtpm.c b/drivers/char/tpm/tpm_ib=
mvtpm.c
> index 6b22826f0e11..946025a7413b 100644
> --- a/drivers/char/tpm/tpm_ibmvtpm.c
> +++ b/drivers/char/tpm/tpm_ibmvtpm.c
> @@ -627,7 +627,7 @@ static int tpm_ibmvtpm_probe(struct vio_dev *vio_=
dev,
> =C2=A0
> =C2=A0	crq_q->index =3D 0;
> =C2=A0
> -	dev_set_drvdata(&chip->dev, ibmvtpm)
> +	dev_set_drvdata(&chip->dev, ibmvtpm);
> =C2=A0
> =C2=A0	spin_lock_init(&ibmvtpm->rtce_lock);
> =C2=A0
> --=C2=A0
> 2.7.0
>=20
