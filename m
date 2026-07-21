Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926EC3815F7;
	Tue, 21 Jul 2026 14:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784642805; cv=none; b=WA2WWP1UwgVvFmgj6KJaSxO3vnU5+7SWcdObSYQHBzgj6W2+FelHtakexBnUM6QxYlyBGnLydYWuTXiuQfa5XJqfM9MpziMf5xssFzyXWF8xBjW2lu50RoBzfPaDfAE5WxAdu77/mOuMkJGcJuO/BcTX2JlST7uFOTee1tax1XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784642805; c=relaxed/simple;
	bh=lTC8nUAU0tkILkHptFrqITlm45JonbtVJNnbUGtqCk8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KP7op+BKaVK3K7O9wqteco6lgUGicIQCNn6pvUNvjHENu8kl5Ccy1lB0+6QoGVz1UIQAlkFoEE74F2yf38fTCII6OR21hsJnF1I9jAzRrfdOzalqi/gVYM1jzIbTvB7wz+SlNFPmBWjjm2G5ydov/ugeSfqi5Fd3qDDGISwEZyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D1Eq2Afq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D1Eq2Afq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A6391F000E9;
	Tue, 21 Jul 2026 14:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784642802;
	bh=Idt5G772KwxjQM6Cd/5RAUT8Wlfvka+iIYZrY3DWysw=;
	h=Date:From:To:Cc:Subject;
	b=D1Eq2Afq1MgQOx80XBoKQWiQfGWEs1oObt39VxNpJud6DFNnh36vAyqeJQI2DUktl
	 wG6KVlkAyvJRjsBFe8DHFsXpcmsviBfE86ddnOAB3B754MHrXJSbT4le8ti9ew0HYq
	 8bW6P5mv49FC9e/ElzVK9/DCNGvtJKHAxRkGwCdU9IIHkDCXrzSoBXYdT1Ko/+LovF
	 0imp05Lfo0KYnGjp/AvBBiblHeTg4w39zMsMp14QTjY+wQXtedpCHfQbU7gYhIgHZl
	 viUMEerKDaxBSSb85LrsZLqmlGSLHK/0+l8ca3rK+Ho5M7iUHBPvDhl3Nq//rKsv1T
	 3J0ncQy2ImgLw==
Date: Tue, 21 Jul 2026 15:06:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>,
	Maxime Ripard <mripard@kernel.org>,
	Albert Esteve <aesteve@redhat.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <al987knJq4h66FcJ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KVSqdCw1em5yhpkZ"
Content-Disposition: inline


--KVSqdCw1em5yhpkZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build
(arm64 defconfig) failed like this:

/tmp/next/build/drivers/gpu/drm/imx/dcss/dcss-kms.c: In function 'dcss_kms_=
bridge_connector_init':
/tmp/next/build/drivers/gpu/drm/imx/dcss/dcss-kms.c:81:17: error: implicit =
declaration of function 'drm_panel_put'; did you mean 'drm_dev_put'? [-Wimp=
licit-function-declaration]
   81 |                 drm_panel_put(panel);
      |                 ^~~~~~~~~~~~~
      |                 drm_dev_put
make[8]: *** [/tmp/next/build/scripts/Makefile.build:289: drivers/gpu/drm/i=
mx/dcss/dcss-kms.o] Error 1
make[7]: *** [/tmp/next/build/scripts/Makefile.build:549: drivers/gpu/drm/i=
mx/dcss] Error 2
make[6]: *** [/tmp/next/build/scripts/Makefile.build:549: drivers/gpu/drm/i=
mx] Error 2
make[6]: *** Waiting for unfinished jobs....
/tmp/next/build/drivers/gpu/drm/mxsfb/mxsfb_drv.c: In function 'mxsfb_attac=
h_bridge':
/tmp/next/build/drivers/gpu/drm/mxsfb/mxsfb_drv.c:130:17: error: implicit d=
eclaration of function 'drm_panel_put'; did you mean 'drm_dev_put'? [-Wimpl=
icit-function-declaration]
  130 |                 drm_panel_put(panel);
      |                 ^~~~~~~~~~~~~
      |                 drm_dev_put

Caused by commit

   b71a623598d31 (drm/panel: of_drm_find_panel() return a counted reference)
  =20
I have used the version from next-20260720 instead.

--KVSqdCw1em5yhpkZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpffO0ACgkQJNaLcl1U
h9ATzgf5Adwr9uCkP59givHL6GPZ5+UsW8JMEQnGh8XV745k1dzIUTyUtzoTjH4s
W6JFzvEr9doz8Z2Roj6QB8bApC3ogiS2ADhtXRcamNL/3S+lIY9GS/aAVFfUlqzs
JKxE6ZE9QFNlrwywGcY95q2WyGb70DfLZ15HDyHDi3rZAiYNi38R/BZ7xmlYfuJT
6uvOvp7litUarT5b/cxKlMbnfyGioIOMdqaBQc9PshwafVOmOJxQErgKgLDMuRfh
2FzU6QDaNHNF4fdBDuvU1c+lASaSTiQanASPjR/lPACrFIgydh82UFCnMF1+lv+A
xtOcoGdmZgOkhs/D3h78zOM1H2JQUg==
=HczC
-----END PGP SIGNATURE-----

--KVSqdCw1em5yhpkZ--
