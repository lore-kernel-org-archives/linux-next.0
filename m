Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789760;
	b=CvYgdMgX4CyJnQcSiwGibrXI8cB8GBx6hxxvni9bJ2LWVHO9fbmC9FqQS3XqNNT7/lj0
	 O4DD5V4PzXmGmVFYbo79TWVBC2haLCEMti3tiReSm8xl1iDAsfE6No1lJ+Ksrts9fT5tA
	 blnb4SNWB+BZ0ibHKwd4Ztcv91dk6YVXiiEF0SSInKs5wpDB1LH6kdYqmE5Qz3fpkd8hF
	 lPjvtzIFOM4+2/Oko3MosLJ95wWRX701TUnrtI7jQG+UlpkqxpX0rz+fA+g4wVCPESJX4
	 VpKLs/Q2DqCWp4UzyZ3YHU0yWvqlrdZ/EGyq4SOwBa2CoOzXAbaW91pqwxbWEkOfgkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789760;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=dVBdniBvEIXtx8ZpG/6yER/9xs072scOUtO/5uLJ+Jc=;
	b=M9k/O9KD0NRgaRQaf5RNyxOLCjh/ffbp1Mrub3ExjWCj1U5OioqKq8kh2aqQu16v3tpt
	 G7mbGcjcAXpOADoKYLCDpkRbcqbHyMMpfpu1ohSiLKpTsTHnjMU9AvCdZP+ddBFxyo/Mk
	 3cSs6StpAkR8xSgWAmyNx7lLKN2zDLEUoGr/rJsnLBosEdMLdjcFd50A5KK1hZZDSve8c
	 6ngezDnzZcnZvtEek7zNliDgCxJ425M0MefZPh2JuzBX7bLymKvIkG4L3xTCeQJkQCdIp
	 +SYRfPNz+4sVVf4aGTayX/0JiQ5UTJbOysxVazVsWZQHg80pyQ6mgkWofTJNclr+OQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="JCpWHu/3";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DA9606A6A3;
	Fri, 27 Nov 2026 14:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JCpWHu/3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFD731F0092A;
	Fri, 27 Nov 2026 14:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795789760;
	bh=dVBdniBvEIXtx8ZpG/6yER/9xs072scOUtO/5uLJ+Jc=;
	h=Date:From:To:Cc:Subject;
	b=JCpWHu/37A4g7JX5s1AIPMZVHbVYvyqOaB89ezJbz4E5/kEasDDi/cWqbaeOVtXuJ
	 pfSm9KZOvSfvm4rskZhhcJNhdvV7MCsZrTBQdqNtX+wzV6T8ougTmCExm3J3ZVrDb4
	 00vhGGQvzATWf5F2qfjOFeQbmUE/5lxhMcYD7NavYsXyjRoY8bUc5UNgyQz+ON0hiX
	 7SiMOYUueS/9vdV/GulNQsK6wJ59SBfRT6p1kPV+3RU976T+LjJ1nBkwFTTYVzKGEu
	 ZLU3q6Z86DxH2hoMdOqFhSuwkBZnlaaFMNZieomj0LNrsG645rikdGfJZfPzja6IDv
	 BSuzMze9i4bfw==
Date: Fri, 27 Nov 2026 14:29:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the hid tree
Message-ID: <awmTvGNur_ENfpxT@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="wJKgiiMvq01juldk"
Content-Disposition: inline


--wJKgiiMvq01juldk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the hid tree, today's linux-next build (arm64 defconfig)
failed like this:

In file included from /tmp/next/build/drivers/hid/hid-core.c:37:
/tmp/next/build/drivers/hid/hidraw.h:30:37: error: 'HIDRAW_BUFFER_SIZE' undeclared here (not in a function); did you mean 'HID_MAX_BUFFER_SIZE'?
   30 |         struct hidraw_report buffer[HIDRAW_BUFFER_SIZE];
      |                                     ^~~~~~~~~~~~~~~~~~
      |                                     HID_MAX_BUFFER_SIZE


Caused by commit

   bed04b3b8a67d (HID: hidraw: Make hidraw.h private to HID subsystem)

I have used the tree from next-20261126 instead.

--wJKgiiMvq01juldk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsJk7sACgkQJNaLcl1U
h9ATOQf/bCDGBcYEM8nvP4vAly4oPb2JnJxvWKRXx80QXOcdrLPpAbFaGN4oUt4h
vUdZG2+Yt0MccEJZenPad563rCyqJTFDgZg0zhHJdis8Kkd7s/qeiA5nhRc45LMZ
fPy2Y0wbdZepJISzhFMAvX0iKyOKgGD+r9BBSCP+62nIAowgMN8DLzQmdeESf4gt
dtWmF/Ous2Hqorj6LXq3GFUhn4gLya80/MUaI+KY/qCXc12UGW+JilVT1cwYrBAu
QwKGzTYWnQHecBaUTQLT4iUWtl+Ap8iG9qqvYfcTWoSSIoXhIyAPif0y9U5n9uud
w7uzu3X/e9Orw7Ifg7C0Ve9hw+s3yw==
=Jiqu
-----END PGP SIGNATURE-----

--wJKgiiMvq01juldk--
