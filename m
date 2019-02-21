From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the powerpc tree with the dma-mapping
 tree
Date: Fri, 22 Feb 2019 09:17:28 +1100
Message-ID: <20190222091728.6d3d9877@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ok17N8/ya7k8hwIQAwaZptq"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/ok17N8/ya7k8hwIQAwaZptq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the powerpc tree got a conflict in:

  arch/powerpc/kernel/dma-swiotlb.c

between commit:

  cfced786969c ("dma-mapping: remove the default map_resource implementatio=
n")

from the dma-mapping tree and commit:

  68005b67d15a ("powerpc/dma: use the generic direct mapping bypass")

from the powerpc tree.

I fixed it up (I just used the latter) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/ok17N8/ya7k8hwIQAwaZptq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxvI3gACgkQAVBC80lX
0GwCLwf8Cs2kNsCKIdpn1d0w4LHBA4HAlvsOfuZgHZktoG/FprY7Yi1Z/1zHEehJ
jUvUjJN9x6Ml6oTk6aunNl1vFIXX3BvtUz4NAmZF+tSY3ycnHJ8CT76QjOPzzeH8
dgnKqzM2RwkgJ0H2ZwkRwr5KVjM5ZVVyqJuzBsMbi/iaZoKIxWI+gc9pI3jPz1fl
47x3wE4KxhI/eu/LKb3lTNgFuatwNqlWYd+mV411VyuXiWBqsuCsluT5vsVWOFfd
nzJlEfcBdZ5q20piok04KZItnCHOFB0trw0BpbBXawTW/6ml8AbY3QNJP/BFhMmx
zU6xpU/5SNGeDu5rCTkHMacnq4Zd/w==
=VWkj
-----END PGP SIGNATURE-----

--Sig_/ok17N8/ya7k8hwIQAwaZptq--
