Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5401C27E1A1;
	Wed,  3 Jun 2026 19:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780514168; cv=none; b=NHzDRKaTBXRsrdoZcul+tJULVlTlCIe9hQSQFHkDM48PMpC9KYaPiuZeLBfLP07jvirEXWXYnJL6YcBJjKJ0l4NgPs2wsutyutukoaVO9MjpxGpn5HUFzUpHbZbLgUxAsL1BeVrcItdoRVBvbcIJ1fWzwWfFY7X+OmagZ0Kcf0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780514168; c=relaxed/simple;
	bh=dexnL7eQC0fA1sJbKVWifOEhhvh5jEKu44UJ06oxGcY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oTM1DeyXCgw71/YKTSiHdUfmRT8GWlcRoBqHvhxCa3bf+tDXKXYOiW/ZhxVHbAQ5vOT59KkxltmTtotdJsQUTItS9Z47RmfFPTblo4iLGGp4dHoXssorfYSOkOhTOKg8KNvABdXrOhBzA4Ead+pVyPCiZ0SQ55VfNJVcZvjRgpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f0KFLTpF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f0KFLTpF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E8431F00893;
	Wed,  3 Jun 2026 19:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780514166;
	bh=ksMoa0F73pdNImxKyG0LG7l6wtV5gvTMGbr826jyjH0=;
	h=Date:From:To:Cc:Subject;
	b=f0KFLTpF9cwcJOP4IAPVvUXyDZNCYhcGupDse1SKsoWuVg5eo7Q9fmin18j5cgtFc
	 1Hs1HIANTxmCN+knOsSQk8/9icKyP2l8LTNWSwn04H9giO/T3RZb+/dWWp2WoSiZ+A
	 79x1lJQES/pCv0m3zHFYIX9YUpvbyz8ux66m48FtL02JRE9xCF7udQ1rbf+VCsDrk4
	 vPGw3xZ+Cw0yMKofB805kE5Lz3pKDGW3ydZbQwuECPqmkv8T/845hAJYLysdBhW/XA
	 DeeMJeDBZUfSWUKyc4Y8azHjVP/B/7a/EtyU24XluSwUOwlLbEI66QYdoYdmClrHbL
	 kYbs21+xC18gQ==
Date: Wed, 3 Jun 2026 20:16:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 3
Message-ID: <aiB9cxB2w3-6pAMz@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v7TIOeDE9WiVOzSV"
Content-Disposition: inline


--v7TIOeDE9WiVOzSV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260602:

The nfsd tree acquired a build failure due to an interaction with the
cifs tree for which I applied a revert.

The mm-unstable tree acquired a build failure for which I applied a
fixup.

The arm64 tree acquired a KUnit failure, I used the version from
next-20260602 instead.

The imx-mxs tree lost it's build failure.

The v4l-dvb tree acquired a conflict with the origin tree.

The net-next tree acquired a conflict with the wireless tree.

The tip tree acquired a conflict with the pm tree.

hornet is now marked as BROKEN.

The drm-xe tree acquired a build failure, I used the version from
next-20260602 instead.

The vhost tree acquired extensive conflicts with the mm-unstable tree.

Non-merge commits (relative to Linus' tree): 9652
 10621 files changed, 561035 insertions(+), 206347 deletions(-)

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

I am currently merging 423 trees (counting Linus' and 130 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--v7TIOeDE9WiVOzSV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmogfXIACgkQJNaLcl1U
h9CDxAf/fqK45QnBmjxPBARXpsKlXkBVzD+yY/Wdlzaf/VCuu3pj7qb+WbPj4pMv
AclIc33kjqTmBiTJi/8uKcN+wTEdmUv0YpJ/9x/4BRvaC5/n8m2A9NoxjgX8jdIv
EcaV9gohjbtI6WzT5EEEFpgX9KMW5b223SxJ/1SY1myZjPxN0QzYkzGt8vxQWLFb
D5S2/rYvFBdlRDy66effrO+WHq9zrVy75/rysNucWpdiMbJi33KLZlKPE0+f85EC
AcPv3nD0BS8DC9fx8dtOnur4U5kwBKvsoieJ4br4mQepNCoMlxN9cYnkDaHuvsez
j4tgMF3lU7pq5QOk5gXbBRxKn6dA9w==
=YsYY
-----END PGP SIGNATURE-----

--v7TIOeDE9WiVOzSV--
