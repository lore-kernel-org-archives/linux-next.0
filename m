From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: galak merge conflict
Date: Fri, 6 Jun 2008 15:05:10 +1000
Message-ID: <20080606150510.fbd11868.sfr@canb.auug.org.au>
References: <20080605134748.307bee3d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__6_Jun_2008_15_05_10_+1000_9MDq._o5l04s7NH4"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38762 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754654AbYFFFFT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Jun 2008 01:05:19 -0400
In-Reply-To: <20080605134748.307bee3d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, paulus@samba.org, Laurent Pinchart <laurentp@cse-semaphore.com>, Kumar Gala <galak@kernel.crashing.org>

--Signature=_Fri__6_Jun_2008_15_05_10_+1000_9MDq._o5l04s7NH4
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Thu, 5 Jun 2008 13:47:48 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the galak tree got a conflict in
> Documentation/powerpc/booting-without-of.txt between commit
> a5edeccb1a8432ae5d9fb9bccea5a4b64c565017 ("net: OpenFirmware GPIO based
> MDIO bitbang driver") from the net (drivers) tree and commit
> aee1dc73b519227084d77b0b2fc972b68b4153d8 ("[POWERPC] Update
> booting-without-of for Freescale PCIe MSI") from the galak tree.
>=20
> I did the (obvious) fixup of relabelling the sections you have added to
> be after the one added in the net tree.

This conflict is now between the net tree and the powerpc tree (since
Paul pulled Kumar's tree into his).  I fixed it up a little differently
(I put the MDIO on GPIOs section last as that required less typing).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__6_Jun_2008_15_05_10_+1000_9MDq._o5l04s7NH4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhIxYYACgkQTgG2atn1QN/ffwCdHqAwGIKvcX9gqL6wKOIjCl25
/AcAoJYILIIqoD4eBJ52y0Ojb4GONrYW
=enjb
-----END PGP SIGNATURE-----

--Signature=_Fri__6_Jun_2008_15_05_10_+1000_9MDq._o5l04s7NH4--
