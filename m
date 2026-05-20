Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045153939DB;
	Wed, 20 May 2026 12:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779279526; cv=none; b=tybryOECTXs85Fp2/tRepU8wVrbjJWaXUGj8nyPErfCjLwuAazbGuGPxlAOpGoWGQFcojxLYhQGHzsMJOw6wduW34uyUx/HSASoTlO7Sna1q44mPVhtk90RYuXbNDVZ/BhpmOsX4jN7RaKEEvC1NZDiCfBqxWMJYLkOiQnBRDAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779279526; c=relaxed/simple;
	bh=+TvEfK2/ok4eKmf5tE9PJD2eOiTiWczdVW0ABQ3ofqM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=no6J8InTQT6fCSWeJhNnvJwrzR+V6FxOJjkp9SKMUjTlcNgBc4Od7d3PFwjsUqxTWJv8lGRiciWU5gboSyo70nNAETXqX346Bjklg6BfG7D7b/Wsfnq3RpfNKBJlxXCwjH2mSnDyYuLD2cJzL/BfqfKKjvmoydHbMzwGf5Bx8zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=owHf9gwV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="owHf9gwV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 484371F000E9;
	Wed, 20 May 2026 12:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779279524;
	bh=zoN//gAQbZwgt7XzUzwf+SlhyhQXRAAhwy8u+Pnqk+k=;
	h=Date:From:To:Cc:Subject;
	b=owHf9gwVUQeWMFkTM2S5JDxVmJeoWOpVPQimqJA0O5kB4bv8PuOrUXIahfg1wdIyu
	 99o4U2wcn9gwKA5D3640k5TSN14yqjYhr5ixf3O7CKDNiyfddemRIFQQOMAF+5PDdV
	 Ovrbopf2zcjOZS+KaGV8kdctbfimQ9U5q5B3te/LOjP5ZiF8Y51OSAP/sQ6Oe0Zuv7
	 LPBQfmzwcG+OMIk49Ga5E+OMNEcCEpEBvNr2QzORjuM/9YQ8yarNHbXRr3TtzbXoIN
	 ao6JXGwfOQFT5zooDTTjPFwejclPvwxSVBuROSf+ZpbF24BW4cX7HgRvIS8jI3NJgL
	 VUlYJ9QUKuSJg==
Date: Wed, 20 May 2026 13:18:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for May 20
Message-ID: <ag2moaJsFXvM4nDy@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KJ6IxbSWnyJiBgCU"
Content-Disposition: inline


--KJ6IxbSWnyJiBgCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260519:

The mm-nonmm-unstable tree lost it's build failure.

The amdgpu tree lost it's build failure.

The thunderbolt tree acquired a conflict with the thunderbolt-fixes tree.

Non-merge commits (relative to Linus' tree): 6144
 7173 files changed, 389799 insertions(+), 143206 deletions(-)

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

I am currently merging 423 trees (counting Linus' and 130 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--KJ6IxbSWnyJiBgCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoNpqEACgkQJNaLcl1U
h9BUjAf/Zo/P1DbFTK5UDat/6D7HqL1tD7ECHKtJu47696UAQHrsdccwLwjZcc8H
o5es/zDZNbGszpO18zBIBEygfnatk68IC3o9Io6jFJmpjS0F6kID4rHYcK6bbVSt
uMdrY5GwpIeSdiN0/SYVLsC7jDCCxZLSy2lGcX0nIehCQomusbhA00zmOzaF1xAw
c3ZdRukSJkCMsVtG+OaKvBnMf/7Vf5Usw0iAxcT6KI5ImZHijwrR2VPcd3hxsfh8
1/lJNNhQagVjrG+mpFxHTYkStes1sfq0twxJqppYDTHyav1d2zv2bbOYHvS9QZ/a
oshx84D7hFuq2SEaTkmvnN8ft3HCrg==
=hyqu
-----END PGP SIGNATURE-----

--KJ6IxbSWnyJiBgCU--
