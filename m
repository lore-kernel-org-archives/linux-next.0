From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rr merge conflicts
Date: Wed, 11 Jun 2008 16:13:45 +1000
Message-ID: <20080611161345.e73c3889.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__11_Jun_2008_16_13_45_+1000_jwYX+op_W_+hHRMD"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60975 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751912AbYFKGNw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Jun 2008 02:13:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__11_Jun_2008_16_13_45_+1000_jwYX+op_W_+hHRMD
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the rr tree got conflicts in
drivers/net/virtio_net.c caused by some of the patches in the rr also
series being in the net-current tree.  I just used the rr tree version of
the file.

These conflicts will be fixed when the net-current tree is merged by
Linus and you resync your patch series.  Until then I can carry them.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__11_Jun_2008_16_13_45_+1000_jwYX+op_W_+hHRMD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhPbRkACgkQTgG2atn1QN9uTwCgh5e2OfpOQrmcmRI0U7Axrdil
FtoAnRkLQWLMqfFS1IcClm+AjCVZqYsG
=Kof8
-----END PGP SIGNATURE-----

--Signature=_Wed__11_Jun_2008_16_13_45_+1000_jwYX+op_W_+hHRMD--
