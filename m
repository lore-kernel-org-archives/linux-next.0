From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the target-updates tree
Date: Tue, 12 May 2015 14:54:10 +1000
Message-ID: <20150512145410.3ab21869@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/A.FohAd4K2dH/joddI4AuhU"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50560 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750723AbbELEyS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 May 2015 00:54:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/A.FohAd4K2dH/joddI4AuhU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Nicholas,

After merging the target-updates tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/target/sbp/sbp_target.c: In function 'sbp_get_lun_from_tpg':
drivers/target/sbp/sbp_target.c:186:17: error: 'struct se_portal_group' has=
 no member named 'tpg_lun_list'
  se_lun =3D se_tpg->tpg_lun_list[lun];
                 ^
drivers/target/sbp/sbp_target.c: In function 'sbp_count_se_tpg_luns':
drivers/target/sbp/sbp_target.c:1833:30: error: 'struct se_portal_group' ha=
s no member named 'tpg_lun_list'
   struct se_lun *se_lun =3D tpg->tpg_lun_list[i];
                              ^
drivers/target/sbp/sbp_target.c: In function 'sbp_update_unit_directory':
drivers/target/sbp/sbp_target.c:1911:45: error: 'struct se_portal_group' ha=
s no member named 'tpg_lun_list'
   struct se_lun *se_lun =3D tport->tpg->se_tpg.tpg_lun_list[i];
                                             ^

Caused by commit 731bbd790f79 ("target: Convert se_tpg->tpg_lun_list to
->tpg_lun_hlist") which doesn't seem to be complete?

I have used the target-updates tree from next-20150511 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/A.FohAd4K2dH/joddI4AuhU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVUYd3AAoJEMDTa8Ir7ZwV9y8P/2UQIjAii3JHi6MwGu7eA9Eq
BZRflzfDByI6A1ytwGB19ahyxSmZm6Anmr6TBys/7xPrZeM/6gFUGK0kUQyPfLha
6P8tU8Gv26eFGq5EGq6D9L7LcjLxVuaxvusceXlCVgEsuolKiAOEUWO+qZQVoXyh
gq0WbxB4DeUXu5BG/wB3AoWFbiQuQNyHemm6b1/GMVd6lvmLI2XpNL7irZU51xZU
OYR39ylR6FuE3HMC0ogME6YrNbrw7dBhu/icYFXKfDI/AvSmQia/wtwek9yY1ciL
4I2aY6F3VsF247HHc41pO0grfYL2xwbM0KodJDRCERWgeB8wnQOdg3jwZB4BNuO1
/Izqj7yHBB8G3+cs970x4xcZP6whkaZUN1UUTDFPIK9lo97nt9tl+sGCVirnA0BJ
LWDevllFiPxDwSwoJuGlBGq2jJ4ROndrgqGT1+Qal715fkjotD51JEBU3c/2z2U/
ZhC/zftRTmYMXNPJ9es8qKqbJU06K1ItirZln5Doy4M50rFme7p72ar1RG/f+FR5
ki+atqU37rpcCLD/iaZsk4Cf7lIAgpBxlinLeKr+XRSlppESnzloxnM8x1EKWLq2
vFXJ6LDB8xzOr2aqn8MWNTf01Eu8EHg+z4sxVD+HI6E8GzkGhSfiFLxVWqwh4L5I
IyF3QV5+sZsWlhRFQFJf
=/rjz
-----END PGP SIGNATURE-----

--Sig_/A.FohAd4K2dH/joddI4AuhU--
