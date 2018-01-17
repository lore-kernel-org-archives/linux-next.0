From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the rdma tree with the rdma-fixes
 tree
Date: Wed, 17 Jan 2018 12:55:37 +1100
Message-ID: <20180117125537.06e46610@canb.auug.org.au>
References: <20180117125145.731ba88b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180117125145.731ba88b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Jurgens <danielj@mellanox.com>, Leon Romanovsky <leon@kernel.org>
List-Id: linux-next.vger.kernel.org

Hi all,

On Wed, 17 Jan 2018 12:51:45 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> diff --cc drivers/infiniband/hw/mlx5/qp.c
> index cffe5966aef9,ae36db3d0deb..000000000000
> --- a/drivers/infiniband/hw/mlx5/qp.c
> +++ b/drivers/infiniband/hw/mlx5/qp.c
> @@@ -4361,12 -4674,12 +4674,11 @@@ static void to_rdma_ah_attr(struct mlx5
>   
>   	memset(ah_attr, 0, sizeof(*ah_attr));
>   
> - 	if (!path->port || path->port > MLX5_CAP_GEN(dev, num_ports))
>  -	ah_attr->type = rdma_ah_find_type(&ibdev->ib_dev, path->port);
>  -	rdma_ah_set_port_num(ah_attr, path->port);
>  -	if (rdma_ah_get_port_num(ah_attr) == 0 ||
>  -	    rdma_ah_get_port_num(ah_attr) > ibdev->num_ports)
> ++	if (!path->port || path->port > ibdev->num_ports))

I fixed up the extra ')'.  Sorry about that,

-- 
Cheers,
Stephen Rothwell
