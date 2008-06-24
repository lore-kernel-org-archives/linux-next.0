From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the firmware tree
Date: Tue, 24 Jun 2008 17:57:06 +1000
Message-ID: <20080624175706.21d5f02d.sfr@canb.auug.org.au>
References: <20080624165508.b9bcabbe.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__24_Jun_2008_17_57_06_+1000_+DWNlZwxQRNi.Plw"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50479 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751837AbYFXH5P (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Jun 2008 03:57:15 -0400
In-Reply-To: <20080624165508.b9bcabbe.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__24_Jun_2008_17_57_06_+1000_+DWNlZwxQRNi.Plw
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Tue, 24 Jun 2008 16:55:08 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the firmware tree got a conflict in
> drivers/net/Kconfig between commit
> 158d7abdae85e9ac43d99780c372d79c119f7626 ("tg3: Add mdio bus
> registration") from the  tree and commit
                          ^
"net"

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__24_Jun_2008_17_57_06_+1000_+DWNlZwxQRNi.Plw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhgqNIACgkQTgG2atn1QN8LzQCcDMPzAvAjbQpzJbkiF4e07pIn
kM0Anie/Al4fj7F4vxhbNog4knYTkNHg
=c9Wh
-----END PGP SIGNATURE-----

--Signature=_Tue__24_Jun_2008_17_57_06_+1000_+DWNlZwxQRNi.Plw--
