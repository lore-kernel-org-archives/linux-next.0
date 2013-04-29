From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH -next] tty.h: fix build errors when PROC_FS is not enabled
Date: Mon, 29 Apr 2013 09:05:35 -0700
Message-ID: <517E9A4F.1080609@infradead.org>
References: <20130429191754.8ee71fb814790bf345516ab8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130429191754.8ee71fb814790bf345516ab8@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix build error when CONFIG_PROC_FS is not enabled:

include/linux/tty.h: In function 'proc_tty_register_driver':
include/linux/tty.h:698:52: error: parameter name omitted
include/linux/tty.h: In function 'proc_tty_unregister_driver':
include/linux/tty.h:699:54: error: parameter name omitted

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 include/linux/tty.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20130429.orig/include/linux/tty.h
+++ linux-next-20130429/include/linux/tty.h
@@ -695,8 +695,8 @@ do {									\
 extern void proc_tty_register_driver(struct tty_driver *);
 extern void proc_tty_unregister_driver(struct tty_driver *);
 #else
-static inline void proc_tty_register_driver(struct tty_driver *) {}
-static inline void proc_tty_unregister_driver(struct tty_driver *) {}
+static inline void proc_tty_register_driver(struct tty_driver *d) {}
+static inline void proc_tty_unregister_driver(struct tty_driver *d) {}
 #endif
 
 #endif
