From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Thu, 7 Feb 2019 19:36:20 +0100
Message-ID: <20190207183620.7h4i4fdl4g7kgkjz@salvia>
References: <20190207115425.61c3708a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190207115425.61c3708a@canb.auug.org.au>
Sender: netdev-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guy Shattah <sguy@mellanox.com>, Saeed Mahameed <saeedm@mellanox.com>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Thu, Feb 07, 2019 at 11:54:24AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the net-next tree got a conflict in:
> 
>   drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
> 
> between commit:
> 
>   1651925d403e ("net/mlx5e: Use the inner headers to determine tc/pedit offload limitation on decap flows")
> 
> from the net tree and commit:
> 
>   738678817573 ("drivers: net: use flow action infrastructure")
> 
> from the net-next tree.

This conflict resolution when merging net into net-next looks good to me.

Thanks.
