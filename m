Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380C9369975;
	Fri, 30 Jan 2026 18:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769799160; cv=none; b=e+qPgJUPikqDsvyFfz57ZjIxui3OrnLGTpZ5VbOKR57Vhnz7yxFE9npwpxxSbg3d96MTs/Zl/3ll800BZcdM24xfJk+ySRESFAJvOy1LhUvR+r3rgj4yYfODTXSsnTmR/J7m+0QLUNcOV17R4+Cu9OHVG44zyC/pwBoSVCudJPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769799160; c=relaxed/simple;
	bh=td3GNBGEm7k5sY5/R9PjmsDkCOvmX5+ZXabVXP4hWA8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=abfI5ovJsLQ4hv2iaj1hGRzCgFMDkPtp1/M+C7dzVYmGKNW4TiWaHtVCF8zkjbIuJ6cB9I55dgw5fTxJbIiHeM5dDU1fXONTjsCYzMFvZ6JC+LnX2Hyvy8HK/26eX90q1EujW0HCkiVc21sWAf0MQpdNYQyi9OTXFPmu6kpmBvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CRPFEvWl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CRPFEvWl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EBD4C4CEF7;
	Fri, 30 Jan 2026 18:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769799159;
	bh=td3GNBGEm7k5sY5/R9PjmsDkCOvmX5+ZXabVXP4hWA8=;
	h=Date:From:To:Cc:Subject:From;
	b=CRPFEvWlqdMPmEzF51zjzVK5vSi//mTVB57by5fBMNDJ1gMyt4++UcNnDGbd18jPA
	 aPjvnZeZi4rhgAaAf+vzuwN98Z9V69mebNAyyG26wi13B9JDMp/O8TowSbVonJSH6N
	 01Rmy6kL+hoWsGBc+r+4Hr5WG+GWMJ0DU1JctbVhwh5YE6zRSFDyYSv0PNpOfpUW1R
	 SZjKGRQHKxCMMkzX/YGPrt6XM0Ksko96PW32XaeIGOdoyLljl7EygEaxNz+/1mPpLV
	 BYC8VelOzZR1MD7yW0sj3PcJrEn2zGslMEOKbcyzb0CW8ook7NK696VW4XtUX3m1WZ
	 eohhaL+1/cUDA==
Date: Fri, 30 Jan 2026 18:52:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jan 30
Message-ID: <aXz99P76SX65G2CT@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="urOyBXxbeGRcWRRn"
Content-Disposition: inline


--urOyBXxbeGRcWRRn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have an added an arm64 allnoconfig intermediate build.

Changes since 20260129:

The keys-next tree was added.

The drm tree acquired multiple conflicts with the drm-fixes tree.

The mtd tree acquired a build failure, I have used the version from
20260129 instead.

The drm-xe tree acquired a conflict with the drm-fixes tree.

The keys-next tree acquired a conflict with the modules tree.

Non-merge commits (relative to Linus' tree): 9978
 9682 files changed, 563559 insertions(+), 207870 deletions(-)

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
an arm64 build of various kselftests and a native build of tools/perf.
After the final fixups (if any), I do an x86_64 modules_install followed
by builds for x86_64 allnoconfig, arm64 allyesconfig, powerpc
allnoconfig (32 and 64 bit), ppc44x_defconfig and pseries_le_defconfig
and i386, s390, sparc and sparc64 defconfig and htmldocs. And finally, a
simple boot test of the powerpc pseries_le_defconfig kernel in qemu
(with and without kvm enabled).

Below is a summary of the state of the merge.

I am currently merging 405 trees (counting Linus' and 121 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--urOyBXxbeGRcWRRn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml8/fMACgkQJNaLcl1U
h9DMUAf/aVV9hY70wLrUQT5UQ0cUdFW1CX8UyWDt+cU/EUvPhRGxLEqetWZF7sbe
FLGoTb/Q9EPd0ig3ZGV1ats3UFwlEplt1Fy8OuZR1KVAoOa0TrRcOV1d5t0xq4ar
QPxS4hB/7b2uBF+1UwN94qDXtEaNwAv9cVpNcq/CPwk0i0ZwUwaP75YBrCOujGe2
CyO9q128Gi9IhAiTT0JNG+JEXMjabFPaA0qL+QnqMvCK9lGQ8Vztit44fzbtjNzI
xphE5WETu6nM9zFN2o66BCfMxXqVycShCrsTwbm2fE6nCUOJPXLYzw+79iUWEKvK
hOsxtO3XAtQfob6z3JuzhqfXKPmfng==
=NgCK
-----END PGP SIGNATURE-----

--urOyBXxbeGRcWRRn--
