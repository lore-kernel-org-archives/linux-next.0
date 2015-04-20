From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the s390 tree with Linus' tree
Date: Mon, 20 Apr 2015 12:02:37 +1000
Message-ID: <20150420120237.2237ab8e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//P8gk+Bh_OXqyzTye0TEyAn"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34322 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751429AbbDTCCp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 19 Apr 2015 22:02:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, Sebastian Ott <sebott@linux.vnet.ibm.com>

--Sig_//P8gk+Bh_OXqyzTye0TEyAn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the s390 tree got a conflict in
arch/s390/pci/pci_debug.c between commit c2f0b61d8969 ("s390: remove
use of seq_printf return value") from Linus' tree and commit
80ed156a3d12 ("s390/pci: add locking for fmb access") from the s390
tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/s390/pci/pci_debug.c
index c22d4402ae45,3fc9b4d90b59..000000000000
--- a/arch/s390/pci/pci_debug.c
+++ b/arch/s390/pci/pci_debug.c
@@@ -45,9 -58,11 +58,12 @@@ static int pci_perf_show(struct seq_fil
 =20
  	if (!zdev)
  		return 0;
+=20
+ 	mutex_lock(&zdev->lock);
  	if (!zdev->fmb) {
+ 		mutex_unlock(&zdev->lock);
 -		return seq_printf(m, "FMB statistics disabled\n");
 +		seq_puts(m, "FMB statistics disabled\n");
 +		return 0;
  	}
 =20
  	/* header */

--Sig_//P8gk+Bh_OXqyzTye0TEyAn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVNF5BAAoJEMDTa8Ir7ZwViNcP/R0Qt0S3NblTylfwWXangjq1
8o9wHblzb6EBkMi6WAHF+OZo+9OGc1Tw+y3B89wXt+HlmsLa63Kkmt8Od/In0cjS
58KXDnKsvCe0IcvXmkQg2sy8ILH7zWWWk7TpxONyPV8/+GbOmyHoOhiGjzQ5D1wP
SHn/B8GrYlObJrYiIfraUyhvwtYEZduUVX+UCheq+sTxyet7c6BrmkJvxEFfDbAP
XeXqoMuwCm95Op7GzxoNP1dfbphCh4SlAA+ear4yT3fymDGsyLlRGwpc9JbZAlnr
Aqo3nllYw7KpA1vCxyCQ/jOt8z1VVMVf/rmZPmbBAycz6FtpHZH/6kdNioJpWvJi
xbrLf6V9Xvie/TVW2witWND1kcRsKzIrA4theoo2AYZgSPyGDufLdshTPT+sEyXX
u8uEVsmVFzMjFljd6qGV+ubejsgOHwqip/oywlT5j1kGS5djnZuzJybniBJDqVRz
KpxWBzkx+L4c5ZS6gt6DghXtpPemt0oz81sjIkGr6iZJrUM69RQ0xUSUL0NBKadq
xRzo4g6VbmP9c1EUKJWH6wVPbGoEy/Aw5ItHRaop8tNFPVK0fL2j+mLXAMkj+Sfw
ZDpwc/nGk+1riJYhCfvyXgFj4dQtLih3/SqdV547Fl6z63UbCR2TS2WDJde5pGL7
SfDgq2JR0Jv28S0d2z3y
=FkYF
-----END PGP SIGNATURE-----

--Sig_//P8gk+Bh_OXqyzTye0TEyAn--
