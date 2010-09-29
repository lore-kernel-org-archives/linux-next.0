From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the final tree
Date: Wed, 29 Sep 2010 14:02:38 +1000
Message-ID: <20100929140238.c987caac.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__29_Sep_2010_14_02_38_+1000_.AWul/T4GmqS2=Ge"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55079 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750728Ab0I2ECs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Sep 2010 00:02:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pavel Emelyanov <xemul@parallels.com>

--Signature=_Wed__29_Sep_2010_14_02_38_+1000_.AWul/T4GmqS2=Ge
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the final tree, today's linux-next build (powerpc
ppc44x_defconfig) produced tis warning:

WARNING: net/sunrpc/sunrpc.o(.init.text+0x110): Section mismatch in referen=
ce from the function init_sunrpc() to the function .exit.text:rpcauth_remov=
e_module()
The function __init init_sunrpc() references
a function __exit rpcauth_remove_module().
This is often seen when error handling in the init function
uses functionality in the exit path.
The fix is often to remove the __exit annotation of
rpcauth_remove_module() so it may be used outside an exit section.

Probably caused by commit 2f72c9b73730c335381b13e2bd221abe1acea394
("sunrpc: The per-net skeleton").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__29_Sep_2010_14_02_38_+1000_.AWul/T4GmqS2=Ge
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMorpeAAoJEDMEi1NhKgbswLoH+QGbLzlC4FGeaOdTMO9+qSls
LF7+IUa3wjiySUOKv3G9ACh5K/KqTwt/P62HlP80heqC8Jy1cQyiBow6IYjQPxz7
7IIvwe4oRpQVD4oqQEl+Gi5V8E3N1rbyBXoTnbfthMomaeAvVb6M5FqtosBn/bp0
UVFYI5a/OWfVPIAKN9Q+XnI27GTsHhUlzVNKys5Wp4LV6LNxbnPCW1eX63PYnnw/
rwA/brnvuuBGVL/y91J1BiGjR9NYULwC3DNieaH2rh0u4NYNpr+Nxh2FFE/oJUWi
/PXMuWVH6lO5eHoPssdq4tzlraS4gvI6agGm1jf6Oo99ttSKViQlSjcr+XT707o=
=GGm+
-----END PGP SIGNATURE-----

--Signature=_Wed__29_Sep_2010_14_02_38_+1000_.AWul/T4GmqS2=Ge--
