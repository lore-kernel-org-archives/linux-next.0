From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the akpm-current tree with the vfs tree
Date: Thu, 3 Dec 2015 00:18:32 +0000
Message-ID: <20151203001832.ef38abf329032ddb8eae22ef@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__3_Dec_2015_00_18_32_+0000_fg/UAlsbocf0KZMs"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:58319 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756907AbbLCASp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Dec 2015 19:18:45 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Julia Lawall <Julia.Lawall@lip6.fr>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Thu__3_Dec_2015_00_18_32_+0000_fg/UAlsbocf0KZMs
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in fs/adfs=
/adfs.h=20
since it appears that "adfs: constify adfs_dir_ops structures" has been app=
lied
by Al Viro. There was no conflict to resolve but git still flagged it as a =
conflict
for some reason.

--Signature=_Thu__3_Dec_2015_00_18_32_+0000_fg/UAlsbocf0KZMs
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWX4pYAAoJECTWi3JdVIfQ0hwH/2E1R33vm2GelB0IApHHXUw0
BC40klcg/qrRw7BGrZKVQOj5hiu8sHC90ysic9Z6X0P+3MMzmjYpe44hcHOPxeIt
I1SJOQ7AZeMvp7pF0vKcQo2h0qC8fgy5+Ks03NoB4acMzx8D0JBMGMm0J3NXQXSd
++zs+rA3KnfQF0SNwOTk9p2bCZiwZxQmv8MoceAo9cDftWbqR/8XbW1jMt0f8dcV
STxS1FvamLneSxonyESOycf3CfKiV3NVpw4MWHTTQRiq40HHLw9iA5GtRG0nDrOA
8AQA33cvHXdiY3/naoWrU0PhrIV398w05aQrD8YGzudOfDj8xabUqdeW9ddPRMI=
=CEmL
-----END PGP SIGNATURE-----

--Signature=_Thu__3_Dec_2015_00_18_32_+0000_fg/UAlsbocf0KZMs--
