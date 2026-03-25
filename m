Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A0831F99A;
	Wed, 25 Mar 2026 19:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774465595; cv=none; b=oJguGU6nVw4rMJh2ZTRhKrQHIxw9UWVO02sq6tYl6h6sI7GFWc9f/KtAnihjnxfUapDNc04pP2j4aGkQQTOZrhQHeFATJ3/HB7Xvprl33JZc+SoYfIZg43mxB6vvhObEfDFudMluO2HN/GxtYE7eRSACxtbmZq8fDyPRAtbw2YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774465595; c=relaxed/simple;
	bh=sfbcdyIzJ+4df0Jofl4AWYq6oeSg3Qdu6aFNnxkTvik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p07bU8ae/EXBKelXfTkCfzBRIBKklNq+1aloa/01ql6pCbVoUapk68qzcFWcb52zHC/BadyIfE3iGb59x5+70N4cu1kZg9jLmPztSKjqfl2uJcekpaQzInbx8atFPCSbWsikHHLXGsmq6h968tjDVuSFlyiEQRcZUdhqsLNCeeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qKULZwmO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qKULZwmO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F082C4CEF7;
	Wed, 25 Mar 2026 19:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774465595;
	bh=sfbcdyIzJ+4df0Jofl4AWYq6oeSg3Qdu6aFNnxkTvik=;
	h=Date:From:To:Cc:Subject:From;
	b=qKULZwmOUvxvSGnUSgMc9IvYm3/vNKOHhwbandDRQk95ZBAEBVSvljwjfhf2OqW4u
	 09JvA6l4NS83S+cTcR5404S6ya/Egi8UN2Dkhw/D9+8OIeMkmRms+tP1joduoI15hK
	 WlakcBKa/rGaA5ylR2qU+PGFlb//5MtfVtX1De7kZrRq/JMjaaXXF+zpFvrCBoh0mc
	 Gyv3gypqUAYuoi2re1m+e0UZaqY27fvo7QEgZ18rDRup0FNX7KFF/8S5hZa3KcoBNR
	 ef4d59B/A3r+cdUpGWjt6VQcuv7aOGIN2lAPG8x9bxwc2SMiV2mh5aPa0FAf5am9iY
	 Xibjq9EVjjtbw==
Date: Wed, 25 Mar 2026 19:06:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 25
Message-ID: <acQyN0dtHSsOaFuJ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Kx/uz0NvzXqNiSGo"
Content-Disposition: inline


--Kx/uz0NvzXqNiSGo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260324:

The vfs-brauner tree lost it's build failure but acquired a new one so I
am still using the version from next-20260312.

The vfs-brauner tree acquired a conflict with the vfs-brauner-fixes tree.

The fs-next tree acquired a conflict with the mm-stable tree.

The input tree acquired a build failure, I used the version from
next-20260324 instead.

The block tree acquired an extensive conflict with the drbd tree, rather
than resolve this properly I marked the drbd driver as BROKEN for today.

Non-merge commits (relative to Linus' tree): 8440
 8271 files changed, 538720 insertions(+), 161995 deletions(-)

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

I am currently merging 411 trees (counting Linus' and 123 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--Kx/uz0NvzXqNiSGo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnEMjYACgkQJNaLcl1U
h9Bqagf+IAVkczQXoA0kmJKz51NGYu+7q+7y2ZWjmXbD+xT4fobNvqrkeziEUuBa
+GWjwIiyVSrSOIHtymQpqG2BrwEIs5yKY9aFmquDb1a/T0+Phv0jsOOgOTK/AHEU
jUD2dEsfV3Z/5tGupqyuGmqiL4Fz8W2/2+Jff8aShaq68vB6E+vrm2h5otc9DhSK
YsS01yxaaLtGp9uSpBVrPNGx+iTn7uyCybW/CkpSpaR7Yi533pbeB2ZPRzjghE5B
qImdaORZC4CEOhMtvdSU0nTl0BZv4fRb7xu0nAY0iavUHgzUReqC13JzOhIuR30t
OqYR9dcqhpAVaavIjSpK+9ZXzOfLag==
=73pf
-----END PGP SIGNATURE-----

--Kx/uz0NvzXqNiSGo--
