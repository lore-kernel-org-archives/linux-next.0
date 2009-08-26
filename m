From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: uwb tree build failure
Date: Wed, 26 Aug 2009 17:10:54 +1000
Message-ID: <20090826171054.631ad39c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__26_Aug_2009_17_10_54_+1000_RS.QZplJ/XqCbH.3"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41516 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756819AbZHZHLE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 26 Aug 2009 03:11:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Vrabel <david.vrabel@csr.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Wed__26_Aug_2009_17_10_54_+1000_RS.QZplJ/XqCbH.3
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next build (powerpc allyesconfig) failed like this:

drivers/uwb/reset.c: In function 'uwbd_msg_handle_reset':
drivers/uwb/reset.c:334: error: implicit declaration of function 'msleep'

Caused by commit ffefcfffee9deb283ab278b0e142807cf0c18d61 ("uwb: avoid
radio controller reset loops") from the uwb tree.

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__26_Aug_2009_17_10_54_+1000_RS.QZplJ/XqCbH.3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqU3/4ACgkQjjKRsyhoI8yydgCgiRLOOg0KL+9FY0vVQQOvBGcj
2fMAn1Ft2zmBIVmnzIHKe+ROxfhuIec5
=1+Wr
-----END PGP SIGNATURE-----

--Signature=_Wed__26_Aug_2009_17_10_54_+1000_RS.QZplJ/XqCbH.3--
