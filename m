From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree
Date: Mon, 27 Oct 2008 14:32:47 +1100
Message-ID: <20081027143247.30750675.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__27_Oct_2008_14_32_47_+1100_8_aXaC8sJ9ZqO3kf"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37201 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750713AbYJ0Dc6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 26 Oct 2008 23:32:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>

--Signature=_Mon__27_Oct_2008_14_32_47_+1100_8_aXaC8sJ9ZqO3kf
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
kernel/stop_machine.c between commit
4403b406d4369a275d483ece6ddee0088cc0d592 ("Revert "Call init_workqueues
before pre smp initcalls."") from Linus' tree and commit
b9d4c68d4c404c48c20380ff25fd8c0202921a96 ("commit a802dd0e breaks console
keyboard input") from the rr tree.

Two different fixes.  I used the one in the rr tree for now.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__27_Oct_2008_14_32_47_+1100_8_aXaC8sJ9ZqO3kf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkFNl8ACgkQjjKRsyhoI8wO6QCfV66e8Ln6CLUulNK27PwQ5tmf
HEwAnj13se+9h/K4jrJvwOF3Lv2hQX3v
=Hie6
-----END PGP SIGNATURE-----

--Signature=_Mon__27_Oct_2008_14_32_47_+1100_8_aXaC8sJ9ZqO3kf--
