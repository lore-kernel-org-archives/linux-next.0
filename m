From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ARM: pxa: fix build failure for regulator consumer in
 em-x270.c
Date: Wed, 28 Mar 2012 16:39:18 +0100
Message-ID: <20120328153918.GX3232@opensource.wolfsonmicro.com>
References: <CAP=VYLp-weNj35OHtmZ6pf5-t7OUxWREeu8r5sSOLhFYu0CppQ@mail.gmail.com>
 <1331244366-6147-1-git-send-email-paul.gortmaker@windriver.com>
 <4F732C97.2030804@compulab.co.il>
 <20120328152743.GW3232@opensource.wolfsonmicro.com>
 <CAN1soZy7jB_H0meVyh_H8nmbaSDmiDpjBYi_WO=pmjYzEf9r6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cbsCxbAnPLQXdgdB"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:40826 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754734Ab2C1PjU (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 28 Mar 2012 11:39:20 -0400
Content-Disposition: inline
In-Reply-To: <CAN1soZy7jB_H0meVyh_H8nmbaSDmiDpjBYi_WO=pmjYzEf9r6Q@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: Igor Grinberg <grinberg@compulab.co.il>, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org


--cbsCxbAnPLQXdgdB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 28, 2012 at 11:37:37PM +0800, Haojian Zhuang wrote:
> On Wed, Mar 28, 2012 at 11:27 PM, Mark Brown

> > These don't look like good fixes, you should be specifying the
> > dev_name() for the consumer device? =A0Presumably it's two separate
> > consumers and should be .0 and .1 or something?

> Could you do a quick update on dev_name() according to Mark's comment?

> -REGULATOR_CONSUMER(ldo10, &pxa_device_mci.dev, "vcc sdio");
> +REGULAOTR_CONSUMER(ldo10, dev_name(&pxa_device_mci.dev), "vcc sdio");

No, you're missing the point again.  As I said previously the whole
point of this interface is that you don't have to have access to the
struct device.  This should be the string *returned* by dev_name(), not
a direct call to dev_name().

--cbsCxbAnPLQXdgdB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPczCeAAoJEBus8iNuMP3dGYMP/3kVle4+dnLlW9GIW+yJxU3b
X2/mZlTgdKE7bPp6/9scuTaEZlia3rPQPNCZvHu6NTaO3IJvOjqgnJ9U9CLOW6OV
IWxK9lgdIm9ClhGD0WE9S3vJVvJwQeFEtiaD0wwanmm25iUrLOiVWf1KVbMaDfTs
dXUIsxIPjFHoMm9j0tbON9g1ozccxWCcZUguae1BZT/0d5oHtcqcb5YcJkEyzvGq
Q6HxxcNEm7X0ZrqcHAwCM/y19dPI/RGEhZpm72AVgCgKMLWSHVy9cOmgpSNxM+y9
0zrxciiy9kEt5L3XHjyCjbpbe9DvbGDtgNMrWxABr9CThznoEfCVBzKzFa+7Suub
WH+mn9xfFrXzidMF4DRSTBXMBAdpHWZQHzSWNV3eYgDjmwniUnN/VSFoJRh3fvob
lhq/4l1LibAdfbpqLNHC3RdDoWgsejmok4qN9ttJKkoC0euEHXloR4QdfuuNwYKr
sAm0E+vbROdR2UUqRc1+mwCoU+SnjR3hPGAP21ozOTgOwIUu1/AEVw+yQkTx7R5a
tl61kSbPHSaWywu81/st3lE/CeDmVCS844ZtZkgyL6B+k1ISqDKA6/bAvp527KoX
gx0EgqM5hPOrso1ZZxNCVjMD6UEY9RypYIN/jgGMGiV73ynFGB/u0jhUeKwP1XFk
teMhKiYshOcSzvr3ADVD
=Y7zo
-----END PGP SIGNATURE-----

--cbsCxbAnPLQXdgdB--
