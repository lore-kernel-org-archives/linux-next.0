Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5819A332901;
	Mon,  9 Mar 2026 18:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773082203; cv=none; b=YXtgxXs9nbOsY172FE29/YdB3PvAxkiDhasf7LxjqwCe1hXYWRX22+GuJczA7vUXbKUu4BaW/6JIchDuednafabIX1O4h9TrZVRjOxQVYTt09q1cJYgoT965x7UYEdtHxfUV+N+z3VRmzm1aDzPRjFNma718ULA8dSUMHkvDGxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773082203; c=relaxed/simple;
	bh=xaVyZl0vz4oFCK25WlnzgmmK1axS1wwvJNSpQTODbBw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EGJ+wDF9bhDMp40fU+GtUwkIIXK0IOpx3KBppuJdC/7r3df1kb6YADq80J2CBQ9TuejK4nETo2TFeeOK8NcXcQc9JbZoYRBgJGbrTq9h0BTe2GSXIFYKKlKTmBSTmLJJZvmJg3rZfYF9Q9cuGI1hluyq6DtVmZHXV5ZoU1DMtt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dANA4H0+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dANA4H0+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A0A8C4CEF7;
	Mon,  9 Mar 2026 18:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773082203;
	bh=xaVyZl0vz4oFCK25WlnzgmmK1axS1wwvJNSpQTODbBw=;
	h=Date:From:To:Cc:Subject:From;
	b=dANA4H0++7Y7p5MPHIpZj5NXtjpg54DYa0H6cr3tHg9kKjSlvrw14nwleibZjb77V
	 /kOUEIsNFLa1DpcZOzcO1BniaB1Lhcrn3kC9Jyy+sumBHlqIUWkgI5wimcfrOwFZa6
	 5W0DvO3FaRrKCaOqgrF8NR40saS4HW40S7bm7yfVKmWcSZzWmp4z40kZiZsIPUvAMu
	 lB3lBczWbvtOgNBC8r/eCDYrRXtJsGNCCAGmlgCqt7hQTV+2taiNxJ17cePD7PaSyo
	 tzCzROmPoGa5xYycAI6OX5+YdXvUk+oY+I57Qq+T5JfmDBRW+I7p6hp097rnck0m2a
	 k/FYj0pk2t00w==
Date: Mon, 9 Mar 2026 18:49:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 9
Message-ID: <aa8WV_KvEV_TFPPZ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5eLhW1cR9BPLe7HI"
Content-Disposition: inline


--5eLhW1cR9BPLe7HI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260306:

The net-next tree acquired a conflict with the net tree.

The mm tree acquired a build conflict with the ntfs tree for which I
applied a patch.

The drm tree acquired a conflict with the drm-fixes tree.

The drm-misc tree acquired a conflict with the amdgpu tree.

The drm-misc tree acquired a conflict with the origin tree.

The block lost it's build failure.

The libata tree gained a conflict with the origin tree.

The sched-ext tree acquired a conflict with the tip tree.

The leds-lj lost it's build failure.

Non-merge commits (relative to Linus' tree): 4261
 4408 files changed, 304357 insertions(+), 76741 deletions(-)

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

I am currently merging 409 trees (counting Linus' and 122 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--5eLhW1cR9BPLe7HI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmvFlYACgkQJNaLcl1U
h9BPFwf/WP4DTVTggz0SbPzDHdS3TFnkv74O8bKxtnWXBRbCMTFg0fRXsr36vG/k
oIhfIQXANIiFXDq3hc+sg9kFrP+yzkGyxNwM74ggwhx/04P8VLsCgV4R7qZ6SWfs
2kDwkrUCNCZB+uUhaAaAVAXZ75n1Wqx9iONvv3rZ3ZvR9GxyJSql115Hdn0/PYrV
03DOPc+jnh5W5DV75TzB3zj2mQ8NGluB7V67dBPHzBtjg7aQ2OyFgcde/46MLqB5
WyOCRKgSXWSwjH7V7cGNjwCCGFlM9J6vptHUGe3+6llsu5FbjcibSnn3Vzd9BuL5
3095AJUMGCfqUoTm4lE6R7fRxAFnkA==
=QM8H
-----END PGP SIGNATURE-----

--5eLhW1cR9BPLe7HI--
