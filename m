From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the memblock tree with the arm tree
Date: Tue, 6 Dec 2011 14:18:16 +1100
Message-ID: <20111206141816.628d9fc4ab58e23eb9fc63f0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__6_Dec_2011_14_18_16_+1100_e8hsKNvNMuzqVbDY"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:39650 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756452Ab1LFDSd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 5 Dec 2011 22:18:33 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Pitre <nicolas.pitre@linaro.org>, Russell King <rmk@arm.linux.org.uk>

--Signature=_Tue__6_Dec_2011_14_18_16_+1100_e8hsKNvNMuzqVbDY
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tejun,

[Tejun, I know you told me about these, but I am reporting them anyway
just for completeness.]

Today's linux-next merge of the memblock tree got a conflict in
arch/arm/mm/init.c between commit 27a3f0e91bed ("ARM: sort the meminfo
array earlier") from the arm tree and commit 0dac7e2d90aa ("memblock:
Kill memblock_init()") from the memblock tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/mm/init.c
index 786addd,7c38474..0000000
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@@ -310,7 -331,8 +311,6 @@@ void __init arm_memblock_init(struct me
  {
  	int i;
 =20
- 	memblock_init();
 -	sort(&meminfo.bank, meminfo.nr_banks, sizeof(meminfo.bank[0]), meminfo_c=
mp, NULL);
 -
  	for (i =3D 0; i < mi->nr_banks; i++)
  		memblock_add(mi->bank[i].start, mi->bank[i].size);
 =20

--Signature=_Tue__6_Dec_2011_14_18_16_+1100_e8hsKNvNMuzqVbDY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJO3Yl4AAoJEECxmPOUX5FEr2gP/0ZXipvyq7QO3vhk0yqUa4Qe
4ZVR4yoAOkBwGa39bLCiG31FG7Zw+aK1WdX2TmEJoA4B07I0VhILWONxGIUJGuN5
0wPUdML1dUhAQmaPrCPkFaFmyPSYUmFAeT18YtEHHcZgsZVchHDjtO/DlN19gUn5
LtfPCUZ5OySnrl66jNqVtr7qMENFfIIZFxIvzwK/zuQPMaT2dk1C34qQHBxy0vNF
MkmvmjYGMhuoPtZqHyj2c7M9jf+x3kPiRX1Tu2JHjg830UejNgNxq4/FEf+bAh9o
z7HMw6Mg+Ok3/5KATGO9OTQ+5RfmBo0a/O89cl1KXRtZliKuyAHtRZg8ptTSpkyG
N9GNlj/3VKzbDeiC5A83oSLCpeGFw73kkdq+rLBAAGA86NMsGYqWtzAqj0pN5dtw
cx+Na/U7Fnp/7S8iSkFQIQKnawB5DkRz4u7dAjpTonKt+23RuqU/kcgTzXKC+5sO
nzTCLTys+Y0TsjeDHBw2AxDx8QLBa1MaQ/JrL6pNUeqGJrs+TMr+mSX+FBLc0Irk
ptu/AlsRH7IF/Hw8C2yiV9wJklYe4gq0qjZqnupyMVU9hC6LIf47qBggHO22jaRy
wtLjhJuDewr/DS5t8pR4r64WYXD3BLGNl7yz1Slf6XfSveaXoGPUrtGX7ZBBOCUf
Dr6L2jjn0HCX8c0ENsVV
=v6kD
-----END PGP SIGNATURE-----

--Signature=_Tue__6_Dec_2011_14_18_16_+1100_e8hsKNvNMuzqVbDY--
