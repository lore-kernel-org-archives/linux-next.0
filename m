From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the drm tree
Date: Thu, 4 Jun 2015 22:31:19 +1000
Message-ID: <20150604223119.1cf74d29@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/AVk9i2NRW/iLMh=./jrnx7z"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48251 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753591AbbFDMb1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 4 Jun 2015 08:31:27 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/AVk9i2NRW/iLMh=./jrnx7z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dave,

After merging the drm tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

./usr/include/linux/virtio_gpu.h:184: found __[us]{8,16,32,64} type without=
 #include <linux/types.h>
Add virtio gpu driver
Introduced by commit dc5698e80cf7 ("Add virtio gpu driver").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/AVk9i2NRW/iLMh=./jrnx7z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVcEUcAAoJEMDTa8Ir7ZwVGtoQAIzrB7th0LJ/GYy1BW3+xCq5
zCWRAk5XDc+7nsnD8g5I7jhHCuJz1ew3LZ3Ha/PmcQ8HUr72yvHnBGYk5VL47Wwr
1Mm6r8REvjZczaZYCbuXcgnU7r1SONW3Wc0hqZq9VxB2pOlgjYpi2L18N8ay5uP5
Hyt2HbHg1qQmgfuz9x6tddM3gLqcxm6r5C30RTBlmbQbfWoftlA1BXhfxxUpGGSt
EjgGrr9us0oouaMYmev1f4heca1DkHS773HUjiTzsxpikQWoTITE0NP6dFMUWXHI
CVcY8nrk8BP16muJNscElXHhaE3vrNot00aa5+W+nBGCg0YPBdCOU4tGPT6hdTwO
P0g7rzUssjyzY4pXWedSP1mUueiiOIT4wNFPvKG5POfA6Hb87bajjRd9m5ltr9yC
WFzF7WK4WvbGHGpYVCvFF6gVid9Y7Vkddtr0dmfG6j7maiOchIY5W2wKFelbPILA
dkrSSZB4E36wwQ6RiKBuB16lyMQCncT2MxYnsSoRUrccdKRhxPehNczmisAeLadL
6M1CqPPFWWyS8cYKGsPCl5d5k5o0VCoLRqE5KdKXEGd4J/cO3BdCl3seSwaLhzC1
IrawmpQpF1qTZZsjLi2D+PSrJUX7lWz1NK7wekRzofOpz6qMx13VMP6YzaiMovcX
I919IE+4zJJCRWc3OVTW
=1M+a
-----END PGP SIGNATURE-----

--Sig_/AVk9i2NRW/iLMh=./jrnx7z--
