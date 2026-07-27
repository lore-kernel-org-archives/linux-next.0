Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FF231F9B4;
	Mon, 27 Jul 2026 16:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785168379; cv=none; b=ZMMXMBvmcpD7Y31mFJ1NypihGO06KuU5I78CqWLTM+OMvoCv7G0yQyxH/mvdX7DQhYpUMKLCi7fbM5HRubUF7IJcIowuWGlYjwrUha9wkPeVodC33+wcAGZzcUUN8tqgUTI89Hdf2DWWTIjiKp5OXX/idb7Qf142ZD3nGJhbpeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785168379; c=relaxed/simple;
	bh=XvX5VBqqmk1+Ht0lhNo2iG38gGF0gicwGi/1ImfHh4M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fxm3pE+pZsZkoHil5hfekAIQcq/WyzMweJNQh4cchj+JcMXmJ6X6XLLtcEZL+bMxRBGpsVg1CboC+47DDtGKI32su4ThK25e/ZkwmiVwxcvJJ0OdUoCllOm0LKrFKL7tqC7O/vmmpdbgbxpKdunVB+qOgrZp4KhKZ50FOs3d1tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ThRcNSAH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ThRcNSAH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0824F1F000E9;
	Mon, 27 Jul 2026 16:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785168377;
	bh=N6k8nYDfJ9g6N+yGmalTkOf1KltHhWeeZGTGjUnD84A=;
	h=Date:From:To:Cc:Subject;
	b=ThRcNSAH26xYXcLaTX8PsLLTbjinUV7R/+d/fV9bCMY9xxlkqeAiWe+9/6+NqGDIt
	 BGIpJ+CXISlVBEr0w+3jsJA5QNKvi/1XQMMiIUbhhQ9vNCxEvVdz5ITVHKaB7s0oSM
	 73jFSGW/CNm7UK+8HAvqNJm93Yc3jSdtUkqLJ/qDBmshIURU+5iu8dCZ7xOqrD79y0
	 WY2mZB+aOQkW/F8yboS0lmlpM/cYt6MRPcdSITXbvfHESqFlwQr6mMriaYgETD1OHt
	 weTkxA8/1wC/FdPAqgucdVq6ZjIfHV8a70m2/dZBg3Edrrqf+8ez1ahcPyBIOFjHVh
	 6Ssdeq6jd0P2w==
Date: Mon, 27 Jul 2026 17:06:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 27
Message-ID: <ameB9hmO2-anxmn_@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8IjNZTVRZpquK+OD"
Content-Disposition: inline


--8IjNZTVRZpquK+OD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260726:

The qcom tree acquired a conflict with the origin tree.

The thunderbolt tree acquired a build failure, I used the version from
next-20260726 instead.

Non-merge commits (relative to Linus' tree): 8523
 7932 files changed, 390407 insertions(+), 122539 deletions(-)

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

--8IjNZTVRZpquK+OD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpngfUACgkQJNaLcl1U
h9BG0Qf/Z9Mmh7WCiwyXfi70iyUYmYaYIs60XwzeM3sYbUZX/COOVBjUbAKHGJ1j
eOrq1QqX3DESQjpo0WSaAuZjOMHO8ILqOd0m9qprIejEVLP7RctSVZ/vQ6VP4QUg
4qzXgQrQrIJpuWVL6dGWXOcBeCVQKVX9D8GLO/mK51bk/ZtEqlUhNPZWHi7MY+Jw
fF2/yBc/a8aAQzNRMpEuOAXORbMoWYYRu7m6uq4mfdJKnT/NB1jgHz9oe4L4o+Df
ReXz2RkiIs0iHBdityqgzpDC1cv/cpaJssjSP8XeHjody0Tzk/oVmocFSssrHnia
52SVeL1f20AGC9Z6xPG0bx10a+uxdA==
=Z2dh
-----END PGP SIGNATURE-----

--8IjNZTVRZpquK+OD--
