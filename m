From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: failure to fetch samsung and bjdooks-i2c trees
Date: Fri, 4 May 2012 10:27:44 +1000
Message-ID: <20120504102744.d5b6fbcdfa8c70c709ed4759@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__4_May_2012_10_27_44_+1000_qPNW_cnrGB3F._L8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:44394 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757008Ab2EDA1x (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 May 2012 20:27:53 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__4_May_2012_10_27_44_+1000_qPNW_cnrGB3F._L8
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ben,

I have been getting:

fatal: unable to connect to git.fluff.org:
git.fluff.org[0: 89.16.178.74]: errno=3DConnection refused

for the last couple of days ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__4_May_2012_10_27_44_+1000_qPNW_cnrGB3F._L8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIbBAEBCAAGBQJPoyKAAAoJEECxmPOUX5FEFkMP9j4/5o7zprZob/pUcrteenze
ronHz4DDMOFMwGqQNAPRQXALvsLBwDaX7etmTGgVbdhMNvbhj9K1KTXaZG4V/Y8k
b1z9ACVxiF4BDsPoDXidk2OTf7bL6b8E2IWsSO5f9cLl+dCGOjNnQOxggrFXeU+A
5nAwPK99nwbUlSnQ40iYBEckjTQPS+H+ovoeOwnAJZCWXtKUjwoKUupJCvaAbfT4
dl6ICSoho+YP+9kywCi1GuUBHIW3P735mvh2/W2IAE8IQOmHVoXu27KKs5aHWhmU
6YWeyzmFPwNlLFqHI2kjm0sscWMBAyzPbWy7Z+TfoIwnY9Oj3/eTLG/OshazfH2w
OC0XoZh/t8BQdmF19/bKkMY2hBiNjyU53uzcYiIKGsFrmTNEgowZQRJexZYKvzIX
j+1AstWuoKCTXrbWXBX+xJyXQIkzRU7OBkKPCsX4KnBRdwCWhLn7LemQYz/1AwWm
G1WxMpQLoYj892W2q/TLU6C6aUt8gWekQurXIh1ZWENeu0+uqc3RsCUxB4H1ajRC
WZqzqofMca0XiKgJ+LY/QJVtp19Pd7F5u+4bpH+RhJvUhRtWa9NOB/DtSynm77ep
k2yDV3DWMNJkXCBhGqej+P1HCzEP2Zq6FW7djh6iLqmYxeonnmb+g2XOnUCEIa9H
G4CR+B1LdSn7bFZPtic=
=xvR4
-----END PGP SIGNATURE-----

--Signature=_Fri__4_May_2012_10_27_44_+1000_qPNW_cnrGB3F._L8--
