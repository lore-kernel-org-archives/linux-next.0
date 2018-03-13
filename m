From: Petr Machata <petrm@mellanox.com>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Tue, 13 Mar 2018 12:41:46 +0200
Message-ID: <wihtvtkjlzp.fsf@dev-r-vrt-156.mtr.labs.mlnx>
References: <20180313112941.7971ba0c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180313112941.7971ba0c@canb.auug.org.au> (Stephen Rothwell's
        message of "Tue, 13 Mar 2018 11:29:41 +1100")
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Today's linux-next merge of the net-next tree got conflicts in:
>
>   drivers/net/ethernet/mellanox/mlxsw/spectrum.h
>   drivers/net/ethernet/mellanox/mlxsw/spectrum.c
>
> between commit:
>
>   663f1b26f9c1 ("mlxsw: spectrum: Prevent duplicate mirrors")
>
> from the net tree and commit:
>
>   a629ef210d89 ("mlxsw: spectrum: Move SPAN code to separate module")
>
> from the net-next tree.
>
> I fixed it up

Looks good.

Thanks,
Petr
