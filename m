From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the edac-amd tree with Linus' tree
Date: Fri, 26 Jun 2015 17:08:39 +1000
Message-ID: <20150626170839.7a0945c5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/2dfwg/695TcHzbhTkBp//HR"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56474 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751579AbbFZHIw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 26 Jun 2015 03:08:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/2dfwg/695TcHzbhTkBp//HR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Borislav,

Today's linux-next merge of the edac-amd tree got a conflict in:

  drivers/edac/mce_amd_inj.c

between commits from Linus' tree and the same commits plus more from
the edac-amd tree.

I just dropped the edac-amd tree for today as it seems that it was just
rebased and a few commits dropped before Linus was asked to merge it.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/2dfwg/695TcHzbhTkBp//HR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVjPqCAAoJEMDTa8Ir7ZwVEHQP/2OhaL+qrPgi6npnCzbzsEW9
necl6BssTIguJAW2++Jiw47jIKyJmHtDNnQLfVUGGMLRPDPQy8ROKwhJbHaEcUqZ
i9LfcsUqnN4nBGBt1O+y+KBl7099b3kwl7WKPBMvq8AekM1xhz2yIeMYnOqp7Bc/
X3F+a3qdZnL+NpqrYRrgbAi8IdC7BLN99GaxQvmTK6djaD0iQ+aQ9wn72oOla2V4
y09mLF8TqpSFAm6Nj3dYivjFsXrDHqwa45aViNLFh9TgdzeJMtcGc6IzvJ+wFdkd
HZtsFS0Smq1eJj79KJyRlOOV/sqFGXpyGH9LQSVD2NlnnAnlgTeGCnLoznawCkYM
fqUAp9jlP4NEOHSXxJiHbVRgWCZ6bI5nyuEgerMf/fkKJ7R+PaK9swOhwvYGxgr0
Ls8djT/DKrGcEbYzIArSVw4atY7TMgcGpJznoTpI8HXvp5Zk/3waFMfdpe9c57dv
uG478lLovKzNmjxcqcjndKJRV6A5w+RqT+oP4ewmxio7p83UlmZgEYLj3loe8JkN
kkFxpmgLZHS0WUG4QxOF9yar8Bm4COVV3axv+W6JPbFv5/7aZUDJbWmHaPu7C6hE
LySHnAY42yxAe0prOxVi6IMSVFJApBZDndJ3iIEu06LcstAwY/YPN7JSFwUl1Ude
h6TxxEgxZjZ8cV7W6peU
=FLLQ
-----END PGP SIGNATURE-----

--Sig_/2dfwg/695TcHzbhTkBp//HR--
