From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build warning after merge of the net-next tree
Date: Sat, 07 Jul 2018 20:30:16 +0900 (KST)
Message-ID: <20180707.203016.623173685153821356.davem@davemloft.net>
References: <20180706095633.676b0229@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180706095633.676b0229@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, moshe@mellanox.com, jiri@mellanox.com
List-Id: linux-next.vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 6 Jul 2018 09:56:33 +1000

> Hi all,
> 
> After merging the net-next tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> In file included from include/net/dsa.h:24:0,
>                  from include/linux/platform_data/b53.h:23,
>                  from drivers/net/dsa/b53/b53_spi.c:25:
> include/net/devlink.h: In function 'devlink_param_value_changed':
> include/net/devlink.h:771:9: warning: 'return' with a value, in function returning void
>   return -EOPNOTSUPP;
>          ^
> include/net/devlink.h:769:1: note: declared here
>  devlink_param_value_changed(struct devlink *devlink, u32 param_id)
 ...
> Introduced by commit
> 
>   ea601e170988 ("devlink: Add devlink notifications support for params")

Thanks Stephen, this should be fixes now.
