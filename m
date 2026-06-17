Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAF2436356;
	Wed, 17 Jun 2026 15:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708576; cv=none; b=PFF1jKiPfBLzvo1TqwulCa9/cB7V1K3BsCyGqcsjIDapnnglgFJLV4kM6WQslL66vEkT/9K7qB/MA55qgSETGxXGMzbsdkml7giHE32kchSB5IUkWnvvJ1kMQ5kztmUYoaTQsb0Wp1vaeHMbhXhFC8G9DxdVOmxQnEctTLDfpTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708576; c=relaxed/simple;
	bh=9szSj5TqHf3pQidOse8kkYqxJQNzwlSH8ppZYH2Drlo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hqLIt3H6G3asxtelI+6yOVZXaIIvveOKtR3GAHIXvQm9bKQFlP1NixVBOUF5EFCtpSd6BhYaLPOub+vX1PANi9zme9pD5+5me+NlhZU/O8syJ5CPKMrp4OGRY2CHdcOLr1c1l8n5yoipeg262ImBlm5hSgY2T0rE69pBK1NrGaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yx1kbCkw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yx1kbCkw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0203C1F000E9;
	Wed, 17 Jun 2026 15:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781708575;
	bh=b0YbIcpHH12HyuseeghEH0pWzXrYpkVKxA4OgmSxxpA=;
	h=Date:From:To:Cc:Subject;
	b=Yx1kbCkwaD9oi8U4sp7R/zmiLqlAC68zRRkCTK2rvylvKJZBvPydulmP3oKO/hFay
	 f5fZpt0yNcI74SkjQY/fuETzsROJZ36Jy3HsUvxMws0ywCN/z+tZ+kKtX/ikzmsfKz
	 l+G7HTZ+8tLw+i5o0d2X/VGIoLaRh92s0zoHmE8Z1j4ztDy//WznwweSXKyZHpB/m/
	 x8iEzB1ubvpNQKw1T5dvkZeG9fm0TyIHfZpgJNjLdiz99PucvwVKmnSwFsiSwvtNOs
	 dJ/lSfcsGo82Y5oS505p8kjpHn7tMRsXz2ztDTMCctT/WY3kGa5Zs1ylKB9dIdSC1I
	 eFuIRDIcOwKqw==
Date: Wed, 17 Jun 2026 16:02:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 17
Message-ID: <ajK3HJdAhHJ85wYq@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LhIpJYvSO66RzuA7"
Content-Disposition: inline


--LhIpJYvSO66RzuA7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The merge window is open, so please to not addd any v7.2 material
to your linux-next included branches until after the merge window closes.

Changes since 20260615:

The origin tree acquired a build failure for which I applied a fixup.

Non-merge commits (relative to Linus' tree): 6079
 5884 files changed, 298566 insertions(+), 109672 deletions(-)

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

--LhIpJYvSO66RzuA7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoytxsACgkQJNaLcl1U
h9CFnwf9GJiD3kw/0Kdl6bVOkXN4qrrKmSeOUl/8BNz7jQwBNgli4Aa594LOfqLP
/AWHZFGDEZLCCbH+WrNsgbN1DPgxp7o2GUwBecBO0LFhQ7Xnq1RBR+ErEvzlWo9S
XAuqSC2d9bzAPXNa+DI6vK2IVNS9KR0NJALRuX2mTOd8j7Lx/iwvWsQowtXK5iLJ
MixkpEdrYiA6SpGN0tWmiE5qTNMtbCm7xWGkZDaQM/43D33rMr22NsxNj8vgL9cy
7MW46WKSUOKH1IVFsBWYERINntIMt/i5nwJTx33g7Vg8/6Em3+DqjXzWkhdUCzE3
l8HUQ+KPF40znLPxdXud7w7fY466hg==
=qe0u
-----END PGP SIGNATURE-----

--LhIpJYvSO66RzuA7--
