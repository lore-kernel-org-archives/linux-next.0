From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the cris tree
Date: Fri, 16 Jan 2009 11:11:27 +1100
Message-ID: <20090116111127.3fc8dbd9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__16_Jan_2009_11_11_27_+1100_G3XEU2dLpnSWdC=u"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52527 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754153AbZAPALn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 15 Jan 2009 19:11:43 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: linux-next@vger.kernel.org, Harvey Harrison <harvey.harrison@gmail.com>

--Signature=_Fri__16_Jan_2009_11_11_27_+1100_G3XEU2dLpnSWdC=u
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jesper,

Today's linux-next merge of the cris tree got a conflict in
arch/cris/include/arch-v32/arch/byteorder.h between commit
aa0effbd1c0269ce7dd13be8dbf13e6b04f30ebd ("cris: introduce asm/swab.h")
from Linus' tree and commit 0db42c6b23ce26b05b235dbe2e0aa096db194e33
("cris: use the new byteorder headers") from the cris tree.

There was also conflicts in arch/cris/include/asm/byteorder.h.

I have dropped the cris tree for today.  You should do a merge with
Linus' tree and fix these conflicts.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__16_Jan_2009_11_11_27_+1100_G3XEU2dLpnSWdC=u
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklv0K8ACgkQjjKRsyhoI8wqCgCcDHWveVgH/ExQf23tgfTknDl3
1h4AnRrwAB5VxSyFu3X/sLKiP8Vlm3/k
=ZAaM
-----END PGP SIGNATURE-----

--Signature=_Fri__16_Jan_2009_11_11_27_+1100_G3XEU2dLpnSWdC=u--
