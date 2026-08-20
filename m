Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F22331EDF;
	Thu, 20 Aug 2026 14:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787236635; cv=none; b=O7oMo8f8nvvwaFMHCmIe8TxhJPQnwWJDfs/BDIPdlC0TIHVNSpfbJs4TbmVb3vLoER+BWcxdGIq66QoTTH66I7rctu11qatiajjA1I98D7f/D1U4Xlz8cDaN3j0R95u/YDC3p2Q6f1UOC8qQjfwt1wfxpExVT87L2KJ5ct3hYXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787236635; c=relaxed/simple;
	bh=r11D03+WLsNXjGYwwL53p6QD3N+7bMBCgDirfu+alXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PgbClxnT8vHh1dAiTQ+R65QfKVhEWh+m6doMtbr6xh1VjsGgmTN7iUiTCORMY/XcyF/OOJe5Csx1D37s3dtR95sfarL4R8FbSEPZzm60bBjtlCE+llhOP5ylDLtN+J8mkZwO/dfdQ/LjK9ffyouoJY8J8SkHSL3u6CzAGc4bcQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kqz8y5Gr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kqz8y5Gr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DD851F000E9;
	Thu, 20 Aug 2026 14:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787236634;
	bh=ErM/5R4ZcOfGVl57iRYPAnwV23DLffrhNm9lRjyXcNU=;
	h=Date:From:To:Cc:Subject;
	b=Kqz8y5GrjEgGDEruXPnSQT54a1QoGNyd1M6XDiu5pA7JG0q45ZjAb3zEcDOwFgpEH
	 BmdugyIDh/+q/SPhr9nuUcjrAzbYxAGEkfx37WKOrj6QzAO/Wb6BInOgzmf2/HNK8x
	 oFUWSVMRoboS95hajrm40QQjKPcSmO5dMygmTXc+R79nraDWssFCh5XpmCrqfmKFH0
	 WDSTDey+bAEWoxhUTLFJEOgojfl5Q6HNBsoBWHBWEIV/nOh8/QnHZkNDVrMjfkVR1G
	 keMZbSHIYEquoJ2ROy3pQRopxXVXLjBOJMvQD7XWpRka4hX9HNjckvetzTMK2x4bOC
	 fyDRijMel0qXw==
Date: Thu, 20 Aug 2026 15:37:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 20
Message-ID: <aocRFkpj_BZkyzAI@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9yrvXQ39AsIgNpMq"
Content-Disposition: inline


--9yrvXQ39AsIgNpMq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260819:

None.

Non-merge commits (relative to Linus' tree): 10404
 8508 files changed, 688614 insertions(+), 206412 deletions(-)

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

--9yrvXQ39AsIgNpMq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqHERYACgkQJNaLcl1U
h9B4BQgAhD0PdC2i0tla8mLwVRrQhkvGmtJ9VgLLnc7LyR4nrxZYY94FU8g5S0Kr
L6m/6yp9FvS/juAAaCU6Yq2WA7vU1cJmGqiGba5/uAxZNnJHG17J2g4xX7HaL68l
F7t9Y8o/lGXVRlHAeFpW/BfgztzhPt8VKQMQpF7Df81Flbj9jR5eUSEW3GljLccA
L3cX78t+qMNJC+hyglMt2aGxQdvhwuBTvPcIRJs5P89q8Qk3bZMlidPzREYEWKhY
46pwF5DupyKpIcV9pCLFhh3I+D11q6IvFsbF56lYc8VAe9oAHp+FZWd+HO6/AhvG
TdkUtY0TZKUDJaXbG6laDvokKz3Fqg==
=GGSv
-----END PGP SIGNATURE-----

--9yrvXQ39AsIgNpMq--
