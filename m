Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010022139C9;
	Fri, 21 Aug 2026 15:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787326325; cv=none; b=JVo6pDGXNWug3J7UmGUH4qpkJZbYYmH1qNWYH9m05y18VD3uKS/z7AKtkQyFSFRjQLEP/K/rJj5ARpROeAZ3h8u7Jl1gE5rtJ2lUDIxOIBlt4fuDj/zpKVaUjSzMogu5Rgmr+BEQiXAJl4WlHNziy+2NNmsV8hYraKFt+c5O3Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787326325; c=relaxed/simple;
	bh=YlxxWOpqex0q9N0YXGawGklK8uRIEULi6U9tNFkbF7o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pqAdcupztBx5tzIcmAWXNQL5W1C+9CYyXTUKgpm5Ljhnd9EthoeDrSkDDfR2X3FdcI9bTR3p0H7tjEXKem0rynnpMgCTuNvodfz3/YC04SrltpAAXPBv38KMMLGQZnGV9wERvkNdq+6Cs404ns+gTNcbeGpBg0hqCbGG0YS6P/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K8g3yqqQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K8g3yqqQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A6C01F000E9;
	Fri, 21 Aug 2026 15:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787326323;
	bh=EtXnNV9lc8Jnn44/YaPqoRnQ2zaSWzTY7apFS+0Rua0=;
	h=Date:From:To:Cc:Subject;
	b=K8g3yqqQVsLMKIpiSnfd1lSJB1Bc5SO1wfRFzNqBYn3TXeIN8KKw/EmjCyI0T4MhM
	 9JoTFTVBPgo6h0ZfDMfZbCiNGHOC8OZbJU6/02Xm0EHwr51KKn/nSa7St+yFiprTOY
	 QG9Vb48OBne8iJ7rK+OwOUAjff4wuyULjyW8JxFvQ6sxUWN2upsY4jLFKAQMHdLLuy
	 L6chRgwgw257vrDq2qzkcWm6oIs5ZQHFaTtNcyNrQa62lkXcHqzeLKmKCTHDsWgMZJ
	 OaePv9jL4OByPpJ+3X9uAyodh25JzI4wqoSjsqy9mgyIofd+Bqf5lkvVyDfPLTOso7
	 hHqhMbgfuurUg==
Date: Fri, 21 Aug 2026 16:32:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 21
Message-ID: <aohvcP8ch-Zn6tV-@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XOq2oLSUtKk8eXKJ"
Content-Disposition: inline


--XOq2oLSUtKk8eXKJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260820:

None.

Non-merge commits (relative to Linus' tree): 7073
 5989 files changed, 509370 insertions(+), 156446 deletions(-)

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

--XOq2oLSUtKk8eXKJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqIb28ACgkQJNaLcl1U
h9BHVgf/breD3HSqmJ2jsjqNwIGLtt2SocY13OngvynVfRq+ELEzKMOYVgR/rjvI
3a1FZ/+wmW6PbKSsoy+0an/4UigN3ZpooEBWrjdQhb0xKyga0C7/jCy877e1ZqH+
X3TGSCbjv4r8Cl817pUbNE1Yo4SGIorPXA5BvBv25t2JJbaErWzQBQvttxN66lno
iWrl6rdKBqnD/AjQ42+SCDZb5W992LUKCoGwr97eGW1ghMJoA4gveaYJ4lC2ivpy
+tA8Q+VWUoo7bIWEquXiCSs2TUX6mWjd+0xPKpjeEbVzpVyrxISZkOXPu0nLgfO3
j0pGH+9nz339zE1u31yLNLLpUd5UsQ==
=p1Uu
-----END PGP SIGNATURE-----

--XOq2oLSUtKk8eXKJ--
