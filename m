From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the net-next tree
Date: Mon, 4 Feb 2019 10:44:27 +1100
Message-ID: <20190204104427.0c0da12d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/C9aL6jcq7mIw1XNb2++WJs3"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Deepa Dinamani <deepa.kernel@gmail.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Kees Cook <keescook@chromium.org>
List-Id: linux-next.vger.kernel.org

--Sig_/C9aL6jcq7mIw1XNb2++WJs3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

net/core/sock.c: In function 'sock_setsockopt':
net/core/sock.c:914:3: warning: this statement may fall through [-Wimplicit=
-fallthrough=3D]
   sock_set_flag(sk, SOCK_TSTAMP_NEW);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
net/core/sock.c:915:2: note: here
  case SO_TIMESTAMPING_OLD:
  ^~~~

Introduced by commit

  9718475e6908 ("socket: Add SO_TIMESTAMPING_NEW")

I get this warning because I am building with -Wimplicit-fallthrough
in attempt to catch new additions early.  The gcc warning can be turned
off by adding a /* fall through */ comment at the point the fall through
happens (assuming that the fall through is intentional).

--=20
Cheers,
Stephen Rothwell

--Sig_/C9aL6jcq7mIw1XNb2++WJs3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxXfNsACgkQAVBC80lX
0Gz0Uwf9FnoKSsHxIa47p9mNaxkWAOdMvaoCj4Ug9JusbzXgaM7Y5WVePkXrrYmx
TOPQila3eDKRURwlfJiZoQVPC9ZqRTuY8+3/EnN+FV+B8i19BN7NESITZoCoTSgm
ACFDqjDCW42YpEJQ/Anv2p0yEbGVc0V681XmKnlhUzShndsuhacKtG70hgUOJano
O2fsmzaX+9ttYGW8vIUbqucrD2M52THSZBWTkmZHz+HkJNOh4+MzBdfGijILxqvO
cAXOGR3O8gfAzsV1tc6f+C2BEz9SXFAgGZhIV3+uSVllpb48yltOuVTP2wF7EGc3
BI9w0nRZWxu92MC3WmfEgTuQzlEmsQ==
=NpVH
-----END PGP SIGNATURE-----

--Sig_/C9aL6jcq7mIw1XNb2++WJs3--
