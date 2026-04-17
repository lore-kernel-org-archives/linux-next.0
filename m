Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9A13A1E66;
	Fri, 17 Apr 2026 13:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776433299; cv=none; b=VctpeYPAV/dQDX13F2itX+ubYYfHRzy7gasdkNijcQOwv+zPnh6mo0xTEofi65CmEm6UK2ODzzz9zzf89ROJf7CH1rZDrYWDjrtyQLtr3LJqTxOpxDFOA4XU1tC/jk10CCf++uNCM0GZFWEcqa9TDAaUdYfgbPmgCBY5FQg3O3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776433299; c=relaxed/simple;
	bh=moq7qX5nU8b/I7j0I+iRZ/+11yNcSglNPh/iq5Cmz7g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aL7kLNIspmY8JvP0/yPzW3tdPxgZViUpcP98ou/Ecwh/O9sh0oGWNk3+wttnYKZPY0kWGj5zLAm04Uov3aZCIuSa+PqBSUoO5ctmhjrbXE0qggzcvn5Kme6f1sNh320zWuA3PYiNDE2zDP2Goc2+SJH73LeKJbPd4UQS5gsdJPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Td23RMO/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Td23RMO/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AA2CC2BCB0;
	Fri, 17 Apr 2026 13:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776433299;
	bh=moq7qX5nU8b/I7j0I+iRZ/+11yNcSglNPh/iq5Cmz7g=;
	h=Date:From:To:Cc:Subject:From;
	b=Td23RMO/tdX5t8v3exXVzsgRHVJv43fum9s42fkkC0wCMsUjb9Id+xmnT9iWydKu4
	 Yph25IJc5ihQNWwDM7xoUbJ/zLYBEIdGQtABZFRhTOe+eYj0l7CahS8IhVORhm1gwn
	 Jth6uL/uGtRTk2iILQi+QnTqtjZGJ8MLZMSRUyYpvWmRI5k9rwgH9gILDiF82rUBbd
	 R91n6dUWrV9AXgNICModWKTesIswdtxODDJYXR0NV+5doeV0kZjNQ3VuAcDCC+We21
	 Y5YHwPbAZK/Oga9RroHU0unqAH4QPCdlYr6nCbGoxheGE/8TZU5Grt4uAld4c0BHI6
	 EQfbqHi9fYv1A==
Date: Fri, 17 Apr 2026 14:41:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 17
Message-ID: <aeI4j3unk5o59PKu@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9dKVCZ+CNohX8Zbf"
Content-Disposition: inline


--9dKVCZ+CNohX8Zbf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The merge window is open, so please to not addd any v7.1) material
to your linux-next included branches until after the merge window closes.

Changes since 20260416:

The clang-fixes tree was added.

Non-merge commits (relative to Linus' tree): 3716
 3543 files changed, 180497 insertions(+), 57690 deletions(-)

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

I am currently merging 419 trees (counting Linus' and 128 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--9dKVCZ+CNohX8Zbf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmniOI4ACgkQJNaLcl1U
h9C2EQf+M9g4vQsu20/ytLy9NHhoRncLfrTf8/39WrCNsDXIXYtE5mLUV19ig7Nt
XjdRyX6Vctn1cDpmRUYEiF3/eZ6Lq4YGKhuJL3mD5hjo2LiY5C0mQO+Wlex1jdjL
VxSRkrGjELUqapx8WXj4iR9kp6eRq6HC8N0vSs8gy595++GJYUfQ/5wCNZ01QiE8
pqMr5DI7Iq3Z/vbdkwQjLL0EZpkq7mI7EhlrBhuBIGnnEYPf20YoG2dTOg/VW+b5
QeyULuMQfVJMMZfZkn51vWIUXO7zJKSNQVsk97ZPf2o0gwKagi4k+e4xaGC2ya0L
KXEDZprYIOKpVT1thlPqVnc0vwiYJQ==
=CQcJ
-----END PGP SIGNATURE-----

--9dKVCZ+CNohX8Zbf--
