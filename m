Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6163D35AC0F;
	Mon, 13 Apr 2026 15:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776095802; cv=none; b=m7PCj27GqilykA+t96x2ene5ukyDktWpPA3hF8wOx8/IWnC7e6R3LcEMu1CHbRbAbvlPKc7xyK1HfZv8Wp7oT3IknZrsQX6TFQsIwfYDbiDDpFOs2IKkMrJcvbDpPlxaoQx+ROX7BzoHC91UceD/363aKXyBvQ9sIG757Hv0Zfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776095802; c=relaxed/simple;
	bh=bOavX79uyfx22XjHzGxK4sVcK9dFu26uvsQA+24Ay9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CJe7ehSoaFh9jQaUQoKqcUZPFKJdZyEOL6QuleJr5SuuMCNZEJpjbekE/kaICR8HnBYW9djDPw1LrjWrMid+v38gBSLgGay56ZUyPKgPIAh8Cl9WTuAYP+rM3U/r6TzmQg+0zAxzz1XcIOvhWlsimmgImRmwsgq3SDFlORsQE2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FWiEmD+9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FWiEmD+9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE65C2BCAF;
	Mon, 13 Apr 2026 15:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776095802;
	bh=bOavX79uyfx22XjHzGxK4sVcK9dFu26uvsQA+24Ay9c=;
	h=Date:From:To:Cc:Subject:From;
	b=FWiEmD+9Y6hs1EHP9IALPzNDZw7Emr9jPJCrJDTkWUqcT2lDZ/g599BWbELRzqwjZ
	 s3bZKsZl6VMJ2t7ypABjmsMQCD1oh8jpibCJ3G6C7tabBBl9wALKotZKHB8Q5467AE
	 3rAPqyItA63c2C7T56VHG6ATaKy9ZsX+r9jXQYCrETyS+W2xbMpfO8M6evEVFhivK7
	 JyIj3qsgqLkr6HKtQaVOyvFxgpLqocv6qlmBomPf/ge0MXJGQaTv8e0RDWNgu4+3kO
	 wQBMk6o6ZgL9g0bF9m4anhpWABYolfmefRz0GGZJYMsbbaG8uYc0LvVmSI545ZvH1b
	 UvzJZO9Kf6/dA==
Date: Mon, 13 Apr 2026 16:56:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 13
Message-ID: <ad0SNjugVvkAwhok@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fz1Xk0FqB9NvTt/g"
Content-Disposition: inline


--fz1Xk0FqB9NvTt/g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The merge window is open, so please to not addd any v7.1) material
to your linux-next included branches until after the merge window closes.

Changes since 20260410:

The vfs-brauner-fixes tree lost it's build failure.

The vfs-brauner tree lost it's build failure.

The net-next tree acquired a conflict with the net tree.

The pinctrl tree lost it's build failure.

Non-merge commits (relative to Linus' tree): 12528
 11510 files changed, 689278 insertions(+), 232617 deletions(-)

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

I am currently merging 414 trees (counting Linus' and 125 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--fz1Xk0FqB9NvTt/g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmndEjUACgkQJNaLcl1U
h9CPTQf+OGmQC7Hf8hOrhJH8onh9HB84K1Tkny0kOhtp0V0FuOCGey26W8bUkgGL
F1aBwyvHsDF/d0k2G9JiKNmC0shEdMgvxmEvGBZCU3x5J6iQGK82XNXpS8CVfEFd
HYwVtmoUoS+62KB3i5d420JcAkYhV6Nl8vAi1EUICS2RsBkTkLlmowcrl1x9nsNm
RznaSxaJnyEOyYaObKz00u3geK2G6pjTXwAaqNITeAP8sklFFbeY+usBYR+GsL+f
5Au3atf/5GW67PfZD6eqSmgNSTCmzkV6nAdv8MgD9RqFXQeSHRjOIqvV4WPvMFSX
hmTUArItUEsOm1Y9n4Arc54kZnnXig==
=GRwi
-----END PGP SIGNATURE-----

--fz1Xk0FqB9NvTt/g--
