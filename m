From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree
Date: Mon, 28 Jul 2008 13:09:34 +1000
Message-ID: <20080728130934.e444229c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__28_Jul_2008_13_09_34_+1000_evFlUK=y3eFmt3d6"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44528 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750728AbYG1DJn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 27 Jul 2008 23:09:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__28_Jul_2008_13_09_34_+1000_evFlUK=y3eFmt3d6
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the rr tree got a very trivial conflict in
drivers/char/hvc_irq.c between commit
611e097d7707741a336a0677d9d69bec40f29f3d ("hvc_console: rework setup to
replace irq functions with callbacks") from Linus' tree and commit
30b3dcfc04fd3948938e0c7c4a14ca8c50d16839
("misc:hvc_console_rework_setup_to_replace_irq_functions_with_callbacks")
from the rr tree (which is presumbaly the same patch, just whitespace
modified in Linus' tree.

Someone removed the extra blank line at the end of the file ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__28_Jul_2008_13_09_34_+1000_evFlUK=y3eFmt3d6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiNOG4ACgkQjjKRsyhoI8zugACfcf5Nd9YWN+q26m8Ihu9az0FS
9CgAoJH7akwBpMaGIQ7nvVTRjJ0+GAOg
=Z1zY
-----END PGP SIGNATURE-----

--Signature=_Mon__28_Jul_2008_13_09_34_+1000_evFlUK=y3eFmt3d6--
