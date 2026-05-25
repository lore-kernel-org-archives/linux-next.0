Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EA8388382;
	Mon, 25 May 2026 15:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779721632; cv=none; b=moU3NXIAT84mYU9bJ/kBe4xLDN9RUF2PFd188+120HCVhf+zHxegXi3zFrhDmAyVmh4i1GByYzxZqo6MqxdBXSSu3ERvqbTPoN6YTgEJNOnG4PmcK2giJPFFAke9wXgvdrassYEdm07OLch5LBIg4dp6TXGkjHodXUJVzBYZwu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779721632; c=relaxed/simple;
	bh=L6qtr1DA6PCSGH+V5Dtoh4EbxNicSoVQfH+R/OqVNSE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oEAcTXXgRrySzgUoYsoFXO6tLZUxpnUwCzwenrgygJy5OtpImoS0YIfEIKTtdFJ0+h8YUdjHWE11wj40PIQJ5IN77SPgzW2s2nkoiZGVIEp6xcVsIqphZa36VIp4K1HOqha+4ucKSOvZTgTYt42191pe6AvrpoCT58bjHdjOCck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BZX1WMEq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BZX1WMEq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C65A91F000E9;
	Mon, 25 May 2026 15:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779721631;
	bh=smcpUGrErS+0wgLLmeBqh/DueKQyN7oltpS3lSlKors=;
	h=Date:From:To:Cc:Subject;
	b=BZX1WMEqFfNEeCPefN+KceuAnq19NHqSiZl7r9M990u0TISkMuSX3vDHoY3xtZjOa
	 E/8DbnX2Q1SRuzSGnY8foa9/sF1EtfYim1MFWiABS4ixRzfK1ejZQXrp8JnDITb5Sf
	 dH5NkAoU/HmBlMn1JF2M0uDl743VCIQOs2ENm0tdUgUNnc88QqH9Hl3d6qUiXQdV8L
	 jTXuHN9vk8q9g4pFoKFuyUM3Vx6TutOdPMKD3vAtmiwZfFVOiVUIcKccsekW3zX+T9
	 7G7XwBym73h/hnZYDL1BxLKgEM9Zo88gWhIFqXNhESYyowshYHcmUeC9heRwRSkzQG
	 rrfT6wHKbxZmw==
Date: Mon, 25 May 2026 16:07:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hongling Zeng <zenghongling@kylinos.cn>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the char-misc tree with the
 char-misc.current tree
Message-ID: <ahRlm-SGZaH4u3C-@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="glJa/bV5H9trAq1E"
Content-Disposition: inline


--glJa/bV5H9trAq1E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  drivers/gpib/cb7210/cb7210.c

between commit:

  2eae90a457baa ("gpib: cb7210: Fix region leak when request_irq fails")

=66rom the char-misc.current tree and commit:

  5ad2849605585 ("gpib: cb7210: Fix region leak when request_irq fails")

=66rom the char-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpib/cb7210/cb7210.c
index 673b5bfe2e7d1,05058bf2cd50b..0000000000000
--- a/drivers/gpib/cb7210/cb7210.c
+++ b/drivers/gpib/cb7210/cb7210.c
@@@ -1049,8 -1049,7 +1049,8 @@@ static int cb_isa_attach(struct gpib_bo
  	if (!request_region(config->ibbase, cb7210_iosize, DRV_NAME)) {
  		dev_err(board->gpib_dev, "ioports starting at 0x%x are already in use\n=
",
  			config->ibbase);
 -		return -EBUSY;
 +		retval =3D -EBUSY;
 +		goto err_release_region;
  	}
  	nec_priv->iobase =3D config->ibbase;
  	cb_priv->fifo_iobase =3D nec7210_iobase(cb_priv);
@@@ -1063,16 -1062,12 +1063,16 @@@
  	// install interrupt handler
  	if (request_irq(config->ibirq, cb7210_interrupt, isr_flags, DRV_NAME, bo=
ard)) {
  		dev_err(board->gpib_dev, "failed to obtain IRQ %d\n", config->ibirq);
 -		release_region(nec7210_iobase(cb_priv), cb7210_iosize);
 -		return -EBUSY;
 +		retval =3D -EBUSY;
 +		goto err_release_region;
  	}
  	cb_priv->irq =3D config->ibirq;
 =20
  	return cb7210_init(cb_priv, board);
 +
 +err_release_region:
 +	release_region(nec7210_iobase(cb_priv), cb7210_iosize);
 +	return retval;
  }
 =20
  static void cb_isa_detach(struct gpib_board *board)

--glJa/bV5H9trAq1E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoUZZoACgkQJNaLcl1U
h9DQlwf+NHxVUOtdMYQsaHW3wg/Lgxb2k407p5w9DOgYOMGokp8qGUqGnsg20fa1
S93YDgEf05i+tgUswPsRRA1XIqt6f5DeNnL8h6Es8ljxJXFFpqZWdbGhZENUaoFm
ObishQD2w0KgP/zCHN989X7v45AB7WdOCqYLcLBDtZqHHK/Qli3qCs4hxxnVsnyM
qUkh10iJJ4iaIkXsi8RYjjTYT6AI2/DMsaKlwCxefhvGU0Tj0JtmoTz0sxm5ktbO
zIpumFLMvA9J0NROBUkeqgtK6jtkWEWhFOr9rDFNcDUH2tDlM2Z0fAar/4Kk8eLH
AkIi7NWMidQ/wgPP26P4Ubb3MlVpqA==
=SMQ0
-----END PGP SIGNATURE-----

--glJa/bV5H9trAq1E--
