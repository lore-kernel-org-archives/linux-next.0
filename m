Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D841A2C0B;
	Mon,  2 Mar 2026 15:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772464700; cv=none; b=LcZABUuWsqCDKbG6IeHC25XuvMwD02n6uOFEryRrWZ3V71dLnPGACEcjGst8T57LnZWRhs2Il3jZuGKbjlMEifIRwKNL1SzI10fy56EWkigOIuqJIiGtKhVKazSt4DIWq9Gu8rZqqh6LrrKaJFlft03pYdEnFsUqy7GUd2Py/DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772464700; c=relaxed/simple;
	bh=jOixqIttSjEGgjaswpbreVsov1u2sg9+mNPBOtGusys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rhjsxzf9ImWN8wvOtswQu42+y170C16+CDKBY+E1uLF2O7oDG5FfZ6Txw+Oerke+vMrWqyDxPAR0O15tQOomievhNxJQpqUuorEdKWIYefNnmfwEIKT0ET7iOXopWfPuQD1Z//mSaUazX23J2t6BS9FCDpjmuo4dSBRhKFkANzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ucZ0UjGN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ucZ0UjGN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77943C19423;
	Mon,  2 Mar 2026 15:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772464700;
	bh=jOixqIttSjEGgjaswpbreVsov1u2sg9+mNPBOtGusys=;
	h=Date:From:To:Cc:Subject:From;
	b=ucZ0UjGNEWZGIi8CPeGrtzYyrL9/GzNqQj31qcNvcpP7NAd48NkwpgSsZhwKhtTfS
	 nlEtUSsc+O+I3h596TxXCpMmN728lwXWAwsOLLcdHZGf0S0W6gIxqhWV7Pr6LqTNaP
	 M0YEncuK0CV1axftGN+3wNa0t5aE5atPN5jApl1j29R7DG/MZ4kHNB6SWZ3pl2XVSL
	 JGoUc29VelwohgsR8r+POjHzS29IczQ/D0fghvWumxAXI9DBdKJCLYNimjbC6sgvmO
	 RQ2KSAu3KZ9LEsVheX2wb04B2U9lkFBagxlQE1I+Yy5535PHNUnDREzmEmcQt53gSW
	 /0nJpoI1aRQOQ==
Date: Mon, 2 Mar 2026 15:18:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 2
Message-ID: <aaWqODNg5iqVRZQq@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="43Yd1TsBnxO64eD2"
Content-Disposition: inline


--43Yd1TsBnxO64eD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260227:

The hid tree acquired a build failure, I used the version from 20260226
instead.

Non-merge commits (relative to Linus' tree): 2601
 3030 files changed, 228180 insertions(+), 43394 deletions(-)

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

I am currently merging 408 trees (counting Linus' and 122 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--43Yd1TsBnxO64eD2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmlqjcACgkQJNaLcl1U
h9DI5gf9Gl6l3pTqHFrwhC8+BAOYt8/bVHmdKbjj9wqLB7OGeGAqp+8lYpyAIKdK
V1z8Sh90eHzCuUA1Up4DZSlooT+h1XeNuLhBSRTSKGs2jsG647vJuUf68svf3gIC
ctrOENew5u4VKNE7ALaG7N3tZPyoM67YOT9dJ8o7X/fpEM+Z+vNcWR6I2xeM1ZWa
e9A8tlUnQAyeCPgJLjovObBdBVaMT/7r+gK4vxg+dRc5CYmujZ9hMgO3PxwR/A8c
X3JpjUmcT3cVbgcWLIQgTkWLhJ+xe3dX4X4InrptAGDf+SJXXcmg/sMMROs108jU
Db6JSunmhrMX5JZGAQrnCcCS1tMH2g==
=1l8p
-----END PGP SIGNATURE-----

--43Yd1TsBnxO64eD2--
