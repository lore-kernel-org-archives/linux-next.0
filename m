From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the rdma tree
Date: Thu, 25 Jan 2018 18:22:59 +1100
Message-ID: <20180125182259.047e0c52@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bart Van Assche <bart.vanassche@wdc.com>
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the rdma tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: "init_rcu_head" [drivers/infiniband/ulp/srpt/ib_srpt.ko] undefined!

Caused by commit

  a11253142e6d ("IB/srpt: Rework multi-channel support")

I have used the rdma tree from next-20180119 for today.

-- 
Cheers,
Stephen Rothwell
