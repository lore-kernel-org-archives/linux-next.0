Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D6D3BED11;
	Fri, 24 Apr 2026 14:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777040614; cv=none; b=avfJQW2ryb45Ida7MH1ecZeHnmOb7aZZd2e6+8VOiIUbH6yl5tcX4LIclMV561cdCFpXjNm0CHNIZ/w3ezL+EDImJbJLQOtAhSwzVkN4jhVj+i1IrEs2HpaoBqPVZaUe/j6uCtnS3KKrrCnYBbdB0KJftrGS1BB3DrYmJ4f7xCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777040614; c=relaxed/simple;
	bh=3JRHnOuK0kq0gVDvnQwTmpKIDMzfSp762nwBOg2b5UE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kO+qaPWkAGNeShusz3DW9WW2K1rZZeIssPItLhFIb+XASO8HDoVeTEnPSoNrdnt1q+dZdoRrbxWe4dwtrFR2LQBgv963i3RfCgg/U08qu7BxOb7Sxq3sAIKNuebR1Lobxexw/se3WcNTa+AEANyv5XhvEVC2T9LssFHTXlWf+Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CB9xqi/j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CB9xqi/j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C11DC19425;
	Fri, 24 Apr 2026 14:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777040613;
	bh=3JRHnOuK0kq0gVDvnQwTmpKIDMzfSp762nwBOg2b5UE=;
	h=Date:From:To:Cc:Subject:From;
	b=CB9xqi/js39eeXqcCVRtgUwio3japK4o1Y1Pfc90I7rfiCx3+OR6m6unilADy6H87
	 JBDiMHKUbmW0ejzhOg0ABPwHwb0UzGHvcmpV898BZ/N/aIln5pJPFcLJGMBZe2CnZL
	 g6S8c9CTQId/6qpe9edlKEp70cclgOYN9M9/gAubdfUUll+0QH0kgUD0Go/SRzPLk3
	 dCyCDq9Xz4JoBLylchXaDfSZ53KhB2HlcPg+2ntcbmbHWUSPtamzarDldgDscfnEPn
	 dTksoXcWsdFAKtqIEuGqhRndnzIiveqPxGTo837uGQRwD++/tigOKkdDN/jnJiMdC/
	 feG7Rz7S8XGUw==
Date: Fri, 24 Apr 2026 15:23:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 23
Message-ID: <aet84gzuY2IooNKX@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="huSZ/Orvc8zMYTbd"
Content-Disposition: inline


--huSZ/Orvc8zMYTbd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The merge window is open, so please to not addd any v7.1 material
to your linux-next included branches until after the merge window closes.

I will be on holiday from 25th April to 15th May, Thierry Reding has
generously volunteered to provide some cover from 25th April to 8th May.

Changes since 20260422:

The vfs-brauner-fixes acquired a build failure, I used the version from
next-20260422 instead.

Non-merge commits (relative to Linus' tree): 1676
 1974 files changed, 50400 insertions(+), 24637 deletions(-)

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

I am currently merging 420 trees (counting Linus' and 128 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--huSZ/Orvc8zMYTbd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnrfOEACgkQJNaLcl1U
h9CZWgf/aiKxtXoz9nLyOnRLaeZju7hXYwbqWmo9dpI24u7WE87AWam3vzAamkpl
DxqTtopNPhbl7y5gHss3IKoiQQ76ENi3wks40dtu6coMLDjFSd7nDIUlUDXWPuno
1EQPq2pybp7xE8wsj/63iJeAY2tKPIfIzDKlT6dZr/o68s9YKjuv8AVf2NuFKkUC
NEKuJ8dNIr6Fb7Ei1nCmM4h05qn3ywBo5J/FMHYGbaZBE8Ra7vZGTiQXKXjSVzw6
oRdOxb3ytt2EeEbv/52WLxf2lS3amzH7UAwH42brxB7hnbw6LN8zvec4O257JFlV
Bj5GtltIFqulAQ4EzcdRVI9EA3q1IQ==
=OPWb
-----END PGP SIGNATURE-----

--huSZ/Orvc8zMYTbd--
