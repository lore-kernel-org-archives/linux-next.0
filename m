From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the akpm-current tree
Date: Mon, 19 Jan 2015 18:45:59 +1100
Message-ID: <20150119184559.0157fa2e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/dVrRs8iRj4/C9pq1yp9T4tI"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44077 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751164AbbASHqH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 Jan 2015 02:46:07 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>

--Sig_/dVrRs8iRj4/C9pq1yp9T4tI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

fs/eventfd.c: In function 'eventfd_poll':
fs/eventfd.c:121:16: warning: unused variable 'flags' [-Wunused-variable]
  unsigned long flags;
                ^

Introduced by commit a90de8a54127 ("eventfd: don't take the spinlock in
eventfd_poll").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/dVrRs8iRj4/C9pq1yp9T4tI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUvLY7AAoJEMDTa8Ir7ZwVo5kP/iAgEnVMOKKUH4mBhiQzCvNp
tawyAC5+z1oSKSmX3p5rVpp2RjW8Hjtso25x9sX7wy17QjN+XojCvprAgXWX4G6l
Dbi+I5cQAsf9O2EUDjH/KaiI+0Rqm2aPUBgxAM7N3k/ZYvAHpOiW7Z481DyfLlut
gxeiZRRIQt01lkGU/eUYi+AtHASXGCdttfwYE+MrR11jHc5KdwDM4kCp+SkxxI9j
t3MKC8N3tb3ssSSqAkknE0tgFTUDN1X8BwYWzYUI5YkOUM0GRkyMA47ThqHzplLD
5vvvhlxUUEloekc9EN8WnWh93RB1ssHFRm6Mx5yTuQaRbPbmxcO2X2CHd/2aqr21
SuWWIFTetFqCKDW00LfFPwLQjO9lqopGN+dy6+CNTLQv34bTEBgGdgehqZ0rfAZP
qKA4k2yjL3WTW6krs/1sO2KlsroEnDiLaMNfQ3RJI3rC9kt3DtvlFPmaYJyq5cmq
ra3uE27r3dWv6MahTkQPkzYlDVocpDnboN3zpCg7S9hgSba0I3aTtDDRe5xteTyp
fhIzYfX3ZeC8Vn86qditsxE/33sAY88d+0NBFzqLHkoNrG16LHm4IGn0v+ypbM0c
HewxTUMvGnrbLzZXScOgMeBaQFBj0sDg9gX/ZnRCk83PEodFRt4VuUS6x2maVlZh
rhVEAmg1pMFDcnlgEhzh
=wSx5
-----END PGP SIGNATURE-----

--Sig_/dVrRs8iRj4/C9pq1yp9T4tI--
