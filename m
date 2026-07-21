Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207BC381AF1;
	Tue, 21 Jul 2026 16:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784652904; cv=none; b=DK7zLuJ8bTcnoNeCKy4kcd4yhHpoVXg5rar17q/1lfn3SJA+3DzGndfD04bPr5dr/5Kt8fMkyMM2AdMgxam3ea12ourXnFX+Vv+EfqUL6hLKLrB+HbO6P8DndcaPIGFB9/OlzUl9OYAoQ/XtVwjLgMKzT0VqU96uqS1/tfU2RR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784652904; c=relaxed/simple;
	bh=n20/m09OkkSreU+A1rMSuX8rvXN5c2OTGTdBqkjs8Cs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RHFwEzT/6jYZHL1NhCqGWdDx90aEoBEikOmnGzJbmzFaaCrbsfEaUYVLTU6cLr6jPhvynfrQ6ykQ3p3fSg4nU+8+aghHmhoRfqPx2lJOVLY5uZl8FbJ+JXflQcuUYeFD1+mVvSjYZZSyEUvsl8DqLKkljRMIUsk9LtlwOwg0xn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VdhxB8cr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VdhxB8cr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1971C1F000E9;
	Tue, 21 Jul 2026 16:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784652902;
	bh=RqdEbytaUFEmcrSRViCNbUPtv2/Pa5duj6cIgi+giN4=;
	h=Date:From:To:Cc:Subject;
	b=VdhxB8crkV/oLqqX9ulRZO5fdOLns+pCjNBO7OIVzilleyy5SF0478hFr8mdJtNBV
	 0lF2TV10pT7TZ0f7yrOFFrO2tRCG4NDAoZGCX2338gPDDI8ZdtnCC9UOUxWEWJWqbf
	 5o4kPeefOaqWUjRRZuuy1P5q9jULsdQclmRO68E36CTT3rUblITwtc0GQMqqJWkUc0
	 s0P8wFA6A14/b4Ls3Xvdur9YywCbaQkwaGSECsEPJmGTndA1/qyzVab3RaKLuOp2CU
	 FCE/E2mtydTd2RMVF9P+VtQvltvEdpRdVFRzcSu06XZAXg/ckzWiRgL9t2XSyub80e
	 vJcP/RyJ7eqUQ==
Date: Tue, 21 Jul 2026 17:54:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 21
Message-ID: <al-kY9adEZUip4an@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tUDGJmIzhp/w4TyG"
Content-Disposition: inline


--tUDGJmIzhp/w4TyG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260720:

The bpf-next tree acquired a conflict with the net tree.

The drm-misc tree acquired a build failure, I have used the version from
next-20260720 instead.

The battery tree acquired a build failure, I have used the version from
next-20260720 instead.

The tip tree acquired a conflict with the mm-hotfixes-unstable tree.

Non-merge commits (relative to Linus' tree): 7469
 7082 files changed, 302697 insertions(+), 111532 deletions(-)

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

I am currently merging 429 trees (counting Linus' and 133 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--tUDGJmIzhp/w4TyG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpfpGIACgkQJNaLcl1U
h9APBwf/VhkSOvVHUDF5bfkDY3IizW57z93I+Pe5aShEPpvfObjgZ6ak3WpZe1jB
FWKRjLs/SqvqfT8iIppgqMCrjrGu6/HYtqJ2O9Dh62y7qN9tbe70P5/Un/mJRF3f
V3oqMdt/OophL5jhj25zp2QiG3Tlo2H2eeHXXGyxhTDu3a0nfODGNliVCznX5wNw
k3U57q1l5SnpQ8JHfCQk6BGHzztrFykoLYHiuS4EGabHUr62xsp58yyDu++ScZ5H
bme3UR4iZVvldoASl3n2pjWundwLRZm09EYwoN5uYnQyqr+bv1lgZu1pG4L1DH2z
NI5cK3qA99kTeE79WRT1w4T4AeWMQQ==
=I7pp
-----END PGP SIGNATURE-----

--tUDGJmIzhp/w4TyG--
