From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the acpi tree
Date: Mon, 16 Jun 2008 14:03:33 +1000
Message-ID: <20080616140333.df7715a8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__16_Jun_2008_14_03_33_+1000_L=qxYR7Do28rzI.r"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34044 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750711AbYFPEDn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Jun 2008 00:03:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__16_Jun_2008_14_03_33_+1000_L=qxYR7Do28rzI.r
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Len,

Today's linux-next merge of the acpi tree got a trivial conflict in
drivers/acpi/sleep/main.c between commit
d8f3de0d2412bb91639cfefc5b3c79dbf3812212 ("Suspend-related patches for
2.6.27") from the pci tree and commit
4fe0a2f25ed36949330dbda0154a4a701f310462 ("ACPICA: Lindent") from the
acpi tree.

The latter was just updating some code that the former removed.

A general comment on Lindent: it is worth checking the output.  Both the
conflicts were because it removed the space from in front of a '?'
operator - which I consider fairly bogus.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__16_Jun_2008_14_03_33_+1000_L=qxYR7Do28rzI.r
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhV5hUACgkQTgG2atn1QN+BmQCgiCRxoUe1dQ21kJPr3ZRRyq0e
v8wAn3FhfTpAyzxurJi0xn8nsCcoF6AB
=hx0/
-----END PGP SIGNATURE-----

--Signature=_Mon__16_Jun_2008_14_03_33_+1000_L=qxYR7Do28rzI.r--
