From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pm tree with the pci tree
Date: Wed, 11 Feb 2015 12:07:55 +1100
Message-ID: <20150211120755.50217078@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/4o_94NUf0gmhExVBShCpuBk"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/4o_94NUf0gmhExVBShCpuBk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rafael,

Today's linux-next merge of the pm tree got a conflict in
drivers/of/of_pci.c between commit d2be00c0fb5a ("of/pci: Free
resources on failure in of_pci_get_host_bridge_resources()") from the
pci tree and commit 5c493df25a0d ("Merge branch 'pci/host-generic' of
git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci into
acpi-resources") from the pm tree.

I fixed it up (I just use the latter version, please check when it
comes out) and can carry the fix as necessary (no action is required,
though someone might want to tell Linus how to resolve it - including
the removal of the "kfree(bus_range);").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/4o_94NUf0gmhExVBShCpuBk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU2qtvAAoJEMDTa8Ir7ZwVY3oP/2YQXcDntGXv/iD+44HhnYam
LAUioolheThDKumq9dnvS2REfokO7VQH3w78gqM4snOpJipVysqjFQgYXBINoEVi
DFGaGmTqBkGB2ybkp26Hq9iR61bmnBmijjB8cjn7kCZztGOUjnEaOKQ7x/DCkGg4
LWIGYYVOUiov+Hac+T+fuERJ9qQ6o/0aVoWpR7PDOZImmbQupYtWS9THzJF58dxg
clUrds7d0YP4m/N5GQ3+E9dMpIT8eZW02CdDamPFGuQHyvk6VR9OyB7Jdq2Ahuwa
N3zW2vly+h+lLVVHVG/Y5/pHBYhZIk7pGLqf9M7ppbd/1l/aGAxP9k9Mb8bm7zJX
CXXgAMm4sfTM5///INJf/5TsAHc4/Qx5pNBa64Ho0E4mTCePTanEUoZo1F1z6zqt
p1I4+aFd2l0pd+7Snac31pZgmtklqu2D4Pu1QE08Y68ARMZtWkAdBk+oy6DK6EgL
DpEoM8ZA1oLmLyJdmPs43mc9wJS7SxaW2lM2QaUN/89sXI8JKktrXIQtyxZ6usRt
R8qtYz6eqLM68LQEs7jX3AZtbUlpEWCZ2KZ9zQPy+xeGj54ppomWczQMqfzW/Kmk
SGJ0hDmUL5nHBPorycXSSGig95CFAkXUeRU7FQmdZdns3XDg7d2MTMWuNvKkFqYl
UF0gQvIIlbsUnL3tFE/K
=XxRl
-----END PGP SIGNATURE-----

--Sig_/4o_94NUf0gmhExVBShCpuBk--
