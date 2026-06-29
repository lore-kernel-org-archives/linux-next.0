Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE91E416CF8;
	Mon, 29 Jun 2026 15:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782746153; cv=none; b=qTLqawo/yDQaUgQ2AesO2UiORVOIkcOaMgjl9Z7qFX8KvLX5EKrlRk07o16pu5cpaEDdmyPLCAZYkFNvlSbooI74J/Reedn+ddWArJodvj3BEKX0hf4oHEc8yw6a/AKE4LWAgSkSdLV7Djm22/QDkD5zCZ9/I2kPrmP0eDm8zwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782746153; c=relaxed/simple;
	bh=djHQYn8t+1emTLgSeHpuLbTN2rhjvaiSlhuymwn2vck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SiWXP1kSkH5L0bFNpQatIBtqs+wezvysp+E4Hefx1jMQejWVm+/5SbEfYZIAeP9e4qnoQXCa2JeWMHcd+hAZrfojVBraEpe9Mvqxtmcizk5LTERNBxmKJaRIsRQKjQAoNTbIyjFXRBEpqfYj0DryhSMxz3dOAdjszMlpWoSMpow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BgAhdu6y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BgAhdu6y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9BB51F000E9;
	Mon, 29 Jun 2026 15:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782746152;
	bh=tF8AqzUWf28ykXgfOiW6NqbEFXUjX2Vgp0z+iUWCvxw=;
	h=Date:From:To:Cc:Subject;
	b=BgAhdu6yy3I0fBw82Tt1+awJ6zJz65YSRt/aB3Da1HPLGtOLqbaZolxKYhIbOtpNI
	 467TSIgNbZlGK8ba7cl/4vAP6sB3pWAL5N5Nn16VmhJ4Bbxzn6eTBESXY9X7Q8Fw/4
	 Wjn7/vCHAu15FpkD1kWK68zdVFVaEac9uQ7NsBtV50Htf0BDwJxzYaId1mGY/pbyLV
	 RwtXAB8LOGZLgO27Yd3+iAE3vOe0HzodKs2r06LeeQ4u1Rwxh5fACNgMQiKYKJlG23
	 aDd4hMkBESM4BWY0dqsbbCmIjiGU3Edo/ixVFdd0JdGH2BY+1ETkiizIvAzXDPwopI
	 hKdrpDc/SZ6uA==
Date: Mon, 29 Jun 2026 16:15:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 29
Message-ID: <akKMJV8WmjuiJkz_@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="la27w9k1IVOwIaIH"
Content-Disposition: inline


--la27w9k1IVOwIaIH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260626:

The nfc tree acquired a conflict with the nfc-fixes tree.

Non-merge commits (relative to Linus' tree): 1007
 2678 files changed, 51769 insertions(+), 22781 deletions(-)

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

I am currently merging 425 trees (counting Linus' and 131 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--la27w9k1IVOwIaIH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpCjCQACgkQJNaLcl1U
h9DOjQf+KYq9DGM1Ma0IUDs+g1dR3WhZKUc0dn6Rw8VT9gOjTgnpiLWiQNMxg2G2
im3GnqYII2eH7TsQPJvRNZL4np6LNPPuHdxL14ck+L3SMKv0f/cK2OAnrh8tAr74
6D1UoW1/RsYsGd65mi149UzmKfVKB3Pl/jB1RypzGipb7/kYUfiTXiLRUuGDaQyi
OqYNz2qbyBk89at/mQ7Njh+z+zYv+P1cpvOJ2oxEY42VtXHrL5RnhbboKVNSkU0G
xglwwOW5PXJwbeqJJCvTCKn5DPLhrHKirbZGdtVibDWnmLxHl7cCtZjWlrNvSp7k
afOamVQpxLkI5Solse8hsbBTifWW5w==
=Rwfc
-----END PGP SIGNATURE-----

--la27w9k1IVOwIaIH--
