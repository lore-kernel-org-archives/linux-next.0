From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vhost tree with the net tree
Date: Mon, 21 Jan 2019 13:19:07 +1100
Message-ID: <20190121131907.67165947@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6CoH0_PjMa07dr7FS08w0yh"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael S. Tsirkin" <mst@redhat.com>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/6CoH0_PjMa07dr7FS08w0yh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

Today's linux-next merge of the vhost tree got a conflict in:

  drivers/net/virtio_net.c

between commit:

  df133f3f9625 ("virtio_net: bulk free tx skbs")

from the net tree and commits:

  a73c976c635f ("virtio_net: bulk free tx skbs")
  017ed06fa099 ("virtio-net: bql support")

from the vhost tree.

The 2 versions of "virtio_net: bulk free tx skbs" are not identical
and then "virtio-net: bql support" further changed the same function
prototype ...

I fixed it up (I basically used the vhost tree verison) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/6CoH0_PjMa07dr7FS08w0yh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxFLBsACgkQAVBC80lX
0GwdiAf/eNP0gD3Mp5G7VVFw9SFTcqCS3+lX2yeiB24cDDb3srpdmFYclmOCy7wT
1LdTSpZA24k33fBoQrnQDEEpufZ1E+SI3JmNtCOcfos8Wlepwzv5Lw3YAsdV1xB7
GXuy0Dz/snOtcjiRbylE0hkM8WUJW5jv9MVqa/lKUFKVAH0GDsV4p2zUocU/F5UG
RwH1svvbcb/nq+vuf7TkL+vRs1wYX+2wsuZJ1agg9rHTCr1uJ8po1orz6rBVlLyf
VKwXVK9AIyv4K4g1g/ADOMn+t/3+laDp1aAyLYuOp3A3OrFqcucrd70ioVwGOTPQ
fShDS2qJ7wukNDuAcDPjiynwI1YHig==
=0oz/
-----END PGP SIGNATURE-----

--Sig_/6CoH0_PjMa07dr7FS08w0yh--
