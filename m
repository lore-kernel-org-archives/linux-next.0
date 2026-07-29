Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93D53C1D60;
	Wed, 29 Jul 2026 15:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785339549; cv=none; b=cthVsUzGa3Bu/Ykbt6HBLiQGpYSaxeFs7hlQ23ClDaJvLO72WzjI0Y7au7NzQUvkGA3ovFH3ZxAKwd9p1Vm9uKxUdionZF1djpwGF07fG2KoGFSHT0CrPJouyTlS65SLPA4g7t9UUI/QHLAQoveS52Md+SJ8aYOOMSWSPat15OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785339549; c=relaxed/simple;
	bh=mhMTrtBnR+Y28IwNtc54X7ncliHRNmK7qKlmJabtAkY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EOMPpJ0yv1ohOW/I5TO/22p7IQDXGRdC6uDVK6HprI0zCoGP/eVkFkg/kTFoVvrRGBBk2XfLoG/g1cABWYD+fTHAvZQcyOzvXN7qDqagTsAXZlk+qwzD/X07jtbsGi0AoqQSmemI7lXlHqdEMkzLe522PGEiV7HfjRF/8LCVEVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZUmZ5lo0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZUmZ5lo0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACEA91F000E9;
	Wed, 29 Jul 2026 15:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785339548;
	bh=Hq74R+8n8QL9M160MvenuS49E1QH6IOGV/l4uZxAjcc=;
	h=Date:From:To:Cc:Subject;
	b=ZUmZ5lo0XSx6Crvlt86Is9cAovs1T4GloWEq7l1h8uydb0uawdiqjTRuHU9Gwu/nu
	 W5M784oOg38XB8Axv7OarEz4Hb3XwtARHfXSn9pIbGjhYLmjivjsUpHr45qtffioNK
	 TW+feYvFZO3ir6f1C+l1PdnY4DfOnSJD1CiN+57O5ev96Ge5gqpkh4AM0OTyI/rQZd
	 ueC53LwZj5AU5FZ98jeycFQf5+Tj5Zg2e2QKFyTvHQlpFIW/+wwqW62JqLdkHnF+9s
	 /EgGBTO1AjZw3BqGeZ2tB3xDh+wL+x3I1f6f/ClKs2J4L+nJwWIs5cEvJjeVvwpwgX
	 AGP/XJ+Py0AnA==
Date: Wed, 29 Jul 2026 16:39:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jul 29
Message-ID: <amoeme309Gay4S5M@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9F7pZkRJsSVc9Q9J"
Content-Disposition: inline


--9F7pZkRJsSVc9Q9J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260728:

The vfs-brauner tree acquired a conflict with the gfs2 tree.

The vfs-brauner tree lost it's build failure.

The mediatek tree acquired a build failure, I used the version from
next-20270728 instead.

The amdgpu tree acquired a conflict with the origin tree.

The thunderbolt tree acquired a conflict with the thunderbolt-fixes tree.

The fastrpc tree lost it's build failure.

The ftrace tree acquired a build failure in the final builds for which I
applied a revert.

Non-merge commits (relative to Linus' tree): 9466
 8666 files changed, 438853 insertions(+), 139498 deletions(-)

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

I am currently merging 429 trees (counting Linus' and 133 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Paul Gortmaker for triage and bug fixes.

--9F7pZkRJsSVc9Q9J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpqHpgACgkQJNaLcl1U
h9CJtQf+McN4pJCK2bAxPuHIpawo957rdfEdzQeZsqlsLImhaIQkdMh/ua+si1t9
1l1tQifL+zjhdPDHdsMXqGb//uNo05bnjzG3RK7MysLinXU8HVQOsH3pjzAblU4T
t0HAlPYXlI49DlMtng8Wehk17YGeYnUVkMDbdbqcFgvPTlCMFoZgQpiQIB0xp8Gm
FOBNNTBeX1slAeIN3atiINMyUh5sEd9zp5LEbVzNVJo8yqSNsoGGl0EffvmVrSAw
PmBCh6T1fDEOZ8OoayG9hC/c+yBwKg7xfahkHdBnYUwMDz7WdTl4aXRZRekyWYH5
6viW64x4SaVGfxtCpNMR7Le1wHbXwg==
=NdHs
-----END PGP SIGNATURE-----

--9F7pZkRJsSVc9Q9J--
