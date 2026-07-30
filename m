Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B010C2D0602;
	Thu, 30 Jul 2026 15:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785423769; cv=none; b=OKdnwp8W752XTaCZt6gVWydIHr5f1zfdxKIuz/wepWN6kRxP2UXLrsJTS+tQHRu4g6AqLc9tH/PDJAr/pR1ga94qW7K3kfjlOORuNh9FWiDNgafQEFn7VPcPXHNng4ZwAgH4RD9TxAcm6DwZWBVv1WfehwMyy7516RyFZiGb5xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785423769; c=relaxed/simple;
	bh=Syja5WEMWSjKlNqr5rjnDTK6QOi81cedYuCjBIu/E4M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RfkjlvM6OEmg3h3HdiWTSMVQOosWzpdNuQ/egJtBvK7R+KtfwcaKUpbMO7ZsLVYXh3/gmQYrnvssagpItlZAVNBVenwqry2txoME8Lw4zDy4g8Hy4y7e15XyOaee1scwZbXlMhzgWRsXa1eFQvlhj7wVZa+8ojIBfKwOecla6dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kxB9++BF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kxB9++BF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBE491F00A3A;
	Thu, 30 Jul 2026 15:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785423768;
	bh=dR8StKJsv04ayDq0WIqo8s3B2DWyO60GdnTNB/f9NVQ=;
	h=Date:From:To:Cc:Subject;
	b=kxB9++BFoo/WsHuOrL5sU+P2UIS2g730EUF5p1EaGtkzUl9i7iEYbXOKz6BtWH6uL
	 pzaeaBrPlks3RCe4+FLlMXJbZiG2rxqVx1+x7q5cdBNHSskVyYJAeqF8jyvz+G65wy
	 WspL+1uDcAiu8sg8LUxRlaHIB4Ia5jvB40Q2bwDLDnhYLUToqdeb61gop9KLSDmcIt
	 wBBq3THfxPRNHx5s23gvNTg+KHRgWzvQ8LxqF9vBdsNaMYmc1LvJ1bomwBiGLSuuwt
	 S7uzUSzIg905Ub5D/qn1i4VPVWB2pClVBOgaRxCvmB0yajhVepTEa/IEoryYIxBjnb
	 c3T9q4Kz4lkhQ==
Date: Thu, 30 Jul 2026 16:02:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 30
Message-ID: <amtnlbQl2KLongvo@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qJoRY6BKK3Fv5d+V"
Content-Disposition: inline


--qJoRY6BKK3Fv5d+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260729:

The ext3 tree acquired a conflict with the ext3 tree.

The mediatek tree acquired a conflict with the arm-soc tree.

The slab tree acquired a conflict with the rcu tree.

The pinctrl tree acquired a build failure in the final build for which I
applied a revert.

Non-merge commits (relative to Linus' tree): 9812
 8873 files changed, 447957 insertions(+), 143464 deletions(-)

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

--qJoRY6BKK3Fv5d+V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmprZ5QACgkQJNaLcl1U
h9ALHgf/W9KK1uKbYMWLdAUrWhIvHdn4rhIwT+BjZ6iZHqrJP9e0Js6EwHr3nP7E
ss5VgVCr1D79Mi3PKPBjLCaUDzsg5Xt5hT9+m/XzO9C+gevk15U8NZSCgmb0Jsfc
vsrjf4MQEU+5kytRl63k3UkBqxiCAO0keL+gAsSCEolFuffTjaaeo/zNWjsD2UO+
PeYkNZ81NrnNiSe6a5v8Cl4uK5WNsgZtx3IIl0iWC4e4j/K4UHMQn6crbYTMnNM3
bGAxgVHW0JzhcIshhID+VuRi6cWOAO0FHXEdokoFZQ1rcjVbxPhzGSc8a6JfIpNd
mRUXgDRrd/j72LSeiibt5qsTnCrHCA==
=cWR8
-----END PGP SIGNATURE-----

--qJoRY6BKK3Fv5d+V--
