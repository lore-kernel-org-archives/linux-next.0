From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the userns tree with the tip tree
Date: Thu, 4 Jun 2015 20:49:34 +1000
Message-ID: <20150604204934.652690f9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/lQ2/0VQLZv3+d+=sGlskjTK"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Eric W. Biederman" <ebiederm@xmission.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Jones <pjones@redhat.com>, Matt Fleming <matt.fleming@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/lQ2/0VQLZv3+d+=sGlskjTK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Eric,

Today's linux-next merge of the userns tree got a conflict in
drivers/firmware/efi/efi.c between commit 0bb549052d33 ("efi: Add esrt
support") from the tip tree and commit c2f0fd2c640e ("sysfs: Create
mountpoints with sysfs_create_mount_point") from the userns tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/firmware/efi/efi.c
index ca617f40574a,e14363d12690..000000000000
--- a/drivers/firmware/efi/efi.c
+++ b/drivers/firmware/efi/efi.c
@@@ -65,8 -64,7 +65,7 @@@ static int __init parse_efi_cmdline(cha
  }
  early_param("efi", parse_efi_cmdline);
 =20
 -static struct kobject *efi_kobj;
 +struct kobject *efi_kobj;
- static struct kobject *efivars_kobj;
 =20
  /*
   * Let's not leave out systab information that snuck into

--Sig_/lQ2/0VQLZv3+d+=sGlskjTK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVcC1DAAoJEMDTa8Ir7ZwVGWEP/idJHtL/d7HgbQ780nLYuPTS
NVOO2bfPnz1kCyABDSQ76Wys0oFzYCx2Ks5dMCbhIwnWuNgbtSzgyZA8cgcwCt03
Knz93USv44UMUhoFbkprQ+SJs4sTPdFDRYePYDWBaXpBIZ3o66piaRXkrohoCMsP
AEaOKlIb5lzesla03tbd/rOfM50rsuTUpekGSCNrBVubJwZTeeDIxGb9jAKqaNiD
FCx0xErtRocYSFUSqGCIqtzlK83jhNpbSZbHfl832ZvDg5LZ5fGASLOJVVH+3Jtu
1wfTjaPRRGId6DHdhxN3aN6Znd6OxQ9jYtUr8TGy1sVKYKVvgJdWXyS7VzXW2bj1
HrVJJmir3vcu4PVoMbY478C7VC8ellYkiwW/LGu/KuJkvQbRlsQ9wozJtaD0vLh/
kwOXJ71F4uO0RriMrtuzm++QGRYgkR0t3CqytImPDuE1/ddp0RrzNNl+FMFnr2Ah
RIa0R2ZFW5D3v74FoKETbxWNkkDZiDbnrTaIr6eitgWF1syk/U6DujZOqykNI6hU
CkyTxbEwmLcJCaHndymoGnsyj9FbNeQtNqbtCUutjW1Sd8/GT3mDUqyddbDkbnie
B3JhohzPtAl2kHezGZOVtIHvNUdz4wGga+2iXgXQ9AiEdTZTPVXyNIwnpbCvG/BA
5TUnXmLjELs0067K/Opi
=lvaG
-----END PGP SIGNATURE-----

--Sig_/lQ2/0VQLZv3+d+=sGlskjTK--
