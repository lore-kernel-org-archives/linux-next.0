From: Leon Romanovsky <leon@kernel.org>
Subject: Re: linux-next: manual merge of the rdma tree with the net tree
Date: Mon, 15 Jan 2018 14:24:11 +0200
Message-ID: <20180115122411.GA15760@mtr-leonro.local>
References: <20180115115321.1d1abc11@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="RUh7Gb6wQL2PrpWP"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180115115321.1d1abc11@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eran Ben Elisha <eranbe@mellanox.com>, Saeed Mahameed <saeedm@mellanox.com>, Eugenia Emantayev <eugenia@mellanox.com>, Mark Bloch <markb@mellanox.com>
List-Id: linux-next.vger.kernel.org


--RUh7Gb6wQL2PrpWP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 15, 2018 at 11:53:21AM +1100, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the rdma tree got a conflict in:
>
>   drivers/infiniband/hw/mlx5/main.c
>
> between commits:
>
>   8978cc921fc7 ("{net,ib}/mlx5: Don't disable local loopback multicast traffic when needed")
>   72f36be06138 ("net/mlx5: Fix mlx5_get_uars_page to return error code")
>
> from the net tree and commits:
>
>   16c1975f1032 ("IB/mlx5: Create profile infrastructure to add and remove stages")
>   c8b8992446a9 ("IB/mlx5: Move loopback initialization to the corresponding stage")
>
> from the rdma tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>

Thanks, Stephen.
It looks right to me.

--RUh7Gb6wQL2PrpWP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEkhr/r4Op1/04yqaB5GN7iDZyWKcFAlpcnWsACgkQ5GN7iDZy
WKf5Lg/9Hxtq8ei4jBInbhSAP9bXsiikHHBFf14y8Wp9BfbBzye3J/klvJUAw2LV
QmxLYufVJUng5z9r0RLmywPTpuSjJpYl4X0aAAJ7GdAl0z6BOIA/5DM3eBzS++Z2
jUmjeDeCRP3hDJbPFT/t99aQa8xJNg570koKLswFUf4gaaexptUmcDV1FjxJtcEM
6qK8tC6xWIgyBOTihJPA1YAgEoJrfASEhp9IbjpUhVCnaG/49dbO2NPzWGr56Oe9
3pjv6bIUJlDcj045zCtbSyaSRRckcjOo+OeH8hr5ZGlPbRsT5OfgX5EcFm1ZZWcR
zp+zUYUPf6owoF+eDjj6qVccCNhyy2LAxIRaemGl6vk1RDTbVXZ2Aw7xScVFayuB
wNYmhhw0vjF7URZzwWqt/GgawfRJYvW4Filqf8DBc5MPr+VasL5c5GL5gmZQRoIh
YxQSbsonl0Cy8tlipT04iUSpuekO3Uhsj3Wmkzcj1grmt+TDsmDVki5Vp7po+eT6
yWlVvUU2/Njay8pHLsH1s0ednYzwEk3NcGSoQiXIJk4uWnkMb0hWI4PoHa4fKsPk
W0zQEpZGwgjMvz9xpBLjBOxdLU9but1wbgBftM1c7HVP0cHi+TUzI3YaeoXL5dX1
0SxPBGhu7c0GssukXNEPc0nqZo4S1ugUaacsexpLb39QoDJzHi4=
=sbJ4
-----END PGP SIGNATURE-----

--RUh7Gb6wQL2PrpWP--
