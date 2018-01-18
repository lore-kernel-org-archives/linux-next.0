From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the net-next tree
Date: Thu, 18 Jan 2018 12:20:34 +1100
Message-ID: <20180118122034.22baa9bc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jiri Pirko <jiri@mellanox.com>
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the net-next tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

net/sched/cls_api.c: In function 'tc_dump_tfilter':
net/sched/cls_api.c:1362:8: warning: 'parent' may be used uninitialized in this function [-Wmaybe-uninitialized]
   if (!tcf_chain_dump(chain, q, parent, skb, cb,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         index_start, &index))
         ~~~~~~~~~~~~~~~~~~~~

Probably introduced by commit

  7960d1daf278 ("net: sched: use block index as a handle instead of qdisc when block is shared")

-- 
Cheers,
Stephen Rothwell
