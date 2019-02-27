From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the iommu tree
Date: Wed, 27 Feb 2019 13:20:04 +1100
Message-ID: <20190227132004.4d3a3da4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ezeCYBum=Iq9ezBpZwWBF6+"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Joerg Roedel <joro@8bytes.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/ezeCYBum=Iq9ezBpZwWBF6+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Joerg,

After merging the iommu tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

In file included from drivers/pci/pci.c:32:
include/linux/pci-ats.h:70:12: warning: 'pci_prg_resp_pasid_required' defin=
ed but not used [-Wunused-function]
 static int pci_prg_resp_pasid_required(struct pci_dev *pdev)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  e5567f5f6762 ("PCI/ATS: Add pci_prg_resp_pasid_required() interface.")

The non CONFIG_PCI_PASID version needs an "inline".

--=20
Cheers,
Stephen Rothwell

--Sig_/ezeCYBum=Iq9ezBpZwWBF6+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlx189QACgkQAVBC80lX
0GxdKAf8DbcfYSLMKlKP0orGWyczZk+rTFfiLuN2m4Hq+QvaUo95ST9AmAJ7EGcY
gQduiIbC6zcoFg7V3+1cGo98KLX4gepynYET64c8CuY4ahTgncZ6PxXiYwC6Ga74
FKKPu5WgvsJDH//Lp0ztJFuMevJMYqaqErN+HFtSOo+rGvurFuTqSgUAuDysadls
QsFFsS04NxS38SNyxbo2hCjtBFkoxNRWjlFto/wBC9JnqfPi9XARCYh5/Xh53MH5
8lDSw+P29Vv9MB1zeaZHeA7IaYtK8H3brqLCRgKnM0i6tCAuKcey2+b+Y2zTSYAx
fLFHJMDYiW58SCkWomO37fm9+4yhCA==
=jpbv
-----END PGP SIGNATURE-----

--Sig_/ezeCYBum=Iq9ezBpZwWBF6+--
