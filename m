From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the cisco tree with Linus' tree
Date: Mon, 18 Mar 2019 11:52:12 +1100
Message-ID: <20190318115212.4366cba6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/UDxm_gPL_/+mDSzZrjY/C=5"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Walker <dwalker@fifo99.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Joel Stanley <joel@jms.id.au>, Michael Ellerman <mpe@ellerman.id.au>
List-Id: linux-next.vger.kernel.org

--Sig_/UDxm_gPL_/+mDSzZrjY/C=5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the cisco tree got a conflict in:

  arch/powerpc/configs/skiroot_defconfig

between commit:

  805bf3b75529 ("powerpc/configs: Sync skiroot defconfig")

from Linus' tree and commit:

  5d4514a9c291 ("powerpc: convert config files to generic cmdline")

from the cisco tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/configs/skiroot_defconfig
index 5ba131c30f6b,bf31334efbce..000000000000
--- a/arch/powerpc/configs/skiroot_defconfig
+++ b/arch/powerpc/configs/skiroot_defconfig
@@@ -48,14 -40,22 +43,26 @@@ CONFIG_HZ_100=3D
  CONFIG_KEXEC=3Dy
  CONFIG_IRQ_ALL_CPUS=3Dy
  CONFIG_NUMA=3Dy
 +# CONFIG_COMPACTION is not set
 +# CONFIG_MIGRATION is not set
  CONFIG_PPC_64K_PAGES=3Dy
  CONFIG_SCHED_SMT=3Dy
 +CONFIG_CMDLINE_BOOL=3Dy
- CONFIG_CMDLINE=3D"console=3Dtty0 console=3Dhvc0 ipr.fast_reboot=3D1 quiet"
++CONFIG_CMDLINE_PREPEND=3D"console=3Dtty0 console=3Dhvc0 ipr.fast_reboot=
=3D1 quiet"
  # CONFIG_SECCOMP is not set
  # CONFIG_PPC_MEM_KEYS is not set
+ CONFIG_JUMP_LABEL=3Dy
+ CONFIG_STRICT_KERNEL_RWX=3Dy
+ CONFIG_MODULES=3Dy
+ CONFIG_MODULE_UNLOAD=3Dy
+ CONFIG_MODULE_SIG=3Dy
+ CONFIG_MODULE_SIG_FORCE=3Dy
+ CONFIG_MODULE_SIG_SHA512=3Dy
+ CONFIG_PARTITION_ADVANCED=3Dy
+ # CONFIG_IOSCHED_DEADLINE is not set
+ # CONFIG_COMPACTION is not set
+ # CONFIG_MIGRATION is not set
+ # CONFIG_BOUNCE is not set
  CONFIG_NET=3Dy
  CONFIG_PACKET=3Dy
  CONFIG_UNIX=3Dy
@@@ -164,9 -159,9 +170,10 @@@ CONFIG_MLX4_EN=3D
  # CONFIG_MLX4_CORE_GEN2 is not set
  CONFIG_MLX5_CORE=3Dm
  # CONFIG_NET_VENDOR_MICREL is not set
 +# CONFIG_NET_VENDOR_MICROSEMI is not set
  CONFIG_MYRI10GE=3Dm
  # CONFIG_NET_VENDOR_NATSEMI is not set
+ CONFIG_S2IO=3Dm
  # CONFIG_NET_VENDOR_NETRONOME is not set
  # CONFIG_NET_VENDOR_NI is not set
  # CONFIG_NET_VENDOR_NVIDIA is not set

--Sig_/UDxm_gPL_/+mDSzZrjY/C=5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyO67wACgkQAVBC80lX
0GxDWQgAimEZUBsc6tPc1R+N5rDTy61f1EIQ438+iJ9DKKBeA+ypdw82+sH2GW1l
9GxZrNThvcBk2IpHfi+m/O5pxybsLo2iwi1Yja8is5cajYnK4B7WEChl8sueZLO1
14u3phSkBx3JvXTHANBiSc97PB147xsrzriqX+7x+e2wpRgO/G7dZygEb+U1aoMR
TGSCD/4d7OvRfQI6wjW55Os138JTJdW1Bxz55kzLul/djepKX1KV/A/dB+dbvYna
hDZsdieQA+uOb5rgX95VLYL7cvYcuNkdFRNz3zoIjyPOovYxWkWTm5yNHH8Qz5Jd
apfPlYoQ23owP6gnqnHdWjxr0kNClg==
=in6C
-----END PGP SIGNATURE-----

--Sig_/UDxm_gPL_/+mDSzZrjY/C=5--
