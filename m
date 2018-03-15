From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tty tree with the asm-generic tree
Date: Thu, 15 Mar 2018 17:36:04 +1100
Message-ID: <20180315173604.5c858ed8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/iGXVQ7fEF9Uy8H_Bob4g059"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@sifive.com>
List-Id: linux-next.vger.kernel.org

--Sig_/iGXVQ7fEF9Uy8H_Bob4g059
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the tty tree got conflicts in:

  drivers/tty/hvc/Kconfig
  drivers/tty/hvc/Makefile

between commit:

  c235c62f99e6 ("tty: remove bfin_jtag_comm and hvc_bfin_jtag drivers")

from the asm-generic tree and commit:

  afa6b1ccfad5 ("tty: New RISC-V SBI console driver")

from the tty tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/tty/hvc/Kconfig
index 3bade5ad3d71,e7cc617d6e45..000000000000
--- a/drivers/tty/hvc/Kconfig
+++ b/drivers/tty/hvc/Kconfig
@@@ -88,6 -88,25 +88,16 @@@ config HVC_DC
  	 driver. This console is used through a JTAG only on ARM. If you don't h=
ave
  	 a JTAG then you probably don't want this option.
 =20
 -config HVC_BFIN_JTAG
 -	bool "Blackfin JTAG console"
 -	depends on BLACKFIN
 -	select HVC_DRIVER
 -	help
 -	 This console uses the Blackfin JTAG to create a console under the
 -	 the HVC driver.  If you don't have JTAG, then you probably don't
 -	 want this option.
 -
+ config HVC_RISCV_SBI
+ 	bool "RISC-V SBI console support"
+ 	depends on RISCV
+ 	select HVC_DRIVER
+ 	help
+ 	  This enables support for console output via RISC-V SBI calls, which
+ 	  is normally used only during boot to output printk.
+=20
+ 	  If you don't know what do to here, say Y.
+=20
  config HVCS
  	tristate "IBM Hypervisor Virtual Console Server support"
  	depends on PPC_PSERIES && HVC_CONSOLE
diff --cc drivers/tty/hvc/Makefile
index 7da1934d34e8,83079ae000ae..000000000000
--- a/drivers/tty/hvc/Makefile
+++ b/drivers/tty/hvc/Makefile
@@@ -9,4 -10,6 +9,5 @@@ obj-$(CONFIG_HVC_IRQ)		+=3D hvc_irq.
  obj-$(CONFIG_HVC_XEN)		+=3D hvc_xen.o
  obj-$(CONFIG_HVC_IUCV)		+=3D hvc_iucv.o
  obj-$(CONFIG_HVC_UDBG)		+=3D hvc_udbg.o
 -obj-$(CONFIG_HVC_BFIN_JTAG)	+=3D hvc_bfin_jtag.o
+ obj-$(CONFIG_HVC_RISCV_SBI)	+=3D hvc_riscv_sbi.o
  obj-$(CONFIG_HVCS)		+=3D hvcs.o

--Sig_/iGXVQ7fEF9Uy8H_Bob4g059
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqqFFQACgkQAVBC80lX
0Gw84Af+JSpHXDpB1HfEw0JrSom98lezyVgJAJf6E9WlOiU8qe/N7SjMhbEFNok0
YQFjhpnmtf6yev+ZYSKoyNi8ccODX4wJ2R/dqHGnyZdfbmGsCsH3m4GsA0OoO9QJ
1SHNJvaB/hQTc6UoMGYYcSwhXMLcHOpJT4GwgmDJ4EQdcSkJcIUEomMMHHIlGXkH
syfu/AcsCFWc7if74PbzpIYsJZUI0eYZk8TtMX7RjWcIDBXcHi3wDhbZWadS5Bg0
RJD7DcXN02DWLQ8WPdvSBevBkUxaNLTcHIUf7cBsyMpDwtzYTzQ7s3a7fd9Fow8n
0KG06HVfNULvQtrV67jsf8lyUTppqg==
=9NgR
-----END PGP SIGNATURE-----

--Sig_/iGXVQ7fEF9Uy8H_Bob4g059--
