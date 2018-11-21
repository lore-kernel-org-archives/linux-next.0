From: Leon Romanovsky <leon@kernel.org>
Subject: Re: linux-next: manual merge of the mlx5-next tree with the rdma tree
Date: Wed, 21 Nov 2018 09:16:27 +0200
Message-ID: <20181121071627.GA7276@mtr-leonro.mtl.com>
References: <20181121110432.64a379f7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181121110432.64a379f7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sagi Grimberg <sagi@grimberg.me>, Saeed Mahameed <saeedm@mellanox.com>
List-Id: linux-next.vger.kernel.org


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 21, 2018 at 11:04:32AM +1100, Stephen Rothwell wrote:
> Hi Leon,
>
> Today's linux-next merge of the mlx5-next tree got a conflict in:
>
>   drivers/infiniband/hw/mlx5/main.c
>
> between commit:
>
>   9afc97c29b03 ("mlx5: remove support for ib_get_vector_affinity")
>
> from the rdma tree and commit:
>
>   f2f3df550139 ("net/mlx5: EQ, Privatize eq_table and friends")
>
> from the mlx5-next tree.
>
> I fixed it up (the former removed some of the code modified by the latter)
> and can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.
>

Thanks Stephen,

You are absolutely right, the removal is correct.

>
>
> --
> Cheers,
> Stephen Rothwell



--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJb9QZLAAoJEORje4g2clinzt0P/RLWoZPvwtl5H2/YEPjCiDCu
K62avmczxvSU67MW5FTE7Ks/0nE9yd+WIWYIydqWxg3dXMbYn8N0vlaN385i20kW
8DLrOsjILysS81fUHK8wZCc553oUKp+qpwMTY4ly/3JvMo3vofe1VTMUQsAJ160A
vAFU9vyFea4YfhYnL9bHwNuXjsJLye4zy8Vp8r3tiHfuYk2HNX8R8oniNo9hyy8u
75oZNegT15fIRqG8zucv+qcyFmuzvNX2LrN3econSKnnE12feqrO7aSTU0nuactO
WNzRjJjwIazkoOufp/pFYAL+7gvlaQKt+abHA7wlmXuKNF5E/Yk4pndWdtzuCjdK
3IDoyS9HWGvG1MY/v/wzOTDChOImH8Z8pXlSzMhx0FNcTavn3ELkSXfwlFOFiTpe
i7JojUWY3wLdRuQMa81Spwwr7qhSmu9A8kOGomPUoagRLmDhNrb421Pj+KeBcHgK
Jlot/hsdOThFHZB7eFT3Jt1qix+RlqzP0qo0wxFy/196LfHpZemx1hanCXmRjQbz
kzA3+5ZGe3fREAMf2T1+sW9fiiwh7MJ0ofXIJaMH7hIR/qo2ckH7xDyIrg9cLACd
aTB3ehdywdgWXmLYXi/g9QsS+NiKai7uox44QSCOajFh1937bgwIQ6IIFurBZjdL
gnvjr9Av3DtZDrG0l7Wq
=MGL3
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
