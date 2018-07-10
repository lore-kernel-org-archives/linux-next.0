From: Leon Romanovsky <leonro@mellanox.com>
Subject: Re: linux-next: manual merge of the rdma tree with the rdma-fixes
 tree
Date: Tue, 10 Jul 2018 08:19:33 +0300
Message-ID: <20180710051933.GM3014@mtr-leonro.mtl.com>
References: <20180710111740.5f345088@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="W1G4cAX3lNqeBRc9"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180710111740.5f345088@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--W1G4cAX3lNqeBRc9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 10, 2018 at 11:17:40AM +1000, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the rdma tree got a conflict in:
>
>   drivers/infiniband/core/uverbs_cmd.c
>
> between commit:
>
>   4fae7f170416 ("RDMA/uverbs: Fix slab-out-of-bounds in ib_uverbs_ex_create_flow")
>
> from the rdma-fixes tree and commit:
>
>   2cc1e3b80942 ("IB/uverbs: Replace file->ucontext with file in uverbs_cmd.c")
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

Thanks Stephen, Looks good.

--W1G4cAX3lNqeBRc9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJbREHlAAoJEORje4g2clinnfoQAMji/2el6Ih7MaASVtQVqUaG
HG0fX390+Mm3eBit3E/RlNE8h7igZodEi857vR1bZPhumNbTW6XULzXxM8g7s2qK
Zy7wUq4xSTjgPrylyYiPu+kEDmWbXsbBbeOwyPPWbCQ9SNI57+D0IYz+Idr7ViIZ
yRURHbrjZaNwgeA1ez3TEABCnYBYkidNkALlDVV0K22jDuhVEKc25cM6QDwEkGmF
k36o9g5C0YKN04eAmiHiCv633xEy+VBG0psTTmuZ91PdYv5B9ufMythU2ac7WVK0
4YacmjHbVQLPEhJZ9wFF8ob3d5lsM3EGZdsnO8pTFRTs7184xHC47aflLwguyRpE
truyMBwnOQBrohpd3rCsm3N9l+uf2cE6oG/VF12ZIKfgyelhrq1pRoLLvuoygoa9
6EG01/cxV6Ba46Fs1xF8wAmnkTN+vkvpFZDnzBR4fsuvCTKmb8th07+tvN+sTRQN
Rrzwra9h6UujHHRZOhAoUCKPeEdX0P71LYPdh0GtK4LzJwgQ5h1ZtfOaVfyhvDF4
AV5EnMvJaJdnZrlPPOlbdnnF+UbLiQoBG8jesgaWJVv2NHrzZ4bhEGonQUv6tAtQ
bj2GQ9lspb/ci/POEdcX1uqoY/yRDsJwjhy2Km3wdZTuFnaHIi9259A++RZ1s0vv
3mnWoiY1tYe4ndARmTAJ
=tZj6
-----END PGP SIGNATURE-----

--W1G4cAX3lNqeBRc9--
