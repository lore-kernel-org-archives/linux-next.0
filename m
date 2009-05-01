From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: cifs tree build warning
Date: Fri, 1 May 2009 13:47:00 +1000
Message-ID: <20090501134700.148955dd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__1_May_2009_13_47_00_+1000_Lnjir5vYNswE9eXl"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49756 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754208AbZEADrE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 30 Apr 2009 23:47:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steve French <smfrench@gmail.com>, linux-cifs-client@lists.samba.org
Cc: linux-next@vger.kernel.org

--Signature=_Fri__1_May_2009_13_47_00_+1000_Lnjir5vYNswE9eXl
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Steve,

Today's linux-next build (x86_64 allmodconfig) produced this warning:

fs/cifs/connect.c:2609: warning: 'CIFSNTLMSSPNegotiateSessSetup' defined bu=
t not used
fs/cifs/connect.c:2943: warning: 'CIFSNTLMSSPAuthSessSetup' defined but not=
 used

Introduced by commit 20418acd6874792359b42c12d159f42f17593f34 ("[CIFS]
Remove older session setup implementation") which removed the last users
of these functions.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__1_May_2009_13_47_00_+1000_Lnjir5vYNswE9eXl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkn6cLQACgkQjjKRsyhoI8xDuACgpKsRePMEg0FYNesLplPdQrZ/
/u4An0qng/p9G9nAWa27U6faDwfhY4Em
=5Vqh
-----END PGP SIGNATURE-----

--Signature=_Fri__1_May_2009_13_47_00_+1000_Lnjir5vYNswE9eXl--
