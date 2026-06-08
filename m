Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46FA41B34D;
	Mon,  8 Jun 2026 15:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780931045; cv=none; b=IDMc40ayMtBpRlQlXqd3DhbKlydLgaJ14o3i+1fpFe3Hj24ufKMwX0EwoDPV7hKT7efSR5x2icnUD9b1sb16JT9BpONMG+Pz/ldAh7+4MbwsBywU1Of9U3tp4fxDuo9Jvi0oi6eXDnG5acktxe35bKuaHdtz24ijD8F9e+sZxZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780931045; c=relaxed/simple;
	bh=7B5D+IaI1Fp6coLctZIsD7Pvn1VxrqrYET4nUE9iqz0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DNRozFz8PGb95oduZyKLjU9T6EGm+0BVSoVc0iqimEqQjPW+hWbrDZ3Ch/mgn5HhJmLv5OKl/GUUG6PACfqM0MQ8BSuaDnqDdo/uTxQHcZeI5cldI/vrW2a9rl+NCQAkcAWu9tT1evCO7fMjdk/i9fgUMIRzgkAMPTHvSXpRwjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9jSdu6A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9jSdu6A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D726A1F00893;
	Mon,  8 Jun 2026 15:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780931044;
	bh=N2DlOT5cTHgjZiVPg89zLScFkHEWTKalfkiupguPkY0=;
	h=Date:From:To:Cc:Subject;
	b=E9jSdu6AAmb8OtMjpqj3TCv9IPsI9e80sCKC2bHlJq/ucARnYt6fDvhg7EqkYtRUS
	 qRL4uTSK6TRAGkILBcgjJP0lq+toIjJ+oh1SWwtowMHQtOnB8j5fEDWYXE+c06G1fr
	 To+VIH0h4CWJhQNghyL9HWbigDFGYt+K/yBrTvHzZChoiG9L2m8IQxsIZf5GtmI7xb
	 rCGY90CwxJ3yj7dWbcPia2q7rt/KzQzCqhzMmLl2VXJ6IX+y4haV2VPQFWl6NyIXYg
	 8FiWN2+RSgYiuQ2VcisIrk6vwtbku9J6jfV4C7FZVwpmHmNYXeKRpaxjZp2Hkgcn3d
	 uL0ViyTaVaYIQ==
Date: Mon, 8 Jun 2026 16:04:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 8
Message-ID: <aibZ4cLxvcz_e3oZ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g4pTR+avPg5aqKTA"
Content-Disposition: inline


--g4pTR+avPg5aqKTA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260605:

The vfs-brauner tree lost it's build failure.

The riscv tree acquired a conflict with the risc-v-fixes tree.

The thermal tree lost it's build failure.

The bpf tree acquired a conflict with the vfs-brauner tree.

The amdgpu tree acquired a conflict with the drm-fixes tree.

The tip tree acquired a conflict with the hwmon-staging tree.

The drivers-x86 tree acquired a build failure due to a semantic conflict
with the thermal tree for which I applied a fixup.

Non-merge commits (relative to Linus' tree): 11020
 11719 files changed, 717081 insertions(+), 225112 deletions(-)

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

--g4pTR+avPg5aqKTA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmom2eAACgkQJNaLcl1U
h9A3IQf9HX68lZTSZr/46skdc/ZDgBx/GUKoOmwZ+PWCGAVCxW5Tm9ZNRGIAtfua
4G1c+h4CmKsdsoUgWmYl1xFai8NWWjXxgEledJxK4DZv7hKS9gF72A16lAB81NMa
+NGwBytcwOLSSqN/9WOVBJjZQcJJx1SEkHFJlRAGoKOl5WJWQHCjY7DpQ2hz2FRJ
P161O7galQSGRSHmDNIwHD+wdO5XgvybT/Yn/YbPOsa1r+LBiWHv2ALgeDUdPdEC
6NFnHrBZQBqz2hcq7uql0eyJuiPM3H6CxetDOcQpaa7B0U2h9yYhg6svObKyytJc
IRHNktY6bbQCNyjaFTWcU1RqABZlBg==
=Vu/H
-----END PGP SIGNATURE-----

--g4pTR+avPg5aqKTA--
