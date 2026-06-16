Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2375F2E7367;
	Tue, 16 Jun 2026 14:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781620266; cv=none; b=k4fu75lOplPJUzEZFFE20nTy9RdoIh4orSiy/HXWMkPOfTDpTWJHb1aauuqZ3I+d3AYWTSWhKju79cZsgu2LSyB3L4Mjzd2TdcLbRm4Kv3HRP9q7nF7I67rXvIZPr6DxKPm/p0EcUUeXcvKi2UzUFcL+wccfoKoPhIviq3/Q1rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781620266; c=relaxed/simple;
	bh=BsD5ypbt7JGDWD22xwFhhS/kMy8x+2PKOxN5d47Drsc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Es8Lg1MT3uGe4hAAYrSdcP5KXCflaoA8ZWWnxXi/GaJsQS500PKhQ9u9DyYOkXt5U5ZGi2T3rRUVsqczWZem3dlf4lkJ35JCXcGBVIWieKwXYY7uCoJwqVk5xO9afWYXrUFE9j/Pju40zR7j6AdllSy0x1hvz1/lMOgC7LFLj70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GKkZchAs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GKkZchAs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CB3D1F000E9;
	Tue, 16 Jun 2026 14:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781620264;
	bh=OumxzQs3amNu6OnWqPOjmAzKKAfu8I3j2y+6dVo7+fo=;
	h=Date:From:To:Cc:Subject;
	b=GKkZchAsjH4hE70tE5JPeaOuRuEhTruA4E2jignd7vJrp9PwWnYMNx/2XdyGUlWaD
	 QunUdEwOddKdaPzxFR+BPAZ6MvQQQyeG0Ccz8tsLcPdHbXZDy6iLs6bIkfzCqakM0s
	 clqGwZLWi1wj0NtbdizYXFmSmLCJ+s3QBxLvPeB4+2YUTgNMCvgZdxR9qsRE3pdA1s
	 T+uD231y8Uc5YiCCd37HYioFC1e/xHvk29qLPZm9UregaMg3Dv3uW7I+9gPKKw8LLw
	 nMJdw0OH9vkccKpix0NUxBdyYbJ263P6Tg6RoYsHNNersEw+EB9PkpqwsK5fhtC6dT
	 9J1uwXmfwBhaA==
Date: Tue, 16 Jun 2026 15:30:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 16
Message-ID: <ajFeHU7nyGOwKOUr@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WA9vzeW9MpvNuzCG"
Content-Disposition: inline


--WA9vzeW9MpvNuzCG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260615:

The drm tree acquired a semantic conflict with the slab tree for which I
applied a fixup.

The block tree acquired a conflict with the origin tree.

The slab tree lost it's build failure.

Non-merge commits (relative to Linus' tree): 10529
 10805 files changed, 726221 insertions(+), 208651 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at https://www.kernel.org/pub/linux/kernel/next/ ).  If you
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

I am currently merging 425 trees (counting Linus' and 131 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--WA9vzeW9MpvNuzCG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoxXhwACgkQJNaLcl1U
h9BnJAf8CkWy81xWqPxvFsKiMOrx+8aI3VV1g5r488F31BMXV/53Wc3Yky6em4Rr
8NcDxzpr0g9Mocs1hREYwSq0c3msgjSgqw2cWXhJSCvSwqBFjwsyBor6oOf0F7A+
fjcl3Ii/AmgDDPhQzQ7meGo+kpy1dZthOrRE7bX0lbElLZSoeq7ivNTeq0AE41LB
9biTH+7XroTWDxt77WbBpbOUCTLoISmTL4RveAGV7rYhSTZphYwswFrvQmFpOag/
gNSwLru61cPbOyg7aa1EgF9vfBxSlY7FL6gI6CjHG2R/fZgdP3zPuOH8AWh/CiXc
dGE2e6GCOoFk/Ly3i971X3THrHiBBw==
=vJZe
-----END PGP SIGNATURE-----

--WA9vzeW9MpvNuzCG--
