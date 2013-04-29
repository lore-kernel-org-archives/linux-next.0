From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH -next] proc_fs.h: fix build error when PROC_FS is not enabled
Date: Mon, 29 Apr 2013 09:05:29 -0700
Message-ID: <517E9A49.5080106@infradead.org>
References: <20130429191754.8ee71fb814790bf345516ab8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:54849 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757256Ab3D2QF4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 29 Apr 2013 12:05:56 -0400
In-Reply-To: <20130429191754.8ee71fb814790bf345516ab8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Al Viro <viro@zeniv.linux.org.uk>

From: Randy Dunlap <rdunlap@infradead.org>

Fix build error when CONFIG_PROC_FS is not enabled:
(remove duplicated line)

include/linux/proc_fs.h:58:20: error: redefinition of 'proc_set_size'
include/linux/proc_fs.h:51:20: note: previous definition of 'proc_set_size' was here

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 include/linux/proc_fs.h |    1 -
 1 file changed, 1 deletion(-)

--- linux-next-20130429.orig/include/linux/proc_fs.h
+++ linux-next-20130429/include/linux/proc_fs.h
@@ -55,7 +55,6 @@ static inline void *proc_get_parent_data
 static inline struct proc_dir_entry *proc_create_data(const char *name,
 	umode_t mode, struct proc_dir_entry *parent,
 	const struct file_operations *proc_fops, void *data) { return NULL; }
-static inline void proc_set_size(struct proc_dir_entry *de, loff_t size) {}
 
 static inline void proc_remove(struct proc_dir_entry *de) {}
 static inline void remove_proc_entry(const char *name, struct proc_dir_entry *parent) {}
