From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the pci tree with the pci-current tree
Date: Wed, 12 Mar 2014 13:00:09 +0000
Message-ID: <20140312130009.2c05e3aea858358daacfbba0@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__12_Mar_2014_13_00_09_+0000_jgn8=AK7rWkd8O7t"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__12_Mar_2014_13_00_09_+0000_jgn8=AK7rWkd8O7t
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bjorn,

Today's linux-next merge of the pci tree got a conflict in drivers/pci/pci.=
c between commit 5f4fe7ad54087 ("PCI: Enable INTx in pci_reenable_device() =
only when MSI/MSI-X not enabled") from the pci-current tree and commit 1e25=
71a7813836 ("PCI: Enable INTx if BIOS left them disabled") from the pci tre=
e.

I fixed it up resulting in the contents of pci-current and can carry the fi=
x as necessary (no action is required).

--Signature=_Wed__12_Mar_2014_13_00_09_+0000_jgn8=AK7rWkd8O7t
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTIFpZAAoJELSic+t+oim97UsP/R/Bd9iM48j9ODnpwtl1YPVX
95l3pspq9ZMKYm+1dMJGwOvqKoe3P2P2QKjThWD6DomPB3vVl/uz1jrO21bpK9VY
1V4HK/3h0RS8i8XKgWMHU9g0wqqQmhBBEqHZ88nRp4Yc8SABIQXZ5H9GQBcPDkYa
rvxxoBKyWuT3uDursPGATFI+LjaP6DtlkWRfMAyfJhXvYwpkGDLN42YA+r9oQkaY
M0eBCjbYsCtUuQnKPJJxa/FkYjyXeU4p4AXfRhAjNGH3y//vSfXQSTVeqO+UW89n
EhXaytNvF8l8vY6Nx5mhLmlUIfRzPA4207CMYnmngk/SFQDD2ScaG3p2dmETzAoI
FfKmrGavT9Sgm5BijqWy1dB48dtIJ6U3RzT+/vYsx3SdR8hnl/XYHZ+JAIDdA4qL
0QM40gqUuYufshjkiEne8Nmg9M4JcUxwzE4zL2dXp+8GajMhDXUxayoVyvZdEyCB
yxeDZ3JqrOftS9LtH6ZOhtvgPF7tmI0G9aLJZ1q6DUgbggLmZFWmeNc370To0YBc
DXgNo6nW+o+OAef+XvT+AycsUpuJ4B+9AK9G+xpSsXdyd9TS5dUWjgvOcddHB5WR
k74c5zpdN7A//+620Ysc1DDpSitljI4mMTADcyjkQpNOsAiiX0jFoWDCHK7JyxN2
4EG4gBtD9C2AQh8lVyFF
=AlS5
-----END PGP SIGNATURE-----

--Signature=_Wed__12_Mar_2014_13_00_09_+0000_jgn8=AK7rWkd8O7t--
