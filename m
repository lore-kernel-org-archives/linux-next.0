Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86293033CF;
	Fri, 20 Mar 2026 15:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774020821; cv=none; b=fM9923IrjAhptRRXiSUJZ1gWa4VhoeAM3ikCoiTbNnhI8YLz73B7DTOVJeOX2ClTE6UA6VmYe+ahBbqOkG28xO4dOLnaGr/h1S/J9JyRZF45+qsast/jcIuzyD4Ps2cUEEP3O8CV68LlMmljga/YlV5KkccMoplxDmLFlo4I09Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774020821; c=relaxed/simple;
	bh=fWGqHn5onBVIaB14bp8ESJl7B1m4jLGltBuEI3Hcf6o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NpJO0SWtGRvJj3ZVfUvSXDUDflqlhIZfzcqt4JM9ZGDhFjF9/QBWxk33bTjFUakilpC2Fgq79BKrbBHw255XB/N7hePTFkYAVbJm/IOPfvgvOc8OZd3Cuv1fItljxk3viK7jioBJwJGrygIeKNqL3hk7a2AojSUDqYBm3u7Z7Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hiwHYjAY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hiwHYjAY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B240AC4CEF7;
	Fri, 20 Mar 2026 15:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774020821;
	bh=fWGqHn5onBVIaB14bp8ESJl7B1m4jLGltBuEI3Hcf6o=;
	h=Date:From:To:Cc:Subject:From;
	b=hiwHYjAYMt8/Ghy7pfTwiW2c385Vj/N788ARqwu+lXOszKpDNVkTdptdl0LTmA/2B
	 e+eY/GAcvP/p3BfcDPFdihSFsdXIkHoBvLP860bhDL2+qxKRNXLd1b0cEQXqF8Xe3P
	 pr072AGB48VQ4sBQqeqElgnVs0vyuqK1WUWXNHd0td39hQYF2kzkMx0rpJ8XT0Acyl
	 kpfAoxcbz/+93gm/upmbUbiLnrzzn5MH/4Si0RZORbc/0yP1BrjwB2g1ZMh4V43Ksv
	 yDtEH/bPbArRD/SnO+iLOP8BpngM2fjZdaoIrRSLXxEg/AT+FouztzsSw/zosjGx+d
	 K+BxGVxys2EAA==
Date: Fri, 20 Mar 2026 15:33:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Mar 20
Message-ID: <ab1o0UcDG8ZXiQln@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kcK23KK1r1GExEHr"
Content-Disposition: inline


--kcK23KK1r1GExEHr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260319:

The xarray tree was dropped.

The mm-unstable lost it's build failure.

The drm tree acquired a conflict with the drm-misc-fixes tree.

Non-merge commits (relative to Linus' tree): 7094
 7164 files changed, 471772 insertions(+), 142188 deletions(-)

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

I am currently merging 411 trees (counting Linus' and 123 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--kcK23KK1r1GExEHr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm9aNEACgkQJNaLcl1U
h9AXRwf+P8RZ6zZZ1KIc1ZjvUGtvmQYLSw8aoC3UvXGleuhcZdLUdiZQQyMcqfTE
5lZ705g3x116xiL1+8drAx+/JfqWk/KCdEnXgIiXSsqs+ZY21UV6OWxiOREVcwm1
2vRJZRErAuYfSEmG8GMkVN09UAHMr4y6uTTXJXUgAjXaeuk7QiqkpKzYU4OyNbvl
ciRwIyIUCEJOTgfxUanoGbuxZVcRwWOhWK30SidklbfUKID35OB3qsgstEeso6Iz
pAXOpF7x3mZcN0+HcAb2gpsmcZbzEJoIGV1qfzcgZ/gyFSmAyKsk777DJGCmBNfE
YBe6BvgV42HJJYuADNb4nXH2mIdz3A==
=rWdQ
-----END PGP SIGNATURE-----

--kcK23KK1r1GExEHr--
