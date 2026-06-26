Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B8D3E6DE8;
	Fri, 26 Jun 2026 14:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782483991; cv=none; b=fdmiF4DSa10cXn64jRCX1QP91jNnCiH9eX7QrGAGtX32BpP/iZfTsYJFCgyTW8s4G25LtKgYhwOqqFTCBRun/OQ5xl21RqkNQasIoBm5gciTFK0AA+BEHXmQuygw90JECgro7hts17ug/8XZ9B4YoABqPxMVPhjZBqkqTTykhJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782483991; c=relaxed/simple;
	bh=+okgzTMtrD5WyXbtZBcTSBj9yquPm7EH3ropFi11puo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gkVe5qz5cpiV3sCyfBdVcLPVi4fGG4PRBrAFGxszHdDbKbHto81VmlDompIpOm06v2dGP39z5Qke3SKth1hGMOUe/NwbPdnCNVAgclvHoR+KRlHiFAg9FNOM4EX+NOKvgNk+bWznuWKyaxx89TG2ij4GmqHn1Brg5vPtOPLAuQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YE4Gojmh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YE4Gojmh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A45B21F000E9;
	Fri, 26 Jun 2026 14:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782483990;
	bh=rDe+Fl585bgOGOrsA1ayZZisZk1Wjex1r9gVKahgPrk=;
	h=Date:From:To:Cc:Subject;
	b=YE4Gojmh4kP8B8zUzKknsmI/urL5RPiUPjkO0LwJrGQ7HvpRS2/e17FC+Zwpi2EqN
	 a5DiLrCj0Mq+d4IdiF+nf0dzdXqMLPn+EVX3zkbNQtp/OomqblD7n7RP4Mj+7rQvhs
	 MF9uErIbE9qUK/DF+SRq7FSYIpg4SCzkok+6fdPm5hj1cLqNVY0JZ5wm1+e+Y5fF9u
	 nvJifjdfl9s661OTozQ7MSv5fmtZMQd6QGBNNh3LVvZJ5ZOxo4pR7hfFJh1mXglzw3
	 LMWkF6xKiZ3zr+IAaGolf9pIzRlbIzg9jUh5ksiaHpKCs5H5hYKFd3IVPo9d6HITeg
	 kh0e3Ot+fLsBg==
Date: Fri, 26 Jun 2026 15:26:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 26
Message-ID: <aj6MEznSdWL856bW@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A3FuWgLUCo1PxMfd"
Content-Disposition: inline


--A3FuWgLUCo1PxMfd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The merge window is open, so please to not addd any v7.2 material
to your linux-next included branches until after the merge window closes.

Changes since 20260625:

None.

Non-merge commits (relative to Linus' tree): 1105
 1119 files changed, 52070 insertions(+), 22217 deletions(-)

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

--A3FuWgLUCo1PxMfd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo+jBIACgkQJNaLcl1U
h9A++wf+JFpCElhSh1bhILzKDW/uTIIJLWOakLt9NXWKrYF5F5sxcuXngJwjfhQ3
eVXFHuRUyj7rfdnwK/ZD9HeWZzIFflhGTHuRWUgeJMF1/Lmxjfkhuw5M5Zxtnxik
MtuOkYHaaJ/hy71tO19oFZ7/FMTdoXCgHXq/SGY76vCUIZI6Pw3Zu/erMbuBo1Sv
dAaS/sShAuPIi0LiAh+tdEZqjJ/GjrJn9FjUz1RxftgZ4hk8tH7tF2XtDBkPWCVp
74BopXKmlL1uHCPhvz3XZBI6BvGTFsbtOh3JAQmQpW0ljaKf4XlxtW9f6V+DWEVo
uy7FwBGh2ktMpxfAkKFT9w8czXr2Bg==
=lJwS
-----END PGP SIGNATURE-----

--A3FuWgLUCo1PxMfd--
