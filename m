From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20160210 build: 2 failures 4 warnings (next-20160210)
Date: Wed, 10 Feb 2016 10:08:37 +0000
Message-ID: <20160210100837.GT13270@sirena.org.uk>
References: <E1aTQoy-0005cH-Tr@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JHjDRUnf1JOMxzko"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:43470 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751645AbcBJKIt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 10 Feb 2016 05:08:49 -0500
Content-Disposition: inline
In-Reply-To: <E1aTQoy-0005cH-Tr@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Pinski <apinski@cavium.com>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--JHjDRUnf1JOMxzko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 10, 2016 at 09:12:25AM +0000, Build bot for Mark Brown wrote:

Today's -next fails to build an arm64 allmodconfig due to:

> 	arm64-allmodconfig
> ../arch/arm64/include/asm/processor.h:183:15: error: expected string literal before 'ARM64_LSE_ATOMIC_INSN'

due to 52e662326e1e915 (arm64: prefetch: don't provide
spin_lock_prefetch with LSE) which adds use of ARM64_LSE_ATOMIC_INSN but
does not add an inclusion of asm/lse.h which defines it.  Most files
have an implicit include so build fine but a few don't which causes the
failure.  It does add an inclusion of asm/alternative.h which may be the
best place to add the inclusion.

--JHjDRUnf1JOMxzko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWuwwkAAoJECTWi3JdVIfQTJwH/2htIf2xNaKLuO3K3M6ye77Y
Oiu6Pu16WHvA/Smek9Z5AswBmXe/E9oITwVrn8VwyzKQi2yNE2uUUEuQ0m+Y19T9
lOEPfk1fSuJdml/N8J3b8C9WaZ7Oo3ca2sVkm25EMe92K8AWRPh2Ox25fTmuLvcU
eK8zbwtz1HdDPJeVLwi3Ai1sNPgHzgP9/sfLZffgHG1hHzdFVU4sdMBCaZ8VHzIf
FiYiNU2mWxMhMoINdB1Fodphc3QbgZaRasbmR5YF83pSKIO2hYsIOxbajUUajCgs
xnxbnHcey4Sileacaw0gxC4b7J9GKLjNbZQS5W3bgx90MhksgalpbPbH0zEQHsI=
=DdT2
-----END PGP SIGNATURE-----

--JHjDRUnf1JOMxzko--
