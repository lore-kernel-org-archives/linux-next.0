From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the vhost tree
Date: Thu, 30 Mar 2017 15:25:58 +1100
Message-ID: <20170330152558.6c7d5261@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Michael,

After merging the vhost tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/remoteproc/remoteproc_virtio.c: In function 'rproc_virtio_find_vqs':
drivers/remoteproc/remoteproc_virtio.c:148:9: error: 'ctx' undeclared (first use in this function)
         ctx ? ctx[i] : false);
         ^

Caused by commit

  a965e977a103 ("virtio: add context flag to find vqs")

I have used the vhost tree from next-20170329 for today.

-- 
Cheers,
Stephen Rothwell
