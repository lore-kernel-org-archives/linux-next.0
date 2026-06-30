Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E23429B78B;
	Tue, 30 Jun 2026 17:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782841306; cv=none; b=Lg3qX7qXLBqHKpgvvyROwUFtsieWNIjeLgldtJMVpTgSXYr0n9dWsr+qLtVNcoWAeFrQ+EzgOq+UEQnS22kSew8NujTbfxvsMA7aHT2LUt8DTwu2BqH2rNBvqUKj8VJk9eV0Kk36XTpGmd/SYu1Pu0N/5GhSTDPYTmBLy9hKgfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782841306; c=relaxed/simple;
	bh=EsBN1oRHn4R9wTqH1I+S83z0RkFq6/kViBnn7ao4oKE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HQil/s+WnLEKq5WP09EBJUL+L2xWy4HKiO0eI6nsxJ4aKmEe37/fTe3hsNCKJhIKOem0Vu9WTFiqBd3kLyOzivqJ3AdG1bsUYf9PuL/JBraUfm2c9rO0ts0xu/0NQTwhkpzpZUV4jAAGDsl0Ht9Raxqkg3e4474/7LpMa65ZOVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Px83hVbF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Px83hVbF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB081F00A3A;
	Tue, 30 Jun 2026 17:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782841305;
	bh=gn1thaQbkz/Yay0OvznvX67euhP8rVwKVxSQAEwozAA=;
	h=Date:From:To:Cc:Subject;
	b=Px83hVbFkrcy+EvT2f9LciW+CS3Ng/Yo5NmvohhzLbTy1ajGs1N1/zIyBgEnr6x83
	 B6gTUsGXYOjXMJIs/di5Bm6rB8crQaCzRm3r/jLmpBLKzlmv7bj6jZOehQILCWb/KJ
	 d6YFCHUCX2AHJ5mPPaYduFgImEJZL/FaAox2heJEIG4hX+IoBCS/wo6/zIozZvZent
	 o/VGzBZ9zIi1fk4rQOlJZmJjKQCLaoO9A4izCZu1YhsksOZh1E6xz0u28fkuHrZFHj
	 iHOpYMMY5dk2H7OOxnD+4UEMi0wiPUDBc0yTNuuiMzl3gcGuMdILboOr3u/dBEQyTi
	 WQmr3yCWdXEHQ==
Date: Tue, 30 Jun 2026 18:41:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 30
Message-ID: <akP_1gGhl79dzT6L@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B6P4TWGNQmBwJa5E"
Content-Disposition: inline


--B6P4TWGNQmBwJa5E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260629:

The vfs-brauner tree acquired a KUnit failure, I used the version from
next-20260629 instead.

The amdgpu tree acquired a conflict with the drm-misc tree.

The drm-intel tree acquired a conflict with the origin tree.

Non-merge commits (relative to Linus' tree): 1909
 3476 files changed, 76404 insertions(+), 32644 deletions(-)

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

I am currently merging 425 trees (counting Linus' and 131 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--B6P4TWGNQmBwJa5E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpD/9UACgkQJNaLcl1U
h9AEowf+PyV+qp79NXqvcm+Ne1KkhYBxebA0BQAmsXcWG+j6AKLMI1wKFcO41JC1
EycQM6+ZI2rToY1mrlnA5DrOlZ8tdNFqRiJPu0lSy7O9v+sYm0DumoI4RjCkBm6d
N0fP9qD8f+UUOYWya2ORtTQm63Y2+jClSbitcv479J0DH+FOjLMl/5xRFSq3YUtR
tJRN0CxyQcLGV8FSevS9e3HPU3noamDLE90+CNGyGBpYQfBOAmWApVNzDOt282dn
t97gjqqPi83scVrkGLW3KzYQ0KbcQBTJl6hh1yPxhqXygaP1XDBljDpijDPchFrL
mzgKBBCdSur4OFSjdpfk9takHSc1cQ==
=lPgz
-----END PGP SIGNATURE-----

--B6P4TWGNQmBwJa5E--
