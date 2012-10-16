From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the cortex tree with Linus' tree
Date: Tue, 16 Oct 2012 13:20:52 +1100
Message-ID: <20121016132052.0ac9f1f6b3fcbe946503793c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__16_Oct_2012_13_20_52_+1100_Ubruad2t83pJLwt."
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?IlV3ZSBLbGVpbmUtS8O2bmlnIg==?= <u.kleine-koenig@pengutronix.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Russell King <rmk@arm.linux.org.uk>
List-Id: linux-next.vger.kernel.org

--Signature=_Tue__16_Oct_2012_13_20_52_+1100_Ubruad2t83pJLwt.
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

Today's linux-next merge of the cortex tree got a conflict in
arch/arm/kernel/process.c between commit 9e14f828ee4a ("arm: split
ret_from_fork, simplify kernel_thread() [based on patch by rmk]") from
Linus' tree and commit 2f3e7d3436cb ("Cortex-M3: Add support for
exception handling") from the cortex tree.

I have no idea how to fix this up, so I have just dropped this tree for
today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Tue__16_Oct_2012_13_20_52_+1100_Ubruad2t83pJLwt.
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQfMSEAAoJEECxmPOUX5FEsgYP/jIgnGKnikApuThIXRdmlbB5
qSdJ/u7LwHzAYcEQoP1U6ajdMliAUxvtF+mFOeb/9LVbuh7Vzus4GKpVhrM8dW4c
svP1X+v22sJrrYqFmMYqE1V1Ko5PFPD4xijIK6mUKODHTsi2lhLOeD0m492CwTQp
m4rMVIQqqsFLqcjYh6ssFqJ9+4QHzIuKwc8aVa0b7CkjjdFAuDqsuyzM0QHZmNOv
Dy1TH3yeV6S6ZHJBYT5J3KDgNK2Iol8Q8oA8BpDgSpbNM43WI5iLvnq3DBJAPypS
XVcgIKFOu/M9+LKUCc7OM4uavlUwOavC85gUI9B1Q4aOBb9kYTmT3PfUG/zZsYXJ
QylXBD9FacY3PkDhJvvUyyN1FlSiBPVffH0laj2LBuHlL7xAlL45IA/aGoO6qpb+
RkaGFovLFNxqh/KPT6RzuJXCPSryFlY2CsXezEKFqJ5LHXJbdWOFYoEYRCFQE0Yp
LnrVc424ri3fhEJLbOaIdtKbTq8CMG+JFltwHxVY+2Ytae9c+Xy3wu8gCox8NHHW
rEZ0gj+XhYgV823PZLsT2Cl1LjAg6T9MANw/mGbxdjPdeNWiKOAkl6sG3Z+Bk2DE
IyqCIFOHduNA4I7mDCGX5Dct3Ph3TWA16mZPJw0sJzteMOBiiY8BUyh3XOc+5Xyj
cRjP3USZ/9lZ1G01r02i
=X7qE
-----END PGP SIGNATURE-----

--Signature=_Tue__16_Oct_2012_13_20_52_+1100_Ubruad2t83pJLwt.--
