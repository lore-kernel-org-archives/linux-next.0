From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pci tree with the asm-generic tree
Date: Tue, 3 Apr 2018 12:14:15 +1000
Message-ID: <20180403121415.20c4843e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/EtAJOtp6TzJsOUSKgvjaxlK"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jesper Nilsson <jesper@jni.nu>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/EtAJOtp6TzJsOUSKgvjaxlK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pci tree got a conflict in:

  arch/cris/arch-v32/drivers/pci/bios.c

between commits:

  c690eddc2f3b ("CRIS: Drop support for the CRIS port")
  fd8773f9f544 ("arch: remove frv port")
  739d875dd698 ("mn10300: Remove the architecture")

from the asm-generic tree and commit:

  31cbca85df15 ("PCI/MSI: Don't set up INTx if MSI or MSI-X is enabled")

from the pci tree.

I fixed it up (I just removed the files) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/EtAJOtp6TzJsOUSKgvjaxlK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlrC43cACgkQAVBC80lX
0GyIUQf9EX5A9NuqbXV4L7ruOh/idShldigxDgznAFj0zujYZGleB9FuUl4nzP6O
HmaCRVVFgG67UDjj+pTkp+T5Q7Ixx0nqP94VrpRh7AeDK6caHXG8k5+NlM+qSYER
NhiQAl6oRoYw7JQpMzxRistijWqrys0+rOXCUmakz98u2Etb8Zj33JOd8xh0iFLW
pVxykVuCKzMbO7loU2cyx3XUEssVYu3c2DaouiheORoJ/FhG/BCR0bLsLLhdjH+p
reI2IJUIGoRdjMZKfGH+himXXbzVcS7lSzBC6ebDhYpgZa2iMi4YIGpEhFQBPQsy
nQca983JJCoulyjJb1a9Yd6bq7cy5Q==
=3YYZ
-----END PGP SIGNATURE-----

--Sig_/EtAJOtp6TzJsOUSKgvjaxlK--
