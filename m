From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the hdlc tree
Date: Fri, 4 Jul 2008 18:56:45 +1000
Message-ID: <20080704185645.d96ef6dd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__4_Jul_2008_18_56_45_+1000_yirHjGO7totcyUo4"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44246 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750874AbYGDI47 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 4 Jul 2008 04:56:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Krzysztof Halasa <khc@pm.waw.pl>
Cc: linux-next@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>

--Signature=_Fri__4_Jul_2008_18_56_45_+1000_yirHjGO7totcyUo4
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Today's linux-next merge of the hdlc tree got a conflict in
drivers/net/wan/cosa.c between commit
0911810755fc9f15659cc3cb43912633b90027a0 ("cosa: cdev lock_kernel()
pushdown") from the blk-removal tree and commit
d2e510df1fe342b6df51c1af036ca28a60f6fc55 ("WAN: Port COSA driver to
generic HDLC") from the hdlc tree.

Just a simple overlapping change. I can carry the fixup.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__4_Jul_2008_18_56_45_+1000_yirHjGO7totcyUo4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkht5c0ACgkQjjKRsyhoI8xLvQCeOZs0Afa4IAqr8B3f1OXlEkyB
d38An1YlniJ1RcFQGVmmrHKgw90Cgly9
=cYoc
-----END PGP SIGNATURE-----

--Signature=_Fri__4_Jul_2008_18_56_45_+1000_yirHjGO7totcyUo4--
