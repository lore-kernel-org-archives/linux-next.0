From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: s390 tree fetch failure
Date: Tue, 3 Feb 2009 09:09:27 +1100
Message-ID: <20090203090927.01e28d75.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__3_Feb_2009_09_09_27_+1100_N/Nqcb_t33RdTe8p"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56497 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752649AbZBBWJe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Feb 2009 17:09:34 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__3_Feb_2009_09_09_27_+1100_N/Nqcb_t33RdTe8p
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Martin, Heiko,

Today's linux-next fetch of the s390 tree failed like this:

fatal: Unable to look up git390.osdl.marist.edu (port 9418) (Name or servic=
e not known)

I will use what I fetched yesterday.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__3_Feb_2009_09_09_27_+1100_N/Nqcb_t33RdTe8p
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmHbxcACgkQjjKRsyhoI8xvgwCfUBica1n9Teqc39DOJ0QY+WG6
VikAnRuknXRalMHRCh4/+36u/oLRv/iV
=x1Al
-----END PGP SIGNATURE-----

--Signature=_Tue__3_Feb_2009_09_09_27_+1100_N/Nqcb_t33RdTe8p--
