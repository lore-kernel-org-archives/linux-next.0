Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CE31CAA79;
	Thu, 26 Mar 2026 17:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774545733; cv=none; b=ibrIklcIAJDfMxPPOHK8YxjZ+bzez1NhV+2fHFRGmMlVPDrUkf8Sh34Sw0us6wvphn42I77zIn+Eqbz49N+gHDasv1sY63XHiRZJA5P5PhmZskg6jnvsa4Yx2ZOs+aud0wFpa2H9n4cAzlpQXqlECZSksHzp27kP596VtNDKjxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774545733; c=relaxed/simple;
	bh=Po30uZJHwWW/yRfqzKAqqPLpVK+6xKGRq0miqdWvEcY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o6b2PPUbWRN2aRwoWtcH0elrJ8UZImVzwK6dg4nFQXFmozFcPpPcLMCKMi4244e4eGI7aPJkbvZ8jQLom0NDb86/gTEBzcEm9qQSLMIQIzXODCMTba1wFkwBTIHNlV2PDZahhDthhV5hWjRgOl0FomoNfMdDp6b1HkqYMVMFX34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=peA5tidb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="peA5tidb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C89C116C6;
	Thu, 26 Mar 2026 17:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774545733;
	bh=Po30uZJHwWW/yRfqzKAqqPLpVK+6xKGRq0miqdWvEcY=;
	h=Date:From:To:Cc:Subject:From;
	b=peA5tidbA4oONjPfb5nUEsT2RuT7XWRLNndxgB6Mx681PLCpHnsNhiT5vG/dvxjQi
	 3yrCllTz/kl+KGQVp5xrJ4UxB+e+XujNZUbc8X8keten6Xf5pp+2mZWtd9AQafy5AE
	 eeSrb8rNMg3B/lGhMtYFKZR092ufhmNGthmtkOxFJm18SFOmBXHJ0dAjs4HkymbICb
	 ++k1kwa0h7cXuYJtRGx1/cKTldFsZnpFu9q/0YPcSVTSO+gcNka7LsH6darB0jTa2m
	 ZwQ8A1H2ye4Gl/ZshaVxh2XkKx1LMWCMUlmvMR4r2EpcOawTowrjLTRNfCE4DPyXxo
	 SHOiQ8ZM8a8LA==
Date: Thu, 26 Mar 2026 17:22:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 26
Message-ID: <acVrQaCROCa7x3NI@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h0LPxyKMghUduTHl"
Content-Disposition: inline


--h0LPxyKMghUduTHl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260325:

The drbd tree was dropped.

The input lost it's build failure.

The bitmap lost it's build failure.

The drm-rust tree acquired an allyesconfig build failure which was
ignored for today.

Non-merge commits (relative to Linus' tree): 8905
 8629 files changed, 522226 insertions(+), 158588 deletions(-)

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

I am currently merging 410 trees (counting Linus' and 123 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--h0LPxyKMghUduTHl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnFa0EACgkQJNaLcl1U
h9CiSAf9GS4w4NFwQy0K+DZFlpPICWNwVfPHUJlRz0a8eGclRIhvFYjzG/rMq5fZ
IB278HaHDIQuG4kl/5txOEG/uqs51ZD3pnknE3Bs9dH36WCfqN3keR8qS4gxg3ZP
WDfgUFOYIDn3J9XRlOxma8YKUPiQ9R34EpUn4s+1ww7ofoM8PPvucZo+/N8BG/Fl
XsAG2emExwrS4g3snN6jL6+lkbmnkne5+sk3eWNgQiEVWQJjitFPUOVGboo//7Br
teCF8zN13El+RnmnNgtigjWKY3TYd1S0UzXjC8x3PWyMj4WmlfmtyYLvjs+NY5Bt
gmYoXCGTM85Sp8odDQlPqf08t7CltA==
=PiqO
-----END PGP SIGNATURE-----

--h0LPxyKMghUduTHl--
