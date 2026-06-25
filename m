Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B508427707;
	Thu, 25 Jun 2026 16:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782406366; cv=none; b=SSAZ769/JsH9N7iHN+S3eiURppoL9ki0u8aYJaGTvPwElWf8WbRTOflxO7c1igLx9IElU0F3rcaIyEjAjWCzy/V2VeNjtK1E3S9mR4WfTD9BkSKYc5C00NbdTnJpTdw2IMoQRGjlZZcsSFxiSbQUjP+OsaNrStrwlLA1PULs0PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782406366; c=relaxed/simple;
	bh=WyqdeK1/Mn+lV7sz2hBjtlgZwiy5XlqBEob4QDRGuMo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NY281sGuSW2NXc+vVFqDC2FjgPyYTbRasgXhdpz8IesGPp5K13HdMiOJbf+NKcN5BGCjqo2BpKOAqrY/NhDwE/vy01D3oA5zcfoVQK8AgR1levhAzUujeojHngdj7C1YfYoGO6/6uwCIKN5k7NAq5nF+/w4UtF/K8jau0pMt6HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FM2WgSTv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FM2WgSTv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE6041F000E9;
	Thu, 25 Jun 2026 16:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782406365;
	bh=PGBmwvZf9HozCnGMKuaGxR7ic/f+AWbW2ot/Jq9wwus=;
	h=Date:From:To:Cc:Subject;
	b=FM2WgSTvxThe9YW9a9lRrd3U4DTtwWrJxuqRYzEFIBubA9F6n3Qxm4D9xYFeUIOMD
	 /Q+pYFUS6JFxv3oHwrp6OBp21+nABwp9/phJm9mz0jkKkS8Q4zy4lRBiPv8shm4o6N
	 AqOMTiUWcoRiDvCaDXwCAZJFIq/THhGnp5sfCWmXMnqVJWFbBXOKD0HrWSx+93F6GM
	 aikhSkNNU0OCMRshlD2Qtx9VoKuSSlEXvrvFYvJ5scsDvdm5UM7684yZ69eNwrq0Wl
	 lNq8Cuirj/jSXGFan+ZijdaGzf+Y1SpOgcCvS4pU1ZcjbZjS6bwF6T8i/3SAugie4B
	 xtG6dk88P5p2g==
Date: Thu, 25 Jun 2026 17:52:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 25
Message-ID: <aj1c2izvSFufG1F9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZQCRjU4CCDRLqao7"
Content-Disposition: inline


--ZQCRjU4CCDRLqao7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The merge window is open, so please to not addd any v7.2 material
to your linux-next included branches until after the merge window closes.

Changes since 20260624:

The arm64 tree lost it's build failure.

Non-merge commits (relative to Linus' tree): 1449
 1463 files changed, 67636 insertions(+), 24716 deletions(-)

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

--ZQCRjU4CCDRLqao7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo9XNkACgkQJNaLcl1U
h9DFyAf+MQzLM7ayDvUlFgc4p5l1llCCJ/S/rDPZseWMnVNnz4PjodjVf3i/wHBZ
2Nh+GpQYty//5gBieXvX02YkhhR8Ily1BS0pQz4ZRbLB6MLkrEX6oWMi6c95L8iV
rRCyTu/QpAa4yRTDcRK2qAyIrTplrj3A9Ke1onfkK06b52tsuSl7+1gOBxc70lSP
p/moSGNcpIgFCZ/B3mcTHUcomOaV9+83knamWyUJTHHj9grJHKAfSpqwhE5oI9Um
jSFPF+C2VhxvkZ1qlbA1t9s9QS2lL/mJ7UvNqoSR3vXdbgqGzMP6/WHr/3AxFVxb
mhKERu/uErpj3d6RC/dTSTbSa8QIzg==
=OYc2
-----END PGP SIGNATURE-----

--ZQCRjU4CCDRLqao7--
