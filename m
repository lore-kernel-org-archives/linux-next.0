From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vhost tree with the pci tree
Date: Thu, 31 Jan 2019 13:40:33 +1100
Message-ID: <20190131134033.1ed0021d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/hPh8DgZ=ib+x5tNHOt/Hbr3"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael S. Tsirkin" <mst@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/hPh8DgZ=ib+x5tNHOt/Hbr3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vhost tree got a conflict in:

  drivers/pci/setup-bus.c

between commit:

  51c48b310183 ("PCI: Probe bridge window attributes once at enumeration-ti=
me")

from the pci tree and commit:

  955156f34e7d ("PCI: avoid bridge feature re-probing on hotplug")

from the vhost tree.

I fixed it up (hopefully - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/pci/setup-bus.c
index 1941bb0a6c13,d5c25d465d97..000000000000
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@@ -735,17 -735,50 +735,26 @@@ int pci_claim_bridge_resource(struct pc
     base/limit registers must be read-only and read as 0. */
  static void pci_bridge_check_ranges(struct pci_bus *bus)
  {
 -	u16 io;
 -	u32 pmem;
  	struct pci_dev *bridge =3D bus->self;
 -	struct resource *b_res;
 -
 -	b_res =3D &bridge->resource[PCI_BRIDGE_RESOURCES];
 +	struct resource *b_res =3D &bridge->resource[PCI_BRIDGE_RESOURCES];
 =20
+ 	/*
+ 	 * Don't re-check after this was called once already:
+ 	 * important since bridge might be in use.
+ 	 * Note: this is only reliable because as per spec all PCI to PCI
+ 	 * bridges support memory unconditionally so IORESOURCE_MEM is set.
+ 	 */
+ 	if (b_res[1].flags & IORESOURCE_MEM)
+ 		return;
+=20
  	b_res[1].flags |=3D IORESOURCE_MEM;
 =20
 -	pci_read_config_word(bridge, PCI_IO_BASE, &io);
 -	if (!io) {
 -		pci_write_config_word(bridge, PCI_IO_BASE, 0xe0f0);
 -		pci_read_config_word(bridge, PCI_IO_BASE, &io);
 -		pci_write_config_word(bridge, PCI_IO_BASE, 0x0);
 -	}
 -	if (io)
 +	if (bridge->io_window)
  		b_res[0].flags |=3D IORESOURCE_IO;
 =20
 -	/*  DECchip 21050 pass 2 errata: the bridge may miss an address
 -	    disconnect boundary by one PCI data phase.
 -	    Workaround: do not use prefetching on this device. */
 -	if (bridge->vendor =3D=3D PCI_VENDOR_ID_DEC && bridge->device =3D=3D 0x0=
001)
 -		return;
 -
 -	pci_read_config_dword(bridge, PCI_PREF_MEMORY_BASE, &pmem);
 -	if (!pmem) {
 -		pci_write_config_dword(bridge, PCI_PREF_MEMORY_BASE,
 -					       0xffe0fff0);
 -		pci_read_config_dword(bridge, PCI_PREF_MEMORY_BASE, &pmem);
 -		pci_write_config_dword(bridge, PCI_PREF_MEMORY_BASE, 0x0);
 -	}
 -	if (pmem) {
 +	if (bridge->pref_window) {
  		b_res[2].flags |=3D IORESOURCE_MEM | IORESOURCE_PREFETCH;
 -		if ((pmem & PCI_PREF_RANGE_TYPE_MASK) =3D=3D
 -		    PCI_PREF_RANGE_TYPE_64) {
 +		if (bridge->pref_64_window) {
  			b_res[2].flags |=3D IORESOURCE_MEM_64;
  			b_res[2].flags |=3D PCI_PREF_RANGE_TYPE_64;
  		}

--Sig_/hPh8DgZ=ib+x5tNHOt/Hbr3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxSYCEACgkQAVBC80lX
0Gxfqgf+I4oKR99AHQbwwfWlsMekEB9AT2rUtkCXzTwQRqQLwPsyCQl9CsdZ69Tw
+hIt8/qR6i35noLRv+sKUDi2Zaw5ybntXmqDwDiz29xtVfHvCOPeRGHLjy7ad/2X
bpvGD9KSCidEth3fELtGZMTtSwW5xVwPPCTGFnMrYpkFzjDa6ApJreb9ZVKPKJik
5FRT1iHPN5uC45X0UJEDuYVoDjLOEUxvSHqwemUAl85odYwf5bymoLIRyhOlG8sZ
BBEEWJEO/mUxH53AL9PCLPx6Lk+M3XynVBjQX44pheoT+rLtiM2GWqCXz7UUSK1Z
0AZdiLV8aAoDaa9x8W6VwuLDipd0vg==
=Bqf0
-----END PGP SIGNATURE-----

--Sig_/hPh8DgZ=ib+x5tNHOt/Hbr3--
