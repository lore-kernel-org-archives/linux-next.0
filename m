Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDCD2C11FE;
	Fri,  3 Jul 2026 16:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783095644; cv=none; b=opf4fifDAwn/ivt8fxVD443Q5d5qKcaCSF9NGho0EdfiOjHkNDqgjaLAq6SXnscBI8HADEvKy7XdG9V5Ers2WugGnmfVqUxzkPv0RibVrzLm/+1+dn/R3Pn33e7RiB9WHp8NVVAXiCnf3ve37jeBiW73xKJFQAKKcPrWq/qO7ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783095644; c=relaxed/simple;
	bh=YHk5pRX10gcwXeOfceh5E4Xw9SzLvZZKpbjOkWI257g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G3bOA4HPnjSq3Zp/AovIn/zKBM3+bcAGN0z7QT01QvoFeAZUkfneazEdTw816G7neDBI4fRI/XI4xpicwpdFad1yK+5YUh8FwffJnnYq2+Y6Ft2r4/YqA0y+4Q1eiqnsJTOVkqRpSXf1Iiie2G0AfnUAOGyQZJrsIDPf6ayJp64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MMBNQRVW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MMBNQRVW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB2491F000E9;
	Fri,  3 Jul 2026 16:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783095643;
	bh=itz8Nb5zpeopoHorFdGxn4I43vfsP8yp0aRsSKaG9+4=;
	h=Date:From:To:Cc:Subject;
	b=MMBNQRVWwyUK4hXgXuTZDXy/98LKll12l58vMec6hMT+MlvsUFJzGFzHt7EyUJ0vG
	 gjjWZQiYphAv90eZ2ctBL21KQ7V991x3+jWLq3u3Wfn1wLt56jWLQLszz4OuIqFZMM
	 hiEb1RT3jCRgpmHx/7yw3CLTn8iSgheLPSbCjpEfKJAosrXKDau0ZuUBPvIiGDbxFH
	 KnnczurJb1x45tuTm8Dly1tBe6TVAtBwkVpahO5ZrDThLlhXX6gQsXcvaWSgnWCFz2
	 fXQ0pDNDfpfOylMX2fgyzbi9noq5fvqbRqqa4nZJNsm4A5tRM31aZpltfI9ad10CAS
	 Wgj7sZ7He/8xA==
Date: Fri, 3 Jul 2026 17:20:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 3
Message-ID: <akfhWKMP7CecwEIq@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4PAHKv6OI2cC+6F6"
Content-Disposition: inline


--4PAHKv6OI2cC+6F6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20260702:

The mm-nonmm-unstable tree acquired a KUnit failure, I used the version
=66rom next-20260602 instead.

The drm-intel tree acquired multiple conflicts with the drm-fixes tree.

Non-merge commits (relative to Linus' tree): 3187
 3175 files changed, 116065 insertions(+), 62025 deletions(-)

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

I am currently merging 427 trees (counting Linus' and 132 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--4PAHKv6OI2cC+6F6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpH4VcACgkQJNaLcl1U
h9CtQAf+NXQSqy+arfulVbWzXHXy7XT/7ju6jfmImuKvNAW8E7AkVx/8rXTCz9xv
XmPAIezonuXTdxAk4YrNmRNX/0HiCJdsVgdIW54zKqEvoxZd85ucofDTI5j4tMcV
txAcoN6IOtmuxEJoM1zpdYgKzbR2ElIx1EFMjBFbYwH3VHCEoUGw++pvIjdJzQSt
HwqQRaGq12NUzQ2kTrqrLSgbyxpiLnQQcJxxwUq2dqwY4857h/hK2zDsw+MbjPcB
2NhXfEc5TLVVeIM4lSm7X2caa4PA3caMOEJ+9GKHc9hRZThKT69ElXklIRTxTJA6
NYjzsma+ZlXzwiu+OOT/05TTfEr1rA==
=l1IB
-----END PGP SIGNATURE-----

--4PAHKv6OI2cC+6F6--
