Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA253275AF5;
	Fri, 19 Jun 2026 13:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781876314; cv=none; b=JvWYM+xybjbsoZvvBRj1guv4PNW+Tt/MtJLbIw9tXZK7/cFFJm2/mhxA9wGbZ5epvBJSMFVJqBt6zvAG758tqEhW9WugMFNA5QSqTK2zFV7i8O1mRYSEz64QiUq7iI0Jp/D3K2X8hgkpYJNIntB3OXNIiu7653qmJbV1DPtEzFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781876314; c=relaxed/simple;
	bh=cKBfqa6SPIw6uaGCw2174DWZFA4ZO0iIlWw5o13jfrk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kbXgtmmTyanSHqThxoaw7c+WHnjMsESyQCo425juJ3O4Pq3qi/aeeLjFkKgPfe1arTAocyRGp/7r+WmYj1uADOBQL+Kuln1dYBZZSj5d2Gmxws1ascQHvT8axjICxf5xcf3D1/Pt87pNpvoEGkCPExktnk1Y6NkUjUpQcllLNj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GsM2FGgn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GsM2FGgn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBC581F00A3A;
	Fri, 19 Jun 2026 13:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781876313;
	bh=RZ9I1LHpEpO0M/mq2lbKly2tnRts3ILxggbJ8+in7Zo=;
	h=Date:From:To:Cc:Subject;
	b=GsM2FGgn7Bni/fY+kfDxDzshE99kvQoTGEV7thfo+aB6I8Cd7DPI/8mpEYivCqNnM
	 j+Sig0PuxM+7Gho8UydeXnFMquZvVMGcRp27M4x6hDmLUhGLBnjS8MSWH9NT0WFDPH
	 owDlO6w9Uy1l0t5xZlV5ryFqkvoNP+287NHjdIilYoJvdkyguze4+Px67HO0tYMjx/
	 Yx/FB0rRWWv0aVFo74gBIBM0tQHGnyPO61CL1FBGwfQsQQ9p1f0B7HMJqvInrHyfD8
	 04dcNzzo7NVXrx1bagozPRVQAEovwDUFRmqrC0qSnanJk7sNX7jCG2DB6WGyAw927X
	 z1IIccwFljdBQ==
Date: Fri, 19 Jun 2026 14:38:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 19
Message-ID: <ajVGVUDsSiagFHy5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u+fEdveIP40F3qgj"
Content-Disposition: inline


--u+fEdveIP40F3qgj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The merge window is open, so please to not addd any v7.2 material
to your linux-next included branches until after the merge window closes.

Changes since 20260618:

None.

Non-merge commits (relative to Linus' tree): 4115
 3842 files changed, 192426 insertions(+), 82572 deletions(-)

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

--u+fEdveIP40F3qgj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo1RlUACgkQJNaLcl1U
h9CIXQf+Ko8h52No85DgV3tJSGm95169rwaNtNdH/eJYtEBxx5zM+/Mbba8324Zs
F+bjEGDy5SlBH0b3S0c6ZuINmOJVERhZILuOcfxSbYHcBx7UL+a/6rzWZCKJ03ry
/4dOBqCnKUmqFD5tABir9NhOEUds2nHtR/woYN2dKJelq/RlMhvBwvXfNiXX28w1
v/KFS2+lBZBflDW5ngzknNKoQJEYSYLQmwn4fVrbNbOLH07JYME4neorACkwjzDf
9nRxjBaxClf6iqZ4DsarBEJWxbuD+X3RbChkwahqUBnE812Yz9aq0wP+bFBmRHpB
Esh36zlZD0jkO4Hc1utx8/BSDlDxwQ==
=ndbC
-----END PGP SIGNATURE-----

--u+fEdveIP40F3qgj--
