Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2911035B658;
	Wed,  8 Apr 2026 17:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775668240; cv=none; b=nM3sjx9xRMVzZ3k6BNyNK1rmaoRMdTt9yKLOhI/KnEaApA7/1Jq7vf3FtDCUDWWPe1x9vE9/nAyjcpoCXUpD3x4YNt8v14j13nEusDJLu4RxPaPA2z7/z3UYZneCf+MSGuzXgLidDNU/lHGH0SMa97JdzcZOs5prvhcYwlWIlqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775668240; c=relaxed/simple;
	bh=KRfMVMj6l6z1yFcKoyY91fFChNfrrnf+L5VVM0XzGkU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tapBb+QXIMzMcyXSQIRrHZzTyFdAckgC1xLvVS0BIDOQwKWG8mV8JfNOCIEYZcvGXV06TFKApTdt+IYpqFlvuJlZsZcBaiLw564JzCmYbM01/FAWeowNPd5zqY6yzz5ehNEkM6Z97GUMG2YW1OXiVwLEI0bEdSvS4p8poHuY9DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zx05fiCT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zx05fiCT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33C7EC19421;
	Wed,  8 Apr 2026 17:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775668239;
	bh=KRfMVMj6l6z1yFcKoyY91fFChNfrrnf+L5VVM0XzGkU=;
	h=Date:From:To:Cc:Subject:From;
	b=Zx05fiCT05qXSGbW6dQNMudApJEqG8dj2y//YzwKe7N5iSK78hu0gRGVOyTP9V1sg
	 f5vImpetyXK6YwbE9DaaVvBan5EMftrGFOjt5DjVNI48jkYUZ5VM+Nfc+Vtmdod1iG
	 NdVNvdKVpdXFMdHaLdC/7/GZ7Sq423GhfxROR/GwuAP3NIl8cawvnB+J95c5eC3yp/
	 AzKj+lQ9kVqBxRpESPY4kp3kQudTU50DzxQxtQrSmnnnCRCxtCIgc3iXpSyWuGYD+C
	 LAsGBTGZv5MQBS09BbOqiW3qCVnkv9DaS1OmL0fKDdv7BwCE56ftGrWDqeTQZ0JBP4
	 066mfWVQ8dQzg==
Date: Wed, 8 Apr 2026 18:10:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Apr 8
Message-ID: <adaMDIC-qOxj3v-a@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6c0BKQ6L9XwfF/sp"
Content-Disposition: inline


--6c0BKQ6L9XwfF/sp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260407:

The vfs tree acquired a conflict with the vfs-brauner tree.

The tip-fixes tree acquired a kunit failure, I used the version from
next-20260407 instead.

The net-next tree acquired a conflict with the netfilter tree.

The drm tree acquired a conflict with the rust tree.

The modules tree acquired a conflict with the parisc tree.

The devicetree tree acquired a conflict with the arm-soc tree.

The tip tree acquired a kunit failure, I used the version from
next-20260407 instead.

The kvms390 tree acquired multiple conflicts with the origin tree.

Non-merge commits (relative to Linus' tree): 11720
 10903 files changed, 634400 insertions(+), 215446 deletions(-)

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

--6c0BKQ6L9XwfF/sp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnWjAsACgkQJNaLcl1U
h9BxZwf/dPg7pwvwdUtqwXN/Sl3rwdVfT3aSHkhtHyvksZ1/73rT12TZ4ovXGKFe
u5hwjIriVGFFk1wjrUNhZI6OnVoLMeDOmj4S0B0VhhmXmHAVx7Iqd1X+uDcNk8jq
B4fIXBPaO3+3vORTTIcPf+wv59Lw7+AQLQLDIFSBd14pd97iRlIs2sVsrc9tmEMC
y7qphDU/AGU70MrbvpwgDqFU38sOCG7XLtwGsmPaPSKcFplM+IvoRuLUSZTl7J4g
bypLs2R8W6pjO/UHfi8rByRvewXxcSZlEJ+oSiyJenP3RMk71Orzy6o6N/ErmHcc
GgQXcPJ7V9M4eSj+1VFVvHjVNJKmVA==
=+PhU
-----END PGP SIGNATURE-----

--6c0BKQ6L9XwfF/sp--
