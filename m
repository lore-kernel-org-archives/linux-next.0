From: Or Gerlitz <gerlitz.or@gmail.com>
Subject: Re: linux-next: build failure after merge of the net-next tree
Date: Fri, 19 Oct 2018 08:48:00 +0300
Message-ID: <CAJ3xEMjgaWC=QrrgLGoXBd6ahwi3tbEbSfBoso+FFp1uB6dy5A@mail.gmail.com>
References: <20181019111805.28860f73@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181019111805.28860f73@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Linux Netdev List <netdev@vger.kernel.org>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, linux-next <linux-next@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Mark Bloch <markb@mellanox.com>, Leon Romanovsky <leonro@mellanox.com>, Paul Blakey <paulb@mellanox.com>, Saeed Mahameed <saeedm@mellanox.com>
List-Id: linux-next.vger.kernel.org

On Fri, Oct 19, 2018 at 3:19 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the net-next tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/infiniband/hw/mlx5/flow.c: In function 'mlx5_ib_handler_MLX5_IB_METHOD_CREATE_FLOW':
> drivers/infiniband/hw/mlx5/flow.c:163:12: error: 'struct mlx5_flow_act' has no member named 'has_flow_tag'; did you mean 'flow_tag'?
>    flow_act.has_flow_tag = true;
>             ^~~~~~~~~~~~
>             flow_tag
>
> Caused by commit
>
>   d5634fee245f ("net/mlx5: Add a no-append flow insertion mode")
>
> interacting with commit
>
>   ba4a41198324 ("RDMA/mlx5: Add support for flow tag to raw create flow")
>
> from the rdma tree.
>
> I have applied the following merge fix patch for today:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 19 Oct 2018 11:10:39 +1100
> Subject: [PATCH] net/mlx5: fix up for has_flow_tag changing to a flag
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/infiniband/hw/mlx5/flow.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/infiniband/hw/mlx5/flow.c b/drivers/infiniband/hw/mlx5/flow.c
> index e57435cb6d96..f86cdcafdafc 100644
> --- a/drivers/infiniband/hw/mlx5/flow.c
> +++ b/drivers/infiniband/hw/mlx5/flow.c
> @@ -160,7 +160,7 @@ static int UVERBS_HANDLER(MLX5_IB_METHOD_CREATE_FLOW)(
>                         ret = -EINVAL;
>                         goto err_out;
>                 }
> -               flow_act.has_flow_tag = true;
> +               flow_act.flags |= FLOW_ACT_HAS_TAG;
>         }
>
>         flow_handler = mlx5_ib_raw_fs_rule_add(dev, fs_matcher, &flow_act,


yeah, this is the correct resolution, thanks for addressing!
