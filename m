From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20170201 build: 3 failures 3 warnings (next-20170201)
Date: Wed, 1 Feb 2017 10:56:27 +0000
Message-ID: <20170201105627.pmx2c2wjfxjvnujq@sirena.org.uk>
References: <E1cYsIh-0004Lj-OF@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2flrilzdksh4bdog"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:50750 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751374AbdBAK4j (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Feb 2017 05:56:39 -0500
Content-Disposition: inline
In-Reply-To: <E1cYsIh-0004Lj-OF@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Zoran <mzoran@crowfest.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org


--2flrilzdksh4bdog
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 01, 2017 at 10:38:07AM +0000, Build bot for Mark Brown wrote:

Today's -next fails to build both arm and arm64 allmodconfigs due to:

> 	arm64-allmodconfig
> ../drivers/staging/bcm2835-audio/bcm2835-vchiq.c:97:9: error: implicit declaration of function 'vchi_msg_queue' [-Werror=implicit-function-declaration]

> 	arm-allmodconfig
> ../drivers/staging/bcm2835-audio/bcm2835-vchiq.c:97:9: error: implicit declaration of function 'vchi_msg_queue' [-Werror=implicit-function-declaration]
> ../drivers/staging/media/platform/bcm2835/mmal-vchiq.c:453:8: error: implicit declaration of function 'vchi_msg_queue' [-Werror=implicit-function-declaration]

caused by that driver being added.

--2flrilzdksh4bdog
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAliRvtoACgkQJNaLcl1U
h9BJRwf+NPKFt0lSpaywj+5Zv2vJB1ATwNnBMENshxc2RHevyH9AMszIcXF2iUdv
19IURWOXQ2sziscSyE0gEmb48/4UWRqbi/FsZtfQwFjhOcMr0e8Hjku5P5TkmWMd
kWmI++zfojKp+hPsfse2L4gyObr7raY+gw1P/yaocBfB6W0GZTHOBA7xTGWTTVaQ
iDnkLjcY+wd8172mKSG8H6cnEqVfng6Kx1n7hbVv+8i+n5ig3f0DANOdLgCB8UOp
+dWEcUJXfV2HfyK+K1co0K3/6EAWNbRzly5u6bD6TbhDUkjov4zZxxY4Aq9knj+h
dZwu3lBTcml3oRMhpQI/H33bisJRiQ==
=qmWw
-----END PGP SIGNATURE-----

--2flrilzdksh4bdog--
