Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EE23CBE97;
	Thu, 21 May 2026 12:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779365290; cv=none; b=Z4YmKwTc480RIdbwPLlKY8p5wQnvUukUt8032Ufc05XB6E4KmDXIVpuJX6saEjxuX0aUewVH9pnniPUNWWw1ScnK7kVQNuIKPbRUFWbay71shD0Gz9kZCzOOJIpyj5csOoeCdU5U/GnsJ6Y5/s38P9WM5aA2sHlzAc08uH01Vlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779365290; c=relaxed/simple;
	bh=8BfGpKeVbPSPORuybBOA1cOv6eQ0i7XsRQhM1trXiYc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fa6DTdnkfIqvIKvdf/svR0u24HT4ZRePfc1lvQJz9jGSYW3VOHY5+f9PCAFbTVGk7dvMhzQ4fI8jRLXolZZHW5b7E6Gxj7KyQBrcXeou3cIAgZovtjtWYpwE+uxr4fDS9Ftv7EpL5spcTa8MEyArNmpte9xTNz+YDjBYF3Koqlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mVwlTM4j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mVwlTM4j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C981F000E9;
	Thu, 21 May 2026 12:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779365285;
	bh=P6akEJ5C/g47NUS1vF5IthCE9KtYXzq7t0y1kEyf9uU=;
	h=Date:From:To:Cc:Subject;
	b=mVwlTM4jDpfflXU7lKnYShHpS2SIhbjL93XKMOhzpk8mSiZs857w7PzJrZ5SvWOwK
	 oAPCagz2uJE3Mvs3raalIs+JkysDYujyJ2OJuC8THtKW64BDC32NlzbprCZc6a7mGN
	 RcADt3V4SID+1iQlkJGU3LRhF6U3ohC7XHkuF55PvpF9FcMn8+B2YD0F/JuzJHKU6j
	 Hcj1l+0kL0xLZ8XGGOM8qT96ViYSNp0hUGPJKVPAZHpP6DLlgbVB4rutWUDzMaygpV
	 u7yJq7IF7HZsKRn/NHQWLY0njO1k6w50FMV5iRoJhW4N3EENgJga0WdY2EgrB3wU8G
	 jivL/lBq2RMMA==
Date: Thu, 21 May 2026 13:08:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for May 21
Message-ID: <ag71otdA0u32WGg3@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zRm/SlICZlBZtuDe"
Content-Disposition: inline


--zRm/SlICZlBZtuDe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260520:

The perf tree acquired a complex conflict with the origin tree.

The driver-core tree acquired a conflict with the rust-alloc tree.

Non-merge commits (relative to Linus' tree): 6706
 7616 files changed, 404561 insertions(+), 150576 deletions(-)

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

--zRm/SlICZlBZtuDe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoO9aEACgkQJNaLcl1U
h9DShwf/akiiA+H8D6oXzPYHLPJbuezSMGqp/krFSBHrxxwry6oF7peJPlMr1mO2
pcCw9v/4ZzcRc9PMqBNTx7SI5xh0RYsJA/czUY/CR+0WV4s3cMaWFNaCPWPVTleH
aWoeTBf1pzz5i591r8EDmM/W5blZoumaCDEBLPgc5pju6hjBz42Loq8UCaWCy7nW
yfWqacr6L4dVXUFh8m3whRm92z6BU5NQQejidzYMpulSzLAi/16HKxbuXz7PqydM
/kwk/LNMBQYQsG3/e3fGxO0ZT1vUnVZEiGvw2zFzGBaCqo865UbIJeVG4V3DylR3
Raa94hxJSUnt1g0/cTLFhOZbVkLoHA==
=79Hw
-----END PGP SIGNATURE-----

--zRm/SlICZlBZtuDe--
