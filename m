Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684BE3D8102;
	Fri, 10 Apr 2026 14:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775832568; cv=none; b=uYrICkGhrFUTx4nv9w6dxQiuZhUYSSiPLiS/slPYid6LlxmJtraKNny9jaSW633c8Ro8P7nknmEV++1vvgd6eN8kGdO2nqAgxHQrtfNQB/oCn43m2A6e+wYIoRNfQX40VGKTb9w+DPiCfquHyIuD7U8/vpNSmQwzX48cPaedpq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775832568; c=relaxed/simple;
	bh=7zmDm5kdc+yS4Nvaaklq4/Vy9u4CDanK1y+qSSnWpdw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jBLTKnihUwK2IVl/+3I9FKJugEtL4nGPzsTEczUoU3zfUTkkFnZ8hP4vaLVmxl4IbkQwvIkffTKhw40VZc9MWt2Hj7//97J4h0/Emwm+KNIYU1hjPVXGEFMR1bjLKAWZCWCcM8jVPAiRyPhZ7l3lUZ+8cel1m88Cyi0ian7KfjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GcEth4vB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GcEth4vB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC06C19421;
	Fri, 10 Apr 2026 14:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775832568;
	bh=7zmDm5kdc+yS4Nvaaklq4/Vy9u4CDanK1y+qSSnWpdw=;
	h=Date:From:To:Cc:Subject:From;
	b=GcEth4vBM4iBp4olyej31HGOxSVmov32k3Ozp8aOf+fIfxhHrlfw+NRzU735I75oS
	 bRjMnXX36IyV8g1aqxzejBnQnN3+ApAVuuK5/1NMAlXJAohIYs3/Z8GwSirooMuHSO
	 8OikL5udMULcG/Nyjxcbd6kj06H635gjPORCmX0b7D1jwW/cKmx/p75rqaT9+FBkJq
	 Mm/XJ1ALKOD4t0z5KG8uRe+ZnuiPxW2nr0zIKuT6aa1PlZWRAV3nLr0Pz+9DkMJ/Sf
	 0EtHOCpRza3KRo0dV13DVM+52HuPtY9nQ1EvDtOZkp3qJu6JWrWxiDuHrewJRNsegS
	 //KsgNVATDODA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 6C5E71AC58B7; Fri, 10 Apr 2026 15:49:25 +0100 (BST)
Date: Fri, 10 Apr 2026 15:49:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 10
Message-ID: <adkN9ZX6xjhARbbh@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EzXwT+QPb2W0EP5X"
Content-Disposition: inline


--EzXwT+QPb2W0EP5X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260409:

The dma-mapping tree lost it's build failure.

The pci tree lost it's build failure.

The input tree acquired a conflict with the pci tree.

The block tree acquired textual and semantic conflicts with the net-next
tree, I applied a fixup for the semantic conflict.

The pinctrl tree acquired a large and concerning conflict with the mmc
tree and also a build failure, I have used the version from
next-20260409 instead.

Non-merge commits (relative to Linus' tree): 12130
 11200 files changed, 657730 insertions(+), 220521 deletions(-)

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

I am currently merging 414 trees (counting Linus' and 125 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--EzXwT+QPb2W0EP5X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnZDfQACgkQJNaLcl1U
h9DXoQf/UdJWCnrecrbRlk19RJyuqpbcYtKrywbAT1qGo7AQVQksQSEcYez2qDhs
cXPMJ7dM1U6d2NeODRsT39etPcTULADQshFYsr+AzhNopvZ3jJPJB8466ZOn549g
qWFvx0IsATPfiJrsadR0duXMOq/tAJXfDvIjV4xK1X3BqIKvIYeeoIvnqqqG/vRS
wx9xXyiK0e3tLkOUaRGNwIVYEmk9lk3Wd2vtMfk7M4BUm29sDtaAoay5Iqs841nk
jGX05JEY5ubPpRnNAENcBv4cw8g1v4/lRgCBw1kin4W1OZ/wTXpqo4xXuILwH4Iy
nuhPZVGksgNNr488fVCMJkz/9YYQtQ==
=MU3r
-----END PGP SIGNATURE-----

--EzXwT+QPb2W0EP5X--
