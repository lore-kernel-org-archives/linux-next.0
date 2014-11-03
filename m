From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the scsi tree
Date: Mon, 3 Nov 2014 13:52:29 +1100
Message-ID: <20141103135229.7916c23c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/M4_1x4wZU/hXYXp.FcDLthg"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42119 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751062AbaKCCwl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 2 Nov 2014 21:52:41 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hannes Reinecke <hare@suse.de>

--Sig_/M4_1x4wZU/hXYXp.FcDLthg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi James,

After merging the scsi tree, today's linux-next build (powerpc ppc64_defcon=
fig)
failed like this:

drivers/scsi/scsi_lib.c: In function 'scsi_io_completion':
drivers/scsi/scsi_lib.c:1048:5: error: implicit declaration of function 'SC=
SI_LOG_LEVEL' [-Werror=3Dimplicit-function-declaration]
     level =3D SCSI_LOG_LEVEL(SCSI_LOG_MLCOMPLETE_SHIFT,
     ^

Caused by commit b6568e80be82 ("scsi: simplify
scsi_log_(send|completion)").  SCSI_LOG_LEVEL is defined in
drivers/scsi/scsi_logging.h, but only if CONFIG_SCSI_LOGGING is defined.

I have used the version of the scsi tree from next-20141031 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/M4_1x4wZU/hXYXp.FcDLthg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUVu30AAoJEMDTa8Ir7ZwVKrIP/R8n9XP/nIJ19o3D7YqPAXeO
QD9oS5QpN0uFX6bcgm4Kz26abSm9/YiJBx/1mD6TdiYSqI1RP4JzGFFEzu0ttGmt
wpz+m5hi7Dnwb1v5PiL+UHiWpsFq1JsACXLQ3nepq6dwBrgnc9VUML7oXOiGEPac
91o2lCSyNfxzB2H4AmOZ99GcSnXS+LSIebhKgT8Cga/Aibld+hHTqQY0pQ4q/h0x
vbBldHIBF66HVXYUe6rW1kWRY6NNnE5yVwC9zyiH8LVBcIMm9JT4y2tsPOvKmW7z
hFkNqBZvpcCQ1pAskRe5v9S7WlhwIaQH9mXEiOh++mCCTu7oUMBmb5FO+JS31SIN
jTBnW58Wr2kt3JHn0JEuapB8E8gbaHPRlLrUwmLlu6hDXUrDD5LjsoQLyUAnOS4n
GuE0lNr1kwUGplht80HlgWf2dS4xZoElp0DNYNBhy0OuIRhusSN7t54ZeF0TCiBR
s/POv8HTgqi+rtd1b9pV/P2qGJg9c6eYu4s1zNXWqGbKyxZRFDeGPGvJErvNab7u
ytsIlp+25kpIXZrcqekj1Gx/vY7RfwzfqSy22Ry6VPK6V9ijdmqb8cZMhrNgQ0fn
qskOnGccIv4rnGViMWGdkmeEshsPgsOK6rvBDjYD0Ihi/JIGn0vi+653THLkfk+L
vgAA2chtyeTMo5k0zwqD
=3k63
-----END PGP SIGNATURE-----

--Sig_/M4_1x4wZU/hXYXp.FcDLthg--
