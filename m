Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C923378D8C;
	Fri,  7 Aug 2026 17:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786122853; cv=none; b=qoQtbsAxUh7K1vIT9HTePIZd7g8hiuZLOihq/MWZgmyHrBnL5e+E0ocYVvbwRsPMrI80Po5bsr9Y1Ga81zMJNHIGltUNPUlYPaysFkuep8u3wo70sMUBlRrjWaVzupOFUDV5tJBB6TkHxGX6QfjBq3IYiVFEhoWZ8k6wYTQfHCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786122853; c=relaxed/simple;
	bh=brJ8PJilwopkybeTJG28HCoEdKNiJbiAbGVUWTW6FuA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OhQ8GPYRb9UEoFUV1Ex0GA/cpwyiSxlVeKIgiPPcBygcmb5yuEuAOvzsw3UBuhx4RgZBGk8RXwb931lcnAV1WMgU50IU+C4ofexpg++wu7oVoWR2DYpANLEWh1r2nBqgQBrBjxRx2vJYeqaOmlfleyV1f3NDezhOT1Ttu2YhGkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WrjMszqr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WrjMszqr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F2FD1F000E9;
	Fri,  7 Aug 2026 17:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786122852;
	bh=hgUN/tJnbxf2rSt+v8dTz1xDDsV1b+MmpowTDNpHuU0=;
	h=Date:From:To:Cc:Subject;
	b=WrjMszqrzam0SrSEasgeB8VUbUF0s11m6j0//k4peI7vXHPmpMiXgDRACszYkOXkp
	 z/dMFCaXOzpezc91rWxdgciIRJeIBnG6jeUA+ZgGtuVHDhbuze+QMHUwQjoZ+JhL+i
	 YOFEFEhggFCCC9I/0oGYiAw7BFJdkC+v51gyGPSsmj3hj1oLg+y+1+lBR/l5KOJ7ZD
	 ZCClAwU75Bjcc2cdSL4y0ecJ1mZzzIpWC45htLI1T1eUvKih9IW2fNmGnnx3xAWOwd
	 sbvNtMxmT3XSTjFyqDpLPUQlZiGUKlINVxkuPdSogkgp/Xt5cgn0rFTPrYM9UWAwvx
	 JZSuqx+h38E/g==
Date: Fri, 7 Aug 2026 18:14:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Aug 7
Message-ID: <anYSYCW2egVFjQE9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Vfucj1rlnPFkcN7y"
Content-Disposition: inline


--Vfucj1rlnPFkcN7y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260806:

The drm tree acquired a conflict with the origin tree.

The drm tree acquired a conflict with the drm-fixes tree.

The drm-rust tree acquired a conflict with the driver-core.current tree.

The amdgpu tree acquired a build failure, I used the tree from
next-20260806 instead.

The kvm tree acquired a conflict with the kvm-fixes tree.

The kvm-arm tree acquired a conflict with the arm64 tree.

The apparmor tree acquired a build failure, I used the tree from
next-20260806 instead.

Non-merge commits (relative to Linus' tree): 12426
 11021 files changed, 579344 insertions(+), 196843 deletions(-)

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

--Vfucj1rlnPFkcN7y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp2El8ACgkQJNaLcl1U
h9CYvgf/XZ5o6fr/HYrfRkdeK6KMDxxPr5b9A+IsAZGyvLjzT1+FQgsvFjPFbHTG
8dcksyHGFCg7DpUzDKFA/gJqUW9vFl4usHmrbCsN0ZjBrqaDnId0VNPeqAbblLI/
rXNl1kEBi1sddkrKCCw9FsHxfVrj+ucLaFZDVivhZdKr8CteDfw1SdQwTPbLUlCA
D9oWE7C5HIcFQxOCdqtvyUyD4uZuNV82nRlnYZMT3u7n9zmKtVwcCdP3PFMUteeb
dCw5JUS3PqobkAKLn3tsasDPGLwln91Ff926pgRjCkYYzAN300dOVez/DK0GPAPI
pdZWy/5vy41S4Ii1kLxG7xfUGKzEXw==
=2C9c
-----END PGP SIGNATURE-----

--Vfucj1rlnPFkcN7y--
