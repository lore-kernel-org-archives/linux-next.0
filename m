Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625CD3A59B1;
	Thu,  2 Jul 2026 18:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783016954; cv=none; b=lrIXtSLUBwFlsLHXw76bTJz2mGyYwEYHK/M7IM352WaNruUAguAPpDBJYhz3THgUkBY5gugOkyQipBBIBdg6H1hGePhXrH3PVzW/uBHn5HmxGebKUFFZpEZpbwXXC5GQVZPlRz9xz7hoqTn9eTXvhJaADkwcLsIL5g3IBIYzEuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783016954; c=relaxed/simple;
	bh=ub1c+XdP+B1z464h8NATxUbIrHU+rr5E/Nuz2xIdT9E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ph6tc21bXVorI0UmVUgJoZ7tEJMlNi6Zbymmzxordv/ZTMSBdLHNtrbwtOJT9TSU437OI6Zf/RGMjM4lv6ShHF1N/0X2qCxCGSx1i9QRBLaplknFYRrbv9zDj2tJn5A6I9GGRWh4qyqLkT9ASUZR2rEUS/Iq8IVW1ZA7BpU1S3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eh+TlKXN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eh+TlKXN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 550B11F000E9;
	Thu,  2 Jul 2026 18:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783016953;
	bh=stVuPLGde7A7nYJNBoIgRl6dzsb5RRiUhS2vkc4wqOQ=;
	h=Date:From:To:Cc:Subject;
	b=Eh+TlKXNXjtjU7A9AZX3snBu4qajx+DHG7EzaBUSnrmxO4KzVVVD0U2GF6E7UnUUG
	 qLBzeQ85Ko0IUOe43YOWbNMsgU2Ztl1Z7D/qoM9eEbkataMk0yeTYiVLPuJ5/olpnM
	 /3y44E4SSl3j9wUzirr8BdVhy1rZ4aT9Gby6NuWiPzE2cW5he6EJDeuywBP3cBiwZp
	 485kEefwdpR8R3gqYGjX/yD7/yI4lPjVocdtn9jbVJPoKZErQXjxwbUMnuBfqsCLJF
	 iY6t2SP7HFoQix0neVZ0zSAR+Ic/+wVhFR0dpgp+G4pV8rHzF08QIwRN1df83+XDpW
	 5YH0XM0UUhiVA==
Date: Thu, 2 Jul 2026 19:29:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 2
Message-ID: <akat9VvnNw7WRp0L@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GJsvS/EB7qgcTlTP"
Content-Disposition: inline


--GJsvS/EB7qgcTlTP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260701:

The vfs-brauner tree lost it's test failure.

The mm-nonmm-unstable tree acquired a conflict with the tip-fixes tree.

The risc-v tree acquired a conflict with the mm-unstable tree.

The net-next tree acquired a conflict with the vfs-brauner tree.

The amdgpu tree acquired a conflict with the origin tree.

The amdgpu tree acquired a conflict with the drm tree.

The device-id tree acquired a conflict with the iio tree.

The mm-nononmm-unstable tree acquired a build failure.

Non-merge commits (relative to Linus' tree): 2945
 4620 files changed, 111949 insertions(+), 61215 deletions(-)

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

I am currently merging 427 trees (counting Linus' and 132 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--GJsvS/EB7qgcTlTP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpGrfQACgkQJNaLcl1U
h9Ax9Af+J43MOsNl9vwBNi59Qags9VRxKSpRMKDlownBzjFHsFO/tGJq7Lv/J4RT
JyOYR1bBnAiynEhQUYAVtqF5pbx6tK2QZTvjARh7O/eToRCVrgbngXfcUga38wGE
M9HCmK2sLsRQhUjswe+0d1wvneU2Xb4fpM83auBOMmt+zu7H2pm9vRhBz9a4RH94
Jzc/7y9B4vWjbH3pkLkNMLOfV6ZCkoT4+MAzuUjvr5wqqKKwjD89OLviWJbf0aSY
9Fw2K2fNBLTmdC3hLxDwKLP5JMh/u/F8s6dBVoTCqXUGAvjs6KH1H9/y00BcDslj
V6WWUJToZf7h8XyVoQwn/VM3wLOPzw==
=UZf6
-----END PGP SIGNATURE-----

--GJsvS/EB7qgcTlTP--
