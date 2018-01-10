From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the net-next tree
Date: Wed, 10 Jan 2018 15:06:14 +1100
Message-ID: <20180110150614.3fb5d9f1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59071 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965124AbeAJEGR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 9 Jan 2018 23:06:17 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jason Wang <jasowang@redhat.com>

Hi all,

After merging the net-next tree, today's linux-next build (sparc64
defconfig) failed like this:

net/socket.o: In function `tun_xdp_to_ptr':
(.text+0x3180): multiple definition of `tun_xdp_to_ptr'
fs/compat_ioctl.o:compat_ioctl.c:(.text+0x0): first defined here
net/socket.o: In function `tun_ptr_to_xdp':
(.text+0x31a0): multiple definition of `tun_ptr_to_xdp'
fs/compat_ioctl.o:compat_ioctl.c:(.text+0x20): first defined here

Caused by commit

  fc72d1d54dd9 ("tuntap: XDP transmission")

I applied the following fix for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 10 Jan 2018 15:01:41 +1100
Subject: [PATCH] tuntap: fix for "tuntap: XDP transmission"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/if_tun.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/if_tun.h b/include/linux/if_tun.h
index 08e66827ad8e..c5b0a75a7812 100644
--- a/include/linux/if_tun.h
+++ b/include/linux/if_tun.h
@@ -42,11 +42,11 @@ static inline bool tun_is_xdp_buff(void *ptr)
 {
 	return false;
 }
-void *tun_xdp_to_ptr(void *ptr)
+static inline void *tun_xdp_to_ptr(void *ptr)
 {
 	return NULL;
 }
-void *tun_ptr_to_xdp(void *ptr)
+static inline void *tun_ptr_to_xdp(void *ptr)
 {
 	return NULL;
 }
-- 
2.15.1




-- 
Cheers,
Stephen Rothwell
