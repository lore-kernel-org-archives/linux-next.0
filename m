From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20160518 build: 2 failures 20 warnings (next-20160518)
Date: Wed, 18 May 2016 11:15:59 +0100
Message-ID: <20160518101559.GJ8104@sirena.org.uk>
References: <E1b2vXq-0003Ij-Ek@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yhze8HlyfmXt1APY"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:40608 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751169AbcERKQd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 18 May 2016 06:16:33 -0400
Content-Disposition: inline
In-Reply-To: <E1b2vXq-0003Ij-Ek@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Chris Wilson <chris@chris-wilson.co.uk>, Dave Airlie <airlied@redhat.com>, Jie Qiu <jie.qiu@mediatek.com>, CK Hu <ck.hu@mediatek.com>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, dri-devel@lists.freedesktop.org


--yhze8HlyfmXt1APY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 18, 2016 at 08:05:26AM +0100, Build bot for Mark Brown wrote:

Today's -next fails to build arm and arm64 allmodconfigs fail to build
due to:

> 	arm64-allmodconfig
> 	arm-allmodconfig
> ../drivers/gpu/drm/mediatek/mtk_drm_fb.c:141:30: error: passing argument =
1 of 'drm_gem_object_lookup' from incompatible pointer type [-Werror=3Dinco=
mpatible-pointer-types]
> ../drivers/gpu/drm/mediatek/mtk_drm_fb.c:141:8: error: too many arguments=
 to function 'drm_gem_object_lookup'
> ../drivers/gpu/drm/mediatek/mtk_drm_gem.c:142:30: error: passing argument=
 1 of 'drm_gem_object_lookup' from incompatible pointer type [-Werror=3Dinc=
ompatible-pointer-types]
> ../drivers/gpu/drm/mediatek/mtk_drm_gem.c:142:8: error: too many argument=
s to function 'drm_gem_object_lookup'

Apparently triggered by 8ad0bd84f98607 (drm: Remove unused drm_device
=66rom drm_gem_object_lookup()) which didn't update the Mediatek drivers.

--yhze8HlyfmXt1APY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXPEDdAAoJECTWi3JdVIfQZx8H/3Fm/TemCxvP+vlFEWUb3jfp
FJNKR3py9usTVYx49LM4/Aj6Hjg6bOruv0U8FUE6H9oJkrIEwBOyenrPCbkUNO6y
akHUwYDc5HWekuSjtV45xgfoXWomqbz3Exr3+shFIGehlCHogq+5n+CzqA23qTta
mK+5w1PzCA/jcTRj3X/znLwaCqjuzqeQeLkhNfsUVO5ajmds9OYKmxckLwA22EQr
4OOfLbL6l3ZX3y89sq7vAhm0XRL6omkxbJMTcVhN8fWE3TAn49BLTO7UQmsuNbBq
oclkuCV5Dprqd7j8lT4/4CNjSxAHOzYlNpOFzuJkDqhfaax6E44mZAPekoel55Y=
=/nmb
-----END PGP SIGNATURE-----

--yhze8HlyfmXt1APY--
