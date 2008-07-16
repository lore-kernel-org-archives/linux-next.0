From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the acpi tree
Date: Wed, 16 Jul 2008 15:33:16 +1000
Message-ID: <20080716153316.6a0cd6df.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__16_Jul_2008_15_33_16_+1000_ZEFxynaV8fXbcpy2"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46863 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751776AbYGPFdY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Jul 2008 01:33:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>

--Signature=_Wed__16_Jul_2008_15_33_16_+1000_ZEFxynaV8fXbcpy2
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Len,

Today's linux-next merge of the acpi tree got conflicts in
arch/x86/kernel/acpi/sleep.c between commits
3bf2e77453a87c22eb57ed4926760ac131c84459 ("x86, suspend, acpi: enter Big
Real Mode") and 065cb3dfe24978651caedfa54da585388ad15dde ("x86, suspend,
acpi: correct and add comments about Big Real Mode") from Linus' tree and
commit 60d40a50886415040888bde5133ccfeab40d945f ("x86 ACPI: normalize
segment descriptor register on resume") from the acpi tree (which also
appears to be in Linus' tree).

I used the version from Linus' tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__16_Jul_2008_15_33_16_+1000_ZEFxynaV8fXbcpy2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh9iBwACgkQjjKRsyhoI8xHwwCfWbP1Jg5cSdejjGupgPE8mv7I
E6AAn2QDrWxlfbYmJZ14kbJVzLVYGkw7
=dYGO
-----END PGP SIGNATURE-----

--Signature=_Wed__16_Jul_2008_15_33_16_+1000_ZEFxynaV8fXbcpy2--
