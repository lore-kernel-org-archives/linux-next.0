Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661EA34D3BF;
	Fri, 10 Apr 2026 11:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775822135; cv=none; b=CvE4EvMKWgIvcu/w5Du14ulPnWqwnpm+IPHsMYf3zaDbnDJ689qXCc+1FwbsATYJDNcwAh4iLicZLoeOiyepy4/D/AV3bAmJV622y1PR+6LkvzNJuAOXGY9adPAbYflTS9FLsQaZ9m0+VP8wBjQYXAQgZldEvknQXHqD6rsFWuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775822135; c=relaxed/simple;
	bh=iCgk3h0iePK8WwyhgMWjs6cnYtK/MH1X5eLtO+vEeP4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FZ53gKJiVV8N09uU7NbI++Irbov0iWJkyUjY9VY9NV/jIGUaT9tT+AWUTRAOOeBZamhWTIfjCkCmycT9MRIFtpHgkAPvqZsnx12/kc+PSOqYuUMgvZ2iXKVEtIuWL5WHq7CK0qOby8tv4YnsLtOP+YDrx1ftDesSOW0VqZP4wEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r6uUirHY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r6uUirHY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E07C19425;
	Fri, 10 Apr 2026 11:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775822135;
	bh=iCgk3h0iePK8WwyhgMWjs6cnYtK/MH1X5eLtO+vEeP4=;
	h=Date:From:To:Cc:Subject:From;
	b=r6uUirHYWdcFMIzvPDHREq+FB1eWCCkRx810qkBHYLSdzsBSAtxjLaj2pKNOwtwyI
	 0cVSZ1yatWzff2QkFIfrsg4jhY1CGdM/r95xCLHttwj9UAFCrRu3Yd8e7tCoj88SoK
	 gZelC/L5uATqOnhPm+SApK9x7gc7bKf2zfd2Er4gk+NmFANAL2FsJ5bnRtVj0cYSme
	 p03TfLgk84gmEFWtTiwwnUqc56Y4RMgWsVJxRZjjro0MZkX5BkIZoJ7KBIzXzm49ZW
	 Vu310g3HXjfTE7+qLJlMJgZ9mS6ZjIFSgfpbPlfOQ8xsYTDjGRQmPwLnJIacOxrfaR
	 OKA5zitFnIpdg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 697BF1AC58B5; Fri, 10 Apr 2026 12:55:32 +0100 (BST)
Date: Fri, 10 Apr 2026 12:55:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the input tree with the pci tree
Message-ID: <adjlNGglOUTLJ8hF@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QQXFFe1P+ZaLUuOL"
Content-Disposition: inline


--QQXFFe1P+ZaLUuOL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the input tree got a conflict in:

  drivers/input/mouse/Kconfig

between commit:

  6f468ea360f0a6 ("Input: pc110pad - remove driver")

=66rom the pci tree and commits:

  e732b2ac0a18b6 ("Input: hgpk - remove protocol support")
  8291ffa3e51d6a ("Input: inport - remove driver")
  931e3151dba747 ("Input: logibm - remove driver")

=66rom the input tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/input/mouse/Kconfig
index c8b87a87744c28,04d56f40ecb631..00000000000000
--- a/drivers/input/mouse/Kconfig
+++ b/drivers/input/mouse/Kconfig
@@@ -300,32 -290,16 +290,6 @@@ config MOUSE_ELAN_I2C_SMBU
 =20
  	   If unsure, say Y.
 =20
- config MOUSE_INPORT
- 	tristate "InPort/MS/ATIXL busmouse"
- 	depends on ISA
- 	help
- 	  Say Y here if you have an InPort, Microsoft or ATI XL busmouse.
- 	  They are rather rare these days.
-=20
- 	  To compile this driver as a module, choose M here: the
- 	  module will be called inport.
-=20
- config MOUSE_ATIXL
- 	bool "ATI XL variant"
- 	depends on MOUSE_INPORT
- 	help
- 	  Say Y here if your mouse is of the ATI XL variety.
-=20
- config MOUSE_LOGIBM
- 	tristate "Logitech busmouse"
 -config MOUSE_PC110PAD
 -	tristate "IBM PC110 touchpad"
--	depends on ISA
--	help
- 	  Say Y here if you have a Logitech busmouse.
- 	  They are rather rare these days.
 -	  Say Y if you have the IBM PC-110 micro-notebook and want its
 -	  touchpad supported.
--
--	  To compile this driver as a module, choose M here: the
- 	  module will be called logibm.
 -	  module will be called pc110pad.
--
  config MOUSE_AMIGA
  	tristate "Amiga mouse"
  	depends on AMIGA

--QQXFFe1P+ZaLUuOL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnY5TMACgkQJNaLcl1U
h9BcsAf/RvUeBzkNo76UZlYjbTMKv8q9BMUXkO2FyfHLXvnrMwqAB5fMD0DMyg7H
Rj16y3VqoijfIlnwF/743cPMicNoVnR8ogW5NyftcNF9HWk51Tp8S2d5OdMWH3di
IfU6CJPwyYr5JrLCFL0UAMDejjlYzSbsZvQZq/tqR3bLOsxjtbUbPnWMYaDY2G8c
/0r+VQlyy4fYGfkoc8KrL+A6g4/qqOKI0025/ytfLwIehAVMwk3VK5URYiXkUHqf
1amo7r1Be4T2zFFQV5OXwxpJVSgbCPPz15qTlguXMRkuqrY/p4kQ0CMvaRcmftYi
5pJXPdCce39g0Cnva2s96oL59aHFGA==
=mPA8
-----END PGP SIGNATURE-----

--QQXFFe1P+ZaLUuOL--
