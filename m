From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: galak merge conflict
Date: Thu, 5 Jun 2008 13:47:48 +1000
Message-ID: <20080605134748.307bee3d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__5_Jun_2008_13_47_48_+1000_GDXIQNfOTnOwTdN_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54122 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751649AbYFEDr6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Jun 2008 23:47:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kumar Gala <galak@kernel.crashing.org>
Cc: linux-next@vger.kernel.org, paulus@samba.org, Laurent Pinchart <laurentp@cse-semaphore.com>

--Signature=_Thu__5_Jun_2008_13_47_48_+1000_GDXIQNfOTnOwTdN_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Kumar,

Today's linux-next merge of the galak tree got a conflict in
Documentation/powerpc/booting-without-of.txt between commit
a5edeccb1a8432ae5d9fb9bccea5a4b64c565017 ("net: OpenFirmware GPIO based
MDIO bitbang driver") from the net (drivers) tree and commit
aee1dc73b519227084d77b0b2fc972b68b4153d8 ("[POWERPC] Update
booting-without-of for Freescale PCIe MSI") from the galak tree.

I did the (obvious) fixup of relabelling the sections you have added to
be after the one added in the net tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__5_Jun_2008_13_47_48_+1000_GDXIQNfOTnOwTdN_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhHYeQACgkQTgG2atn1QN9qKgCff6PLz3VdvTU22Iy6uzwoZG4o
xdcAn0l7p/NZR1RByESvwaQf6j7gRkUG
=B9CK
-----END PGP SIGNATURE-----

--Signature=_Thu__5_Jun_2008_13_47_48_+1000_GDXIQNfOTnOwTdN_--
