From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the driver-core.current tree
Date: Mon, 20 Oct 2008 11:48:42 +1100
Message-ID: <20081020114842.e6cd6f90.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__20_Oct_2008_11_48_42_+1100_NYlcxDCDcSW7Vc6c"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51119 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751172AbYJTAs6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 19 Oct 2008 20:48:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__20_Oct_2008_11_48_42_+1100_NYlcxDCDcSW7Vc6c
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the driver-core.current tree got a conflict
in Documentation/sysctl/kernel.txt between commit
061b1bd394ca8628b7c24eb4658ba3535da4249a ("Staging: add TAINT_CRAP for
all drivers/staging code") from Linus' tree and commit
ac7b643ad9c570efa0b5cbc9af5581db8c2faf64 ("Document kernel taint flags
properly") from the driver-core.current tree.

So the Documentation patch in the former commit was not right (64 v 1024
for TAINT_CRAP) ...

I took the latter.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__20_Oct_2008_11_48_42_+1100_NYlcxDCDcSW7Vc6c
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj71WoACgkQjjKRsyhoI8wC7QCfZVZbKHmVIRSmBY6k+ogBLOfu
zxgAnRO84QsswBF59jP2Un330dtAPSXI
=J1z9
-----END PGP SIGNATURE-----

--Signature=_Mon__20_Oct_2008_11_48_42_+1100_NYlcxDCDcSW7Vc6c--
