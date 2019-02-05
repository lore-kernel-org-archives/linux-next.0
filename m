From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the net tree
Date: Tue, 5 Feb 2019 16:25:12 +1100
Message-ID: <20190205162512.696c2c3b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/eXXShqYv0dL=P/DQLXg5jNk"; protocol="application/pgp-signature"
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kent Overstreet <kent.overstreet@gmail.com>, Xin Long <lucien.xin@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/eXXShqYv0dL=P/DQLXg5jNk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  net/sctp/stream.c

between commit:

  cfe4bd7a257f ("sctp: check and update stream->out_curr when allocating st=
ream_out")

from the net tree and commit:

  2bd3fbb3ff23 ("sctp: convert to genradix")

from the akpm-current tree.

I fixed it up (the latter removed the code modified by the former, so I
did that) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/eXXShqYv0dL=P/DQLXg5jNk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxZHjgACgkQAVBC80lX
0Gwzdwf6Ao3cgh2wcTap/BLvemTLoGWAlal3etp6kdfmCWBj4iHIHOkOZwtvmjKh
r6kBeMMqqceWkPcBMQ7k5vlmaqyTipf2ziPu87TFDoY0cNOiYK7/waFT6sn+RMwE
O0qY+DhFc7+6Pl3R+KfCqg7gYurQf2bom3DxZsQL5Waa8PWdkn2+GM15DMh35kDw
C6bjSloARhtYLJUiSemxLA0nEVdX0GNicdd4a9KjRd+L1EDBGVMAM62vhW4EZCAr
yP6LlCpna1j/7JUPRrDRMv04KcxhXOSE7Jp9+mbMzGqvV2zuI1Kgl401ynpJM6yn
q4d7l55044kOvmPjySd5bnL1XOIAmQ==
=zbID
-----END PGP SIGNATURE-----

--Sig_/eXXShqYv0dL=P/DQLXg5jNk--
