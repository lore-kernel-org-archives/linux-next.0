From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: qemu boot failures with today's linux-next
Date: Mon, 15 Oct 2018 19:18:59 +1100
Message-ID: <20181015191859.2f600de5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/wkS07L+gQGLSeyWewVybqj7"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/wkS07L+gQGLSeyWewVybqj7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next tree does not boot in qemu (with kvm or without).
Here is the (non-kvm) boot log (the kvm one is basically the same):

------------------------------------------------------
SLOF=1B[0m=1B[?25l ********************************************************=
**************=0D
=1B[1mQEMU Starting=0D
=1B[0m Build Date =3D Sep 24 2017 12:23:07=0D
 FW Version =3D buildd@ release 20170724=0D
 Press "s" to enter Open Firmware.=0D=0D
=0D=0D
=1B[0m=1B[?25hC0000=0DC0100=0DC0120=0DC0140=0DC0200=0DC0240=0DC0260=0DC02E0=
=0DC0300=0DC0320=0DC0340=0DC0360=0DC0370=0DC0380=0DC0371=0DC0372=0DC0373=0D=
C0374=0DC03F0=0DC0400=0DC0480=0DC04C0=0DC04D0=0DC0500=0DPopulating /vdevice=
 methods=0D
Populating /vdevice/vty@71000000=0D
Populating /vdevice/nvram@71000001=0D
Populating /vdevice/l-lan@71000002=0D
Populating /vdevice/v-scsi@71000003=0D
       SCSI: Looking for devices=0D
          8200000000000000 CD-ROM   : "QEMU     QEMU CD-ROM      2.5+"=0D
C05A0=0DPopulating /pci@800000020000000=0D
C0600=0DC06C0=0DC0700=0DC0800=0DC0880=0DNo NVRAM common partition, re-initi=
alizing...=0D
C0890=0DC08A0=0DC08A8=0DC08B0=0DScanning USB =0D
C08C0=0DC08D0=0DUsing default console: /vdevice/vty@71000000=0D
C08E0=0DC08E8=0DDetected RAM kernel at 400000 (122a850 bytes) =0D
C08FF=0D     =0D
  Welcome to Open Firmware=0D
=0D
  Copyright (c) 2004, 2017 IBM Corporation All rights reserved.=0D
  This program and the accompanying materials are made available=0D
  under the terms of the BSD License available at=0D
  http://www.opensource.org/licenses/bsd-license.php=0D
=0D
Booting from memory...=0D
OF stdout device is: /vdevice/vty@71000000=0D
Preparing to boot Linux version 4.19.0-rc7 (sfr@ash) (gcc version 8.2.0 (De=
bian 8.2.0-4)) #2 SMP Mon Oct 15 18:53:28 AEDT 2018=0D
Detected machine type: 0000000000000101=0D
command line: =0D
Max number of cores passed to firmware: 2048 (NR_CPUS =3D 2048)=0D
Calling ibm,client-architecture-support... done=0D
memory layout at init:=0D
  memory_limit : 0000000000000000 (16 MB aligned)=0D
  alloc_bottom : 0000000001640000=0D
  alloc_top    : 0000000030000000=0D
  alloc_top_hi : 0000000080000000=0D
  rmo_top      : 0000000030000000=0D
  ram_top      : 0000000080000000=0D
instantiating rtas at 0x000000002fff0000... done=0D
prom_hold_cpus: skipped=0D
copying OF device tree...=0D
Building dt strings...=0D
Building dt structure...=0D
Device tree strings 0x0000000001850000 -> 0x0000000001850a02=0D
Device tree struct  0x0000000001860000 -> 0x0000000001870000=0D
Quiescing Open Firmware ...=0D
Booting Linux via __start() @ 0x0000000000400000 ...=0D
------------------------------------------------------

I have no idea what may have caused this.

--=20
Cheers,
Stephen Rothwell

--Sig_/wkS07L+gQGLSeyWewVybqj7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvETXMACgkQAVBC80lX
0Gyzewf7BtjO16MLB1LL3Td+HEidA4l7bQb8GmPKvCnb5JayVKcYYkYSypXyT2B1
wgeawciRKcRlwhtdWH3NVD/MC65/IctQ4nTvrKLHCqLWkmNJoSTBstlc2E+P2rTr
vODtTdmLEHVodfV3WDIIVMlHyOhyh43hmIOqfcSkqqYIjYkC7cbtevAh9ruWCUn7
LS91771bXv23Ckftr07RucbbCD++H/liinsWm2Tupys4Uvu1eupb2Y1sdgOCKcub
L1f55kRrmpefpgRuTIa2Ug9P2B8ThqNmkhBQb41v+sl3MtQuE4uyO0hxWHdGVgk+
TgrT22hCERgFMxvtckHi7bb+jtppYw==
=fy5B
-----END PGP SIGNATURE-----

--Sig_/wkS07L+gQGLSeyWewVybqj7--
