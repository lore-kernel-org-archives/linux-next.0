From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the drm-exynos tree
Date: Wed, 24 Jun 2015 11:01:22 +1000
Message-ID: <20150624110122.2dcbc338@canb.auug.org.au>
References: <20150623115245.2142288e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/CBS+7JbL.ZR.2CrqeWfq9dl"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44338 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932228AbbFXBBa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 23 Jun 2015 21:01:30 -0400
In-Reply-To: <20150623115245.2142288e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: Inki Dae <inki.dae@samsung.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hyungwon Hwang <human.hwang@samsung.com>, Rob Herring <robh+dt@kernel.org>

--Sig_/CBS+7JbL.ZR.2CrqeWfq9dl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Tue, 23 Jun 2015 11:52:45 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the drm-exynos tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/media/i2c/adv7604.o: In function `of_graph_get_endpoint_by_regs':
> adv7604.c:(.text+0x586c): multiple definition of `of_graph_get_endpoint_b=
y_regs'
> drivers/media/i2c/adv7343.o:adv7343.c:(.text+0xa13): first defined here
> drivers/media/platform/soc_camera/atmel-isi.o: In function `of_graph_get_=
endpoint_by_regs':
> atmel-isi.c:(.text+0x1ec9): multiple definition of `of_graph_get_endpoint=
_by_regs'
> drivers/media/platform/soc_camera/soc_camera.o:soc_camera.c:(.text+0x2ce3=
): first defined here
> drivers/media/platform/soc_camera/rcar_vin.o: In function `of_graph_get_e=
ndpoint_by_regs':
> rcar_vin.c:(.text+0x307c): multiple definition of `of_graph_get_endpoint_=
by_regs'
> drivers/media/platform/soc_camera/soc_camera.o:soc_camera.c:(.text+0x2ce3=
): first defined here
>=20
> Caused by commit:
>=20
>   a0f7001c18ca ("of: add helper for getting endpoint node of specific ide=
ntifiers")

This failure is now in the drm tree (where above patch is commit
8ccd0d0ca041).  I have used the patch from Inki for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/CBS+7JbL.ZR.2CrqeWfq9dl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVigFoAAoJEMDTa8Ir7ZwVn+UP/RkyXQk4I2WlFteH3w93H04f
xVRweWoWld2TMVjucjjs1owsrSAjLX60tJ0OA4bXg23pGrq8bcaEW15ePidppqYz
2iJcRmtw9s8yaBOKkQE77wMx/W0sKuUiy+ofXC5qWNNw3p+wC4TpT/n4Jr6oZRhE
wecQHVl2Lp+BVypq4CR3WKGkPG1hGkYCVnoPmtEd675gDdU+kAZX5mFopLNDUh/u
2mOCMVn3k0Zp+pglvxFYPL018TQJ0XvStPYfNry9zDOXMn07z6Qva/Xt8cmfN3f8
fdYflgBbS/8wM4pch9EzADYVqrykYhUD7fIj8w173qXmb9oPOo+s260ZvrRRy8LG
sOJg8XZuPgoJoJFUvSZtV/NF8wMg/K+4uf9qrBEmHZyAtn9oYO8uA79fROraSNeJ
X2ubiVxnLyd+9ymVipv95e/nMkBUjABLKNeakWVeYVoZ2OBvHjusNeoJO1VlXTrm
jlVBoywBz5fLa6vAO2KY0RntVqHv/OSGAnG3cZLiWusYeExtehN2OM5TdAS4pH4q
/9fQj32+Z7X10+ITF9IY/qaJB1DN03oOpOZ2lCWV8xKk7Um1c+1IGZhVNIqQiRgC
sCc8zoNG6WEy61l48ZwidYfLzmHWsx1Dt5abs7PVq2QRFywgNpKZh41oqj9cBVim
sEXRVabpQZ/6X/zrI7Pu
=nPMi
-----END PGP SIGNATURE-----

--Sig_/CBS+7JbL.ZR.2CrqeWfq9dl--
