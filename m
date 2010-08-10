From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the trivial tree with Linus' tree
Date: Tue, 10 Aug 2010 12:11:17 +1000
Message-ID: <20100810121117.8710aa26.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__10_Aug_2010_12_11_17_+1000_u=CHSRkJrpHDAeg_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36636 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751235Ab0HJCLZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 9 Aug 2010 22:11:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Bolle <pebolle@tiscali.nl>, Christoph Egger <siccegge@cs.fau.de>

--Signature=_Tue__10_Aug_2010_12_11_17_+1000_u=CHSRkJrpHDAeg_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

Today's linux-next merge of the trivial tree got a conflict in
arch/arm/mach-omap1/board-nokia770.c between commit
ab6f7751905e5cf713d081dbb3b97b8f6909ab34 ("Removing dead OMAP_DSP") from
Linus' tree and commit 426d31071ac476ea62c62656b242930c17b58c00 ("fix
printk typo 'faild'") from the trivial tree.

The former removes the code that the latter is updating.  So I just
removed it.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__10_Aug_2010_12_11_17_+1000_u=CHSRkJrpHDAeg_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMYLVFAAoJEDMEi1NhKgbshuAH/2aLvvsnn1ub2QA9IgT1TUwb
hIVbGzSQAzWNRhH3tI29loWd0p+65m9OZaImmBWblBzwhFGbRjpMzY45w7GCMpkW
9tnI2kHwypkGeV83h5Q6FDYXq1jYt6KruLjAa3q0e9qoIJA/HZbBt7UzE+H/8VG5
VtlPUZ+nL/sgv1agWC+ovOf+D4KKgCNr3XaerqNzobtjRYGrKHkENI7g+p/TBkHy
OC0FmrvDVI6ao4ist9hXYsCNCAor/N2lFdghIxSTkWFYK73iDNQamRVJdCr0NHlt
+NiGEl6QeE46PahhpcnZfQLRJgtAGa9udya0m0ftQW4X9RDN0b1HFk3n9l8rtAA=
=cGsp
-----END PGP SIGNATURE-----

--Signature=_Tue__10_Aug_2010_12_11_17_+1000_u=CHSRkJrpHDAeg_--
