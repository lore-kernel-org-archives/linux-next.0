From: Doug Ledford <dledford@redhat.com>
Subject: Re: linux-next: manual merge of the rdma-fixes tree with Linus' tree
Date: Mon, 29 Apr 2019 18:21:32 -0400
Message-ID: <16bb268f0b5b62d71cc65204bccea856333b87d8.camel@redhat.com>
References: <20190430081346.3196b60f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-kTp3XO4XHgKUZmRW43En"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190430081346.3196b60f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Leon Romanovsky <leonro@mellanox.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Linus Torvalds <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org


--=-kTp3XO4XHgKUZmRW43En
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-04-30 at 08:13 +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the rdma-fixes tree got a conflict in:
>=20
>   drivers/infiniband/core/uverbs_main.c
>=20
> between commit:
>=20
>   6a5c5d26c4c6 ("rdma: fix build errors on s390 and MIPS due to bad ZERO_=
PAGE use")
>=20
> from Linus' tree and commit:
>=20
>   d79a26b99f5f ("RDMA/uverbs: Fix compilation error on s390 and mips plat=
forms")
>=20
> from the rdma-fixes tree.
>=20
> I fixed it up (I just used the version from Linus' tree) and can carry th=
e
> fix as necessary. This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.
>=20

Sorry, I forgot to back that head commit out.  Once Linus committed his
fix the one in the rdma tree was superfluous (and wrong anyway).

--=20
Doug Ledford <dledford@redhat.com>
    GPG KeyID: B826A3330E572FDD
    Key fingerprint =3D AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FDD

--=-kTp3XO4XHgKUZmRW43En
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEErmsb2hIrI7QmWxJ0uCajMw5XL90FAlzHeOwACgkQuCajMw5X
L93igA//bArimttUT9ZAcK4JA+fRqDSS+4dcaQMFk9Oh32EFWRwse525YYSz3s7Q
8jPpVpZezM2gJ5Pt8ue7/6uXDkRJbOyQw6rlIe/pEvZ5M3UsSdXM3+m5BKyViCPP
HlGQQVbYspvZNPSJhriogtY+vNMBxBYngRqCNpwEJzF52fSGA/OF+aXkM/Qy20/B
+FORwCCVq7QQTWYdkW/qAbI+PicPGnow2NGo+ghXyxYifU8L0TKzEmAd5xvZOJmj
HW7c1KvQKcDtATPDrsLVziyrmozq+2NvoDfaBdSq/IRMcw4pSgbgCO0UKaYBvb9o
X27TTQRP+JNcDVzgBhKNvZZhWZYhGo40nGnOgfaFiCwIHl7Dl102NP5cN5eHldwL
QR/X/IZC8yL6E8CUe8IJdi01EHJPD86m8zg0oqNI6IAjqFuuWm+JGIJ4R/7iwOPp
C1SG1taStDvpziwcXFXhpn3ayKQcjbNAJwMFqZCAjIYs4CFSiZBrGe2FjzATnrE1
HqmX1kXl18B93R0C1DOecC/3Xaih7YjyeQ0VYkfpP063ju0dXYNNSg2AqnstWWWK
o985i9l1YQ0IkxvkzOo8VggMmlwy+kf2HMoiRZaXyMnyYEG1QFxYyPp1Ugfw12o5
+OmrkpnjyLrFcBf/P8ZV+EhNg2szlTYuBLLzoGQuQydyU9kk0qM=
=PsyW
-----END PGP SIGNATURE-----

--=-kTp3XO4XHgKUZmRW43En--
