Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A22A338F52;
	Tue, 17 Feb 2026 16:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771344114; cv=none; b=GnopCZbHG/efR5wyrBBa3r9cyrxcTLLnjJAworpwBjJc1J02fB2jvv2e29kUmKR5MEXvz6EZJ8zghR4tJ+F0y1zXm6WqADJFSQ9g7l3zxRns6A5lTgiCJzCf58ppxLy6vnKRXuKdDWdPfNo7qwM1L9/Vst58TGFfNsxKnGI/8So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771344114; c=relaxed/simple;
	bh=YOU/DtvTFPcX1+ZQzf4/Sg1szRUtDaJyK7HbPxENQWc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KapVis5QN51wQnjPgtJrGEnFh54Qa5/Z2yN2VS/5HW2+PmbimTPrZXDSvBztBbzJI2JVGYQPH6eWl4xny8nJFfxLNxPiPqLB/UlL9oqqDo7RLMlvLOWfBOuxtLk1l3hBnjVFCPq22Y6VFnxFS5nsnLkO3OM/z7TdSy7GqJeccZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KS0Ca5ht; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KS0Ca5ht"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0958BC19421;
	Tue, 17 Feb 2026 16:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771344113;
	bh=YOU/DtvTFPcX1+ZQzf4/Sg1szRUtDaJyK7HbPxENQWc=;
	h=Date:From:To:Cc:Subject:From;
	b=KS0Ca5htnYi+M3IrRT0yavPD9i0MuqGsupcrhsVJTUpofZXFylLOZkrxau0lkDrMi
	 yfyrQdQ6wKfW4ciQnp1xCdJCA65aALYMQB+OXDOm2BiMM8OniI0c6jD2ORG9PxduhD
	 VFxRrZVBTk9KUvOI7IXEpE3K8bMbZA24G6eUaUXlj20M650hS6lNmiXUwUUeUYoDsc
	 KqxL2SyiCX+yDBCV/2zEiSH+y21Oy//l6KZOzyQAvNOgkMXq3HPi6TRG5EpwPuEYSh
	 tpbsZZZvG1bZcJdLMGTgZDW1QL25ZE+Ud+BF8cg3A4J8FFO/wyRoZ/izqOr9PcAL20
	 VCxFDmkLPbC6Q==
Date: Tue, 17 Feb 2026 16:01:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Feb 17
Message-ID: <aZSQ7h2kRstIA21k@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jtq4dz/mXKyT8mLr"
Content-Disposition: inline


--jtq4dz/mXKyT8mLr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260213:

The vfs-brauner tree acquired a conflict with the vfs-fixes tree.

The mm-nonmm-unstable lost it's build failure.

The amdgpu tree acquired a conflict with the origin tree.

Non-merge commits (relative to Linus' tree): 2123
 1902 files changed, 77999 insertions(+), 35233 deletions(-)

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

--jtq4dz/mXKyT8mLr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmUkO0ACgkQJNaLcl1U
h9Aqbwf/c0vv4NkvAUixcU+Du0Dl+4a4BfMxSO86mQna0UjV4Ido3g39XM3MaROe
jk8wSz8rvK8e3S2rlBmSex5UPmKWJ0fKRfOhLKeKe/eB2h2kKDWDnuS2tec9AcAY
SfmExpulFzDSmIzM08ZI09LXrMvzJviyaO30DdImM4gz+6AX0SJFbxZywnIPoNgG
8w59lt2oJMHyDjN3G+ZxU7aRi5Qaomnm+TQ9rJLPrXJwQ6MmUQ3SHmmLKS8pVz6R
FkieZvxMKUAXWGhh4cZ0BE7QcevLxWoU8gGVbx6EqGRSeOwC4Bp4ezxvlwCXY4il
ZxgICykwx3Mx/MsHdC449gGpW++gNg==
=UJQb
-----END PGP SIGNATURE-----

--jtq4dz/mXKyT8mLr--
