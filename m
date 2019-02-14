From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the devicetree tree with Linus' tree
Date: Thu, 14 Feb 2019 14:02:16 +1100
Message-ID: <20190214140216.72ad7d4a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/bZa23S7X0eEOjYpMr4pLIK_"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Otto Sabart <ottosabart@seberm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/bZa23S7X0eEOjYpMr4pLIK_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt

between commit:

  8217724eb7c5 ("doc: bindings: fix bad reference to ARM CPU bindings")

from Linus' tree and commit:

  36c79bc7ef79 ("dt-bindings: interrupt-controller: Convert ARM GICv3 to js=
on-schema")

from the devicetree tree.

I fixed it up (the latter also did the update from the former, so I just
removed the file) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/bZa23S7X0eEOjYpMr4pLIK_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxk2jgACgkQAVBC80lX
0GxHcQf/ez6DQIB2UzdcaZhNK+qTO/5Ub80/5h0dAEvGW6cTVB1UH44slklwFh6N
F25gkr7fKuBzJNI4y8FcXD+joQX/KwT9cYrV2nbKP1pY9CEpOJK1c0hi7vq6tqtJ
2p956b9NDteEi0oNRusQyC0C+Wrtch5WzLUXedJgiqQk9YWfasQmUlvurCe7Z7Kl
3bM8IggXMOOjdqNBBh3qdSdozZIwWk6jCC92nLOzM3PA1i1wEFQY4ZkcciYc8XXg
rVvm0xpO0wjZ6boEN118aajiguhdMcN1PXVzX2hiCnOvqnokYISRo8HoBiDe+KYb
7d68k2PuTTacj7zuiq2KWmg3KeJuWw==
=FgvM
-----END PGP SIGNATURE-----

--Sig_/bZa23S7X0eEOjYpMr4pLIK_--
