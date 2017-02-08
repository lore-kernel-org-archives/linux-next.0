From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20170208 build: 1 failures 16 warnings (next-20170208)
Date: Wed, 8 Feb 2017 17:21:01 +0000
Message-ID: <20170208172101.k5slp2zw2tatrjvs@sirena.org.uk>
References: <E1cbPtA-00012m-9J@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="apqxi3tugshul4kf"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:54296 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752061AbdBHRVO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 8 Feb 2017 12:21:14 -0500
Content-Disposition: inline
In-Reply-To: <E1cbPtA-00012m-9J@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org


--apqxi3tugshul4kf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 08, 2017 at 10:54:16AM +0000, Build bot for Mark Brown wrote:

Today's -next fails to build an arm64 allmodconfig due to:

> 	arm64-allmodconfig
> ../arch/arm64/kernel/armv8_deprecated.c:359:31: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'aarch32_check_condition'
> ../arch/arm64/kernel/armv8_deprecated.c:386:10: error: implicit declaration of function 'aarch32_check_condition' [-Werror=implicit-function-declaration]

triggered by 1930faf201e83f6 (kprobes: move kprobe declarations to
asm-generic/kprobes.h) according to a bisect, though I didn't
immediately see how.

--apqxi3tugshul4kf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlibU3wACgkQJNaLcl1U
h9DVVQf+Jzmrn5fZNjx+WnDyG640/2h4QTx2Bzo8xufnxvLFoobqnWeE1QQ44ZA/
2hVVTcUihbCoLgbOqn+ZGb8xF8/wkMQ9P2fJxiBvqdQdY7K++QHTZocOvbrHha4E
3/14wMY13fGA2yCCWfval9zekqe0jIj95RZmRc9BfpfsBbn2qNoYvfpYw7wtfjZG
NlptQIBuU4KfVR9oTPVB6yiU+uDxe+jTO2AuDqmdGk48EtDID7hh8lIephEPDLl+
z35YBrXFKgP+vLxdeCZuPL2hiada8755Nkb2iHuQTjWL+moDPdZBNBEYH4PTBbU+
NVNKwbA8DnoJoDh42XTH9IQwIdvieg==
=Jkjl
-----END PGP SIGNATURE-----

--apqxi3tugshul4kf--
