Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161273CC338;
	Fri, 22 May 2026 13:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456886; cv=none; b=n2FBWx/4wAnFEjb7DYRRQ2dcKH8J5pb+sKvt0PBfyqeVY9rdQMoAob/ffK2XdUil9PctbPtNhNtrXCvpxCtyzzjVMXs96FU77FUwIZEceMY6Tnj1jxDCecs43+JK1p5K+SRso1Y3omtqs+DRA/zajnulLIfJGKdh9FwVXzAln48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456886; c=relaxed/simple;
	bh=wrDElyznecD1WQvJCSPy3pjdqqDuOMLv/ES32JjIVL0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WUnv0E3BJ75xy4cdKgw8s+T+wFYhDxa2ynjOJr8zmEXo0aI+lDAkM29XYYvC9ttX6AVVubLibxsVz2aP/GSa9W7iVDjGteh4e/s9CQ2KqvwNgMhwkSMBULSoaRyL4ETA2r5H8m4dKggSc1ip00fodjQlE0rjWj04i4DKURt+YYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oQOPnK0p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oQOPnK0p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4E6F1F000E9;
	Fri, 22 May 2026 13:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779456883;
	bh=1QqCE4zlzz2p807o5XSgqGgV8aVFD7utReEfeOJJnro=;
	h=Date:From:To:Cc:Subject;
	b=oQOPnK0pdLZxZov5kF7LG/VcvymKqqw1cPyBoGlVYKpIsvLgn5zkVD1weGjC60R2u
	 n50NV12rRay9rvd2Cd9RLvOOMFOXVbxZPLCdQp5rhjiaNVZV+uqcqGG4rkAC3pAO08
	 FBKCzWNo4eI3rsggUszjSVKU3Jnpy34on+j1SBtZwop0EEq5aTJqTTKsuKDfvWHzzL
	 3/EuH9TLcUOaLvjGa7CZPF01l1HDwg66UvZo05wQ/yWSdX3u6GHz0OadovnGKspZ4H
	 ylH0mvbKd9EzOcckkT8SGm0lA2Ah0xbnkapDFj0OHYiHMve6XMfQjxgQd6eiYGKUyz
	 emgDr9mG8oHDw==
Date: Fri, 22 May 2026 14:34:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for May 22
Message-ID: <ahBbcIsbkIaWHDGX@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PVKPmwb02D84ES7Z"
Content-Disposition: inline


--PVKPmwb02D84ES7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260521:

The vfs-brauner tree lost it's build failure.

The fuse tree acquired a conflict with the vfs-brauner-fixes tree.

The loongson tree acquired a conflict with the mm-unstable tree.

The ipvs-next tree acquired a conflict with the origin tree.

Non-merge commits (relative to Linus' tree): 7032
 8042 files changed, 425274 insertions(+), 156184 deletions(-)

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

I am currently merging 423 trees (counting Linus' and 130 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--PVKPmwb02D84ES7Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoQW28ACgkQJNaLcl1U
h9AVugf/dAVyOMztgx67WOLqqrpG8xaTGZHEzir6lg/a/HTCr61Yke2vxolr9I65
LATgwfuESjoWGqQ6LXy5cqSOAHKLYTBrULpnZzC0xrcb7+24N6U8A7MElHHC6V3B
Xe0S4B/v8p6Ia4ETlLz1E3m3Qhn1JdD92EwLhnueySbhaOchrT8sTC9sG+RkfWTP
EITs3GU65f1svtHSSocGvmYkevCC4tiXLMUWUD4T9CzK3tkOYmk4Ndyo35weolRY
6jequKM9zrm+lUDmYRLR/V7Dx1VkSZd7SBkUqjTrozvxG9o1ohj11CBhfMEgy+hJ
RVFj8KfkfRTFSW8nvEtsRIq9lgGy6A==
=7pRg
-----END PGP SIGNATURE-----

--PVKPmwb02D84ES7Z--
