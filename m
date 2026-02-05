Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0868D41324C;
	Thu,  5 Feb 2026 15:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770303868; cv=none; b=Jco6TfXswsTK4RUTlfzTTJe53HHRZZkSpJJ1476ZlXDSYJsN08hq/PFWldMMgBgXmMuQvJeI9IrIJHgAlDsI5T0ZMzvJlVNLvrg0X3ONG/ZYB8JvMNLBwr9lFpNgSnWw0zVjlF3eV3CdKgvYe8cvTgffG30p5YmM7TlU75fHx2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770303868; c=relaxed/simple;
	bh=eekNCkkKeDyiyaYdJvsAfwStKEk7W4wAjptk5Txh4So=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kozKa6AH1LACcyPvT2fMTruhss33gJaROpxKwaacaKXnsWaT3rINgv0NQTvvBu6OCFeIr+Vp5g8gbGTT3MfJyac6B4vOVrH5Arx62CHZ0ksiKid0ir/m1scv8LYn3Khcc9786A3q/foHuZILyV9p8YKKg7IVR4OQgQ5QS7wcwsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CyRxRCbE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CyRxRCbE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B8DC4CEF7;
	Thu,  5 Feb 2026 15:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770303867;
	bh=eekNCkkKeDyiyaYdJvsAfwStKEk7W4wAjptk5Txh4So=;
	h=Date:From:To:Cc:Subject:From;
	b=CyRxRCbEsvip4pUbrt5F+PH8tbAaXOkqgWk7xnFE7hXuDFUn/ezmj+4Q2+pLniRyj
	 sgunPqPyi6WY9agkSwU40sur4OFoh30YnOCr3R6bvLmBEhqIcLPRpIYc9N3UunQpEj
	 wM88+EhZkjmN+5UDEvxvvqZM1HsfGtJa3YUl5cu5tP6jIosN2DdqlrgJOGE/C+xlHO
	 THJE7RK//KIASHqK288mwBXbHk6eABUFb3pYrze/xLwGeYlptuxJNZ0C0kAurEtiJ1
	 CjElzoXicZ/ge2jmccPQxK9qCMkirMsKY8Vux9e7c24U+dvvuIH0M6QVCd1rL3sl/X
	 QpuAxOJgI9Alw==
Date: Thu, 5 Feb 2026 15:04:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Feb 5
Message-ID: <aYSxeHaPjfcpollR@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zfZHhsxN8s+ajTmo"
Content-Disposition: inline


--zfZHhsxN8s+ajTmo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260204:

The kvms390 tree acquired a conflict with the mm-stable tree.

The mmc tree acquired a build failure, I used the version from 20260204
instead.

The slab tree acquired a conflict with the slab-fixes tree.

Non-merge commits (relative to Linus' tree): 10985
 10614 files changed, 613112 insertions(+), 229587 deletions(-)

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

I am currently merging 405 trees (counting Linus' and 121 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--zfZHhsxN8s+ajTmo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmEsXcACgkQJNaLcl1U
h9CEPwf8D2R/mrjqRSk9wdl3ZHYq3wYSNkYn/t0BaZKhuSRdvzIlgevBjbgGlBYX
Ht+Ks25l7mSJV6d/Ebjdfc3OZSR2KJ/Pa/JwCPRaqSrLNrbkc/h9ATJT7BgS0mHH
CgNF8Yzp7fRgCjgfXAl507MtrvfSRBKnTtcyy6GsAFT5cIjw3Hsb50Dp/w9DsnYf
iB4fXKg0y9vjAj+2Q/tcNYUL01usC20OnH7v5Tumrap04s/F3z3m8Jydfnxkaoiw
HOjjWuLy4HCwtB/uu9aQzC7CdGS3RhaVN2GfbF6TkeqNuGZXxfii3bfeFfmfJ9UM
VazKm0qH6yDpCWnb/jJ2CM+pYFzfjQ==
=IRMV
-----END PGP SIGNATURE-----

--zfZHhsxN8s+ajTmo--
