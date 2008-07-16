From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree
Date: Wed, 16 Jul 2008 16:56:45 +1000
Message-ID: <20080716165645.32a9f05e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__16_Jul_2008_16_56_45_+1000_9jeIRu8SOzMkYdjR"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49054 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751197AbYGPG4y (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Jul 2008 02:56:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Laurent Pinchart <laurentp@cse-semaphore.com>, Jeff Garzik <jgarzik@redhat.com>, Kumar Gala <galak@kernel.crashing.org>

--Signature=_Wed__16_Jul_2008_16_56_45_+1000_9jeIRu8SOzMkYdjR
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the net tree got a conflict in
Documentation/powerpc/booting-without-of.txt between commit
d0fc2eaaf4c56a95f5ed29b6bfb609e19714fc16 ("powerpc/fsl: Refactor device
bindings") from the powerpc tree and commit
a5edeccb1a8432ae5d9fb9bccea5a4b64c565017 ("net: OpenFirmware GPIO based
MDIO bitbang driver") from the net tree.

I just added the new section from the latter commit in as section 'g'.
It may not even belong in this file any more, but I don't know.  Kumar?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__16_Jul_2008_16_56_45_+1000_9jeIRu8SOzMkYdjR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh9m60ACgkQjjKRsyhoI8wG+gCgkgAxA/AT9yl2ay0ltMGSyaMz
J+0An06VzVqa6x6YJkLjIrZF7GER7pl8
=uCaD
-----END PGP SIGNATURE-----

--Signature=_Wed__16_Jul_2008_16_56_45_+1000_9jeIRu8SOzMkYdjR--
