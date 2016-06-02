From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: next-20160602 build: 0 failures 2 warnings (next-20160602)
Date: Thu, 2 Jun 2016 11:08:08 +0100
Message-ID: <20160602100808.GD23566@e106497-lin.cambridge.arm.com>
References: <E1b8PEc-0000qk-Ol@optimist>
 <7858362.3LIbrZdxpY@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:43815 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932078AbcFBKIL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 2 Jun 2016 06:08:11 -0400
Content-Disposition: inline
In-Reply-To: <7858362.3LIbrZdxpY@wuerfel>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linaro-kernel@lists.linaro.org, Build bot for Mark Brown <broonie@kernel.org>, kernel-build-reports@lists.linaro.org, linux-next@vger.kernel.org

On Thu, Jun 02, 2016 at 11:58:24AM +0200, Arnd Bergmann wrote:
> On Thursday, June 2, 2016 10:48:15 AM CEST Build bot for Mark Brown w=
rote:
> > Tree/Branch: next-20160602
> > Git describe: next-20160602
> > Commit: ce425f36d1 Add linux-next specific files for 20160602
> >=20
> > Build Time: 141 min 21 sec
> >=20
> > Passed:    9 / 9   (100.00 %)
> > Failed:    0 / 9   (  0.00 %)
> >=20
> > Errors: 0
> > Warnings: 2
> > Section Mismatches: 0
> >=20
> > -------------------------------------------------------------------=
------------
> > defconfigs with issues (other than build errors):
> >       2 warnings    0 mismatches  : arm64-allmodconfig
> >       1 warnings    0 mismatches  : arm-allmodconfig
> >=20
> > -------------------------------------------------------------------=
------------
> >=20
> > Warnings Summary: 2
> > 	  2 ../drivers/gpu/drm/arm/hdlcd_crtc.c:185:28: warning: unused va=
riable 'hdlcd' [-Wunused-variable]
>=20
> This was introduced today by 1e5e10b59403 ("drm: hdlcd: Cleanup the a=
tomic plane operations").
> Liviu, can you fix it up?

Yes, I have a fix in my local tree, I'll push it to the public tree soo=
n, will be picked up by the next -next rebuild.

Best regards,
Liviu

>=20
> > 	  1 ../drivers/staging/iio/adc/ad7606_spi.c:24:18: warning: 'data'=
 may be used uninitialized in this function [-Wmaybe-uninitialized]
>=20
> I sent a patch on Monday, but Greg has been busy working on his stabl=
e kernels,
> I'm sure he'll get to it.
>=20
> 	Arnd
>=20

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF
