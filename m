Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4341B2DC765;
	Wed, 15 Apr 2026 12:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776256309; cv=none; b=Ibenz6ML9xXiKtK6Ho65PyPeTomAfjYOS9j8724bunxnuiD3/TE2PK1bPca14kJhsmgVTklc3QN2YaCovsF2/fDxB80qPZyHvROQHFF5GGWDWUc/4qYonm2q/FF14OZHEMme1TJXigrdXeeWk1FCHFBsivUrHiPuVo/gVNjmtHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776256309; c=relaxed/simple;
	bh=lUsfk89EcOjtpbTrXGWlpDsKtseJkObTpiQNdBEW/cA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jok1HDrGWpyJABb+F+TXsWHbyZ1o5YD8J9IbI9UMFTBKmuh9dFPQ+Wgp5731UNDT1A3YnkcwhXas3o7jS3xgo4PlkVmZFG2wkwVbCixjGzXZ9i9iCGQuKrS+X8aWeTdk+wqrY0VRbYvYN5Olm1SFNxjOGN5cks1i0+U60Ly2GLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jbdORbUs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jbdORbUs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3290BC19424;
	Wed, 15 Apr 2026 12:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776256308;
	bh=lUsfk89EcOjtpbTrXGWlpDsKtseJkObTpiQNdBEW/cA=;
	h=Date:From:To:Cc:Subject:From;
	b=jbdORbUsC4lu6/NX5y8+SbT0dBSjKPyOpoVTeGZyk+2ghtqnxR3k1CiqTFLC+3LXn
	 8fCiIl9ChurlUerlB9ME5kTSukO02Ee3HwHUeaavkUuDOUwJRfaSBfbItUKktM/A0Q
	 4kLUwJhIx2/0uwxNrv+pJUy5m42DwZHLsNV14gxFHNh23Z/zJ7RKmamP9X1hTf7eT6
	 PGHr35BLhzWyKNO471S81UWBOSWQfFZUSdNB8KbyRLT3glBMWgNCS6zVLcEaIwrx4x
	 EgSTitELpSFLfSk45WD6aaT4rokO8N38yyjQNRW+6yWnu8dx7dtbOmOADYqa118zAA
	 V3H226Yc7nOXA==
Date: Wed, 15 Apr 2026 13:31:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 15
Message-ID: <ad-FMU6dQxgqz2T5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Noijtj+ikuMmH6pt"
Content-Disposition: inline


--Noijtj+ikuMmH6pt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The merge window is open, so please to not addd any v7.1) material
to your linux-next included branches until after the merge window closes.

Changes since 20260414:

The vfs-brauner tree acquired a conflict with the origin tree.

The cifs tree acquired a build failure, I have used the version from
next-20260414 instead.

Non-merge commits (relative to Linus' tree): 8902
 8032 files changed, 515424 insertions(+), 147840 deletions(-)

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

--Noijtj+ikuMmH6pt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnfhTAACgkQJNaLcl1U
h9C5Pwf/ZYTzQdnJRxksqACki/VCVlAxePZ8MhOG4qrIQ3UdryUHCjU5jGgr1qgT
sMCXjri/7JB3rqgFgdO0ooobmdg2x4NlTRry3bvgrkQ2UmF8oy0opL4fgyBIzbZm
1g4Y+Dk6CuP1joxPM2TmOOniogt7qm544nLHYMZcumhELSNfFoYSj+xDRVksfd4o
awHGflLQRdagZEDhr0m76Z36cwk8KGxt19HtzwZsYw7J89KLKTvMcp57y8Vttlmh
17sW/HvqHAhYOSjNwxxOHspXkEqo4mnD8jePh4ohv4WXImDceBiGG0AjYR6+DfBt
gXJ8yQAAYvV1AGAp1AIbH12AYrn4mg==
=Pqnw
-----END PGP SIGNATURE-----

--Noijtj+ikuMmH6pt--
