From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: scsi tree build warnings
Date: Thu, 11 Dec 2008 13:25:03 +1100
Message-ID: <20081211132503.bc5e5994.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__11_Dec_2008_13_25_03_+1100_xWuW0AeM703epxpH"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48655 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755838AbYLKCZP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Dec 2008 21:25:15 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: linux-next@vger.kernel.org, James Smart <James.Smart@Emulex.Com>

--Signature=_Thu__11_Dec_2008_13_25_03_+1100_xWuW0AeM703epxpH
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi James,

Today's linux-next build (powerpc ppc64_defconfig) produced these
warnings:

drivers/scsi/lpfc/lpfc_scsi.c: In function 'lpfc_parse_bg_err':
drivers/scsi/lpfc/lpfc_scsi.c:1319: warning: format '%llx' expects type 'lo=
ng long unsigned int', but argument 3 has type 'sector_t'
drivers/scsi/lpfc/lpfc_scsi.c: In function 'lpfc_queuecommand':
drivers/scsi/lpfc/lpfc_scsi.c:2376: warning: format '%llu' expects type 'lo=
ng long unsigned int', but argument 6 has type 'sector_t'
drivers/scsi/lpfc/lpfc_scsi.c:2382: warning: format '%llu' expects type 'lo=
ng long unsigned int', but argument 6 has type 'sector_t'
drivers/scsi/lpfc/lpfc_scsi.c:2404: warning: format '%llu' expects type 'lo=
ng long unsigned int', but argument 6 has type 'sector_t'
drivers/scsi/lpfc/lpfc_scsi.c:2409: warning: format '%llu' expects type 'lo=
ng long unsigned int', but argument 6 has type 'sector_t'
drivers/scsi/lpfc/lpfc_attr.c: In function 'lpfc_bg_guard_err_show':
drivers/scsi/lpfc/lpfc_attr.c:126: warning: format '%llu' expects type 'lon=
g long unsigned int', but argument 4 has type 'uint64_t'
drivers/scsi/lpfc/lpfc_attr.c: In function 'lpfc_bg_apptag_err_show':
drivers/scsi/lpfc/lpfc_attr.c:137: warning: format '%llu' expects type 'lon=
g long unsigned int', but argument 4 has type 'uint64_t'
drivers/scsi/lpfc/lpfc_attr.c: In function 'lpfc_bg_reftag_err_show':
drivers/scsi/lpfc/lpfc_attr.c:148: warning: format '%llu' expects type 'lon=
g long unsigned int', but argument 4 has type 'uint64_t'

Introduced by commit 46c6a5eabb0284b10c0377bd78c04edcb4163ee0 ("[SCSI] lpfc=
 8.3.0 : Add BlockGuard support (T10-DIF) code").

I guess sector_t and uint64_t should be cast to "unsigned long long"
for printing as u64 is "unsigned long" on some architectures and
"unsigned long long" on others.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__11_Dec_2008_13_25_03_+1100_xWuW0AeM703epxpH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklAef8ACgkQjjKRsyhoI8zqgwCeKigJECyZqkep0RZ0sxeAtDP2
2bUAn0KUFefhRnPXHKGcxffCfo2930kE
=a5HM
-----END PGP SIGNATURE-----

--Signature=_Thu__11_Dec_2008_13_25_03_+1100_xWuW0AeM703epxpH--
