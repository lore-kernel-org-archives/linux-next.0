From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20170208 build: 1 failures 16 warnings (next-20170208)
Date: Wed, 8 Feb 2017 17:22:50 +0000
Message-ID: <20170208172250.rnqxq7g77ekuo2pv@sirena.org.uk>
References: <E1cbPtA-00012m-9J@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fl2zae62ox2ghyff"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:54318 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752003AbdBHRYy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 8 Feb 2017 12:24:54 -0500
Content-Disposition: inline
In-Reply-To: <E1cbPtA-00012m-9J@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Luis R. Rodriguez" <mcgrof@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--fl2zae62ox2ghyff
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 08, 2017 at 10:54:16AM +0000, Build bot for Mark Brown wrote:

Today's -next fails to build an arm64 allmodconfig due to:

>       arm64-allmodconfig
> ../arch/arm64/kernel/armv8_deprecated.c:359:31: error: expected '=',
> ',', ';',
+'asm' or '__attribute__' before 'aarch32_check_condition'
> ../arch/arm64/kernel/armv8_deprecated.c:386:10: error: implicit
> declaration of
+function 'aarch32_check_condition'
[-Werror=implicit-function-declaration]

triggered by 1930faf201e83f6 (kprobes: move kprobe declarations to
asm-generic/kprobes.h) according to a bisect, though I didn't
immediately see how.

--fl2zae62ox2ghyff
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlibU+kACgkQJNaLcl1U
h9DqNgf+Pakzo7U+L+FEI7zmJjFBPmAa106bmDeEi4clUhODchBmNaMHS0ru+tpQ
GsG7IiCbMEUykObWz6DS1hNFlpV70+muehjW8vuq6f7WfgzE37XMJIei5gvu2ss1
frwHiCkBreuAA7IJWCQopG6XMU88bJRQmrmgJjGCM204G3B8UZPYlQ6B1T22IJPk
mYimi3D8dMHagnmBrtTFrwMmvJQWrRL1Pu1HEdXT10REGQBbLdJTRn4bw5P0dYj1
yBHQTkL8ra5Xbtw8qZEujXoy/xrIuSy0MHAF1MI+tt03JiEunTE3voLDwKRQOXmy
cG1fyCufUD7MWL3c728JdOk2iFqG3g==
=I1gW
-----END PGP SIGNATURE-----

--fl2zae62ox2ghyff--
