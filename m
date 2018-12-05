From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the rdma tree
Date: Thu, 6 Dec 2018 09:58:15 +1100
Message-ID: <20181206095815.6e814057@canb.auug.org.au>
References: <20181204114731.48b18bfc@canb.auug.org.au>
        <20181204015247.GR12288@mellanox.com>
        <AM0PR05MB533192C82AA04E89004251A1C7A80@AM0PR05MB5331.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/5Ab73ZpnT+cYVFrA54Iz_/Q"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM0PR05MB533192C82AA04E89004251A1C7A80@AM0PR05MB5331.eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Guy Levi(SW)" <guyle@mellanox.com>
Cc: Jason Gunthorpe <jgg@mellanox.com>, Doug Ledford <dledford@redhat.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Majd Dibbiny <majd@mellanox.com>, Leon Romanovsky <leonro@mellanox.com>, Changbin Du <changbin.du@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
List-Id: linux-next.vger.kernel.org

--Sig_/5Ab73ZpnT+cYVFrA54Iz_/Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Guy,

On Wed, 5 Dec 2018 12:25:57 +0000 "Guy Levi(SW)" <guyle@mellanox.com> wrote:
>
> >=20
> > Huh. So apparently every compiler that tested this patch (0-day, mine,
> > the submitters) optimized this call away because is_atomic_response()
> > always returns 0: meaning mlx5_get_atomic_laddr is never callable and
> > can be deleted entirely, including the call to mlx5_get_send_wqe.
> >=20
> > Not sure what compiler setup will hit this, but it is clearly wrong
> > code.. =20
>=20
> Flag -o0  ?

No, but the kbuild tree contains a change that allows turning off of
gcc's autoinlining and the CONFIG option guarding that gets turned on
for allmodconfig builds among others.

Masahiro, should CONFIG_NO_AUTO_INLINE maybe need to be off unless
explicitly enabled (like CONFIG_DEBUG_INFO and others)?

--=20
Cheers,
Stephen Rothwell

--Sig_/5Ab73ZpnT+cYVFrA54Iz_/Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwIWAcACgkQAVBC80lX
0Gxe3Qf9HENVqAcv4gfugjd3DGVnBI8YGNjVCcY4Sr2FmgDhz6I5kEyhafsBDjIf
Na4JTAJtcpI61N4HPUnO27DRiMJRqy1NJb2PRzGw6LRzDv5qWusd8IJe/JLrUr7i
XcK55bPzwiVSfIWJqeJQ45RKOFs4P7XOaJbiShdH1ojUmCAqDSrMsqgCCM3zrFz2
SDCzoAPsY7jtTvZ+VCr1AOCHc6Cq42Yt56h5m/3dXAxClgV1fLtIVudNdumjBrD0
baW655RGtacqRiqxF03QVHhnRP8FUyzZ1qEiirJAM8GSSO1Wf/RwkGYFENEx2r6y
vV/oa2/jIF/Qf3kHsCNyGHp4mV7xRg==
=p1vQ
-----END PGP SIGNATURE-----

--Sig_/5Ab73ZpnT+cYVFrA54Iz_/Q--
