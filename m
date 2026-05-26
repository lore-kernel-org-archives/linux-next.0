Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6013FDBFC;
	Tue, 26 May 2026 17:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779817140; cv=none; b=oyBygAfgJAVqKTO5fNJn/T1beQ2/0lekc97jgNMs22Uksb1u4dBUMm1s4odX0MH3YYAhDMg7kxDmqKga9clvEr4ubjsGEkMrH/dd4fbjfdt0KKph9Qi6pjhclCnzr5GjpgoWXbVKkqRMMLwYR+M/yvFKpFxuLqyEvjBJFvLFKjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779817140; c=relaxed/simple;
	bh=hVcGjT8fouQVFYWwMNs+hD/76GyABoGb3CPALWX2hBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LGvyxv317wIxseRKzjtL/ec+Val+NxQlfpA0/7uPPxVXUuuYaXdtDIOa4E4NUjAMrvVvqcbIgSEx6Htto0n+M1vUMg2zh3UEiKWokHDHJc6E4eo+lu7DjRdl7Xa6rV8NABgVqRSXVFA9GWrj1LwcSiBYqb2P0esh24od5/yJk+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HBBV5mtj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HBBV5mtj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49F7D1F000E9;
	Tue, 26 May 2026 17:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779817138;
	bh=ouPJ+t/q245iKcwE16i018E2z0F4aO4gA7QKHRjP4gk=;
	h=Date:From:To:Cc:Subject;
	b=HBBV5mtjUq2WGuF1Zjs82ObLcevJ8lZM17WHKZpBfeAnfhmtVpNlpeAlX+IFAxbaW
	 PoljQXMfguSrG2oGoVcZYfIHkmhXwqMKSJf3gp0+F5KnqX+47TkVmOCuadn84CxTrM
	 hbQzXUXsCtxrLDZ526+NGK1dBNnIiZNQDXp6ArmWv5zBWOO/8L6cNLfq/3X63AOtxv
	 DH15Im4MyfgG9VCge4wdfpkJcbJAM4qn1Xi2viCFX75thHRTRHpIkH1QV785apF++D
	 o0BcDGrzThYdI6vzljQpeqXt19R1eFB1BYA8RSvQIMFXWWERuPwERbwa7BdW90NtrO
	 IXFTWBy/iamUQ==
Date: Tue, 26 May 2026 18:38:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for May 26
Message-ID: <ahXarxbl8HRtB6qh@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yTy+ozid2L6CR2rS"
Content-Disposition: inline


--yTy+ozid2L6CR2rS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260525:

The bpf-next tree acquired a build failure, I used the version from
next-20260525 instead.

The drm-misc tree lost it's build failure.

The liveupdate tree acquired a conflict with the liveupdate-fixes tree.

The sched_ext tree acquired a build failure, I used the version from
next-20260525 instead.

Non-merge commits (relative to Linus' tree): 7493
 8417 files changed, 448844 insertions(+), 169345 deletions(-)

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

--yTy+ozid2L6CR2rS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoV2q8ACgkQJNaLcl1U
h9DDHAf/RF/vXizlKPNZbaE+R0Oz5SwxINOnQVKR48eFiK3niWO4nDma5KStquh+
fBODE3ZYWct+yJMDKrDbcPFN+vOYjOuYmChL6q1LU9X7AbkBeZhVOUJWe/Aq6Kpv
LL6ZVyjEMABZnT6PyMuGy9WLIz28dktaDfEjQydtsoQp2mOnWm/5NPqeSff82yh5
4lIJSo+Xit7x53ovN6aR8EvGn6oUy2Yb1eUjFo0KDoYQXUAWUirGbKeEicoJKDLI
crEyG9TFxYL2C1sMSNZE+28Qk5ld4JlbbtLKA71PLSEaZQanC+PtaZzTllW1dqlw
vkYduKk4jFn8MN9vz0172W7AYFeiow==
=dMwp
-----END PGP SIGNATURE-----

--yTy+ozid2L6CR2rS--
