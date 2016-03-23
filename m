From: Leon Romanovsky <leon@leon.nu>
Subject: Re: linux-next: Tree for Mar 23 (infiniband: mlx5)
Date: Wed, 23 Mar 2016 20:13:50 +0200
Message-ID: <20160323181350.GA11949@leon.nu>
References: <20160323132208.54ba0c1a@canb.auug.org.au>
 <56F2D1CB.8080600@infradead.org>
Reply-To: leon@leon.nu
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:38766 "EHLO
	mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756221AbcCWSOB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 23 Mar 2016 14:14:01 -0400
Received: by mail-wm0-f47.google.com with SMTP id l68so35126773wml.1
        for <linux-next@vger.kernel.org>; Wed, 23 Mar 2016 11:14:00 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <56F2D1CB.8080600@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, Matan Barak <matanb@mellanox.com>, Leon Romanovsky <leonro@mellanox.com>

On Wed, Mar 23, 2016 at 10:26:35AM -0700, Randy Dunlap wrote:
> On 03/22/16 19:22, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Please do not add any v4.7 related material to your linux-next included
> > trees until after v4.6-rc1 is released.
> > 
> > Changes since 20160322:
> > 
> 
> on i386 or x86_64:
> 
> ../drivers/infiniband/hw/mlx5/main.c: In function 'mlx5_ib_add':
> ../drivers/infiniband/hw/mlx5/main.c:2358:31: error: 'mlx5_ib_get_vf_config' undeclared (first use in this function)
>    dev->ib_dev.get_vf_config = mlx5_ib_get_vf_config;
>                                ^
> ../drivers/infiniband/hw/mlx5/main.c:2358:31: note: each undeclared identifier is reported only once for each function it appears in
> ../drivers/infiniband/hw/mlx5/main.c:2359:35: error: 'mlx5_ib_set_vf_link_state' undeclared (first use in this function)
>    dev->ib_dev.set_vf_link_state = mlx5_ib_set_vf_link_state;
>                                    ^
> ../drivers/infiniband/hw/mlx5/main.c:2360:30: error: 'mlx5_ib_get_vf_stats' undeclared (first use in this function)
>    dev->ib_dev.get_vf_stats = mlx5_ib_get_vf_stats;
>                               ^
> ../drivers/infiniband/hw/mlx5/main.c:2361:30: error: 'mlx5_ib_set_vf_guid' undeclared (first use in this function)
>    dev->ib_dev.set_vf_guid  = mlx5_ib_set_vf_guid;

This commit [1] fixes the issue.
for any reasons the functions were declared under #ifdef
CONFIG_INFINIBAND_ON_DEMAND_PAGING protection.

[1] https://lkml.org/lkml/2016/3/23/132
>                               ^
> 
> 
> 
> -- 
> ~Randy
> --
> To unsubscribe from this list: send the line "unsubscribe linux-rdma" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
