From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: linux-next: manual merge of the rdma tree with the rdma-fixes
 tree
Date: Tue, 16 Jan 2018 20:03:29 -0700
Message-ID: <20180117030329.GC15750@mellanox.com>
References: <20180117125145.731ba88b@canb.auug.org.au>
 <20180117125537.06e46610@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180117125537.06e46610@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Doug Ledford <dledford@redhat.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Jurgens <danielj@mellanox.com>, Leon Romanovsky <leon@kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Jan 17, 2018 at 12:55:37PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Wed, 17 Jan 2018 12:51:45 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > diff --cc drivers/infiniband/hw/mlx5/qp.c
> > index cffe5966aef9,ae36db3d0deb..000000000000
> > +++ b/drivers/infiniband/hw/mlx5/qp.c
> > @@@ -4361,12 -4674,12 +4674,11 @@@ static void to_rdma_ah_attr(struct mlx5
> >   
> >   	memset(ah_attr, 0, sizeof(*ah_attr));
> >   
> > - 	if (!path->port || path->port > MLX5_CAP_GEN(dev, num_ports))
> >  -	ah_attr->type = rdma_ah_find_type(&ibdev->ib_dev, path->port);
> >  -	rdma_ah_set_port_num(ah_attr, path->port);
> >  -	if (rdma_ah_get_port_num(ah_attr) == 0 ||
> >  -	    rdma_ah_get_port_num(ah_attr) > ibdev->num_ports)
> > ++	if (!path->port || path->port > ibdev->num_ports))
> 
> I fixed up the extra ')'.  Sorry about that,

Thanks, this looks correct to me, and the conflict was expected..

Jason
