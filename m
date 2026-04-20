Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F8E158535;
	Mon, 20 Apr 2026 13:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776690613; cv=none; b=M9+K1M1O4ZDtqXlSrSDVoijEgjkqGvHQC2Mk90WAZSCfBTTq1k/QtjhqpvVdI24oU8R/SAlZb+36eL9utxDVAvqltrbJN8PkdtAXWlQZstduUmGCYKZ9LWjnxoIP1kC+dhNos1byP5p6Ad8VmQKSYLjuFI4/JZfUmNyMDfwhBSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776690613; c=relaxed/simple;
	bh=WMr+SyxNsz7OyfPewDTxdobt1oLiC5gzcRbi6c3IQyA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i4GakS0wAzFAFUjqhrxTmDNonPy1huSAm5Yr0zKiaL1+KUxducqRL3fNbrw8ry9FogHpeI1KziMnUR2EFqhqRExs5NKT45/Cjdp9x8yFSp3s8E2dzpP9PRryiiZ+nNeFqGKX1o0CU2kuN17n3YhdGnnSuih2kwWw0DCqytBQOIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NLoOQ+hY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NLoOQ+hY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 902B9C19425;
	Mon, 20 Apr 2026 13:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776690613;
	bh=WMr+SyxNsz7OyfPewDTxdobt1oLiC5gzcRbi6c3IQyA=;
	h=Date:From:To:Cc:Subject:From;
	b=NLoOQ+hYbBDWxgRNLgz1PanUoY+0d9rFJQJUonmLfzEvm/SH4Ka6Ch0A2envoghD7
	 AjV9GD9T06q46KAeOCdcUYAQ/X6dJFTIvTM70nW8AEKxqBrsf72hwWP/UYemIEoX01
	 d8SPCj1zhLE9gO/xDQBYKrwgIQJFKCJFh9RA5usEwHahwB9fDv7+U55FAv5OHzDfhw
	 2kuUUz8iBOdcO9wNEa5i8I+oMiIed0qh1uomyapyMqEEyBW2IMp6yb+Dbb7HRvAZ4S
	 fjgV027PIA+HuGE2slA/e1F8D1eD/kwWV4pK+BZ+SagAF4Qmy8sXSlQPYT4WB7Clou
	 MWOIOEshwPOAQ==
Date: Mon, 20 Apr 2026 14:10:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 20
Message-ID: <aeYlscP7bXs_8yf9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dsVv8EiLtexh4AUm"
Content-Disposition: inline


--dsVv8EiLtexh4AUm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The merge window is open, so please to not addd any v7.1 material
to your linux-next included branches until after the merge window closes.

I will be on holiday from 25th April to 15th May, Thierry Reding has
generously volunteered to provide some cover in that period.

Changes since 20260417:

None.

Non-merge commits (relative to Linus' tree): 2086
 2150 files changed, 73598 insertions(+), 37860 deletions(-)

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

I am currently merging 419 trees (counting Linus' and 128 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--dsVv8EiLtexh4AUm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnmJbEACgkQJNaLcl1U
h9DM0Qf/VjGrPcGl6oSIDh6OwgYv08SLQ2ycvXh5bCi7WcnCfQ2nyas98AykWDg1
xN6diIgTD4xl3GKcrrqgmFDIFs3sf/yxvEk69h24qqXJyQrvPPTLYzqu8YJidSFu
xANtw2A9QH1a3/oeeoyvYocsi5GgRm4k9wZujwwv/GRVeTGxC/1Ug14d/5Mizh++
Dp0j0wR6MGDfJE9bhocrYrgJ3wMCP5r3dcfd4yOnMpsg+K8DkodE6f0gXPZAhhlq
5nbAmpcCnHV6DSHjofqLPGYd4DIrPVjyfhP18RvMbqSY/ZsxdpTQbAlcL+Rin+N5
2jUydm0DGFAq8gSe4Keo3ryGFJzE2w==
=Pn2I
-----END PGP SIGNATURE-----

--dsVv8EiLtexh4AUm--
