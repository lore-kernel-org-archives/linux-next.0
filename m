Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E454396571;
	Mon, 30 Mar 2026 20:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774904157; cv=none; b=gCgnQzm+ua7aFO2vHVsAtV9fDAOU3AvM68jquIiL8zC06KJr+6Yy3ZUmIustv7qtjOjiLZ+9eghSNJ1CwvsXtJAAmo1Nu6tNkkTEaRyL3M/N4qhpGje7BUHsWMLq02cBkk+0BiISfbJC6WsBFiHhO9vUSPAwd23DrJxW6j4PNGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774904157; c=relaxed/simple;
	bh=Tko+cwFzhGvuKT7dFeeqlgrWVdQq8NLYWeGkyrjX1ys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mUpstMVuWKiTJ0U7X5tGDWomaWFJB7fqNy2P5/31Tqo17KzSa01W0bWHztdBjCS1x1NfnmC8ata1ifOMs2FW1sk7DhackVpegxswnLlqahF9L2IJ0U4B3i968PfR2SlcI9Z9dOid2RZaZEdav/Mqkoe0QvrJlxoDE1k9r1WOmCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g9Ds/266; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g9Ds/266"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DA85C4CEF7;
	Mon, 30 Mar 2026 20:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774904157;
	bh=Tko+cwFzhGvuKT7dFeeqlgrWVdQq8NLYWeGkyrjX1ys=;
	h=Date:From:To:Cc:Subject:From;
	b=g9Ds/266Aa6bODNf9xFmc81yK/lxlYk5zJ5jGwCNHCpkHdGM//JBGuCFsePJAzYKg
	 gWPRY1b1mchtbAqMIMWtvTdNNLrIVmhqau4sIw6YdHGVZvZXEh9MM9G60lYthCfo86
	 MTEr2ferOPdrwGRm5j9yvlWAW2VrpfZ9L8WCaOMUxA5VGoEOjxl30nfzxPhBcUjZYd
	 6nqGfxXplmwomgloFXa/RFSenHgkZ0s+mcTZcyA8viA2cXV7V39ZivfEaiz2bXodrZ
	 +HY5tgMmY3bE58uQuhc4y+himF7Ijt9V+y5PgwN5wJDIVWZuDhLUuc1rS/YBLSCAvQ
	 ham0fXXdgCWbw==
Date: Mon, 30 Mar 2026 21:55:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 30
Message-ID: <acrjWb9ZvGcc-YSJ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O4KaoJjdN3qH4MJE"
Content-Disposition: inline


--O4KaoJjdN3qH4MJE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260327:

The rust tree acquired a conflict with the origin tree.

The dma-mapping lost it's build failure.

The rdma tree acquired a conflict with the net-next tree.

The pm tree acquired a build failure, I used the version from
next-20260327 instead.

The drm tree acquired a conflict with the origin tree.

The drm-misc tree acquired multiple conflicts with the drm tree.

The drm-rust tree acquired a conflict with the rust-next tree.

The scsi-mkp tree acquired a conflict with the origin tree.

The gpio-brgl tree acquired a conflict with the gpio-brgl-fixes tree.

Non-merge commits (relative to Linus' tree): 9468
 9078 files changed, 554820 insertions(+), 171917 deletions(-)

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

I am currently merging 413 trees (counting Linus' and 125 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--O4KaoJjdN3qH4MJE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnK41kACgkQJNaLcl1U
h9DKJAf+IdtJ2BzpzmC8ICPBa2LppUuV7SThnQuMV8eSw1A8aImWRzyf3Dp2hjWB
rywQaKACoKz0xKXWf3D9H9pP0GG37QYmuUOCOLxs/ONf4wDZizJAMi2/VUJqPaj8
2fo0vBjwfs5V7uMoWAvL2R4j4g0JeG5V8ie4MMdTGJGlllx0/+QPOh/64gYq2vK+
Pytrp4T7E1Zevotfcc2o5JH8G4ZcSYzySctASZXZF5hjmq3o9txEv7SQXTxjG1p0
iidabhrXSQCVwy1HnN6acmxpB1NHDIjre1Tx8ITomDapSaAlK3sDuUIMW6NhqAQn
D0GR34FuJtqw6WDcDtvVZ7ImaQ+NAw==
=+RP5
-----END PGP SIGNATURE-----

--O4KaoJjdN3qH4MJE--
