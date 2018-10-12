From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Fri, 12 Oct 2018 11:10:55 +1100
Message-ID: <20181012111055.31eaf9f3@canb.auug.org.au>
References: <20181012105329.40678d21@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/rz2Y5V4nJVSwrBhq8yt2=5f"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181012105329.40678d21@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/rz2Y5V4nJVSwrBhq8yt2=5f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 12 Oct 2018 10:53:29 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the net-next tree got a conflict in:
>=20
>   net/rxrpc/input.c
>=20
> between commit:
>=20
>   5271953cad31 ("rxrpc: Use the UDP encap_rcv hook")
>=20
> from the net tree and commit:
>=20
>   d2944b1c66a5 ("rxrpc: Use rxrpc_free_skb() rather than rxrpc_lose_skb()=
")
>=20
> from the net-next tree.
>=20
> I fixed it up (I used the net tree version) and can carry the fix as

Just to be clear, I did not use the whole file from the net tree, just
the net tree version of the conflicting hunks.  There are other non
conflicting changes on both sides.

--=20
Cheers,
Stephen Rothwell

--Sig_/rz2Y5V4nJVSwrBhq8yt2=5f
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu/5o8ACgkQAVBC80lX
0GwRmQf+JCNu33Ov5fRwh0OUyduXN4JjiHqv7lG5yWtbjcGo9J+l7eFCiOyMTSyf
lbiXPAZY3jBELlZoWT8N7bfTN0JSYykNK0Gy+Z/9i0ya0h/PHLYyttEahSoCDGFf
BHFe+Y6P9JmGhr0vqmY9N1JB5ys1qOwmbygYbrfDrytkDnwng+nlI7R+U0Qe/lK7
nRoWp6TVKPw2si2q4BS3yNbBdyuxrAB4h1a/BiDsXH77Irej+xhN+CNSX5IEOjqN
tu1UOrZYjaK2lHjdMBrlG5+vN59TJC0XUbn92QkDf3VUKUd9jnQITaDtYyJLKFqk
+nSXXAgjE+PlNkyOHqXIQwfe9aF0Zw==
=Ddtc
-----END PGP SIGNATURE-----

--Sig_/rz2Y5V4nJVSwrBhq8yt2=5f--
