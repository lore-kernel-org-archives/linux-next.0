Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97733A0B1C;
	Tue, 24 Feb 2026 14:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771944305; cv=none; b=g0Denzhs67XABizIbYasIw9jkiGcwfup2kLPpwveHRmX3pv0qMVR3WpHH6uRrFKQCnyKB1Q4a0XxjztSSdtBe1tf2q1HkZydRd1vVyceHATAKw6f/cI1m4GC8Xq0N4E0NjFiEZ/r+i5iXHhOxiIHE9xwxIpz8wjY9oS4T+0m6uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771944305; c=relaxed/simple;
	bh=8X6A4v0Uw9CFnZZtaG6N37eWOThYgpfQ17Uy05CkK9g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nidRk4WbrzmpLhV/a+rw25kGg307wJdah+Jo5JfH2YDSl6v7Dx0k7bpBlcvNBRSV7NGLNhv2N9DPcKd18siMTB6VHYgahVAyN4KWtaCb60UwM/c62RciccMBfFMiNJH11yLDInj0bHGrd/m4CTa83adOo2KFHznwoLCQTI6nbfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g6K/5oub; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g6K/5oub"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3D9AC19422;
	Tue, 24 Feb 2026 14:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771944305;
	bh=8X6A4v0Uw9CFnZZtaG6N37eWOThYgpfQ17Uy05CkK9g=;
	h=Date:From:To:Cc:Subject:From;
	b=g6K/5oub75gDRSrVDtOySuM81zZXwey60TnOxBUWQ3Z1rjPFw7fe5KNjKQ+TvfJVt
	 8dcnOx5E0GHYgETxN2pOE83ao1IUOrtzJb1UUemCRDf2qZV+ZKDVOBjXo7Hh9DFRvJ
	 EU8Ke0e1Ek4zEXNpI7sXI3R3U155u4voW1G+NAPqQbSQAyDm0O+65uOJFD8A0oR/as
	 gRJENeHWZwdi9jEZ9+NzxecfyxMazmGbRs1lLyWQ7slIFoG//AGDsta2QTqogI1DS0
	 S+NdMIkCHuBH4qwqo4xNESrqbagr0zhIFkA70MB3hJUi9y1ytYUPysWDcoC+Zs7UZH
	 ff2GZ+yEDAlqQ==
Date: Tue, 24 Feb 2026 14:45:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Feb 24
Message-ID: <aZ25blqeMq06lzws@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4++c3B8KH5G0Ny3s"
Content-Disposition: inline


--4++c3B8KH5G0Ny3s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260223:

The kvm-arm-fixes tree was added.

The bpf-next tree acquired a conflict with the bpf tree.

The drm-xe tree acquired a conflict with the origin tree.

The drm-xe tree acquired a conflict with the mm-unstable tree.

Non-merge commits (relative to Linus' tree): 1376
 1495 files changed, 145114 insertions(+), 18910 deletions(-)

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

I am currently merging 406 trees (counting Linus' and 122 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--4++c3B8KH5G0Ny3s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmduW0ACgkQJNaLcl1U
h9DT1gf/YFkLpwUbTSxibmXQjRijk7+AOxpOLwMLHSz+VOa/9bIt/wa4j8jSD2fV
/gSKwfj3NL3XrIStL55HyhxbIbsa0s8JPa2/M8dE8opvfZYJYjvRkSM9JaF5ftPl
hBMb2kONvo1wzW9x/rMwPW3xiPYjgdzg62gFCb8ozdElAT9xqLGCDtYN23ixAGE+
A8xJWiWPLXFEPf2fJKelLHRSX14i2toOt+jXZKqQrQ08FXBv4+YUNSwkmXTKGiej
t3SZKA0ZncvAbyYnmyDrLpOVgH3F7/pTOw0JhojN3V1KdkH8KEQMJV/fs/aH7X8m
Wh4jZVKAs8j5ebGMrcdL0V6MLuVVpQ==
=KTYS
-----END PGP SIGNATURE-----

--4++c3B8KH5G0Ny3s--
