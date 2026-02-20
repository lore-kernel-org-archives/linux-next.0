Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA1725A33F;
	Fri, 20 Feb 2026 14:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771598065; cv=none; b=iFQ5XMeLVC9ZhuRvHPE0Lgpmk/4PyxtiOD3X1E912XiBBj1ORpJImKBuq+WWs9Nyr7h12SmfVUKELC1xPP47E4NEg4yn1NxFub2eufrdXW9fXMK79oeGl1rmn1kuX2To60mXaCR6B49vWOjcu0id8fuh5Ba7eue7OgNbLnG1dxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771598065; c=relaxed/simple;
	bh=3jhAA2bxcz0HUI2ttYFE5scPxkvG2WPSG17uwPrBXYc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wr4z5a3Np3Yd7Hfxz1MOOKP56xHVp+x8obeLrizya8yO1D5gTmNgNztnN0G7WPECUM62aOH4xFhQEgCAKcrSq0yeWgWkxqJMFRnsdDO9g0dy5g34PaGdZlnAVaEUU8JuRW/PWT/ugppfLiu946bXUdFxM2NB3rgZasp8O20N/fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=osPtXvkG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="osPtXvkG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44A7AC116C6;
	Fri, 20 Feb 2026 14:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771598064;
	bh=3jhAA2bxcz0HUI2ttYFE5scPxkvG2WPSG17uwPrBXYc=;
	h=Date:From:To:Cc:Subject:From;
	b=osPtXvkGmeTIo9rkofwX1zNkXWOiPnjnmK7amnGU9Ovmvk9MzjPGDR2MOP0FpJTwf
	 eNHUlyyaEyLp+XxjZCy6f4i4A1Gl0SvaqjFxOFTIAUpPsdHQCZzKjtNdDp9yDXh2fg
	 CZ6seoYCyPIZ9FZupJFi9RoE3GWiiP5x1J8MNBLlHnPcAUtRUb9DEEaJ9A8mhG5FKJ
	 MZYoFNoa6N3JJdj3F8bA+WqxQw+sfoVGRtC2nPWgic+qIDHdXvcjc46IlPpa5IbinK
	 0GrdkUyv0EDWWw5qmxMaLlpPODGfVwFlW8zZBqMHI2M6ubN9LjqhobkbG9dnurpUEr
	 fVkTIymnkeWPw==
Date: Fri, 20 Feb 2026 14:34:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Feb 20
Message-ID: <aZhw7aQrasxUI3Y2@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uYH3v4Yv/ZXrx6GT"
Content-Disposition: inline


--uYH3v4Yv/ZXrx6GT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260219:

None.

Non-merge commits (relative to Linus' tree): 1298
 1239 files changed, 38236 insertions(+), 16847 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There is also the merge.log file in the Next
directory.  Between each merge, the tree was built with a defconfig
for arm64, an allmodconfig for x86_64, a multi_v7_defconfig for arm,
an arm64 build of various kselftests, a KUnit build and run on arm64,
and a native build of tools/perf.  After the final fixups (if any), I do
an x86_64 modules_install followed by builds for x86_64 allnoconfig,
arm64 allyesconfig, powerpc allnoconfig (32 and 64 bit),
ppc44x_defconfig and pseries_le_defconfig and i386, s390, sparc and
sparc64 defconfig and htmldocs.

Below is a summary of the state of the merge.

I am currently merging 405 trees (counting Linus' and 121 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--uYH3v4Yv/ZXrx6GT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmYcOwACgkQJNaLcl1U
h9B1ywf7BXWtcWrFMUSUMqXqcCI2qzDeWrStR60sTQuCunNTqkkjT0J8m4Be4C/V
nt1UvSkmSGsN7bqmqChtv6WI++4DGo4dLzmGHy1S0ZxWf5+k5UpJwZLihjqp0xRx
G/b8IlMINoVMQkRNuTLMygDMWzhiwJkRNyqylnSYLRUm9Kut3X81yPDJqdhPZi/b
XumMiCqS+5uNWv+6fRBiO+9FGNaz5Or47RrIWZedlsvQSsF9VoQLdzNgVWkTlDHi
dU1akeeQLHkHnJq+aaSgWA3rUbIcFa8jkClEzUK9j7Y6xJU0ZjILPYeNOQMjLQ1p
n+7PT17fWOuR9Rv5//8NrDLj3LqLPQ==
=7G7d
-----END PGP SIGNATURE-----

--uYH3v4Yv/ZXrx6GT--
