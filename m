From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm-soc tree with the kbuild tree
Date: Mon, 3 Dec 2018 09:06:40 +1100
Message-ID: <20181203090640.487321e0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2547292889699003053=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Dinh Nguyen <dinguyen@kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, =?UTF-8?B?Q2zDqW1lbnQg?= =?UTF-8?B?UMOpcm9u?= <peron.clem@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

--===============2547292889699003053==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Y35zpDCRjxf=8rLb+CbrFfj"; protocol="application/pgp-signature"

--Sig_/Y35zpDCRjxf=8rLb+CbrFfj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm-soc tree got a conflict in:

  arch/arm/mach-socfpga/Kconfig

between commit:

  2eac9c2dfb2b ("PCI: consolidate the PCI_DOMAINS and PCI_DOMAINS_GENERIC c=
onfig options")

from the kbuild tree and commit:

  fbc125afdc50 ("ARM: socfpga: Turn on ARM errata for L2 cache")

from the arm-soc tree.

I fixed it up (see below - I also resorted the select lines since they
seemed to be so before the former latter commit) and can carry the fix
as necessary. This is now fixed as far as linux-next is concerned, but
any non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm/mach-socfpga/Kconfig
index d43798defdba,a04660918d71..000000000000
--- a/arch/arm/mach-socfpga/Kconfig
+++ b/arch/arm/mach-socfpga/Kconfig
@@@ -3,6 -3,6 +3,9 @@@ menuconfig ARCH_SOCFPG
  	depends on ARCH_MULTI_V7
  	select ARCH_SUPPORTS_BIG_ENDIAN
  	select ARM_AMBA
++	select ARM_ERRATA_754322
++	select ARM_ERRATA_764369 if SMP
++	select ARM_ERRATA_775420
  	select ARM_GIC
  	select CACHE_L2X0
  	select DW_APB_TIMER_OF
@@@ -10,7 -10,14 +13,11 @@@
  	select HAVE_ARM_SCU
  	select HAVE_ARM_TWD if SMP
  	select MFD_SYSCON
 -	select PCI_DOMAINS if PCI
 -	select ARM_ERRATA_754322
 -	select ARM_ERRATA_764369 if SMP
 -	select ARM_ERRATA_775420
 +	select PCI_DOMAINS_GENERIC if PCI
+ 	select PL310_ERRATA_588369
+ 	select PL310_ERRATA_727915
+ 	select PL310_ERRATA_753970 if PL310
+ 	select PL310_ERRATA_769419
 =20
  if ARCH_SOCFPGA
  config SOCFPGA_SUSPEND

--Sig_/Y35zpDCRjxf=8rLb+CbrFfj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwEV3AACgkQAVBC80lX
0GzvuwgAoC2WyAKFyQtmka9DPSfzrpWvkOBV9RwC4bEcGcgAFnVXmICcMbqlRFlE
EIlvhsf28ioSE+OPWQ3g82xssuDncpY83TncnkayI8Uf9rjYlIKkvoi3fcl+tc0Y
jcbL1TbeAwzn1miS8UU+nste/65lSQdxG+qYV1Rkv+b77++YVQxX02z6gCvtJx7/
o2SmoA86IVhrkgl1KDwVsqjYA4iRrkWqWiP9B6nn5LsayZLSWF2b9HV7AzfctCMz
sFaAKvuNgueVTfd66lvY6aFxZ0rI1VQmdk4PIVXXs6h3Iuz530SQf9vz6mzY3+If
BEjVoQ27vrjIJM7Ut9+n4jD3jbPsWA==
=UN20
-----END PGP SIGNATURE-----

--Sig_/Y35zpDCRjxf=8rLb+CbrFfj--


--===============2547292889699003053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2547292889699003053==--
