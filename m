From: Leon Romanovsky <leonro@mellanox.com>
Subject: Re: linux-next: manual merge of the rdma tree with the rdma-fixes
 tree
Date: Wed, 27 Jun 2018 08:50:01 +0300
Message-ID: <20180627055001.GI30877@mtr-leonro.mtl.com>
References: <20180627100726.0092e8b7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ZJcv+A0YCCLh2VIg"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180627100726.0092e8b7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--ZJcv+A0YCCLh2VIg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 27, 2018 at 10:07:26AM +1000, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the rdma tree got a conflict in:
>
>   drivers/infiniband/core/uverbs_cmd.c
>
> between commit:
>
>   940efcc8889f ("RDMA/uverbs: Protect from attempts to create flows on unsupported QP")
>
> from the rdma-fixes tree and commit:
>
>   e99028ad76e7 ("RDMA/uverbs: Check existence of create_flow callback")
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
> diff --cc drivers/infiniband/core/uverbs_cmd.c
> index 87ffeebc0b28,5fc14fde274c..000000000000
> --- a/drivers/infiniband/core/uverbs_cmd.c
> +++ b/drivers/infiniband/core/uverbs_cmd.c
> @@@ -3559,11 -3554,11 +3554,16 @@@ int ib_uverbs_ex_create_flow(struct ib_
>   		goto err_uobj;
>   	}
>
>  +	if (qp->qp_type != IB_QPT_UD && qp->qp_type != IB_QPT_RAW_PACKET) {
>  +		err = -EINVAL;
>  +		goto err_put;
>  +	}
>  +
> + 	if (!qp->device->create_flow) {
> + 		err = -EOPNOTSUPP;
> + 		goto err_put;
> + 	}
> +

Thanks Stephen, looks good.

>   	flow_attr = kzalloc(struct_size(flow_attr, flows,
>   				cmd.flow_attr.num_of_specs), GFP_KERNEL);
>   	if (!flow_attr) {



--ZJcv+A0YCCLh2VIg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJbMyWJAAoJEORje4g2clinkT8P/ArcUH7f8+w+Z1u3JZa0K9Ib
sUX9gS4YDPl/Jkov/wVW8S/cwGLRyCvrN177r4/LOGMJri1l2V4PmP53Gutet9oI
bBbbdcJ9jvghW3acD+2lzGhddqe8mk6psmjPMh6qK4QP7B7/mO2NxcBUeF3hK8eU
lal2JbBcMsaLgGWsQ0UrrL4X3zWtLEPgawSwDQjn+dDcs9m6OL8a+Vm1Ayw3VHLU
wObpB+20f4fq7dCHKKSG2TvBvotptUNCh8QwdSxYipDWFEBBYJOcGfdSj4aI199/
aozp7hGTD8953VKTcHVnDQcczVE7iovzfd3mHNGVEV+Jy6VaJe2H+JZR9YTE1Vke
87SvtyTLQIgMwR3BHqBMtcrZglndzFEzQ3JRJHl1cOPZ4G002KyKld6A0YWP0Tsr
HADhhjUMpiu5PvGOaBzzl0PBprkFbhaouQvlAlhGosdNvi0wuG3pUsKJUzSvVWzn
TbvmvODagbDxpUI4wm8BJm5Mkn6JVcbXxpXuxXsdYJgxwICS4FvZpPDFVdaF8x0l
mNhjj/qwT0aEr1I2VpNLiXPIoVxQEFawAVhNKpZU37qd9GVE+ZyPUHc6vneM+AXf
JrFhcHiw9z1218gNYxSxCnMtDEQj3urnfzuqYzEsr7hqOLFkzPz2T4Y5Swd/8fKN
XcFskSwW60LlHM+hp4E0
=k306
-----END PGP SIGNATURE-----

--ZJcv+A0YCCLh2VIg--
