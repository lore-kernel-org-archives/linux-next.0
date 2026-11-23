Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455916;
	b=FJMwQna2TUTdlXm2GU1zdIbGe4wKtWCzKzYzjdwAN9VK0lolxEa+jvsvyw5A9lKgEqn8
	 iMDlwyWVhfNnh5ozpGr/sTY/eDBzekaRIldOYe63lgy/mMroLSzrgN3QJRjpqUUXQeozE
	 UskFWYuTGxlZssvRd3kGXyyRWxl8rdzaGt1xH4U3kXGfrWob3shRG+RVz5fFrcHAeKlBM
	 OPlUThxTi71CsY3HtzmJdE2QK7ovLOlMK8vDjMMtg1qoDN1TQzB2CkpuHWKk7N0wV8Bfa
	 Nzcnj/pIp8Y7f7qf43WmclR1Skkc/u0vEXrmtzC3/fiO3bXArECaWwRH9+sMqa8/01Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455916;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=DKKk4J0R8sZ/pAz9QjsSiFHRHPCF5MYq2B2iKWsW02s=;
	b=DUV3CJmzYlr7m1nrZhPtXNzokccj0YHVVIZymyLBVPP3+fcFYgSAQsG03RXQ45CrovbH
	 oB54NImk4BvMA3HWw2cIWLNuLfvOH/XPNvcFYLxL4dNm5+hhE9LyyNxSdBZdzqsBMG07G
	 boQJCnrJM92L0sNOCyQwrHeWcUfzfXcCv2i+qH/GZp5BijP3/sE49h9lmzlqiLGM/9QTE
	 D38RQHJ6xEbgizE/YLMm5/alejRGn6J717JihKcL/NrSWAVckW2DIrs8KiOr9UoqHe6P/
	 xbMHICub7x5T7EymFj8cAW14px9yA3nD6P9VDGswiI/TA8CC6zRUDwqBREA1pKBnrwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E5VFrQ05;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD26606A31F;
	Mon, 23 Nov 2026 17:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E5VFrQ05
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F3DB1F000E6;
	Mon, 23 Nov 2026 17:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795455915;
	bh=DKKk4J0R8sZ/pAz9QjsSiFHRHPCF5MYq2B2iKWsW02s=;
	h=Date:From:To:Cc:Subject;
	b=E5VFrQ05rQfL9NF+Umc4Fy861Z1KtK0A2Omp9XlDDGcjpNEvrzaCnlfcF5upFO90Q
	 87af8//7lq63CC/niaUXHsI5Da+XEy8M6PtjzIZ0IWP4Uc6tE+GAE4Est5mPVLAe5+
	 exNxCE8RcSQuioTJox4086nehJpTaDdKKErkELE9K4k1UTUDyh1ul2NUZ99N/JBPAT
	 R4pojuoDavtDZj3LiE8icAW/Ay2xwfiGLBJ6K8aswLJjrpk65jBiIbE5CHq07EHg8F
	 xf/39uDMxFB00FMEfhnWBqC4lKzT68EeLUpg4Kr4C81LAFmBmGJtP+dnWWU6deHFUJ
	 AnbYWpypxI+Uw==
Date: Mon, 23 Nov 2026 17:45:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Nov 23
Message-ID: <awR7qEcZuliNj_iE@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G1i7t00+M+eRYY6H"
Content-Disposition: inline


--G1i7t00+M+eRYY6H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20261120:

The perf tree acquired a conflict with the mm-nonmm-unstable tree.

The hid tree acquired a conflict with the origin tree.

The hid tree lost it's build failure.

The v4l-dvb tree acquired a conflict with the origin tree.

The ath-next tree acquired a conflict with the mm-nonmm-hotfixes-unstable tree.

The drm tree acquired a conflict with the origin tree.

The usb tree acquired multiple conflicts with the usb.current tree.

The final tree acquired a build failure which I ignored.

Non-merge commits (relative to Linus' tree): 9557


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

I am currently merging 438 trees (counting Linus' and 135 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--G1i7t00+M+eRYY6H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsEe6cACgkQJNaLcl1U
h9A+iQf/TvV7EAov/hqzKj/6jorsj51Lc0WVANXicS6YvhdZwuViQZVdEp8Da1Bw
mQACm5hLaurhaCP7aqWSoO0gFsVfYgPTx2vzs/4RCy37uJQJF7xtmMZkd2rC1+p5
0C8UdmVh8ZisEHoWrc44L7LL+iI5lsQOa20n6gZ9pQvhblRMy2DBRRZL/JVZbD6P
HivqdFtLv58CPaoQ2Sg6c9ZdKit9DlTZZAYznfu19FG+koBDiTJ2nphpcUmtaWeH
ZomIdnrQjfWnriGpCEaRy1xl/1mO6HSuDYWtFX3QnjUMNOvsdt6yC1HK6ym+qTz5
1N0rU+4AN01Kjl1j6mpa8a/KaQupeA==
=3XMB
-----END PGP SIGNATURE-----

--G1i7t00+M+eRYY6H--
