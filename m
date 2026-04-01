Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B3678F2B;
	Wed,  1 Apr 2026 15:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775056173; cv=none; b=Bc0N4BIyuxOd93CqmiKIyDEHiE0xPsCXf2YpUP8rDyK1w/ILEMJIdMBR1zWqzjzG5eFTnW+Uiaj4Ceqd2n1kEakLMDcsUq2AmRUzb0tPWOW2n7UYVqVuQRwWUuQrPaBujGIKEX4w0sLnpvz92SQirUQtszFojGT/WNjmTzdqXN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775056173; c=relaxed/simple;
	bh=wGmWDEbWGJZhllc3xqORcl9zu/tLiAWGapMJ/Z511wI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sq7AQFvh1O+gkDAAINNysIGWxlgaVwRT8oVD0mABa+Hob/OpG9SrMn0mTY53ku1zN3vxxp94Ke47RqtdPQMvnuDA42aYSiljFPmLluxQaZvGihx+G3JoBPeFknCgfxLeP/9L8k5LeVRDyCE1WPciBNTzRk8qEVSoMgqyYzLvfMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TBqujZoM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TBqujZoM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16173C4CEF7;
	Wed,  1 Apr 2026 15:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775056172;
	bh=wGmWDEbWGJZhllc3xqORcl9zu/tLiAWGapMJ/Z511wI=;
	h=Date:From:To:Cc:Subject:From;
	b=TBqujZoMC+RyUfbZIvqcwWZg+BkENth8sjNXQnrHQU6yjPzu8XgcWESZpbpi1Drdu
	 fErkv4MADWw+jekCiKWX8OQtw4rYhQ+g2etjGgKhnOaTre3FdWjldcB1uormKUXQGR
	 vrErRVzFID70ewlHy5IV3tl96BVUQB54BUxAHvfrsbjhWnHj82ctfpbSqpzo70k7Xp
	 K3TjA08FRXkdstd+Peb6RlDU2Ul5dQDxzUBEnN/u2EXINfX+V13KUBtPoKuSqMD1gC
	 Evj9gpc+kUmjp6nS40M68KtD4kFx69Qu+b1pE0qUic/hzbfkaUyBBblPd9lEvG+vwJ
	 8XU4DUFiBs//g==
Date: Wed, 1 Apr 2026 16:09:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 1
Message-ID: <ac01KcHzDErLkPHl@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CPM6N+dHpD2K+VF7"
Content-Disposition: inline


--CPM6N+dHpD2K+VF7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260331:

The bpf-next tree acquired a conflict with the bpf tree.

The usb tree acquired a conflict with the battery tree.

The cxl tree acquired a conflict with the nvdimm tree.

The mm-unstable tree introduced a build failure in the final build for
which I applied a revert.

Non-merge commits (relative to Linus' tree): 10090
 9631 files changed, 581498 insertions(+), 187717 deletions(-)

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

I am currently merging 413 trees (counting Linus' and 125 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--CPM6N+dHpD2K+VF7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnNNSgACgkQJNaLcl1U
h9A3sAf+MD/MCSXIz3owdN9H78RIkwtRo4AyJPM5sMnJxWUT+S/w11gXawO+mcLi
SwDkpVISIu7wfZGPPEQLa2vnJc4VepwEBgKCB0yjF9mQidKGw5tnBpI40bIHrH5q
jykZCf/cPtb0xN84wp2WIdVXXDYvcgFJCR4RUBZ67vV3X3SI+gj1CoO2DoH2NEbe
HWoo6df/rVF8ufaASaFWMo7y5tlErpQl408LFN81yZiWB+m7UW+Svfx0bETWKx9f
qlUZWjltxPSy0+X5yAADz6NGai24mfz28ns+Tm8UYD0vWnLNTC2+c+Ofwf0dJOog
rZDYJYuJv7Jqk4Z7HZBzbO8xFwkXFg==
=w9IA
-----END PGP SIGNATURE-----

--CPM6N+dHpD2K+VF7--
