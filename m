Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F88393DD9;
	Fri, 27 Mar 2026 22:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774649163; cv=none; b=faZq+yl5D/sGey7XjwiCx4+8YzRZE4SuC3USY+EN66Z7MRkvqxiN9q8d9VzaJydqGpQzkhE5xekyIrWYzy1vruA4Exqnzobj7CfsIRLFSYsFJy9vqn0UjEEG7f11F6TaxEajNxrc0E1BzHvl5JNfOO0PEwYpTLpD4JYI52a1hW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774649163; c=relaxed/simple;
	bh=m1HETNHfdCWX9ou8HwqN0ebdnDbaGrn8udlSrnI3Ieg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V8BJDc67OvlhNvWBHUzzzVp+/h0vTvU/af26CL2iULttEVnMBgVFbZvaXU0rGD8dYuaXMrbrheAz2H15o0cZHGDGZmOAbDQu/YmhZo9m6b/QCUzDZiNSIpl0727GMmycme+tTWcceOiwE/4b5w8DQ4rFj4QhhHVzI126GHtGihE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VW5sgFAR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VW5sgFAR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ADCAC19423;
	Fri, 27 Mar 2026 22:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774649163;
	bh=m1HETNHfdCWX9ou8HwqN0ebdnDbaGrn8udlSrnI3Ieg=;
	h=Date:From:To:Cc:Subject:From;
	b=VW5sgFARvMhR7GJgKbH+JqaePKYRW16KUiK40k7WY9U1uv5UoM++TmOODlMRPaB71
	 3Y9rfAS21amwzRuFxh3Yk2b3q/wHb6cO2551YSamle5ZE4W3UaT3+2q/s5b/W+ZjFp
	 PnHw9dCepKMbrbAuBBAvbyyqQvIpP7tSCM5PAmxXkwEpmWlmL73fF2ipsDaMc2u77d
	 W/6CDTUwv2pmSQSpRhBOiMfx3530SFVrAZ02uBOwusKHpt+m0aRgj0+06ccd9eq3ui
	 tC7zFt7Do/ThqLGACEdS12W+dij1McBNMGTSc0yZoZh9B0uvyuoKzO5RzAF0TWYNI1
	 pUxzWGYTESPUA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id ADFA81AC589B; Fri, 27 Mar 2026 22:06:00 +0000 (GMT)
Date: Fri, 27 Mar 2026 22:06:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 27
Message-ID: <acb_SCAzAHPms4S3@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ojizP/vFfO7O0Z4S"
Content-Disposition: inline


--ojizP/vFfO7O0Z4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260326:

The vfs-brauner tree acquired a conflict with the exfat tree.

The vfs-brauner tree acquired a conflict with the ext4 tree.

The arm64 tree acquired a conflict with the kvm-arm tree.

The exfat tree acquired a semantic conflict with a mm change which I
applied a fixup for.

The dma-mapping tree acquired a build failure, I used the version from
next-20260326 instead.

The pci tree acquired a build failure, I used the version from
next-20260326 instead.

The drm tree acquired multiple conflicts with the drm-fixes tree.

The drm tree acquired a conflict with the origin tree.

The tip tree acquired a conflict with the mm-unstable tree.

The tracing tree acquired a build failure in the final build.

Non-merge commits (relative to Linus' tree): 9270
 8901 files changed, 537418 insertions(+), 164520 deletions(-)

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

I am currently merging 411 trees (counting Linus' and 124 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--ojizP/vFfO7O0Z4S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnG/0cACgkQJNaLcl1U
h9BnFAf/dzw+Dd5V/5SV+luZ8KYSj6GYtNlV6BGSW1Xr8kkQri5HWcjgNKbyZq/v
s9/a4rnaIOsTJWqeZqxPct+PEZV3YB7H+ITLkiyg1hNtRu8syi5MnyUnH+WJPHXs
CKynMzvr5CkR6zInJrKbhBQbx5KYfXDnO8kB6rEn/z9Gch5Q4dgpAs/DqdGQTxvc
ZMM/axefMojZc0MU4IaXTo+HOAFXqx5r/hgJMpnJt/DZ1oA+qiEEVdBE6GPxJKpb
zamtdru0ILr1kVQTULbVg3OGbeOSepHEk3aklRtrPSzh4XLGxaFN8d+grz3hfze9
Ze+qUzh//2sePBj2K/u8nAYPwqEkSg==
=ZlxD
-----END PGP SIGNATURE-----

--ojizP/vFfO7O0Z4S--
