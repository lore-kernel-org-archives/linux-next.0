Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0CB23EA94;
	Tue, 25 Aug 2026 23:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787700639; cv=none; b=l21rDIQpDXvAJPFdtKDAct/byC1NoA8MP8SSXttFDuh0HTAGjqkWUqZtUPJ9OfYZFc5/4ugjpGniYBzHUOkdQ4r4mv8OcH4Q5+t43b5C+4xUpb8UX0GQ4ZdBIjcpQrvn0upO4beT+4yEBzpHA4MMsfW365gO5kHdt45wQC3a2CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787700639; c=relaxed/simple;
	bh=FhwD2Lhw62saKFxzWwPHKQlyWlQKlUu6LBvXuNtC/Ao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ctjTV/v0ZvuJV7DZ3tul0nMoPbJyEBAkh0BZErz9LRPo45lob7ojoo9e47DRrecnP4X3IalOA7eONxOt2dj+3RoUG36FnfpYLX726sNh6dtQIMmmIUV2nsyThzuhgzQC2953ibJNBBN6OuQ3K58A0G1RcbHRdGmUllipgC/XF4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ldApTpci; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ldApTpci"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12C7E1F000E9;
	Tue, 25 Aug 2026 23:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787700637;
	bh=UthDDKYiFjnMTTaK4H33rHcgW5Z+m4/ADkeHqNHXo2U=;
	h=Date:From:To:Cc:Subject;
	b=ldApTpcitTDDZD3pKwvRVHIHADGNCyzZ6leENNHSoRWhygFXqxaSkCAABWqSZCFJA
	 YImLycog4d4ULJ6uS13P3aNkl36ov3qzf+qRqkqQRZyk+W+u7J3AyEFxWG9S2cAuaT
	 2D1uUMRUWBSpurGCajZhB6gMo/7/kCzT2oWumigK18SlJ7Obh1A8TdQBufLNz/rhmx
	 5CF+1au6ZqnteEwGbbKFD/oluHpVEnVYNDjQDjzcuQKHeZvhY1+6GCmVHZBTP9elSQ
	 XH1hOMaMoGQMnlRqrqPU7FScPOmSpDnhJV2vZUobv3ZV5g8qX0+pZimDJKtSsyxDp1
	 D3kj45sKMyDbQ==
Date: Wed, 26 Aug 2026 00:30:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 25
Message-ID: <ao4lmmsKhODIlMr1@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d1zlVXB1QfBqGgkt"
Content-Disposition: inline


--d1zlVXB1QfBqGgkt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260824:

The drm-misc-fixes tree acquired a conflict with the origin tree.

The sound-current tree acquired a build failure, I used the version from
next-20260824 instead.

The bluetooth tree acquired a conflict with the master tree.

The sound tree acquired a build failure, I used the version from
next-20260824 instead.

The kvm-x86 tree acquired a conflict with the kvm tree.

The pagemap-headers tree was added but did not build so was not merged.

Non-merge commits (relative to Linus' tree): 3249
 3050 files changed, 116622 insertions(+), 59970 deletions(-)

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

--d1zlVXB1QfBqGgkt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqOJZkACgkQJNaLcl1U
h9D+ygf+MpbRUKqjK1lsowdxbbQJyjzt8K9DeYx8caS4/RxZEUZZvyzyDqA3QQc5
RQAItIQ3pTUE6S4dI10AN6kW0RYaD/IDwlTicGNusM5fxe4WM8QsgQ4SwDEtb9TW
Vmsq0o7Vy2PQel97FdV2YiS7m16cPt7Nj12bsaAeAyG4qQiz8MolxZ3AWv7MpNss
NO+GqxF+J4Qvh8GnmHdJilbNaa98XdlJ0wK1LN+lKfSKAHbwrzqq+ScfaBU8gJFf
SGnezJr0pVe0PZGRCU3ZZa0b0ETO1i0Gf1shH4/wZDXH7d4QLAKxmmWqtKBrHdVo
dV5dGcZIrrVQhF4qtNQD6drtvGW0IQ==
=vS0K
-----END PGP SIGNATURE-----

--d1zlVXB1QfBqGgkt--
