From: Or Gerlitz <gerlitz.or@gmail.com>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Thu, 20 Dec 2018 08:54:25 +0200
Message-ID: <CAJ3xEMiiRLCerdvOikn=xMqw+-Yu=UEm-YhdSMyXtCDzte0kcA@mail.gmail.com>
References: <20181220130744.1c8db488@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181220130744.1c8db488@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Gavi Teitz <gavi@mellanox.com>, Or Gerlitz <ogerlitz@mellanox.com>, Saeed Mahameed <saeedm@mellanox.com>
List-Id: linux-next.vger.kernel.org

On Thu, Dec 20, 2018 at 4:47 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the net-next tree got a conflict in:
>
>   drivers/net/ethernet/mellanox/mlx5/core/en_rep.c
>
> between commit:
>
>   8956f0014ea5 ("net/mlx5e: Fix default amount of channels for VF representors")
>
> from the net tree and commit:
>
>   d9ee0491c2ff ("net/mlx5e: Use dedicated uplink vport netdev representor")
>
> from the net-next tree.
>
> I fixed it up (I just used the net-next tree version) and can carry the
> fix as necessary.  [..]

Yes, this is correct, thanks!
