Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A12248CD77;
	Thu, 13 Aug 2026 16:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786636933; cv=none; b=BmHYYXqxcJ3bNKEMbCeb6KEoDpNMiYW7rcccKT55lKZB7mx1h9/hO5NhAaHBkoHENMxhGxXD1XBEsJiRx5kymTKLn0vDDAloP/DvaAsMLOauyrt2Cy69K5+xUgleM9LC9Dqo6D4W/LVmckyiKO71v26z0BW0ftr6wAGQ8rS+yME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786636933; c=relaxed/simple;
	bh=YG1s4klWIC1pQMyoBuFlwwAkVyY7Sthz0XaBMW25MXI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AJjEtx3dcKxkwdL8k1gHjKQKWIaSv1DJ2h1BoBPm0ZbzPcPOpsH8OvcMiqhNLzzjUSp9gvYBi5cd60n9BcXLDDTTG6EJyREYR6po5+IuyjNG8LsjO13I0Zq3G/IKr9bvrdfu9H7liKsnvPO63VHTJQHm3GJ/hOg2vpnUena4vF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UdV/+HzM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UdV/+HzM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC701F000E9;
	Thu, 13 Aug 2026 16:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786636927;
	bh=y5+Ja4/IZolY+DYeiyXBQ53K81SaltbvuTx//xq9HeI=;
	h=Date:From:To:Cc:Subject;
	b=UdV/+HzMGWoWNVITaNsFxz4aEFlvjlpv4XNdvrj2Ohw1rU5r7O6EbJRpa3jiueAeQ
	 AYY11WkGXalaYmpjD8BduZBIGomQCEyKbAxITLdj9AiXNiOdMnqUgvbs6BWHEe123x
	 XtUJM/M2hy/ujNuQU3mQr6cKRhX1N3wZUhL0Pocbrwect/KZ6JRdF8IA7/mktBBzva
	 MB5SjMHtskCGzlYp+7RyT6O9JtY1g86r5Lmc6i50hanj5F0yfl+4vmHM53LgDC2xFG
	 KmSOLaeowV8Vo6gK7QIiLvce+dDvxl+iVOIiOWGGD5r0BT5PJNZj+6xwSzoZIIbcJP
	 UaK3plkRnuRyg==
Date: Thu, 13 Aug 2026 17:02:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 13
Message-ID: <an3qfFsuPla4SDrM@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rVHh2YLRUGHCaWB8"
Content-Disposition: inline


--rVHh2YLRUGHCaWB8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260812:

The amdgpu tree lost it's build failure.

The kvm-riscv tree acquired a conflict with the risc-v tree.

Non-merge commits (relative to Linus' tree): 13861
 12294 files changed, 833614 insertions(+), 252733 deletions(-)

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

--rVHh2YLRUGHCaWB8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp96nsACgkQJNaLcl1U
h9C2kQf9FS6tM7/HZBMn1lBBvVsae0WtpKpzZBLtKXPgJnY6NIfz6ThPaiF/tbh4
cXmxgRcvg7Sx3E/PTPCk7iuL3FDiHtjXlUvqKCv8l6gkZs0j2us7ijYcyKkC7zgj
YphJsHrcVTA7L22Edluh0gSXLBcLRcBgcNKZzJqW53UjQ6Lxva8/YbGvUeMZpyEq
BhWQuUawqEI5OhpV4bTkStu6dTmqhGlQTpyvd0ZykqEivDx+JKqPXetAVnJKkDP7
CGdx+r1pykDIqobjxz6oGcK+yMm4c/CLWMLUSlULKjbyJk4sPr+xgV8PX8j9we20
sEkdnI5w0LsuIPsfy8zocdL1OfHf9w==
=X7/r
-----END PGP SIGNATURE-----

--rVHh2YLRUGHCaWB8--
