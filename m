Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE5934D4CB;
	Fri, 13 Mar 2026 16:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773418367; cv=none; b=Mp04NPWkjkH9OKSydoMZbj+cIVYeMrb2KXid7jNpCnIBNCsTniSFbh7lnwEvsTPjNZGISP55U4fVWDBB9CELIrCD4RjlKDA06tEAW9WL2nwi1hkfwM4D3N3/rkudgi469TAKcXjC+VtpvOaBu5d1ZPLYo5mqyzeOZeXyT1xzzmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773418367; c=relaxed/simple;
	bh=Qc5ZBb7f0b6w5Or1n/LTcrBZdZpWKCb0EpcXg4Skq6M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vubw09xwiTKyFDD590to7/PZMClVsJLVsRFTtjHdEmQ/FzW1ns5H/sbEzxGkqkH44/6cCT/w4IhvYN4LBFetNj5ggWBzloJhMzuJpQ/y0n366AAypuOfB7fflEoAkGHKG+224vxhi8NZNcbHjrwX1sRMvpYwOdHGeYUoJqe5UmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ED+9xNH6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ED+9xNH6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 196D8C19421;
	Fri, 13 Mar 2026 16:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773418366;
	bh=Qc5ZBb7f0b6w5Or1n/LTcrBZdZpWKCb0EpcXg4Skq6M=;
	h=Date:From:To:Cc:Subject:From;
	b=ED+9xNH6S1pTjCDtXWRHcaFaMbihdMA+H1WEf4seUUDp6q30TvVkQGKSwdR+r7Vop
	 lsXP8CMBGHexGb61JuLp7QeQ1aC/ylKDKYQWq3FMisf82E39K145V1lcNrKGHQaSn/
	 b/3npE+YCuBeKGsy/1Go8G/buAtaIB1Z5ofcuUUf5JzIbJXcuOH5cMXcCm3UpyAIXu
	 fChziYAoLlrbD+Txv/k468BQStT6HAPaHsAMzd93V9CAi8g4W04bgarQprsD4QZq4Z
	 hPoHw/jaCi0+5mUhwOGJ8fbJGYkI81xdy+0nP9roTymkPLn4oI/agQzm9ek67HGZQD
	 u0DT+Poq441rw==
Date: Fri, 13 Mar 2026 16:12:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 13
Message-ID: <abQ3e5bOsFXcG0BB@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mab1GUElWkbxZ1ic"
Content-Disposition: inline


--mab1GUElWkbxZ1ic
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260312:

The vfs-brauner tree acquired a conflict with the origin tree.

The vfs-brauner acquired a build failure, I used the version from
next-20260312 instead.

The sound-asoc tree gained a KUnit failure, I used the version from
next-20260312 instead.

I applied a workaround for the tip KUnit failure.

Non-merge commits (relative to Linus' tree): 5682
 5915 files changed, 360634 insertions(+), 103445 deletions(-)

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

I am currently merging 411 trees (counting Linus' and 123 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--mab1GUElWkbxZ1ic
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm0N3oACgkQJNaLcl1U
h9Ca+wf+IU2AChkrXIFznxGWgVrEa3lMmSe6BIwbfg0Yf21DKnnXQjZMg1PV/569
I1vDYt+sJIOTUOXu31q9ZWIGxfMnz3gAmOc87peHpNtTO7G491iGbAoHhP3ruQ0C
v8G580ZnZ4iqfu65ugFOEeRnXfYE87AX8IFA3vv+nL3BX58l2hEOMPjNfi+E565F
Yeev1Du07RFpEGn8dz8CCo8RFmvJvIGkJK8E2muHKfvumKkGRvrBBmLrBFPlI3Hv
iwifpSRs79vJ1qx9pNtmW1cTGlPDl0MZPftar5bR190SNQF1YFoo71KgSZ+hgKXz
dIAGkVb8ozWbm/wZZwq5QONt3m+QGg==
=xhU9
-----END PGP SIGNATURE-----

--mab1GUElWkbxZ1ic--
