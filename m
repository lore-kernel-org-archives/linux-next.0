From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure
Date: Wed, 8 Apr 2009 14:04:07 +1000
Message-ID: <20090408140407.14dc5242.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__8_Apr_2009_14_04_07_+1000_fApaZDf86MUiO_70"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40698 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750725AbZDHEER (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 8 Apr 2009 00:04:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Cc: linux-next@vger.kernel.org, linuxppc-dev@ozlabs.org, amodra@bigpond.net.au

--Signature=_Wed__8_Apr_2009_14_04_07_+1000_fApaZDf86MUiO_70
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (powerpc allyesconfig) failed like this:

  LD      vmlinux.o
powerpc-linux-ld: TOC section size exceeds 64k

I will think about (and appreciate suggestions on) how to fix this ...
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__8_Apr_2009_14_04_07_+1000_fApaZDf86MUiO_70
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkncIjcACgkQjjKRsyhoI8w6NQCfVtfU/oL6L0UFvH7TzsgnzXvz
3MgAoKdHOOGiDuh4Fxg2hyHpTPNWFLx2
=CFy6
-----END PGP SIGNATURE-----

--Signature=_Wed__8_Apr_2009_14_04_07_+1000_fApaZDf86MUiO_70--
