From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the rdma-leon tree
Date: Wed, 4 Jan 2017 11:27:18 +1100
Message-ID: <20170104112718.0f73458e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Leon Romanovsky <leon@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Majd Dibbiny <majd@mellanox.com>, Kamal Heib <kamalh@mellanox.com>
List-Id: linux-next.vger.kernel.org

Hi Leon,

After merging the rdma-leon tree, today's linux-next build (x86_64
allmodconfig build) failed like this:

In file included from include/linux/swab.h:4:0,
                 from include/uapi/linux/byteorder/little_endian.h:12,
                 from include/linux/byteorder/little_endian.h:4,
                 from arch/x86/include/uapi/asm/byteorder.h:4,
                 from include/asm-generic/bitops/le.h:5,
                 from arch/x86/include/asm/bitops.h:517,
                 from include/linux/bitops.h:36,
                 from include/linux/kernel.h:10,
                 from include/linux/list.h:8,
                 from include/linux/module.h:9,
                 from drivers/infiniband/hw/mlx5/qp.c:33:
drivers/infiniband/hw/mlx5/qp.c: In function 'mlx5_ib_modify_wq':
drivers/infiniband/hw/mlx5/qp.c:4910:48: error: 'struct mlx5_ib_port' has no member named 'q_cnt_id'
    MLX5_SET(rqc, rqc, counter_set_id, dev->port->q_cnt_id);
                                                ^
include/uapi/linux/swab.h:113:54: note: in definition of macro '__swab32'
 #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                      ^
include/linux/byteorder/generic.h:93:21: note: in expansion of macro '__cpu_to_be32'
 #define cpu_to_be32 __cpu_to_be32  
                     ^
drivers/infiniband/hw/mlx5/qp.c:4910:4: note: in expansion of macro 'MLX5_SET'
    MLX5_SET(rqc, rqc, counter_set_id, dev->port->q_cnt_id);
    ^

Caused by commit

  cbd0624cc927 ("IB/mlx5: Expose Q counters groups only when they are supported by FW")

interacting with commit

  fbcb2b5c3749 ("B/mlx5: Add port counter support for Receive WQs")

This needed to be fixed up in the merge commit

  3064f9066da1 ("Merge branch 'topic/q_counters' into rdma-next")

I have dropped the rdma-leon tree again for today.

-- 
Cheers,
Stephen Rothwell
