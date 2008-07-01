From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree
Date: Wed, 2 Jul 2008 00:07:12 +1000
Message-ID: <20080702000712.3698a7f9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__2_Jul_2008_00_07_12_+1000_F=SaPZhsYld8/pjw"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58933 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758620AbYGAOHP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Jul 2008 10:07:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Adrian Bunk <bunk@kernel.org>

--Signature=_Wed__2_Jul_2008_00_07_12_+1000_F=SaPZhsYld8/pjw
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi ,

Today's linux-next merge of the ttydev tree got a conflict in
drivers/net/wireless/strip.c between commit
94d9842403f770239a656586442454b7a8f2df29 ("remove the strip driver") from
the net tree and commit 7636d4eb65deca18568e3ec4bfa65b85078042ce
("01-ldisc-ref") from the ttydev tree.

The former removed the file.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__2_Jul_2008_00_07_12_+1000_F=SaPZhsYld8/pjw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhqOhAACgkQjjKRsyhoI8y5iQCgjkoFl6U6hO1549TY3xB3KJ2s
uYsAn0sMKRvKj5xPVdKN7jRUE9v2j9uZ
=UKIK
-----END PGP SIGNATURE-----

--Signature=_Wed__2_Jul_2008_00_07_12_+1000_F=SaPZhsYld8/pjw--
