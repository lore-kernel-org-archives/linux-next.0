From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: powerpcle qemu boot failure after merge of the akpm
 tree
Date: Thu, 31 Jan 2019 16:38:54 +1100
Message-ID: <20190131163854.307e17ab@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ntkEG4.kWchexs_2hOHxgT1"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mike Rapoport <rppt@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
List-Id: linux-next.vger.kernel.org

--Sig_/ntkEG4.kWchexs_2hOHxgT1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[I am guessing that is is something in Andrew's tree that has caused
this.]

My qemu boot of the powerpc pseries_le_defconfig config failed like this:

htab_hash_mask    =3D 0x1ffff
-----------------------------------------------------
numa:   NODE_DATA [mem 0x7ffe7000-0x7ffebfff]
Kernel panic - not syncing: sparse_buffer_init: Failed to allocate 21474836=
48 bytes align=3D0x10000 nid=3D0 from=3Dfffffffffffffff
CPU: 0 PID: 0 Comm: swapper Not tainted 5.0.0-rc4 #2
Call Trace:
[c00000000105bbd0] [c000000000b1345c] dump_stack+0xb0/0xf4 (unreliable)
[c00000000105bc10] [c000000000111120] panic+0x168/0x3b8
[c00000000105bcb0] [c000000000e701c8] sparse_init_nid+0x178/0x550
[c00000000105bd70] [c000000000e709b4] sparse_init+0x210/0x238
[c00000000105bdb0] [c000000000e468f4] initmem_init+0x1e0/0x260
[c00000000105be80] [c000000000e3b9b0] setup_arch+0x354/0x3d4
[c00000000105bef0] [c000000000e33afc] start_kernel+0x98/0x648
[c00000000105bf90] [c00000000000b270] start_here_common+0x1c/0x52c

--=20
Cheers,
Stephen Rothwell

--Sig_/ntkEG4.kWchexs_2hOHxgT1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxSie4ACgkQAVBC80lX
0GyoNwf8D5nWY24NFrP/NjzcK9jc58lkkCPf1DekarNUeR5vdhoLXoFXw4v1ShJz
EXdvMvCwmCG6eAVANIyRxPpZIwUEKPYOmRE0nP5SIUBoPPt04WLB70SPmPFeaECL
3CBDDSB8ZkTYLXTRHCWKfwYIHzvktXqf7gTSG73gxTaOv+4bHh3MA3jRZ/3WQJ7/
EA0m/G3nsfZWVrjyKbiaA0ONS/QRN9tYkMtnrV8S/DVE/U06eSrSeJeKpYZA1FDr
zPijbbOEY87VgncKCVw/0DOZjdttM/k7uMyR6Gk15ZjbPa2w11IgrbX9MD2zo2tx
Pm4vgyN0qKKrRuZePOflXndb5x5PNQ==
=bVoJ
-----END PGP SIGNATURE-----

--Sig_/ntkEG4.kWchexs_2hOHxgT1--
