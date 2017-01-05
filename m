From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20170105 build: 4 failures 3 warnings (next-20170105)
Date: Thu, 5 Jan 2017 19:55:46 +0000
Message-ID: <20170105195546.wnmjwh4hazqiyodf@sirena.org.uk>
References: <E1cP6p1-0007i0-IF@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="j7tujq55kg2hrap6"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:50884 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S968545AbdAET4I (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 5 Jan 2017 14:56:08 -0500
Content-Disposition: inline
In-Reply-To: <E1cP6p1-0007i0-IF@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Alexander Popov <alex.popov@linux.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--j7tujq55kg2hrap6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 05, 2017 at 12:07:08PM +0000, Build bot for Mark Brown wrote:

Since sometime over the Christmas vacation all arm64 configs have been
failing to build due to:

> ../arch/arm64/include/asm/setup.h:14:29: error: redefinition of 'kaslr_offset'

(same error repeating a different number of times for each config).
This is an interaction between Andrew's -current tree and Linus' tree.
Andrew's tree has "arm64: setup: introduce kaslr_offset()"
(1a339a14b1f2c7 in current -next) and Linus' tree has a commit
7ede8665f27cde7d with the same title but a modified version that went to
Linus through Will.  In the version in Andrew's tree kaslr_offset() is
defined in asm/setup.h while in the version in Linus' tree it is
instead defined in asm/memory.h so -next ends up with two definitions of
that function causing the build errors.

I guess the commit in Andrew's tree should be dropped now, reverting it
fixes the builds for me.

--j7tujq55kg2hrap6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlhupMEACgkQJNaLcl1U
h9DVRQf8CsDqXHrj2mvEVv2UyapAQstu6lAsgrbKEM2yC8OiBkfC54JzsmAsXvaY
ppFVFQ5jbwZi/RPu2blFHcb5jX9Yr2yDRqH5FK5hsFGTAxF55NapxyecSTyj7Pi6
Vd5Atyo2Ta2aVZUMsmtuKLnpMIDd3ZWF4IEPua7zGt2UNXW0SuYqSdzSJuTCMrAy
KZKSz1AJxFyUOQpcQDLFmY3O+dawDn03K44QpnYCDxpJOf4b1WrkdOkHviaixBA+
dJdA1V8K4z/2Ld805E8lDkCmKiLX0gtuUSuiVh7QDIn9DS2GORcvFjm/3rRhFG3x
fk1kZZazGCuiZkIRqdgIxKZrTTJB2Q==
=G3lS
-----END PGP SIGNATURE-----

--j7tujq55kg2hrap6--
