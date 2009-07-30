From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: scsi-rc-fixes tree build failure
Date: Thu, 30 Jul 2009 18:13:45 +1000
Message-ID: <20090730181345.cec774b2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__30_Jul_2009_18_13_45_+1000_7xdrhcSS10AOXcO7"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751290AbZG3INy@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tom Peng <tom_peng@usish.com>, Jack Wang <jack_wang@usish.com>, Lindar Liu <lindar_liu@usish.com>, Kevin Ao <aoqingyun@usish.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__30_Jul_2009_18_13_45_+1000_7xdrhcSS10AOXcO7
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi James,

Today's linux-next build (powerpc allyesconfig) failed like this:

drivers/scsi/libsas/sas_expander.c: In function 'sas_find_bcast_dev':
drivers/scsi/libsas/sas_expander.c:1701: error: 'FALSE' undeclared (first u=
se in this function)
drivers/scsi/libsas/sas_expander.c: In function 'sas_discover_new':
drivers/scsi/libsas/sas_expander.c:1809: error: 'FALSE' undeclared (first u=
se in this function)
drivers/scsi/libsas/sas_expander.c:1824: error: 'TRUE' undeclared (first us=
e in this function)
drivers/scsi/libsas/sas_expander.c: In function 'sas_rediscover':
drivers/scsi/libsas/sas_expander.c:1903: error: 'TRUE' undeclared (first us=
e in this function)
drivers/scsi/libsas/sas_expander.c:1918: error: 'FALSE' undeclared (first u=
se in this function)
drivers/scsi/libsas/sas_expander.c: In function 'sas_ex_revalidate_domain':
drivers/scsi/libsas/sas_expander.c:1951: error: 'TRUE' undeclared (first us=
e in this function)

Caused by commit 4c70d933a41e1d712f3db90d2a41141730383d5a ("[SCSI]
libsas: fix wide port hotplug issues").  Presumably a missing include
file.

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__30_Jul_2009_18_13_45_+1000_7xdrhcSS10AOXcO7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpxVjkACgkQjjKRsyhoI8wDKwCdH5T38RObD3P3cboNh3h72mfB
TNEAnAiwGRx3H9rLmHj3eDYEShS3tBvj
=NCR+
-----END PGP SIGNATURE-----

--Signature=_Thu__30_Jul_2009_18_13_45_+1000_7xdrhcSS10AOXcO7--
