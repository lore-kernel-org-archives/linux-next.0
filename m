From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: scsi-post-merge tree build failure
Date: Mon, 7 Sep 2009 20:06:46 +1000
Message-ID: <20090907200646.c6d6fadc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__7_Sep_2009_20_06_46_+1000_nvjNj7yDjY+qKbnn"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752776AbZIGKHD@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jayamohan Kallickal <jayamohank@serverengines.com>, Mike Christie <michaelc@cs.wisc.edu>
List-Id: linux-next.vger.kernel.org

--Signature=_Mon__7_Sep_2009_20_06_46_+1000_nvjNj7yDjY+qKbnn
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi James,

Today's linux-next build (powerpc allyesconfig) failed like this:

drivers/scsi/be2iscsi/be_main.c: In function 'hwi_write_buffer':
drivers/scsi/be2iscsi/be_main.c:1481: error: implicit declaration of functi=
on 'virt_to_bus'

Caused by commit 9316dc3deb9675c674f96a0c6fb74ccc6c497fae ("[SCSI]
be2iscsi: add 10Gbps iSCSI - BladeEngine 2 driver") which I have reverted
for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__7_Sep_2009_20_06_46_+1000_nvjNj7yDjY+qKbnn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkqk2zYACgkQjjKRsyhoI8yGSwCeIBsZoAPHTEeOvWoSGiUV90r7
dRMAoLAqqaXfLjf3LSWrWO7ElYqIjNOq
=0sp8
-----END PGP SIGNATURE-----

--Signature=_Mon__7_Sep_2009_20_06_46_+1000_nvjNj7yDjY+qKbnn--
