From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: bad merge in the libata tree
Date: Wed, 5 Jun 2013 10:13:39 +1000
Message-ID: <20130605101339.16b56c6fc7e17092798d9ea9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__5_Jun_2013_10_13_39_+1000_z289I/zex=/JzBXc"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:40216 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751343Ab3FEANt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 4 Jun 2013 20:13:49 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Wed__5_Jun_2013_10_13_39_+1000_z289I/zex=/JzBXc
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tejun,

The top commit of the libata tree is a merge that leaves some conflict
markers in drivers/ata/sata_rcar.c ...

I will use yesterday's tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Wed__5_Jun_2013_10_13_39_+1000_z289I/zex=/JzBXc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBCAAGBQJRroK4AAoJEECxmPOUX5FEwn8P/izAJst8PHKQ/TlTVaKNrPwW
gCKB2aYxCitV6cR93GWZWhY/oPXKm1SHu4b9cviPXVJi2WkyBmJ66c+eG/Rd0soR
5bZ5++at8PQBGyGTvDSvU1P75Iozd6H9f37eWwY/nMxkqg9iJi9iZDZCLMETN+Vg
i51Il4MT9gEBny+LzhBsR0x9YCI4jI71orPxcVJmycr70RMLpHPQwAbFlPNqGhSt
Twg0+DAGU60s2551IJVj/QnBBsfEcqESmE0Qnklui1bCKZDAbAxM1oVGTBN/zZBs
mXg/+Csi+Rgzkav2cheb7npkVdJ/cQi8YZrMCBx2bO9TNEOE6cvwS0ERGBPF1gTu
YsHW2AEor6DXmu7ZyvJmKIr4B5oixEsZ2n1fWj70befzcJLd70LYXhL1CFvw7k99
ThHxBWjLj7NItSQJ1p1O4ci/tNsKFTzW9+U3JP8cpCnC51Zvhs1oVGeZfgPduuhL
XTlpCN6qqvOjbduV25kGY4xV8IwzvPXHv/HNXdW9PHA84JdF8zsBcQXNtcz5aMet
JEyNQ/M61xrAW5FHoCV0I8oOYXqE632+sSiz2oaH+c/LD4jaEULo9/2ySMId/LF0
kLVBrROAlGIMfz8eDpJSwV/g951vVHguZG2nptyJUkC85WALHVgeMdnI+VK0QCWw
dUhRZfgjxbcfzBhDNivT
=OM9c
-----END PGP SIGNATURE-----

--Signature=_Wed__5_Jun_2013_10_13_39_+1000_z289I/zex=/JzBXc--
