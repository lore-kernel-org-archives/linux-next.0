From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the devicetree tree with Linus' tree
Date: Fri, 5 Aug 2011 12:13:56 +1000
Message-ID: <20110805121356.7dc43da10b3a47f3e49bd53a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__5_Aug_2011_12_13_56_+1000_RGg_zQz0XEaB_Nzg"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46954 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754287Ab1HECOE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 4 Aug 2011 22:14:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Fri__5_Aug_2011_12_13_56_+1000_RGg_zQz0XEaB_Nzg
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Grant,

Today's linux-next merge of the devicetree tree got a conflict in
drivers/of/base.c between commit fe55c1844a1c ("Revert "dt: add
of_alias_scan and of_alias_get_id"") from Linus' tree and commit
79787f21b37b ("drivers/of: Fix sparc build failure caused by
of_alias_scan") from the devicetree tree.

Given the discussion on other threads, I used Linus' version.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__5_Aug_2011_12_13_56_+1000_RGg_zQz0XEaB_Nzg
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOO1HkAAoJEDMEi1NhKgbscZAH/1+eyhsQXPwj9VJsiPHyNTWb
etLGePlG3f07J6YDxoxKz8G/IeAWkgu5DI1sJF1oeBQHp3MFE3F/xy7L0lG9HIiN
6CsDCfR3/1cCzkpw+ZnAl7N90KpBOhrQh799DkJKQmsWEf9weC/HqLavgQRUlkTR
4ZkjpjX9alx8HWHS/Kh21A1q63a6t8WrAi/BIUWGJy50xLjpDdhEEPxveBQ9Uckk
XP+nqTBImsZ/tLuvXrPgTOIatnQqpg9muqKXx2tO9z4LQuygTZ3Y30nVIaKYuebD
la2rZCsZDBaPznEfS8012DGoK2Q/SG8GIUeuLMLO8DXYDVyqfZSq9iMdz1UhGTI=
=zUg+
-----END PGP SIGNATURE-----

--Signature=_Fri__5_Aug_2011_12_13_56_+1000_RGg_zQz0XEaB_Nzg--
