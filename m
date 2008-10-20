From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the acpi tree
Date: Mon, 20 Oct 2008 15:45:52 +1100
Message-ID: <20081020154552.feb7c962.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__20_Oct_2008_15_45_52_+1100_1EW7DfvQ9f=3Q82X"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34416 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751735AbYJTEqG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Oct 2008 00:46:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, Bjorn Helgaas <bjorn.helgaas@hp.com>

--Signature=_Mon__20_Oct_2008_15_45_52_+1100_1EW7DfvQ9f=3Q82X
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Len,

Today's linux-next merge of the acpi tree got a conflict in
drivers/pnp/quirks.c between commit
2e532d68a2b3e2aa6b19731501222069735c741c ("{pci,pnp} quirks.c: don't use
deprecated print_fn_descriptor_symbol()") from Linus' tree and commit
2f53432c2aedbe79020e44525eb069d9138a01dd ("PNP: convert to using pnp_dbg
()") from the acpi tree.

I used the acpi tree version (since it was just a follow on from Linus'
version).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__20_Oct_2008_15_45_52_+1100_1EW7DfvQ9f=3Q82X
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj8DQAACgkQjjKRsyhoI8zYhACdHJWRfqx+DGpCisdBgRH33Mev
I5wAoIgzSWV8T4vzlI/4AxDv25+MDbrN
=ZphQ
-----END PGP SIGNATURE-----

--Signature=_Mon__20_Oct_2008_15_45_52_+1100_1EW7DfvQ9f=3Q82X--
