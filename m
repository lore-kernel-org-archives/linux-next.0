Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E74618C03E;
	Tue, 10 Feb 2026 22:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770762620; cv=none; b=diGWmiWkRW0BBZpf0cRuJGQcRSvBqxMB87RyQ9IjGzwVp8lJmecUflVPv15TDl5GWmcwNC2GXrZXzC1ZTpWZkl12gbH75lt1IEUZC6R71SilbW25r4PYV7pUYlHK5Vo1cKpwdGxLk9BktnWkiTh46j6QciIGrt2pMHt0+ij3QUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770762620; c=relaxed/simple;
	bh=x7yYJqQmMu2U7mpyH/Gwq54p4gXKqSNSYm+l7TpMJN4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cw1QhZAbmfNOQMqv6GbEyAn/MuRATnSq3MLTKviju3RKiRlfncU6ovJK5Ttb8PGXDkO1qtx/MiNQ0QQxja+DS29++GQ/3cZUQF+e5Vh27erB4tgaEk8MpvO0ZQzTkCrITYLvr0xCjYry0LGwsTJksE5sjg2d5zTWcd4FZ1hOpdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cvznfK2d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cvznfK2d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DA34C19423;
	Tue, 10 Feb 2026 22:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770762620;
	bh=x7yYJqQmMu2U7mpyH/Gwq54p4gXKqSNSYm+l7TpMJN4=;
	h=Date:From:To:Cc:Subject:From;
	b=cvznfK2dxbhqPvkZ7USBXNbQDO1OZUXrBjQEoiBPK0SVmPpL8Y7kB5UiMwBy1AZXt
	 XRePks40JVkj+vFlx/Hg5Icfnp7dczGHHAUwSotXWAbLSV3EFqNYiLLREZvNXtbHyQ
	 oZymWs5t8poc8tXciCaQMWy211PllG0ka3J0xT/OMn1SMjLkRSPVE4Vlgq3r1oE3J0
	 uAeYcueLL9aSDT+PQWevu+xQELIEUpBLrlnrcBguzCXJr4cEVwy/44xMywCpcscBGA
	 XHP0o+HF7rmZ3V67K1YJTyRe3eDKsukwc19XtFSoXdQRjS7nJ9crlbKnTtAqHvy6hR
	 WhNU3IYCTir9Q==
Date: Tue, 10 Feb 2026 22:30:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Feb 10
Message-ID: <aYuxeFgQLDx-n1bJ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xeP+RTgIgUvWY2Vp"
Content-Disposition: inline


--xeP+RTgIgUvWY2Vp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260209:

The fbdev lost it's build failure.

The drm tree gained a build failure due to confusion with a dependency
on the drm-xe tree, I ignored this for today.

The kspp tree acquired a conflict with the origin tree.

Non-merge commits (relative to Linus' tree): 9537
 9017 files changed, 550583 insertions(+), 185441 deletions(-)

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

--xeP+RTgIgUvWY2Vp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmLsXcACgkQJNaLcl1U
h9BNNgf7BXDFeuB+SHd9guugOU2kPv9TjISY2rKlidRCOPUriYTku1ZCGxDU6e7y
NGPFOHaRMwrX679c5ikjXwdmISQyWukRXZEtIlN2wCbW0buB93ET4FWKSsXI7nD/
Rq5JJIhYxRJxIViwymMy8gfJqQBnrCeOUEX9rn/XfGTYPyOmOL67KkzuyMijYVtW
IpjTSdtjnNwICDrC/bFsZCa4duQdaV7bi3sYQyklBe+wS2bMu99g93MDGax+q6QX
gK183BoQO5ZBKZ8SxCqus8QO+3pILaFfUmLxMdqeU/Yfv0BGsIJGNewgrhDJI7F9
ou2yu6KEaXgqFNWGN+gRhRlijmiCFg==
=qDW8
-----END PGP SIGNATURE-----

--xeP+RTgIgUvWY2Vp--
