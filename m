From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20170217 build: 2 failures 7 warnings (next-20170217)
Date: Fri, 17 Feb 2017 11:21:13 +0000
Message-ID: <20170217112113.mlkmgogbqg6nzd24@sirena.org.uk>
References: <E1ceeuE-0004r2-HY@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6hgccbc5ygiajqm4"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:39346 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932636AbdBQLVZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Feb 2017 06:21:25 -0500
Content-Disposition: inline
In-Reply-To: <E1ceeuE-0004r2-HY@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--6hgccbc5ygiajqm4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 17, 2017 at 09:32:46AM +0000, Build bot for Mark Brown wrote:

Today's -next fails to build at least arm and arm64 allmodconfig due to:

> 	arm64-allmodconfig
> ../kernel/sched/core.c:198:25: error: 'paravirt_steal_rq_enabled' undecla=
red (first use in this function)
> ../kernel/sched/core.c:199:11: error: implicit declaration of function 'p=
aravirt_steal_clock' [-Werror=3Dimplicit-function-declaration]
>=20
> 	arm-allmodconfig
> ../kernel/sched/core.c:198:25: error: 'paravirt_steal_rq_enabled' undecla=
red (first use in this function)
> ../kernel/sched/core.c:199:11: error: implicit declaration of function 'p=
aravirt_steal_clock' [-Werror=3Dimplicit-function-declaration]

due to 004172bdad64432 (sched/core: Remove unnecessary #include
headers).  asm/paravirt.h was one of the removed headers, it must be
included implicitly on x86 but clearly isn't on at least the two ARM
architectures and definitions from it are used directly.  I've sent a
patch.

--6hgccbc5ygiajqm4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlim3KgACgkQJNaLcl1U
h9Ba7Qf/XQS73wSgl96Fl/1GNSvt1M+VAMvhY6ID7L7y7VQjG2HO9M6RfZm033KJ
fzEynd476gNXANQhAVFV8Wy01qpIIDaAKc6RRFnFb92jcOa33iCugoKA+FI5L2Ic
RrUZJMofgsPOg4YFnSMH8ZndMTTXWD6ue0MGRj3J8jS0tj+j8LphYBdDfDOt7DXh
0/RBionpTY2W/sZAC5Co/BZ0wLjtwWreE79ZQBB2Btmtukf7lGUxSQdrhOCBUc5T
lHQYKkP3ActObCOKcMs3z5JBO2cd7li8HttIPrEN12Uj1EK7kf2l7MUK5oD93oMK
X68KbIsDdTmYrekW/MRaGI+qVnWxCA==
=SJUf
-----END PGP SIGNATURE-----

--6hgccbc5ygiajqm4--
