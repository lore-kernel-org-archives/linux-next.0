Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA023BFE4B;
	Thu, 26 Feb 2026 14:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772115656; cv=none; b=tu1arHzBBftZ/jp0TwvlUcd3736wz/cP2ilEtXQT5eeTzTwTjnft66E1VEKgqatZ2UHX8SoOdGuOeWfcJ6FZVNE+kLzMDrkA6FTLPtLQV1DlBiHKYt+zBXSivTr8yojadBo/CbXkVJT4DfO9M1UyYAMyzMHV0vZ6sLEHH3wh1wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772115656; c=relaxed/simple;
	bh=zVk8/ApV7tHhDOimzTdkY3YBILgDLMaC4CrI44vpQ+8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZwqucqS1Uv4uVkssjBKZxsAH7gjnBDNge+doARduVGJdkXbB9leo6d9DpEAB9C9dOJ0gN9cqLy7ikx56Hl02UZDY95NpxmkZ9POjgz3UI0L2kSyfdxrBGeApHwkPZuG/jqKPkB0fiFJyLaOyRzsjxs/4v6HBMbJRaj1Y404Z96s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tohhGlrq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tohhGlrq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 937F2C116C6;
	Thu, 26 Feb 2026 14:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772115656;
	bh=zVk8/ApV7tHhDOimzTdkY3YBILgDLMaC4CrI44vpQ+8=;
	h=Date:From:To:Cc:Subject:From;
	b=tohhGlrqD+LBaVoKP5FkGpGtQfR+1+OquhB5jBPRPGlaT14eLAkLJrQvXa1OQrRWv
	 fETh+m1Bghs+MIs2bVUnmtIzUhXs1WbKTHY/Uj9smjRHD4MZ7mw995LUwMYmjgh1/O
	 Q1PVN9byDcpTsRfyzD9znwEaQNmUKGHpet3UQe+VxZuhlKGdns3mSox9g6l9oHoxH8
	 x41n+ZSHGs+2CVZ1BbonVdQTa4eHWgBYmPnFIOjyWLngN9kz52lF+MEfTuitrNJSHi
	 6o6ae9h4PbBVR8L8x/NrqpwsEai6lp4gmREVmtyvMZS8qCQqtjrFTZsCFVUQ0opOP/
	 L3CHMcN+gY4Jg==
Date: Thu, 26 Feb 2026 14:20:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Feb 26
Message-ID: <aaBWxNYF4g5jRzzg@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w6t0usUr0Bb7MdOn"
Content-Disposition: inline


--w6t0usUr0Bb7MdOn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260225:

We now do a rustfmtcheck build after each x86_64 allmodconfig.

The net-next tree acquired a conflict with the net tree.

The net-next tree acquired a conflict with the origin tree.

Non-merge commits (relative to Linus' tree): 2264
 2557 files changed, 203760 insertions(+), 33660 deletions(-)

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

I am currently merging 408 trees (counting Linus' and 122 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--w6t0usUr0Bb7MdOn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmgVsMACgkQJNaLcl1U
h9Ac6wgAhnIYKvBhWCQBbP8QCXiIQKe7fiforHa0HLp2EOSN2soF7J1bIeBZHNgE
DF4PpW5f80blw0altUmJKJK70lHcuAyGykVZqinm7rPNL57vQcnfGToN5EinjtLD
5mpckWGCxs63IsKC5HODLHgw/Jow7/6SQ6kIkvMMdBvngXOUwYoIzDmDw16Bh6oN
pTOFjlkYkgyJPNBjJm4rQn5gUP4wQWKR+XP23ITp/N+JXgTDDdquDFnKlOVdNzss
s6/et3fR/5bUKlJsLF2PIESzFMC8komogxMV0uQSwKTvdlH24C+fg0vwBK/41vZ7
8JshbcLinn9OIh8RubP4G/FIIIZbng==
=tUG9
-----END PGP SIGNATURE-----

--w6t0usUr0Bb7MdOn--
