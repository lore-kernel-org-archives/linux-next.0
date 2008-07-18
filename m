From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the semaphore-removal tree
Date: Fri, 18 Jul 2008 16:44:43 +1000
Message-ID: <20080718164443.dc7f6117.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__18_Jul_2008_16_44_43_+1000_qgrzWfgOqx8+3cdk"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:54949 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752804AbYGRGo7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Jul 2008 02:44:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matthew Wilcox <matthew@wil.cx>
Cc: linux-next@vger.kernel.org, James Bottomley <James.Bottomley@HansenPartnership.com>

--Signature=_Fri__18_Jul_2008_16_44_43_+1000_qgrzWfgOqx8+3cdk
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Willy,

Today's linux-next merge of the semaphore-removal tree got conflicts in
drivers/scsi/qla2xxx/qla_attr.c, drivers/scsi/qla2xxx/qla_mid.c and
drivers/scsi/qla2xxx/qla_os.c between various commits from Linus' tree
and the scsi tree and commits 5469811b8b0085c0f19fd3aaad29cde59761e243
("qla2xxx: Turn vport_sem into vport_mutex") and
e2c6f1aa2f67c585ffcb879d32ff3e74b53faf25 ("Convert qla_os to use mutex
instead of semaphore") from the semaphore-removal tree.

The scsi tree did the conversion from semaphores in this code a long time
ago (and that conversion is now done in Linus' tree), so I just reverted
the latter two commits.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__18_Jul_2008_16_44_43_+1000_qgrzWfgOqx8+3cdk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiAO9sACgkQjjKRsyhoI8xLiQCfQb60yKAKDSZTa517CK9wV6DH
pNQAoKjOwfGbLuJSFXGceIqalDLLDLa/
=IYSF
-----END PGP SIGNATURE-----

--Signature=_Fri__18_Jul_2008_16_44_43_+1000_qgrzWfgOqx8+3cdk--
