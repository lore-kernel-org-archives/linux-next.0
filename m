From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vhost tree with the pci tree
Date: Mon, 15 Apr 2019 16:07:58 +1000
Message-ID: <20190415160758.390eaf8d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/V7udtFxG3FbkzLoVt4SOoB/"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael S. Tsirkin" <mst@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/V7udtFxG3FbkzLoVt4SOoB/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vhost tree got a conflict in:

  drivers/pci/of.c

between commit:

  9cb30a71acd4 ("PCI: OF: Support "external-facing" property")

from the pci tree and commit:

  e1c326663501 ("PCI: OF: Initialize dev->fwnode appropriately")

from the vhost tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/pci/of.c
index 73d5adec0a28,9454c90980c9..000000000000
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@@ -32,16 -34,13 +35,18 @@@ void pci_release_of_node(struct pci_de
 =20
  void pci_set_bus_of_node(struct pci_bus *bus)
  {
 -	if (bus->self =3D=3D NULL)
 -		bus->dev.of_node =3D pcibios_get_phb_of_node(bus);
 -	else
 -		bus->dev.of_node =3D of_node_get(bus->self->dev.of_node);
 +	struct device_node *node;
 =20
 -	if (bus->dev.of_node)
 -		bus->dev.fwnode =3D &bus->dev.of_node->fwnode;
 +	if (bus->self =3D=3D NULL) {
 +		node =3D pcibios_get_phb_of_node(bus);
 +	} else {
 +		node =3D of_node_get(bus->self->dev.of_node);
 +		if (node && of_property_read_bool(node, "external-facing"))
 +			bus->self->untrusted =3D true;
 +	}
 +	bus->dev.of_node =3D node;
++	if (node)
++		bus->dev.fwnode =3D &node->fwnode;
  }
 =20
  void pci_release_bus_of_node(struct pci_bus *bus)

--Sig_/V7udtFxG3FbkzLoVt4SOoB/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly0H74ACgkQAVBC80lX
0Gz3Swf3aCDVFBy1S3tddu+clorIixKLKHuMwQ/83DcW2kRgNpedCnjZKiNIkIpL
lswSefPpg3+t28ExpMQ3vGU8F9yL7lZ+gp81aCcpPPMdlJqKxxCxYXoeEG/CQgIw
t13K4HEHAB6CS1V3KCAqnzYMcpBXQVfA4ZuxCFS9T1R6iZA+kYN+5LaHRDrQos2n
OHzE1fn2Cs+fTNAsH+5Lh6ari4ri+C6jVDuOnyjOhHVAKQs9CRwJOYshUBQMzbgc
eQGOz412cXj9vGsk2R2LX3MbIH8/NxTL6TJJ5KbXARmmi0OacmKdJAYSeprJCLQA
n2GzXrn6C+KkeRT8e8A+O4MtKY2j
=Kfar
-----END PGP SIGNATURE-----

--Sig_/V7udtFxG3FbkzLoVt4SOoB/--
