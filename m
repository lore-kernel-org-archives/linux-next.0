From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vhost tree with the usb tree
Date: Thu, 9 Apr 2015 18:07:19 +1000
Message-ID: <20150409180719.2eee7e59@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Ho=k.9lf.Wtm=c5XNC3Os0q"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57059 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751862AbbDIIHc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 9 Apr 2015 04:07:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joseph Kogut <joseph.kogut@gmail.com>, Felipe Balbi <balbi@ti.com>

--Sig_/Ho=k.9lf.Wtm=c5XNC3Os0q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

Today's linux-next merge of the vhost tree got a conflict in
drivers/usb/dwc3/dwc3-pci.c between commit adf9c3c85615 ("usb: move
definition of PCI_VENDOR_ID_SYNOPSYS to linux/pci_ids.h") from the usb
tree and commit 3d4e078e29d3 ("usb/dwc3: comment update") from the
vhost tree.

I fixed it up (they both removed the same line - the former removed
another line as well) and can carry the fix as necessary (no action is
required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/Ho=k.9lf.Wtm=c5XNC3Os0q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVJjNAAAoJEMDTa8Ir7ZwVYlsP/RzLwLaaPt6LimfMtB2M9qzr
nkkx+wxdQqR4P0S/covzkenPADzfbZAdxYRiqGFJ9pVlM0FInrEe8eKl7R7bBbql
PMArsxgRsTw2A05TBhm1KZFsjYoUUdOrsy+UvC2RMHa4XAAkOcJDDxBJXi66Zk6t
KkuHrnbfN8vOhc+l63MVjW4HxschcnKjSn83pAIua2sdk0SuvBIb77nmcBg0OvhA
R+Mvr0ccLG9+/BDFtEa79jxmEbQJB//h0o5ww3kswSTfeaeITt/vXZdIGhRhBOeQ
SmrbTTkVq+FGdvEBYOkzR+TFv2bUrY+H2NuSSSODg6+sTnt4gdG1dESObAUqVDA5
3W55ka+wdmclNeiGZK2EwGp/fB6nokv9U3K/UEZnCNTorF3mlGGhwTuAb9tGK3XI
w6ZKNhLxvbQZs5Sy4zycfjUXMISsQvum4p2GJphV3HsaYSi746AtYYFS8DJwU8mr
L6iCLW+nzbewt3GIqxzp95x5wNccW1c0csN85zy6HPLa33sUJE3Ay6V9gyFXDztK
SzYUf+HKU5E2hVL5os74MhkxoWI/bo8DI/AYBVqFQJtK4ta1gpo+yTN3EBn4JKKb
lkYWc+v3qKBiw/DyiAu3Epo5yl8qWZIanBBaKpwQ3UYZmU6UwmWz8nVrK7jTumlI
Qsci4LzBilGDzU+LBWgE
=RuxD
-----END PGP SIGNATURE-----

--Sig_/Ho=k.9lf.Wtm=c5XNC3Os0q--
