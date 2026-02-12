Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB763382F7;
	Thu, 12 Feb 2026 14:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770907802; cv=none; b=VgB4AQj9ubUp0mO/Pt7A2iLkg6zvXj3Y9lWijZrff5bQpp1j2RxaeoaU3RRHUoFyFMThURVWbhCgtsTxXRItJDSuImVAp5LO/HLoeZAeeHiuu5KqYf7CybYOWCEEarEAxvLLLHfHxq53sBlvziOhp5+Ub5CC6wKr90fOyIjpalQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770907802; c=relaxed/simple;
	bh=AxkpoO5jJrXbtI8n8bK1eU06dG2+XOVw8YBOUdc09S8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KAJASQXPv+YT7MbYa+eBulOGOZ5L/Oou4EklBeDdBeDtnkgK8Y8Vcys2wI0nSjmTeTGUwRcdNIURN8DwLIKlqEWqf0CJpHUgeK5YtyRcBgdOIRf6yFBRMRnRa0IlPR/Md7iqZ8HeXKUH+vx10pYWUQ3QA8jWgTcrnxq+k9/VKV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dNJpTIWJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dNJpTIWJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C573C4CEF7;
	Thu, 12 Feb 2026 14:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770907802;
	bh=AxkpoO5jJrXbtI8n8bK1eU06dG2+XOVw8YBOUdc09S8=;
	h=Date:From:To:Cc:Subject:From;
	b=dNJpTIWJqf00JerMxe7/gQ6kgXfJqibxK38/0saz9bgQp4E85csLjsTzklkBrV+8x
	 xYu9QBJENHFM1qL/Llmdq+u0AMGn3tCk+oxSAb0InfFStGZ6PfIuenz4LQLUcyGOpT
	 3CE8MpxgZrm9rXDFWubJZk+qSiszxFTAMGJ2CRo7mN8oJDseUvjr6+iknEpNbgyL+l
	 +iWpkQH/Y3+D6KMtS4OXJOYrzO2k+aQeg/UOHPmhf5P3p+gNlAgJcuQb4fhC2dgmNX
	 XrpiBNp13/kZEUrfIvB7lGoF/nPWofhFowT09p4CtjhXhNqm0RLcILB/4QtH6SanjM
	 9dxVXMi7dyHuQ==
Date: Thu, 12 Feb 2026 14:49:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Feb 12
Message-ID: <aY3olu0xPwMs_4k6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fjYhpIGIR6mhtbrq"
Content-Disposition: inline


--fjYhpIGIR6mhtbrq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260211:

The drm lost it's build failure.

The mmc lost it's build failure.

The kvm-x86 tree acquired a conflict with the kvm tree.

Non-merge commits (relative to Linus' tree): 3874
 3907 files changed, 164054 insertions(+), 66206 deletions(-)

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

--fjYhpIGIR6mhtbrq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmN6JUACgkQJNaLcl1U
h9Al2wf9HIeaHtP2ctW36QM03FUXHbmZi+VLha+Fn7Kfw/mCfnuiS2N+dxB1osH2
rFlcBZGBsUYLTRU/L1Zya1eTXwfHmQfCq75bhE5jjPsB0Cu6+XqDA8vi1rGGxy1G
C/m2PDAVFPEzlsAePIlLqhEB7Qc63KEdz0vKbZPlRoUE+XRmL8DnAvRNO+UaECps
qrsQ6mZREy81O5VBa5pNVSozZjXsP13mf/UPKzm6UisAYdL+3MoaPMyW7RR7Hh7Y
vksb4Ip9D0W59YaSLvARb7Skvlt664i0UzuVnqDagX680k7Nq5edUo/ybUW9H+BG
x4gjTtxYL9uUpgkk/XMqs94pD8Qr6g==
=COQC
-----END PGP SIGNATURE-----

--fjYhpIGIR6mhtbrq--
