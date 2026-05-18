Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1150376490;
	Mon, 18 May 2026 17:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779123837; cv=none; b=hIhAtX6PJLIRXcrFGieebLOm6v0y3ov8GiL+DzNvg809e71T8GwgsYxnaqG6OTzGpqU/U/AsYHQSkzbfuD2v7TO2Vl3kmOF/rjQXWEkG95SaJ0s9mYYCD9XXMrDOvgQkf1Z6L3qYf76AVUTrJKKArGmHKJhJyrXH/yADyD25WmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779123837; c=relaxed/simple;
	bh=TmRfso59+ERDjllhJEmGqcF6xjc2k62Lw8KIOjerYDU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bCKimjp5G3cLsPWTLwD2e9rtYwjKkTU4vtwGnMBziT84B+WAMy1vEr4GDLzBtPOoLWWdkozbW0+gHMgWgGv8YQfwDKa/YCa1VaDr9q+QojNQNH2u1PT7s1FeLOKe6cBfruk9DWXkbtn0fNN2XDV3BAsSqnlvhzOwD8wBcsDSGE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Np97kz/8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Np97kz/8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB659C2BCB7;
	Mon, 18 May 2026 17:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779123837;
	bh=TmRfso59+ERDjllhJEmGqcF6xjc2k62Lw8KIOjerYDU=;
	h=Date:From:To:Cc:Subject:From;
	b=Np97kz/8vXXP9Ny1qe69cuHS/ssBwqZG+o2F3RyHiz9LVcb98wFcJcpgIR19nmz4Q
	 9ofEO/owQkE5Ntah+6322YNdCYbDGPHn6ou6QedzKWHN1MnodHd/8eINTNWYrStwgF
	 R2IWuTSkq7x+B98X1cV2gtMaPq3QFrPwcGlbt4+zgMy9NnT7IqbJIBUho2wwrspYPk
	 1nLYIphvcQ+Z+aRZ/ZEH4tRV15sdL65AVvZmwYnJr41clg5jo+SdN2QS89tQNUAN+r
	 J9K32K6i64yPqsaK/vMlqlRPnVvQd9csGpVsq5vFvR2K2v5bTVIJSBFpNOlIEPVA2F
	 F9DwT5J2GAK+A==
Date: Mon, 18 May 2026 18:03:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for May 18
Message-ID: <agtGec81nRIQz90T@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZHSI9NWPTsKWlAZn"
Content-Disposition: inline


--ZHSI9NWPTsKWlAZn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Thanks again to Thierry for covering while I was on holiday!

Changes since 20260508:

The watchdog-fixes tree was added.

The vfs-brauner-fixes tree lost it's build failure.

The vfs-brauner tree acquired a build failure due to an internal
semantic conflict for which I applied a fixup that unfortunately fails
to build sparc64_defconfig.

The mm-nonmm-unstable tree acquired a KUnit failure, I used the version
=66rom next-20260506 instead.

The rdma tree acquired a conflict with the origin tree.

The bluetooth tree acquired a conflict with the origin tree.

The drm tree acquired a conflict with the origin tree.

The iommu tree acquired a conflict with the arm-soc tree.

The kvm-x86 tree acquired a conflict with the tip tree.

The cgroup tree acquired a conflict with the mm-unstable tree.

The mm-hotfixes tree acquired a build failure for which I applied a
revert.

Linus' tree acquired a build failure for which I applied a revert.

Non-merge commits (relative to Linus' tree): 5467
 6387 files changed, 358135 insertions(+), 121907 deletions(-)

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

--ZHSI9NWPTsKWlAZn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoLRnkACgkQJNaLcl1U
h9CiGAf8DLWl1CfmGxEgCumBso3IDr0Dksw+m3NGf94C4IcE4H8CTASHKM7tbmMt
j61ZyKHqhLp6znzoGkDQn/hpgrUjnkMVxp1EEBRo/DrYdeyf04UaPtXCHDCR1ZMn
DCAUdF2pTgdzqvljsl5LsfZOQVzaPGsacpCfb1rfBcsoYMq9lUcF6FaaRhqIkoFl
T1e+xDuXnqRvcWsyrGURQbMVdH1BFBJZIi5/8NdZaHRCOGsfct4L3VY2IdNnKwgm
lyBSLRUDQBYnK2udrUFLeESHx/dzuhOzZHVxvkYeMe4nF6mIwpYL2OvuprdNkD2g
dpS/3ujwgz9MahCSXTJ9Hopd2OTIWw==
=rCD2
-----END PGP SIGNATURE-----

--ZHSI9NWPTsKWlAZn--
