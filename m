Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qj8r+SHS"
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 462C7CF;
	Sun, 10 Dec 2023 13:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1702245177;
	bh=N6L+jss40rpJhCimyakhzVZzSqFKdaMB+fAnx6lIq/4=;
	h=Date:From:To:Cc:Subject:From;
	b=qj8r+SHSgh3oMHo7+UXSqIvXjxK0MUSNb+dRzUu8HV/aw9VwxcUr88Lk8VJQnOOQ/
	 rmPuoU9Ku/n8jc7RJRhUw9LyeB4bw7QvZZ2+3L60ZWPDwC4e4ySQjkiD+YYpjZMXnZ
	 KorHZeka5F1f1P1YGk3/a2RIGRuLRI53yOWGHVszbvzd/0MG7a8CK2XFnQ6+Uaizdp
	 +VkJ4SZrOQczICvQ/lf69Ac7NVjXCJXUc+eSSQUGn1f3s9NIp5q3SzkNcxOU7kaGzV
	 WV7y9SsyXa8PgssQDoMpVInpRePHr9iG7MTMxJ/iW5takfbTEFt1qNEIyyiwo+sTaK
	 b3ww08J7Eio+w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SpJX80pw2z4wdD;
	Mon, 11 Dec 2023 08:52:56 +1100 (AEDT)
Date: Mon, 11 Dec 2023 08:52:55 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Uwe =?UTF-8?B?S2xl?=
 =?UTF-8?B?aW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the pwm tree
Message-ID: <20231211085255.405d4654@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/H65QUyVnMFD4cdSQDFLXHxA";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/H65QUyVnMFD4cdSQDFLXHxA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  1ea832ef9787 ("pwm: bcm2835: Fix NPD in suspend/resume")

This is commit

  4e7a8dbd2bc0 ("pwm: bcm2835: Fix NPD in suspend/resume")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/H65QUyVnMFD4cdSQDFLXHxA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmV2MzcACgkQAVBC80lX
0GyQZAf+MsWqXao/LcgWlCtkEYgMasSg058DEkBaqfag70wAn8sBRBhX6Bva9o3L
+uuAEq0kgKRnBrJxRd3Bv3t3KRMreGmvQRxqsSBF9NXqNuS9tFKBJsbJtRBjTj02
BpQ8v9chEZrKmfHLUUkkirNWTi5UW39zhWK0ZmedMm07u00hCXQjh+tcyrfHrQd1
CEsTOV20XbCryw3q+Xn4z7+zrH3dVOV/OkwpaEu4kP+IWI0iMIJ2NnMmunIce3HH
fwhefHe44TlPWt1e+LLKDPPIZA81BwjYlv0NMKf97xQLy9WYo61t/E9CoVkkSYEa
5OxgjhUnNGxs53x3rMRyKstGdK7ZOA==
=dOus
-----END PGP SIGNATURE-----

--Sig_/H65QUyVnMFD4cdSQDFLXHxA--
