From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tests tree
Date: Tue, 17 Jun 2008 16:22:56 +1000
Message-ID: <20080617162256.4a17529b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__17_Jun_2008_16_22_56_+1000_A/9ueS=KnGP631Hg"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53417 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751987AbYFQGXJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Jun 2008 02:23:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ananth N Mavinakayanahalli <ananth@in.ibm.com>
Cc: linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>

--Signature=_Tue__17_Jun_2008_16_22_56_+1000_A/9ueS=KnGP631Hg
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ananth,

Today's linux-next merge of the tests tree got a new conflict in
lib/Kconfig.debug between commit 1462a200057df08be12f3719e1f37adbd2c6e4d0
("Revert "prohibit rcutorture from being compiled into the kernel"") from
the sched tree and commit db00d6090740863199393461c8332812986ce4ad ("Move
rcutorture to tests/").

It is trivial and I did the obvious fixup and will carry that.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__17_Jun_2008_16_22_56_+1000_A/9ueS=KnGP631Hg
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhXWEAACgkQTgG2atn1QN+I+wCfeRA+ue48s2GTJPLN/4kA/ONa
r64AnjSblAhgrMjWm4Wue3lssnlmGmS+
=RDYU
-----END PGP SIGNATURE-----

--Signature=_Tue__17_Jun_2008_16_22_56_+1000_A/9ueS=KnGP631Hg--
