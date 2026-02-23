Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066FB37D124;
	Mon, 23 Feb 2026 23:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771887854; cv=none; b=BHdtQ45j6RkOSgPk04qeiu8gm9wXKj5YTQ6A6MgkBfQlSvIsmEG+vHLZZ3rxY4sRKW8Qi79h6q3PtaZEYjcH6Hd54OuBavi5B9J8+13ZV/nfs+KxMmQJd51dC7TE+AgJwWitucYnzFydfH97pJS9HXLBirGiL0JaUUzwZW6GFko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771887854; c=relaxed/simple;
	bh=ROUYNWNjjJpqmE2JdvS/+Vnr64kj6y5X3kE9vdtUWT8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fuIHvLgKeYUrYDpwXoPt1VdedE6+tgezMWY9+b7NS/m2j3nvyM8eDyiFJxobB45I69w1p7CyGft3A30dlIb67DZt3t41Qjj4f0rSTLPpc2huxQ9v2P8EH4GSdkKZGLCeEZbkCkz9DqMesArMKNmG3jjN/g2HvHRo9CBN4s6lxeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mRhw+1wY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mRhw+1wY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04416C116C6;
	Mon, 23 Feb 2026 23:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771887853;
	bh=ROUYNWNjjJpqmE2JdvS/+Vnr64kj6y5X3kE9vdtUWT8=;
	h=Date:From:To:Cc:Subject:From;
	b=mRhw+1wYBXWdot5feX+ZjjRBvGecg5Tjz8Q3iR3d/PSEkh3tDz7jxt5sGcvX56xdW
	 tY7jdX6SCzDJOTIBhwJCFzSqFS1DWo4fQuHy5vkIwxUk2ehONV/4Xjjso9LumwoGzb
	 wO+YdC/H2oCRv8lc24bi1KgWGcJU8MzpMHJiUiy5KYLq6Weibvcy+wLrOQuUI4s/Fi
	 9RCKWHu54n+Ntwwo9EkHsvCBphqsiiIlCTehLNMIieK/mNKQBgwNYj2YhQvOnceExw
	 xHPpXOVPNzi+C9E1ETUj4WrZp0CVeNK6r+ATW2GlpBmRh/DcH+bSClrOhT1mIBRQNU
	 wVlJk+Wxp4kbA==
Date: Mon, 23 Feb 2026 23:04:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Feb 23
Message-ID: <aZzc6oc538KyTPUB@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2RD5moD33G4V3uKK"
Content-Disposition: inline


--2RD5moD33G4V3uKK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260220:

The mm-nonmm-unstable tree acquired a conflict with the origin tree.

The drm-intel tree acquired a conflict with the origin tree.

The drm-xe tree acquired multiple conflicts with the origin tree.

The drm-xe tree acquired a conflict with the drm-misc tree.

Non-merge commits (relative to Linus' tree): 885
 828 files changed, 18023 insertions(+), 9574 deletions(-)

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

--2RD5moD33G4V3uKK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmc3OkACgkQJNaLcl1U
h9DO7Af+JIbdvJSjL9lKjindJCmELKQGeDYHJgP6znGFxgXpCbJCgARm47Kdo3AP
nPJWw59SWgz7fmic10WuEbmHSzdKVGctupWexJ+O9nYlTBWwKTTIiXesAuTifaxs
nIPDlI5+esuAmsp3FRQM0Hholm/2jMbj8ai7DmwmhvoYn6mjlJxpHsB59LpR1bUV
QpI+R96KpH8QutGPGpHTEuupEjtwxjq5AEtyo9iNnVXyvNdFqRwL/KBidDXTsMc5
Ki95fW8hneybKdLknJjMQbLQ1iOq3bqeQ7q0n8UZr1nHVmfMYHvXZWL2LYCdjuQd
oktWSJSU1YQszqdCcHrX6ExSnb1ESA==
=KjRi
-----END PGP SIGNATURE-----

--2RD5moD33G4V3uKK--
