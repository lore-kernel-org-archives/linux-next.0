From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20150629 build: 1 failures 74 warnings (next-20150629)
Date: Mon, 29 Jun 2015 18:06:22 +0100
Message-ID: <20150629170622.GJ11162@sirena.org.uk>
References: <E1Z9WQC-000356-Bd@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j+MD90OnwjQyWNYt"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:60828 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752972AbbF2RGg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 29 Jun 2015 13:06:36 -0400
Content-Disposition: inline
In-Reply-To: <E1Z9WQC-000356-Bd@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jan Kara <jack@suse.cz>, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung@vger.kernel.org


--j+MD90OnwjQyWNYt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 29, 2015 at 11:36:17AM +0100, Build bot for Mark Brown wrote:

Today's -next fails to build an ARM allmodconfig due to:

> ../drivers/gpu/drm/exynos/exynos_drm_g2d.c:465:7: error: 'vec' undeclared (first use in this function)

caused by "drm/exynos: convert g2d_userptr_get_dma_addr() to use
get_vaddr_frames()" which has an obvious bug testing the return value of
frame_vector_create() by trying to look at vec rather than g2d_userptr->vec.

--j+MD90OnwjQyWNYt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVkXsNAAoJECTWi3JdVIfQhH8H+gNPl7rSAmkX6j+O5vtYlejq
8/uqWAO+lSoBW5USMYvxuvR+Ks0XFKRtNlI7gWAaBUxe5AMQExPKsV8f3/8lN8jL
iquUqcOwZsVXfAVK2aAvZ2a5MKqtcnkFO7efNKJszqbOb5o3PvShrodUVAB/WxXf
hVq7tiuu4vnQm9vk0m5cAN1jm7yBCtpWZsdKewSYXMc3u1zhYWOAitdviCqCR9Z9
M58gRO4gwkRb7UATruYnbErmsKS4YaYcdVYCTvTjgTxSOlQ2yXjGsHwfISKZMJLN
MFGVYxOYLNOu4LtaQ4iV/DUSk9UwucDekcIyie68q1DGxC1NIVmthQDlMWnbhA0=
=EdjL
-----END PGP SIGNATURE-----

--j+MD90OnwjQyWNYt--
