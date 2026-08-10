Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F31A387585;
	Mon, 10 Aug 2026 17:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786383206; cv=none; b=n/rJD7P/THf5bjTJz3DAmxThfNnjpaxDfkXyUz3JEarp54LItFqxZFGkMcVRc3a8neS9W5yif/zbDtG46cgzOfGJIkvh6WeU3lmjRR8jvWwAFhTejaQPc1MiFjkLsa5+NGzumlzdc2jY7pRM5ldEuNhfNO09h1Phn1TVebqYWHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786383206; c=relaxed/simple;
	bh=HqJTqqBSO4LnXzO94e8HNLOVbh4byZQvEXkOqKCgCSY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=akUhAl9J1MvMj+Dnhc96wzxxVb3DufGJUB9LIUlocLdZKL1ujnX4pN0It8BuE1FIH65JmUlwXk+KfV/s/PAXtAJegx3KGhrEab4zr5kgaJN2ws1yUIqiu0X1XLXpYKQmZBEGgyJNh9IX2asqYv8BqeJ/LiZYb90DxX9pj3pgbh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e3K55Csn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e3K55Csn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13DC91F000E9;
	Mon, 10 Aug 2026 17:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786383202;
	bh=AerK2Ol5g/8/iy+hxtYor9tb6DdpKqTNDw8+h3ldY6M=;
	h=Date:From:To:Cc:Subject;
	b=e3K55CsnO/I/rX2QsS9eztMybkk0+arLcNcxl/xGFPw833F54nPAQ6r5aJHQvR4kn
	 ZxhLPp0Txp2gnLfUo2TXdQ7j4PlwpaM7OVa8su2Np/liOl7x0wqqLFlJJljAhcUWtQ
	 Blj+lE9cn8EvrLLOInI05IpyPWI4O5tVDbYqfIjqAzYwfsP+8NRIhGFSpDXrjHKGe1
	 O6ptLSGvzVnTpYmpRGvXHoJ85eg0000lPdzI4QIZ/4DDb9Md0OICDs1wJOyt2TjhFP
	 YiY483xAJXn1v5S014TFfbYHYapv+QhqFikmG4pmKUh3i4/z0HU/r1EsJnIUS0ntUl
	 xtY7WLppVTC1w==
Date: Mon, 10 Aug 2026 18:33:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 10
Message-ID: <anoLXxLwqcg3cF2P@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0jxa0EZ96L1OHv/V"
Content-Disposition: inline


--0jxa0EZ96L1OHv/V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260807:

The pm tree acquired a build failure, I used the version from
next-20260807 instead.

The thermal tree acquired a build failure, I used the version from
next-20260807 instead.

The drm tree acquired multiple conflicts with the origin tree.

The drm tree acquired a build failure, I used the version from
next-20260807 instead.

The apparmor tree lost it's build failure.

The tip tree acquired a conflict with the rust tree.

The char-misc tree acquired a conflict with the tip tree.

Non-merge commits (relative to Linus' tree): 12849
 11385 files changed, 622107 insertions(+), 203793 deletions(-)

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

--0jxa0EZ96L1OHv/V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp6C14ACgkQJNaLcl1U
h9DpAgf7BQMV5ueiOCSob0FDqleTNUSulKQxgfF0kXvRRwFFNJJFdebAdpnlQP1j
glLIkPCxMC+r/Xis2pz2WCq6JGLeIfl8P+WVuVkQWYqp+XotUzwax2lqgy1Dll9l
+rKpNJsVdFPCJdSPPQIAVlm05W2YqGbFCWNghFQ9gPKKYY29xnNB+Vy6KTi+MlUn
Tf/dJDxJo6CTdGVrUg5WD0pNqq3Kw4NZRw1cta9G/7SuQPw+sY+Hho7il2tZcsha
ANV8C1Fl6LJDvZcUyXqQMf5z4EVeTjOc6hT1QVfICiXHML7OccgI1lOdpHDF8gLw
YE6ILLYm2YTxO16XUaEDF/7dF6RcIg==
=Dn3l
-----END PGP SIGNATURE-----

--0jxa0EZ96L1OHv/V--
