From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the edac-amd tree with Linus' tree
Date: Wed, 5 Aug 2009 15:09:33 +1000
Message-ID: <20090805150933.103de233.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__5_Aug_2009_15_09_33_+1000_rP47wccz9lCjEdPF"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39505 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754019AbZHEFJo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 5 Aug 2009 01:09:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Borislav Petkov <borislav.petkov@amd.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Doug Thompson <dougthompson@xmission.com>

--Signature=_Wed__5_Aug_2009_15_09_33_+1000_rP47wccz9lCjEdPF
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Borislav,

Today's linux-next merge of the edac-amd tree got a conflict in
drivers/edac/amd64_edac.c between commit
126b67b8d26f6623d199aa59279f2e3243f2144c ("amd64_edac: fix ECC checking")
from Linus' tree and commit 793a2a12b43aba669c8b2604a45f000a394f142d
("amd64_edac: cleanup amd64_check_ecc_enabled") from the edac-amd tree.

I don't think the fix in the former patch is required, so I just used the
latter version.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__5_Aug_2009_15_09_33_+1000_rP47wccz9lCjEdPF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkp5FA0ACgkQjjKRsyhoI8yOeQCghBzQsv/bM+tSZ+XDDBLjlkHS
u48AnjD+nddDgs6uMVnrl8X7rt9dmmP7
=zs9O
-----END PGP SIGNATURE-----

--Signature=_Wed__5_Aug_2009_15_09_33_+1000_rP47wccz9lCjEdPF--
