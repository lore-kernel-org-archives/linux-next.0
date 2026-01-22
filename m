Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C003B36EAAD;
	Thu, 22 Jan 2026 17:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769102599; cv=none; b=TKfhgQg/eqXePrrEGdIjSC4KKtLjJWCnu2/NJzfQZdb/3at+ilTuoeNu5tFvrOfhkdd+6i2Jzb28M9qfMShym1r1kvFiMeQ0d5MsyXqAiIjFB3zd0gJwyJbaQTYP0IFK/E3vgkdt6+qZ1kdfoT3YlF2CQ/ndobbLjDI7fBIrXN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769102599; c=relaxed/simple;
	bh=1VrGt+M81cxLp1FmdN3fnoEBtKrtUT1ibiqJipJkasA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ndsArbmCDUo7fYu2dQtO0xjoEYp/KogICPzTXf33F8vjKVxLFxi7NTKamn6B9VJWFoLXOm2sQvkU8ApAHsnMPlDAg9hL5tL6oaUm8k2bUdMxGqfgWqb8VGSFcy2pVfLlQET6MszHqJ/hzBm6/iAivmm/IhAEq0Z2M9cSS7JjHlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=haiTRgei; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="haiTRgei"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3EB2C116C6;
	Thu, 22 Jan 2026 17:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769102597;
	bh=1VrGt+M81cxLp1FmdN3fnoEBtKrtUT1ibiqJipJkasA=;
	h=Date:From:To:Cc:Subject:From;
	b=haiTRgei2DpJZMj2UX7/IMHet+Ov++E0wj31VJT2eU6UYCezBHfdP3/JbZbu2hqEa
	 zF/RuOkW6xEuMLfBiki8BaT1kIUn4Tik11Ck2Uz6aXq0+rm7HQG3CZnA13rUifHaVe
	 dtAal0SgrzvGYWz8zfzkgBA/olD5YW749knbvUUZAfnA8QXlbPrSZaoVsmZX2I1lm3
	 gTfUUMkNshi/8Xqja2XQ9JftujaqVS5g8h4fWGtHJtF62zDASFfsJlJt2HUOOu052C
	 zo0MaIaOChSOn1XxBpQbXiTWS3NLpla7nuwCVu5vQxEJInYaYcuOdJEQ5RHCKiF84B
	 LRovOWs5CbDnQ==
Date: Thu, 22 Jan 2026 17:23:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jan 22
Message-ID: <aXJdAt5G-O4DEG0g@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hCppJl1iCfdHV5PG"
Content-Disposition: inline


--hCppJl1iCfdHV5PG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260121:

The mtd tree gained a conflict with Linus' tree.

The tip tree gained a conflict with the risc-v tree.

Non-merge commits (relative to Linus' tree): 8375
 8183 files changed, 478222 insertions(+), 167031 deletions(-)

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

I am currently merging 404 trees (counting Linus' and 121 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--hCppJl1iCfdHV5PG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlyXQEACgkQJNaLcl1U
h9A/GQf/e30BmwlvBOt09hxeUPIVZGv84AMVLzYlX2Xy0HD78/aDMIo3ZUA92y49
d3t7S4RK8eJh3TcRDP2kc6mhlxf4wDYpQ0XFPQB7oirICLYcH7EwHXqQweWmPXMq
4qXnXFEG5gp5QGBl23SETeLGcwSj4RDmDTLNra54Za613+o62+2fnAcIzLbJ4Ieb
UKPGOKfwncD3iLgI6o6So1fEF0JwrpYonD2tI3gajbrdRCCq/usqB4U1ACt5Bx8G
Q2uKNlFmAgXqHRv9jqKIW1H07E5a9aEqOcQaM8loVq82Ag1TBjJwSN8grtT+ai/w
OPAoKf7ca9Vm+IEXbU8FjkmtI0xkGQ==
=PEm8
-----END PGP SIGNATURE-----

--hCppJl1iCfdHV5PG--
