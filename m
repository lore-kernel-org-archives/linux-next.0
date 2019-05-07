From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the cifs tree
Date: Wed, 8 May 2019 07:32:38 +1000
Message-ID: <20190508073238.6a5f4cd7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/nV_z1UXHPRWrbHF1bVrzqUz"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Steve French <smfrench@gmail.com>, CIFS <linux-cifs@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Probst <kernel@probst.it>
List-Id: linux-next.vger.kernel.org

--Sig_/nV_z1UXHPRWrbHF1bVrzqUz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  b00c40f57bd5 ("cifs: fix strcat buffer overflow and reduce raciness in sm=
b21_set_oplock_level()")

is missing a Signed-off-by from its author.

Actually it looks like you were just tripped up by the mailing list's
DMARC workaround.  :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/nV_z1UXHPRWrbHF1bVrzqUz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzR+XYACgkQAVBC80lX
0Gw6+wgAnPYqgMXjYLhWdeqyVk2mTpGiJyxOY7FqWKAHX5nhsBFolPphfLHcXe3b
vJnigEOtiB0S/opc0DAxQZAXXW404hF2aCsTWa9NoLlfkAUTsObsLv/l6oloK7SZ
6otfVHe2RX6hrPdqCAEt+wXtJUTbQN07PSxRNb0bSMPBhas6GNO9HW26ecFuHRY4
hAfsMY5CX/7bsSuhfgwSevxTOXFkB8VwSHjOJRoWwX3w7iXT6XVlr1AQ49oGQk6F
Gc2AiO8RMtNzQPPHyyy0QCWGZQV7ect7Z6yJOaEtSAicYNjYc00cxSINICSPUI6R
iqJxGj7zOE8Zru4GOx1kiX+wKV3e7A==
=rYQp
-----END PGP SIGNATURE-----

--Sig_/nV_z1UXHPRWrbHF1bVrzqUz--
