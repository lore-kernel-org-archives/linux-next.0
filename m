Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB71E344031;
	Sun,  8 Feb 2026 23:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770594249; cv=none; b=AgRoGNVVRmDyTpJeg1URJLCOYEkhuIYV9tQMqia1XCMTY0ZslLznVN8xhxGNePyV7M/WnqWxJc53OnYmgqZQNQHHPyg1yGSQZvYQ9mvt9bI+0+47x6h+htaqLv6SMup5IxM1qcW/cPya0+AAJCWBlRCKdyfWZKLveW3mdVDy4iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770594249; c=relaxed/simple;
	bh=86jNGteaTIhW6F0bybGtyMb1/Ca2/rBLt2gs2P55uN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a4cfri7QRPRbTs5ttD6PRxyw5X0bAeA0N/s6LjWJwf0KTqgNyXSutQrm7aH19qmdu/WyYvT/srBMky/y5cVBUCmP0pnSiIQL/68m0mv7WezDHvL3Xz8Uk2RExuEw249po2FEHaVEVMy3+bu+h0lyCHhBcMv75OCaSiyoifb6N90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LMDSBvHU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LMDSBvHU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23BEAC4CEF7;
	Sun,  8 Feb 2026 23:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770594249;
	bh=86jNGteaTIhW6F0bybGtyMb1/Ca2/rBLt2gs2P55uN0=;
	h=Date:From:To:Cc:Subject:From;
	b=LMDSBvHU7DZXWZWz3XI0lYfJz8ENRK9XE85EO28WmUqd++Azcnyu/Dz/79e3h7Rqz
	 whXu9nITw8cjHimRqRsSzeXvu2aMGcIptEw5DUw8drh1IiZiyPaao4gG4O6Uiwjbjq
	 vx9YRpOFb8c7p8N09o4dadzk5kx5e7uI+D3jWQJu3LFF7j6usb669YdLk9LXEN2v9E
	 eCL9QB1IOumXA0kqKm8gdFqnZ89uyHqZHeL+tW7FyqPs7OUiS7ioa7cAsfgy3a8usz
	 AAI9oKdgRo4DADFaK/UI7BvQC+DZdZekkq5gELTiz5z/fmB0P8gz88X7cAV296JRtC
	 KYDVKgP1gKyeA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 84D121AC57F0; Sun, 08 Feb 2026 23:44:06 +0000 (GMT)
Date: Sun, 8 Feb 2026 23:44:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Helge Deller <deller@gmx.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the fbdev tree
Message-ID: <aYkfxvZGxTwUTQfK@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="meA3W6zzJdnTaZUw"
Content-Disposition: inline


--meA3W6zzJdnTaZUw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the fbdev tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

x86_64-linux-gnu-ld: vmlinux.o: in function `au1100fb_drv_remove':
au1100fb.c:(.text+0x251e220): undefined reference to `unregister_framebuffer'
x86_64-linux-gnu-ld: au1100fb.c:(.text+0x251e22c): undefined reference to `fb_dealloc_cmap'
x86_64-linux-gnu-ld: vmlinux.o: in function `au1100fb_setup':
au1100fb.c:(.text+0x251ec0f): undefined reference to `fb_get_options'
x86_64-linux-gnu-ld: vmlinux.o: in function `au1100fb_drv_probe':
au1100fb.c:(.text+0x252096f): undefined reference to `fb_alloc_cmap'
x86_64-linux-gnu-ld: au1100fb.c:(.text+0x2520997): undefined reference to `register_framebuffer'
x86_64-linux-gnu-ld: au1100fb.c:(.text+0x2520c08): undefined reference to `fb_dealloc_cmap'
x86_64-linux-gnu-ld: vmlinux.o: in function `BSWAP_SHUFB_CTL':
sha1-avx2-asm.o:(.rodata+0xc38498): undefined reference to `fb_io_read'
x86_64-linux-gnu-ld: sha1-avx2-asm.o:(.rodata+0xc384a0): undefined reference to `fb_io_write'
x86_64-linux-gnu-ld: sha1-avx2-asm.o:(.rodata+0xc384d8): undefined reference to `cfb_fillrect'
x86_64-linux-gnu-ld: sha1-avx2-asm.o:(.rodata+0xc384e0): undefined reference to `cfb_copyarea'
x86_64-linux-gnu-ld: sha1-avx2-asm.o:(.rodata+0xc384e8): undefined reference to `cfb_imageblit'
make[3]: *** [/tmp/next/build/scripts/Makefile.vmlinux:72: vmlinux.unstripped] Error 1
make[2]: *** [/tmp/next/build/Makefile:1280: vmlinux] Error 2

Caused by commit

  c357150378862b (fbdev: au1100fb: Make driver compilable on non-mips platforms)

I have used the version from 20260205 instead.

--meA3W6zzJdnTaZUw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmJH8UACgkQJNaLcl1U
h9CzwAf/dcGHtOs76Kp3fqnetxkrzWsWpaAEobJ0+s/5Wj+GpAhjfzN+oIHfNM5g
iBOglAaWBOv2gAYLOs3h+8+t8tq/znEVLcvCXPsUiqill/6u/J4/nvae39ZrT4LX
rbNVfNrfqJZ8lyeRrvtAqsaqjOt0NUXkXbOlTyncEbJW/Azh1Mn0sDC5VbZ6BExE
IxDdHA7dCGl1u6iIC1ShY28W3dhekwSkGbuaRc0W5+zNLJ/uvFMZCofdxkVwNnH3
FbyTZqhSxOw5X2eYqeeWNRvGQeVOE5THrKMVe8cX8/DouK9L/zXGgUcqFSJyw8ht
BWnfsEHaf/LzrgrDeP5tl02NLAxgkQ==
=Xbq0
-----END PGP SIGNATURE-----

--meA3W6zzJdnTaZUw--
