Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A3B32C937;
	Sun, 26 Jul 2026 23:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785107953; cv=none; b=aSiLMMDW7+nhWshfSkwUPFyXLoNOwzkmhcs7Fccy4C/a2eRGeLiIyoMp+o+Sv4aWZSvADBQS6ha6wF+hVeLJ/WdWIq9kPV5mladKQd1ESgU6gT6LlR0J8FchEsGjX5GD65h4EoCOCvDfpaxdODEMRf7n/LvemFq11xjcCtE2AW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785107953; c=relaxed/simple;
	bh=MrPU/iIDH3sOxb6lhnklaffWJH7zzpekEDsh+x1c6Pw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PnumIeHp9d8Zj0X4lV9FEbpIgzNdi8ei1rKcp1SSNIqzt4ZfNCumMDo8hGMlxxTb9Am40Qf//3FyvMpCZnK7auAPsGZ43NxTWZ+PCR3cvVjA1/Ax8zNSsvSXzsG3albjrIrdVNxIbfqJTvF9yulMmooqPWt6RTqEB1b/RkApofE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CNxydnHh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CNxydnHh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 929B21F000E9;
	Sun, 26 Jul 2026 23:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785107951;
	bh=AcURE4n1rPCwAdnsjIkUCphG43sYr+aPoFPBc9e19HU=;
	h=Date:From:To:Cc:Subject;
	b=CNxydnHhYTxODbxnQL6/c6cNP1OUWz9GOMXUFs049OzfyFXkWnvMisGDYkCrq5yWM
	 QHApwqVJwnRFfPLavxb/HNP+7K03PvtLOUXc6lWR+jy5js/fdbO9ilpXTOEIEv66J+
	 LP99xyyHW1AVzvI1/mSRoIQNRZbvYOblFDIqAHad7IxJKI8ZElU6m5Sjhydmy0vsSJ
	 E/tInkR0y2P6WmMXkKa0b9zOwjpGGir/JMoNK7RFx608Opbo0j3BKbwzSxKAus6iNV
	 u51Bi7L+2+CIJ2dw2X+FrB12lEcwOsM91gfZWL4qLuZfI7RtHXIfknVRkeC/KhMBD1
	 LG2dZ+NaoVG5g==
Date: Mon, 27 Jul 2026 00:19:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 26
Message-ID: <amaV66xRPLA_k8-H@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fVZoSJTCTChf/yav"
Content-Disposition: inline


--fVZoSJTCTChf/yav
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260723:

The vfs-brauner tree acquired a build failure, I used the version from
next-20260723 instead.

The amdgpu tree acquired a conflict with the drm-fixes tree.

The tip tree acquired a conflict with the mm-hotfixes-unstable tree.

The liveupdate tree acquired a conflict with the liveupdate-fixes tree.

The char-misc tree acquired a conflict with the drm-xe tree.

The char-misc tree acquired a conflict with the drm-rust tree.

The fastrpc tree acquired a build failure, I used the version from
next-20260723 instead.

Non-merge commits (relative to Linus' tree): 8374
 7774 files changed, 386851 insertions(+), 121366 deletions(-)

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

--fVZoSJTCTChf/yav
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpmlesACgkQJNaLcl1U
h9ABuAf9FU9C0iS0m9gVEb9xxsrZS7wlDzegBnvVv9cxLD5rCvILDbKhR7J2FwnT
X4QCDXywq7DTWuUkC8/5Unf8OgLIsYiNQ3bUJfb2tuepAp/VP+uDe/Tq0uYt/aSj
+bnN1lRBhfW7QY6Um0t4sCV/5rEJbAzOQoWBPCszdR4j8Jn88PpuYa49ymkXzqFK
fA7EB/5A3lt40oBviT5H1A8jD9RBrGeYf33vfMR5JfG3uVr3rvnVXqZelFNnp3VY
j/1JzhSTCOET/3U11ZOPmKWYRYLnJ4VaqAskGFr0hOBCasflP5aCLXJzt0TyPR0s
yRsUQdYhpuw3U8R5F7PtJLjgQCG+ZQ==
=PhfF
-----END PGP SIGNATURE-----

--fVZoSJTCTChf/yav--
