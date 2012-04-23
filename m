From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the usb tree
Date: Mon, 23 Apr 2012 15:11:46 +1000
Message-ID: <20120423151146.8c5687c65c4eab16f063954c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Mon__23_Apr_2012_15_11_46_+1000_QF+S.g.P2bMayYjm"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:50732 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751901Ab2DWFLz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 23 Apr 2012 01:11:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Masanari Iida <standby24x7@gmail.com>

--Signature=_Mon__23_Apr_2012_15_11_46_+1000_QF+S.g.P2bMayYjm
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in
drivers/staging/comedi/drivers/dt9812.c between commit de15fe3ed9c3
("USB: dt9812.c: remove err() usage") from the usb tree and commit
73e2918990c0 ("staging: Fix typo in multiple files") from the staging
tree.

The former supercedes the latter, so I used that.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Mon__23_Apr_2012_15_11_46_+1000_QF+S.g.P2bMayYjm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPlOSSAAoJEECxmPOUX5FEdRQP/RnBYkT3U6Wej90CILTuL2pZ
GPEqs/xOjaWq8/0UPC4VnreGN1x/Mz7oZPO7w+Go6EVP0tEvUb3EQO6TRHYP/P64
kzGBFAGTE+Jn5f42voS/OrfJ2YulLVWssmK5O6YyD6Tyr6zYVaaXDVaatDgmXK81
C3ijUjEghgO1aXNJGfw6LW21jqwotiW+WwAuC0IoUDMh5hfoMdn69j2iCkUp5bH2
1AQKg0X8ilvKwmFXazhQVeshqJDNUYIHssLEaAma3/S3+bPqvI7H13QGAFZl24eS
alwbL0vd4IY9sPFwn2ZfSce4ccFJjR9xNtQN8B6G64vDOZxy3T/eDQFLUs2aCQRj
DCIjT1EmWILMbBk1Hk7GAjIuGrhHMdKwYs4VS6yL4ggFLKLCZPPL8F9bsuwsQ9cu
A5MrxosLKE1bmW0+Gp1zFarLK/xd8TCFoOzpEEWuHw1e+x25Q91m/lJ9Mzw5Jeb0
z8t/0mVM4WoA8wUFrjr/u9z399NUXLtlJHtorv/7UHtF1ewvU2xAklpSXxMXuvtT
HPRvGW5dnI3yBaXGKRzUnoVKV7WKcuExWlDUkR9Scx/EiP0+e92mSHKFJVzxQAKd
xyILx5WWRXvAbGYnkOyXtttSQx2H4/LWSnMRSLCm7yZVssoZwYmATCHel9C9oosK
Crh1l2qLwAtbfMi/qsSF
=ivUT
-----END PGP SIGNATURE-----

--Signature=_Mon__23_Apr_2012_15_11_46_+1000_QF+S.g.P2bMayYjm--
