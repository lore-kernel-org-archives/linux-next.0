From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the staging tree with the  tree
Date: Wed, 2 Dec 2015 20:17:43 +0000
Message-ID: <20151202201743.15940e7e8853122af01ddff4@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__2_Dec_2015_20_17_43_+0000_hSPpZY57XHnbnJ9T"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:58069 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755727AbbLBURu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Dec 2015 15:17:50 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Wed__2_Dec_2015_20_17_43_+0000_hSPpZY57XHnbnJ9T
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in
drivers/staging/rtl8188eu/include/phy.h between Linus' tree and commit
"staging: rtl8188eu: using unique names is good" from the staging tree.

It looks like the patch is already applied so I skipped it.

--Signature=_Wed__2_Dec_2015_20_17_43_+0000_hSPpZY57XHnbnJ9T
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWX1HnAAoJECTWi3JdVIfQ6pMH/iulQCyWpNktZCW3A27fy9uf
8asHl14/19gG6ZHthyJU6o6c6DccNCmNwJmOtxDcJHS5ULHUXfwZHHk8MURyPATR
p3M/xztB2hn7BZXij7GnosgZm/izVM0CRUdEr55a9ZElseuMM1bP6y5H1bXzv1XB
FOigBYG+cE+/SUColntV6q2s7EIbMjlByg8nge+SaLnZ38aqKsGlbOMivIRHOo4m
fQVLvl/SCgUlBzESp+6DrAJwM2csMZnr+wBof5LQo5YcudnXyE5MBFbKu62P6Y59
JE8mXsLTKHXbX3JnLuWZly/EV+0WgXB5nls0nQL1pNDyZoshy9rKs8VshFGF6Uk=
=vp25
-----END PGP SIGNATURE-----

--Signature=_Wed__2_Dec_2015_20_17_43_+0000_hSPpZY57XHnbnJ9T--
