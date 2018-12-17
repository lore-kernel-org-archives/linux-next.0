From: Saeed Mahameed <saeedm@dev.mellanox.co.il>
Subject: Re: linux-next: manual merge of the rdma tree with the net tree
Date: Mon, 17 Dec 2018 13:24:03 -0800
Message-ID: <CALzJLG84yL5DQy20YdXa09WGFrR+5wYpO=YGmaoVGMueoJ-_pw@mail.gmail.com>
References: <20181217110810.64c69fb7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181217110810.64c69fb7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vu Pham <vu@mellanox.com>, Gal Pressman <pressmangal@gmail.com>
List-Id: linux-next.vger.kernel.org

On Sun, Dec 16, 2018 at 4:08 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the rdma tree got a conflict in:
>
>   include/linux/mlx5/mlx5_ifc.h
>
> between commit:
>
>   663f146f2ecf ("net/mlx5: E-Switch, Fix fdb cap bits swap")
>
> from the net tree and commit:
>
>   c74d90c11c05 ("net/mlx5: Fix offsets of ifc reserved fields")
>
> from the rdma tree.
>
> I fixed it up (I just used the net tree version) and can carry the fix

Yes this is the correct resolution.

> as necessary. This is now fixed as far as linux-next is concerned, but
> any non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Dave was already notified about this merge conflict.
This conflict will go away once Dave merges net with net-next, and
linux-next of rdma merge with net-next
will not have this problem.

Thanks,
Saeed.

>
> --
> Cheers,
> Stephen Rothwell
