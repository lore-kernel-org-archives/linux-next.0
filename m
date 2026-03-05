Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555AA3BD63F;
	Thu,  5 Mar 2026 15:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772723986; cv=none; b=eO8CpqL2JVTYYG+bKvmiyikKW02IunmaXjSi7ei2IxULLPrY07UBZBbgYBTh48KZ7YWTBCXquGGzASNGifVan8xESvO39iFGxzUd/sja7qcWvpifkEkGanYOL2a8XXHBnR92bwrAMU6zzVLeluTIVPzbVXIi+QSzV8c1RHPhd9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772723986; c=relaxed/simple;
	bh=ZNev5cfAm9+LPYRnZvv5k2Gy/DdZW9rkep3kZ1zDrbo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VvRNRQoc6y7IYzSrgnRl9mdgTDMOuUoNN73j7bQ8pPl0FCE2UIA2YibpOXooTaBlM7x36WOVQC8b+3A4lEYlBphkn5vTRb7Hvraa632iRuvcpYCuv47CzwSpEO5YuU1V7y8P6J5juxyOkORWpBQV/uHZnU6IYUF/tTeXQV8x/Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tELWhmo8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tELWhmo8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9A9C116C6;
	Thu,  5 Mar 2026 15:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772723986;
	bh=ZNev5cfAm9+LPYRnZvv5k2Gy/DdZW9rkep3kZ1zDrbo=;
	h=Date:From:To:Cc:Subject:From;
	b=tELWhmo8Yta/Dz02Vztal/oTL97bCwz9yVjWVlurbOd4qUq4Vwjd2zutoarpJXusn
	 jgHgIaLFoLu9gVx0wfTiRB5matMsQsADHrQuHocFMYZTEN4yTdR0mG0wJRR6v/VdcS
	 25/Sg4SuBkemuZEg9lgzXwLzeRYnypBJUN7C5GoT47e+qlqBmGctBWvsE0mxOcQn8m
	 cuMwo4sNkN3qyvM7ZPamFY9khJgOVyQKI3FYz9QtLlUECfDDeVEX/Dx1sQRwOVmdkF
	 7F3B9DQi9n8RsMDUtaXv3J4ByL8uDq4PSZJTBdq92bRia5KO7T0J64nVq1Aptzkaby
	 bhFADqSW29+RA==
Date: Thu, 5 Mar 2026 15:19:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 5
Message-ID: <aamfDgG428dmA3sf@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C8fbDOKYuV+JzBd2"
Content-Disposition: inline


--C8fbDOKYuV+JzBd2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260304:

The amdgpu tree acquired a conflict with the drm-fixes tree.

The block tree acquired a conflict with the vfs-brauner tree (note that
the merge here is almost certainly wrong, be cautious with the block
integrity code).

The xen-tip lost it's build failure.

Non-merge commits (relative to Linus' tree): 3772
 4008 files changed, 278321 insertions(+), 67256 deletions(-)

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

I am currently merging 408 trees (counting Linus' and 122 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--C8fbDOKYuV+JzBd2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmpnw4ACgkQJNaLcl1U
h9D26Qf/W0ga6/EJZl9No5Gbd8quhYiVP3iWzhplcv1zR/FlwIvBvXlI6Ydqume3
QZWKp1ot/Sz9IIGZdipyROgGLnJ+hfRtMosXZ3/ZP6NWCbWZVtYq/og/JUOWXXDW
MdrlT1Ky/4TFokLhSI9TeDWh0t9gDNmdTVJJ9eokYnAwV4T61ia9htS3HCLAlp+c
NUh1thakqguzThGBbH5mzT9MyeNo2I2Gr9RWOUPl1RLfa4Ewu6r5/gDATTukLGji
8aKISXptofkdd+YGfevUa8JZpw9uWyiULvRqV2+3EqaFQtSPkpJqdF+c/9jhv0CQ
Mv0XalOrfVVQolvpYap4NF9F9wv6vg==
=5GXV
-----END PGP SIGNATURE-----

--C8fbDOKYuV+JzBd2--
