From: Harvey Harrison <harvey.harrison@gmail.com>
Subject: [PATCH 2/2] net: tun.c fix cast
Date: Wed, 16 Jul 2008 12:45:34 -0700
Message-ID: <1216237534.28841.18.camel@brick>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-net-owner@vger.kernel.org>
Sender: linux-net-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, "rusty@rustcorp.com.au" <rusty@rustcorp.com.au>
Cc: linux-next <linux-next@vger.kernel.org>, linux-net <linux-net@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Signed-off-by: Harvey Harrison <harvey.harrison@gmail.com>
---
Appeared between next-20080715->next-20080716

 drivers/net/tun.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index d1fa746..2b0ae61 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -908,7 +908,7 @@ static int tun_chr_ioctl(struct inode *inode, struct file *file,
 		if ((tun->flags & TUN_TYPE_MASK) != TUN_TAP_DEV)
 			return -EINVAL;
 		rtnl_lock();
-		ret = update_filter(&tun->txflt, (void *) __user arg);
+		ret = update_filter(&tun->txflt, (void __user *)arg);
 		rtnl_unlock();
 		return ret;
 
-- 
1.5.6.3.499.geae9

