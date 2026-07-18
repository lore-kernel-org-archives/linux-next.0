Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DAB4C92;
	Sat, 18 Jul 2026 00:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784332951; cv=none; b=pP6bs/DJfbZWrfppM1/i9EAk612+nsjqkRUHgL59kqRpJTyvkiOvUZlhOYtxdc4e8v0Kzaem1NS5ujwiC2zgafONGJJcC/kLWVhUjJY33o1lrVsz2Za5EV8cvd0hobeZbr6vFR5WyhltlQ599IKz7KyYCDCr4jSKA4zGqUfQQis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784332951; c=relaxed/simple;
	bh=jaChfUuapI/JPxFdDYr0pB9n4Yf7qQ4tj9cARAfAPBc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=svSeDLX1OLsMzpVVYr5ULFsvJGj3iHC0P+8ujpoyyPDRSNxQYW1bTwtNHDVWQuQfTPQSUzcrfvzAdkOeAC+X1Z+G5ixvlzk0N55Uy+48ZHgIbvR/PGH4ms70eKpyLrc3hEhqh25KRnygDH/xKEDvx+ylOFmRUpDh7zW3s3oFCao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jzfkj/Xp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jzfkj/Xp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B57B1F00A3A;
	Sat, 18 Jul 2026 00:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784332949;
	bh=yUWlEknKxh+/qZWlc2yc05zb/ZURK9CTRBQlJRpfMa0=;
	h=Date:From:To:Cc:Subject;
	b=Jzfkj/XpzWZVKMoWSkqlZlxdUvxcceM/6qJ1MkVWHgaeZz45VvsaczpUmg4gYqz4u
	 FVnR0EGra/dphqC9qX2+gp/lQhhNE1tMWIO6vphDxxFoB1B6HzK6yj6j/BsjlWwAjF
	 u5JsSv9RDV92kTQ5w1bKL82viB9t/YfaQEgk7ADqiwfec3ULOF/fZ/W6zWHFqIshy6
	 W/bbSGN2AT1vZhrVpPmQoFaTaI/UkpxCAFXxMyM8cEe+93fxE1WmnPm3Uvz7K66rvh
	 9YIPeYJJ13P1fNXzkDrip5GZb1+FBxgg93LEVh3sEESRM0bZHHPlo5kPYXsR6TF9l3
	 RndMdw98A6kNA==
Date: Sat, 18 Jul 2026 01:02:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 17
Message-ID: <alrCkmuUg00fKUgb@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QBV0sJWp0qHRV4nB"
Content-Disposition: inline


--QBV0sJWp0qHRV4nB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260716:

The qcom tree acquired a build failure, I used the version from
next-20260716 instead.

The bluetooth tree acquired a conflict with the origin tree.

The drm-next tree acquired multiple conflicts with the drm-fixes tree.

The kvm tree acquired a conflict with the tip tree.

The tty tree lost it's build failure.

The scsi-mkp tree lost it's build failure.

The nvmem tree acquired a conflict with the iio tree.

Some interaction between gpio-brgl, kunit and most likely a third tree
triggered a KUnit regression.

Non-merge commits (relative to Linus' tree): 6698
 6416 files changed, 277182 insertions(+), 104787 deletions(-)

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

--QBV0sJWp0qHRV4nB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpawpEACgkQJNaLcl1U
h9Dfhwf/VUQ/Gy3QDpzll1ncAzlgF1OMIMJ48iWL0liB8EUuJpPoUtoFO+9Fcy7P
r9dWIL7ZJAQiDneh71hHdD25aEgivK9GxAPbNtbsx7L4mugASooVuJzG5eN8hgec
BaMDU+5Z6Q8WlzcGgSHocTNnKqxx2H7a470b5PHhUGvXHsgZsINY5Ve+I3tdxscw
lf/gqF14Rmj5wo4jh5mLm/L9pBk32VcSlYeKEVvz/g7J94GBFXFJeIn6puGUZdex
KdGSAUkq5rQi2wgVXzlhvW+4WuR9Od8CemsBYZ1odJCnD3gA2/0PQSNdURMICVOI
h1xgOBpGobaoVTT+6oUo4Iv/4g5nLw==
=yL6+
-----END PGP SIGNATURE-----

--QBV0sJWp0qHRV4nB--
