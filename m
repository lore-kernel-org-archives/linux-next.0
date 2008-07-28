From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree
Date: Mon, 28 Jul 2008 13:16:00 +1000
Message-ID: <20080728131600.86690126.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__28_Jul_2008_13_16_00_+1000_gWSqvU3o0x5vB0fY"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60620 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751824AbYG1DQH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 27 Jul 2008 23:16:07 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__28_Jul_2008_13_16_00_+1000_gWSqvU3o0x5vB0fY
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
include/linux/kthread.h between commit
ed9559d38a87a44e3bda87d73a50aab92471d7dc ("Label kthread_create() with
printf attribute tag") from Linus' tree (which is also in the rr tree as
"misc:kthread-printf-attribute") and commit
b7298a2ec9cea26892cebb99916349e974b254fb ("misc:kthread-typesafe") from
the rr tree.

I used the rr tree version.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__28_Jul_2008_13_16_00_+1000_gWSqvU3o0x5vB0fY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiNOfAACgkQjjKRsyhoI8y3fgCfXBZMa6QNAMRPscuMGJc6sEIB
b6UAniIA1oNoho0nX5o/6x3/8ovJSEiP
=Q5hC
-----END PGP SIGNATURE-----

--Signature=_Mon__28_Jul_2008_13_16_00_+1000_gWSqvU3o0x5vB0fY--
