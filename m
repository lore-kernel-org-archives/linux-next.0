From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20161205 build: 3 failures 4 warnings (next-20161205)
Date: Mon, 5 Dec 2016 10:44:55 +0000
Message-ID: <20161205104455.2m5ky3hgd5n2kb2w@sirena.org.uk>
References: <E1cDo86-0008IX-9W@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cymrbzeqhjlbbku6"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:36586 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751241AbcLEKpX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Dec 2016 05:45:23 -0500
Content-Disposition: inline
In-Reply-To: <E1cDo86-0008IX-9W@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Marc Zyngier <marc.zyngier@arm.com>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--cymrbzeqhjlbbku6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 05, 2016 at 07:56:06AM +0000, Build bot for Mark Brown wrote:

Today's -next fails to build an arm64 allmodconfig: =20

> 	arm64-allmodconfig
> ../arch/arm64/include/asm/probes.h:18:25: fatal error: asm/opcodes.h: No =
such file or directory

due to bca8f17f57bd76d (arm64: Get rid of asm/opcodes.h) having missed
one reference to the header.

--cymrbzeqhjlbbku6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlhFRSYACgkQJNaLcl1U
h9CXuwf/WZKt4zT0gaFwm0IFbXk/DXM+Og+F1PKw0V1zSm+5tlrg7HJlWsrzclb2
q9NjI6XhBlLI5dVwZJ4HJFzkZHY6sZGPWGOZAe4U6WymD6XLdYohrX+BCwxOG60x
6CrFJFuboL2MxvXiZcl9Mig7DPI+5Z3sP4oJDcFaA6Lb5MJnS7fAzfrmjJeu6KPw
s1Z0GX4tsg1QGN7HIVssg7FKSMB97+8BvrBv2uYM1VrPUuR3Ue4QMokVYGBpJbFR
vZElK7xx9uYUKVWp/yXa1w+OZ2kUD2BLmmo5UpdrACW/f5V468jb7MEE6DZzV76R
3UUmem1U52ngFiXYQDObIgyge2yjFQ==
=z0Nd
-----END PGP SIGNATURE-----

--cymrbzeqhjlbbku6--
