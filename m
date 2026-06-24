Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53EE3CA486;
	Wed, 24 Jun 2026 14:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782312148; cv=none; b=UvvxTb38+IcPTsxH7Ze4m6PH2aI0P5U+WK4BcEXVkNrVrNY8JTX6hpWU8Q6epz6HUEZkQfea1UZOjWAtMlFMFIsMH7j90VUIx1lny6AOTLsBFk+X3Ob6aplZJFYgWy4pNU+FFo7EiVMCMOa5e9ydFOGuL9HpYuEFlaNkPfCOTMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782312148; c=relaxed/simple;
	bh=cFDwFOBxkDv0DvWCsvG1QaGT/s8vJSuwXtNw/4+t+Zg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GY0JV7jRs3Ep+KLnUhmYASo1Q+PO2k4UYZIDF4BJqIrWZzGs6B+JFXx24qDgYUgiN9WQIM8Vp/ledTXsP3NE3ZrsXr+0O2gxMlSUXtB9RCTACLHPU2en2Vb0erKNbDsY7V6gJ88th1h+4z180OA//PVdceqiKWH6j9N4Z8Wd9wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dAIktrjC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dAIktrjC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 939351F00A3A;
	Wed, 24 Jun 2026 14:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782312147;
	bh=lqI6cUxmmk+Q3gbqs2fgyBeAhQ9V1xMVl7cvfG46284=;
	h=Date:From:To:Cc:Subject;
	b=dAIktrjCPlL/m/qHA3gL2AojAYBuPniQN92T+gDk1g06xpo7D9J+QvhRwNqmlfZ7Q
	 QDIjvaz3B3njAbZ5fzcklHw/OxJnFqBW8f4jVdje1vLaFA+U2XaRBWcjrMrNl4avkj
	 NagJ4aLdgNim1bAtmcXZ+zL/rSxsY4GMWsc4cg+liRbMSawFFhhSb+4sFUmTqWK2CS
	 BVfqfOAzH15pq79H3dSifGZV2QZ3lqFuYB4JBuWn0BZhqzFERvPf83lJsKb1NWoeKB
	 /E5udv4tooA0czlzKS4p/xRTZMSrOUAf7+286zBdvdeI6ILvu2xqd41ZtQUbrndgjr
	 oMpuHJJ/JBPtw==
Date: Wed, 24 Jun 2026 15:42:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 24
Message-ID: <ajvs0PhDpBvu_2I5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0NUjHghUKNJvOzf2"
Content-Disposition: inline


--0NUjHghUKNJvOzf2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The merge window is open, so please to not addd any v7.2 material
to your linux-next included branches until after the merge window closes.

Changes since 20260622:

The arm64 tree acquired a build failure, I used the version from
next-20260623 instead.

Non-merge commits (relative to Linus' tree): 1592
 1507 files changed, 65562 insertions(+), 21462 deletions(-)

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

--0NUjHghUKNJvOzf2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo77M8ACgkQJNaLcl1U
h9APBgf/fwKccWSHWe8Lrxr0PMz7UCVzGkssm4KoHvij0xUOjFQ+2I9omGUh3lFG
cT+CMKbBBe/8B/5EW+lVqXR3UAFSyIHD4G7dRHnb3EdDtuCjCfFZ91NI5HjOGAwp
zM/sIY1k/u/nrgIeh3Ovo/40HSnFY+c7U0PIiYfvfW6YeA5s1I1vH3vmDR/G2NIi
ebva6BK/0n8CdsJso3oeTQ9yRkefTB32C1gMzn6c/q3BJkTpV7W+LFzDWvjWqP7h
1GyrmWgxG0dxraosNiSn7tCOKNE6gGKrg59/OR0L6eyLQzR4V9HPqS/61haULBFM
GP6CZb1cUy21aBBP7SnWnQgzEjS5Aw==
=xwKH
-----END PGP SIGNATURE-----

--0NUjHghUKNJvOzf2--
