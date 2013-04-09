From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the mfd tree
Date: Tue, 9 Apr 2013 09:20:59 +0200
Message-ID: <20130409072059.GC23447@zurbaran>
References: <20130408142124.ac540429a889cdc9800e529a@canb.auug.org.au>
 <1365396351.542317232@f36.mail.ru>
 <20130408092243.GK24058@zurbaran>
 <1365438469.322553103@f51.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:26944 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1762938Ab3DIHVF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Apr 2013 03:21:05 -0400
Content-Disposition: inline
In-Reply-To: <1365438469.322553103@f51.mail.ru>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Shiyan <shc_work@mail.ru>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Alexander,

On Mon, Apr 08, 2013 at 08:27:49PM +0400, Alexander Shiyan wrote:
> > > > After merging the mfd tree, today's linux-next build (x86_64 al=
lmodconfig)
> > > > failed like this:
> > > >=20
> > > > drivers/regulator/anatop-regulator.c: In function 'anatop_regul=
ator_probe':
> > > > drivers/regulator/anatop-regulator.c:134:2: error: implicit dec=
laration of function 'of_get_parent' [-Werror=3Dimplicit-function-decla=
ration]
> > > >=20
> > > > Caused by commit 5ab3a89a741f ("mfd: syscon: Add non-DT support=
").
> > > >=20
> > > > I have used the mfd tree from next-20130405 for today.
> > >=20
> > > This means that we do not have empty declarations for the
> > > of_xx functions in linux/of.h for !CONFIG_OF.
> > > OK to declare these functions or any other opinions?
> > Ok with me, but you'd need to get Grant and Rob's ACK.
>=20
> I've revised my initial opinion and write =E2=80=8B=E2=80=8Ba quick p=
atch for fix this issue.
>=20
> From a884d309d2978cbc44c52b650d669e56fef664e2 Mon Sep 17 00:00:00 200=
1
> From: Alexander Shiyan <shc_work@mail.ru>
> Date: Mon, 8 Apr 2013 19:13:10 +0400
> Subject: [PATCH] regulator: anatop: Make select dependency from
>  HAVE_IMX_ANATOP symbol
>=20
> This patch make selection of anatop-regulator from HAVE_IMX_ANATOP
> kernel symbol. This fixes build kernel with syscon driver but without
> oftree support.
>=20
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---
>  drivers/regulator/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index a5d97ea..078932d 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -133,7 +133,7 @@ config REGULATOR_FAN53555
> =20
>  config REGULATOR_ANATOP
>  	tristate "Freescale i.MX on-chip ANATOP LDO regulators"
> -	depends on MFD_SYSCON
> +	depends on HAVE_IMX_ANATOP
This does look like a band-aid solution to me. Yes, it will fix the cra=
sh, but
you're restricting this code to a much smaller architecture set. AFAIK
linux-next is not tested on that arch, for example.

Cheers,
Samuel.

--=20
Intel Open Source Technology Centre
http://oss.intel.com/
