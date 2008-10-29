From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the hdlc tree
Date: Wed, 29 Oct 2008 17:52:31 +1100
Message-ID: <20081029175231.116cca1d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__29_Oct_2008_17_52_31_+1100_AJsLhAc=xcQ.yyW/"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54231 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751357AbYJ2Gwm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Oct 2008 02:52:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Krzysztof Halasa <khc@pm.waw.pl>
Cc: linux-next@vger.kernel.org, Jeff Garzik <jeff@garzik.org>, "David S. Miller" <davem@davemloft.net>

--Signature=_Wed__29_Oct_2008_17_52_31_+1100_AJsLhAc=xcQ.yyW/
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Today's linux-next merge of the hdlc tree got a conflict in
drivers/net/wan/syncppp.c between commit
404b12c10d2f4d77649a193af2ec69f77b852926 ("drivers/net/wan/syncppp: Fix
unused-var warnings") from the net-current tree and commit
8a8c8f08abe7d3fd82c2853d0e1f391f8bfc96db ("WAN: syncppp.c is no longer
used by any kernel code. Remove it.") from the hdlc tree.

The former modifies code while the latter removes the whole driver.  I
just removed it.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__29_Oct_2008_17_52_31_+1100_AJsLhAc=xcQ.yyW/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkICC8ACgkQjjKRsyhoI8xwGgCgi1pQUyFIqioRMW1qsOQmiX5Q
/GQAoL9FPTzvZr3EzXNC1BwaP91xtv9+
=Q66+
-----END PGP SIGNATURE-----

--Signature=_Wed__29_Oct_2008_17_52_31_+1100_AJsLhAc=xcQ.yyW/--
