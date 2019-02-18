From: Leon Romanovsky <leonro@mellanox.com>
Subject: Re: linux-next: manual merge of the net-next tree with the rdma tree
Date: Mon, 18 Feb 2019 10:48:54 +0000
Message-ID: <20190218104852.GC16218@mtr-leonro.mtl.com>
References: <20190218110549.7f22feda@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="jq0ap7NbKX2Kqbes"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190218110549.7f22feda@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Bloch <markb@mellanox.com>, Bodong Wang <bodong@mellanox.com>, Saeed Mahameed <saeedm@mellanox.com>
List-Id: linux-next.vger.kernel.org

--jq0ap7NbKX2Kqbes
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 18, 2019 at 11:05:49AM +1100, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the net-next tree got a conflict in:
>
>   drivers/infiniband/hw/mlx5/ib_rep.c
>
> between commits:
>
>   459cc69fa4c1 ("RDMA: Provide safe ib_alloc_device() function")
>   fc9e4477f924 ("RDMA/mlx5: Fix memory leak in case we fail to add an IB device")
>
> from the rdma tree and commit:
>
>   f0666f1f22b5 ("IB/mlx5: Use unified register/load function for uplink and VF vports")
>
> from the net-next tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>

Thanks a lot for your resolution.

--jq0ap7NbKX2Kqbes
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJcao2UAAoJEORje4g2clinTmYQALOnHgN4H8CEH+WZnZ43pELw
XDp2l3IYkBSoHC9kzLoTnEsX2rtyD4nnrwYF6C8oHe2tW9jQ2IpGXdlenqEg+4IM
HjR5oJLFd1m15NWSvo+epdOoLCHQdr9OhrlrdiF1vfyRD0iLeDZt+xSBuscEcFKx
M5VTRVbFfdSBmqxCniqvWcf4v3yOwl5VORseOkN1Ml9oTZoy0MR86CL6m01cBTA0
N9H8bcBEyNmcDit7v5r0d2hogfvPBogtJbi9kAyfQDNCxBS07q5cmT7o2HGP80Ct
8U04olT0kokFtMZKImEJ9HFPrFxyqOMB3RH/TlYDUCesQhVbfE1RnIbWWepsZ6lm
cmDC2vM00aS9TXeh8EyDW+vqBrsMjIRRqXEcZ8fxAJW9pS/LHDf4t2LrhQYbnqbl
ttpeZjOAAbbgpYkWMBPSWm/2CiN0MncdcIFzC7JCJ6SlvjlFNQNpLt3JHvOU3OQh
Nfn4ov2W2WroISbTxIT/A007qJeeck4snPYpCk29Dw45jsTzKkGVfV8qJusmj+uy
mUa3taDe/uwVvV3bRSiXH4mjIHAAQD6PojtFrZEhR0TSRWeI48U6hT0uQ5WNyyzj
N6h49KIdnGFaR0D3dtmOVerBdXeMq9FPW/b7m8Wxp4fWxH7CH7lztcoJLF6S1vr0
jLVcoYoEz4nbjNaF5TcD
=NaCP
-----END PGP SIGNATURE-----

--jq0ap7NbKX2Kqbes--
