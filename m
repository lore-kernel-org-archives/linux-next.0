From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the pci-current
 tree
Date: Fri, 1 Feb 2019 16:51:30 +1100
Message-ID: <20190201165130.1d9c9850@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/+X_QduJiQuiCX+69A_u.8Um"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/+X_QduJiQuiCX+69A_u.8Um
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Bjorn,

Commits

  f14bcc0add3a ("Revert "PCI: armada8k: Add support for gpio controlled res=
et signal"")
  432dd7064aa1 ("ARM: cns3xxx: Use actual size reads for PCIe")
  65dbb423cf28 ("ARM: cns3xxx: Fix writing to wrong PCI config registers af=
ter alignment")
  a4ace4fa2007 ("PCI: imx: Fix checking pd_pcie_phy device link addition")
  a6093ad7fc49 ("PCI: imx: Fix probe failure without power domain")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/+X_QduJiQuiCX+69A_u.8Um
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxT3mIACgkQAVBC80lX
0GzNZAf/YdQlcA40w+mUjg3UwGwS3ez6czuFckWuqlvEvr7YLKGsOtA1sxmbgFvJ
MdAaKXrAensDCDRTjqkXs2gExprhdu4Fhv97mF4QqCupW817hM+mMvMXMApiqMgr
Ihq4/qFF2wb1gsxukeZuHcCJ8bZiIfdrT18MkOsmWTQ5AHXatDgcqfO9jsd9VTj0
l5twhsxNJht+ou+0534KHy8x7Oz1xW8YjQgKYig71B/80a3b01wVa9vbUG1a5KQl
6SGllmoIyUrlZoVrn2mbe0Rd6WMhb+puso5rliRs/6GdVKIYgI9rYYtI2ekzpi4H
Wzd1ZVLaBUL8vXdsWmg1/+JjHVsawA==
=1rQ9
-----END PGP SIGNATURE-----

--Sig_/+X_QduJiQuiCX+69A_u.8Um--
