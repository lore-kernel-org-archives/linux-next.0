From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the nfsd tree
Date: Mon, 29 Oct 2018 12:21:21 +1100
Message-ID: <20181029122121.7758fed4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/JwbZf_S2Jf4g9Wdt8hUZGPH"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>, "J. Bruce Fields" <bfields@fieldses.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, Trond Myklebust <trondmy@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/JwbZf_S2Jf4g9Wdt8hUZGPH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in:

  net/sunrpc/svcsock.c

between commit:

  64dbf4dc5496 ("SUNRPC: Simplify TCP receive code")

from the nfsd tree and commit:

  aa563d7bca6e ("iov_iter: Separate type from direction and use accessor fu=
nctions")

from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc net/sunrpc/svcsock.c
index 3b525accaa68,0b46ec0bf74e..000000000000
--- a/net/sunrpc/svcsock.c
+++ b/net/sunrpc/svcsock.c
@@@ -336,12 -338,8 +336,12 @@@ static ssize_t svc_recvfrom(struct svc_
  	rqstp->rq_xprt_hlen =3D 0;
 =20
  	clear_bit(XPT_DATA, &svsk->sk_xprt.xpt_flags);
- 	iov_iter_kvec(&msg.msg_iter, READ | ITER_KVEC, iov, nr, buflen);
+ 	iov_iter_kvec(&msg.msg_iter, READ, iov, nr, buflen);
 -	len =3D sock_recvmsg(svsk->sk_sock, &msg, msg.msg_flags);
 +	if (base !=3D 0) {
 +		iov_iter_advance(&msg.msg_iter, base);
 +		buflen -=3D base;
 +	}
 +	len =3D sock_recvmsg(svsk->sk_sock, &msg, MSG_DONTWAIT);
  	/* If we read a full record, then assume there may be more
  	 * data to read (stream based sockets only!)
  	 */

--Sig_/JwbZf_S2Jf4g9Wdt8hUZGPH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvWYJEACgkQAVBC80lX
0GwsyAf9HrTAWirnIzF0M1o5QLWkmRqa+ZH08+xp6fuKg76SAQwNKxtPU2V6bGsI
q8IjXiAwxSOksrhA5Uk4TgW62pTN8leXi2afJ4bb3WaRVJ1agLC96KzFi8U7dbXG
fN++soXaSSSIy4mp/szKUi2/jDG+zAlIOhVS4vv+6qD54qKGAdVLnX8bAwadqMm5
ReKDJEV7zqG9hIU4zTra/OvSbFogzHh4RdEkGIyBjuy8sH91YyZda3AUd0b8pPtn
4AKJVxqJr2AmajwVQEObdqhvOV23EphlbmQztP9QwpTt1ZHrfVaX2mSCZH7VzqwJ
kB9ySaVHj3V9DGcVFLz7zZgz2cd+9Q==
=BQDe
-----END PGP SIGNATURE-----

--Sig_/JwbZf_S2Jf4g9Wdt8hUZGPH--
