Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B46C3C5DA8;
	Thu, 12 Mar 2026 13:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773321262; cv=none; b=naGNwMhdwFLJCKZvdoq0OESuMopsFBJ6+l35wjX0MrMQLAKgrfoVjwoKUT/IjEaa5SUWYCziPePla5S8hb3aNIpAF6SoF8JT77+OoRuzqOv0rBSNSXW4NFOIIhLG2gqt6LxsrsMuJuOl2w5sUX5JsVG4ucizLn0eY+q/ejfXStg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773321262; c=relaxed/simple;
	bh=oQn5OssERoQ3zCBlIWlNOo6LI5orp/zNTuGIK/+NNQY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=preLW/Wo06L1Xn/Q+Lw3czZJnL7uUfHKwOICFJ/yERvn1/1REmac6y2/a5AbsrJo7iWxrcoC9hIqVYeMUHpy5af5nFqi33+foGLI473PxOty9bdQkz0tNE3DEP4QK56QlmlQ1Qx0tPbk2X+qO8flTDu08IU4IFOjPCoh3/MSLb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ph8hYngC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ph8hYngC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65CF3C4CEF7;
	Thu, 12 Mar 2026 13:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773321261;
	bh=oQn5OssERoQ3zCBlIWlNOo6LI5orp/zNTuGIK/+NNQY=;
	h=Date:From:To:Cc:Subject:From;
	b=Ph8hYngCNjuoU06a3kKDO/nZ4svsTYwTT4qIFDBtqcuqrtZFbf4ZckB+WpIbBnGh+
	 ef701q7kNb+ZKQ0esXbefeSwPmA4aOQkMQ9znpsSyVKduMk0VNnCEMHzy1cOYGG8Ya
	 qGhW7DZS2/Eg1U3JImDGPka0aU1U4OJqb60hNW3TOzxr5Ak8D/C+PBiFTfNVCJ0ZNr
	 BldED5ZBsOqRm0UGVsQRDzsBhm/nOvRO6+etTGdcg4+F7fUzT9tTiF66g5lmWmp7MJ
	 yYUsAlu/oDSdaWRSb/QjHj1etg4rpQWYxYiKYWHyu4wa8EKpkeCLeWWwiwFCAI1Kqa
	 Ocjap93gbRNpA==
Date: Thu, 12 Mar 2026 13:14:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Richard Weinberger <richard.weinberger@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mtd tree
Message-ID: <abK8KXC70RC2K_fW@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zZ8U2QINJChQVT7E"
Content-Disposition: inline


--zZ8U2QINJChQVT7E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the mtd tree, today's linux-next build (KCONFIG_NAME)
failed like this:

/tmp/next/build/drivers/mtd/maps/physmap-core.c: In function 'physmap_flash_of_init':
/tmp/next/build/drivers/mtd/maps/physmap-core.c:367:23: error: implicit declaration of function 'of_flash_probe_bt1_rom'; did you mean 'of_flash_probe_ixp4xx'? [-Wimplicit-function-declaration]
  367 |                 err = of_flash_probe_bt1_rom(dev, dp, &info->maps[i]);
      |                       ^~~~~~~~~~~~~~~~~~~~~~
      |                       of_flash_probe_ixp4xx

Caused by commit

   16d68d10f5b93 (mtd: physmap: physmap-bt1-rom: Remove not-going-to-be-supported code for Baikal SoC)

I have used the version from 20260311 instead.

--zZ8U2QINJChQVT7E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmyvCkACgkQJNaLcl1U
h9CIpAf/Ud6yWc+HtIrtMxOCbwd85c7XVsfPHbu0afRnoUkl3bfKwVxDPeGBKjBl
wKcBHm4DZsv01tqUy8h8PPQkNW4NN/asANrYOovW++r3yExheAX3nDAFl46QVqTy
zG2g0zSSbYxiJLOsW0Jxl/GmYnQ0p8najmjCL4jKo2uPG7JzPB+MtGrrISY8DsLt
SQIj4GNAabp4q4g+bSnMlMvatwF7YwxeL++QvuRi5MS6NOMQV9xNVYlX3OSWBSx7
KGAhDYMHFTAiPR2lDe8fnApoj7YPlMb9aU2Whnd+tv2EU0ItsmxusGk62IYSBRB3
nwzFBdWZop0pOEy208S3E8PxrJC1cw==
=Fk1g
-----END PGP SIGNATURE-----

--zZ8U2QINJChQVT7E--
