From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of net tree
Date: Tue, 17 Jun 2008 16:53:10 +1000
Message-ID: <20080617165310.90439415.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__17_Jun_2008_16_53_10_+1000_2pc6cz/AWEy/+ppT"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36677 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751527AbYFQGxR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Jun 2008 02:53:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__17_Jun_2008_16_53_10_+1000_2pc6cz/AWEy/+ppT
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next got a conflict in net/sctp/protocol.c between commit
80896a3584bbff9ff9ad4dde735517c4de68d736 ("sctp: Correctly cleanup procfs
entries upon failure") from the net-current tree and commit
20c2c1fd6c842caf70dcb1d94b9d58861949fd3d ("sctp: add sctp/remaddr table
to complete RFC remote address table OID") from the net tree.

(I guess from your other email that you already know this and it will be
gone tomorrow.)

I did the fixup from your current net tree (which I had not fetched for
today's linux-next).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__17_Jun_2008_16_53_10_+1000_2pc6cz/AWEy/+ppT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhXX1YACgkQTgG2atn1QN/GUQCfR+AOsFYuyJvRlAcJDlzm3jL2
7TcAmQHWUQN7OCiPrwZyjSe7G+WOZrlQ
=9nPn
-----END PGP SIGNATURE-----

--Signature=_Tue__17_Jun_2008_16_53_10_+1000_2pc6cz/AWEy/+ppT--
