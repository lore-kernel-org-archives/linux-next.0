Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3399940E8E7;
	Fri,  5 Jun 2026 13:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780666701; cv=none; b=eJVDfpgztSKu6a3QFn0vlBnWjB3BWfSPOcfqhGTXeZpk4rbeuoQj9aOQmgkEsTaFe+hyv209thfc1M+GQ6bQsbwJ08EIbhxgLkR7R58vKHv09rWgmMYlSGflqXNSJGuft8sFH25SLnBUnJQZoMZUCGXutJIrbdd95lmLXlC/oN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780666701; c=relaxed/simple;
	bh=tOwyO0pTJY0NaQwa0DjSInxxadR/JYMAKjcyb8WVrHA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y1ihDaJSM7mTYJAHNaDqajwoOuhfOILOOgu2BXxZzVmadA0y30k5u3b32dfYYwE2+CgwwNufZ+QrgbqPv3qXKa5DDzcKpF95FWTSN27YNX9i5YF9dvbi7Mwg7UrDHhyvhsH3nool1WPj9IX9ZRLyerMCLvwAAwjZevsNuO6MbJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Th/Bt1v7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Th/Bt1v7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA2A61F00893;
	Fri,  5 Jun 2026 13:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780666699;
	bh=XyOXZ29pjZ9Bu45t6S70w9y7kQMTuR5Li7J4tD1DLwg=;
	h=Date:From:To:Cc:Subject;
	b=Th/Bt1v7MF6gjAmg1tPD9TZhMz0n0oCRK+eISDU+PntcTIfumTFq1jqI4vHJT7nRZ
	 S30mu62ZSUWNMJLgqdt8o7hj7h2aO+/oftkiW/XwumFYgxPbr6j/E6D7CJ+B3oLi5D
	 HmtqeDmU7F7XL/WshiIHRRalIm7SbgRQ3prA7NfbaUTbYs1Ef2g0WhSv5coNhUK3fb
	 tJBetdVHNSdG2reKX9dR5ljvmNU1nHwNtNZq7F0WMsH12AzEJf5663QCB16nWGozn/
	 LoNNJZUaz0DTf8bgm77BWhl0tcdk+W+F9e8TpisGeKBiEdA9LFlSSUEPJr4ur796qW
	 BzwHCQ/xlBWog==
Date: Fri, 5 Jun 2026 14:38:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 5
Message-ID: <aiLRSHeK7b5qEk-c@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iWfGFjVG9DqeNSwD"
Content-Disposition: inline


--iWfGFjVG9DqeNSwD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

It turns out we have not had rust coverage since switching to LLVM for
the x86_64 allmodconfig builds, neither clang nor GCC is currently
compatible with rust for an allmodconfig.  I will probably switch back
to GCC from Monday.

Changes since 20260604:

The ext4 tree lost it's build failure.

The vfs-brauner tree acquired a conflict with the extfat tree.

The vfs-brauner tree acquired a build failure, I used the version from
next-20260604 instead.

The sound tree lost it's build failure.

Non-merge commits (relative to Linus' tree): 10525
 11347 files changed, 697251 insertions(+), 219350 deletions(-)

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

I am currently merging 423 trees (counting Linus' and 130 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--iWfGFjVG9DqeNSwD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoi0UcACgkQJNaLcl1U
h9BW3gf/W3aOiICYY6+oWd2Uqu3wIp41HG53H1aITcewx6elhYeq3i/WisC0Io4s
PFSJPVKVKGFQa6+G7dPNLjXSPdw6urfUQWMh953ghrRMzZjndqlyEAT7EnWILh/h
zxsxJJO/QlK5pXgW8/7NdYP1AzlnOded31z0iqhZQ/IMbCtxKtobuK4wsZVscIPG
IWsXgsKoKAdD5XHniQ90ZKABWMRbQlbcCsU0aNokdXFUZJrTEwqX01QmN7f7Rn4l
ANGsE5KiFfYzfqraw0DLGhQWrp8SKugsKLHkCl/jVlacPwKNCkYAVwNravzGlGir
9GdpRQcC24IasjFjD6gLqrzEHdrR1w==
=uA0K
-----END PGP SIGNATURE-----

--iWfGFjVG9DqeNSwD--
