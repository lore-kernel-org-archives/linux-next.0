From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20170518 build: 1 failures 4 warnings (next-20170518)
Date: Thu, 18 May 2017 12:31:29 +0100
Message-ID: <20170518113129.iazxrdyfyuprj2ep@sirena.org.uk>
References: <E1dBFeZ-0004Qr-Jp@optimist>
 <20170518103607.u7l7vr2rnv3rsysu@sirena.org.uk>
 <C252950D-15D8-48DB-9149-799546627FC2@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bdn57b7yutvaa36d"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:45468 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933810AbdERLbn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 May 2017 07:31:43 -0400
Content-Disposition: inline
In-Reply-To: <C252950D-15D8-48DB-9149-799546627FC2@aosc.io>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime.ripard@free-electrons.com>, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org


--bdn57b7yutvaa36d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 18, 2017 at 07:16:55PM +0800, Icenowy Zheng wrote:

> P.S. I also forgot to write the dtb file into Makefile, so it passed
> my local build. Does the CI build have different build system
> for DTBs?

I'm just using kbuild.

--bdn57b7yutvaa36d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlkdhhAACgkQJNaLcl1U
h9Duzwf8CuQ7GgxQA/eonu4O2AHxwx8/M+grjhKgbgcCz28grAf1YO30R1YM+Kgb
Gn9RKEZYudLDxjWQqmp3PDApTtittAa59u9ito9lc7YQ0Ixqq30u6F4VGR6LAQAN
TD+Vz36EQ5RYOgsXYoJeLWx1eJ/4bVMtsvNnfDxZ4Dhcfpj+1PDdZBETQCUOCa9b
NRD4CSz7CNSXMnSnGMQVKY8RO8eTYJj/0lxiSQeXCSh/Ak0vwjSrIyKHqpBV7K4O
Ac/gp2yhAuPCFj7+A83Mc6bs7VgdMg+7xlv08z67VHIdZK5uBVxWpOKW0TmjZ9FY
avq6f1XGFDoMGk5wB9S6sN+v0dSo+A==
=bwOx
-----END PGP SIGNATURE-----

--bdn57b7yutvaa36d--
