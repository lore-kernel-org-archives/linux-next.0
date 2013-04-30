From: David Rientjes <rientjes@google.com>
Subject: Re: [PATCH -next] proc_fs.h: fix build error when PROC_FS is not
 enabled
Date: Tue, 30 Apr 2013 09:36:58 -0700 (PDT)
Message-ID: <alpine.DEB.2.02.1304300935290.31619@chino.kir.corp.google.com>
References: <20130429191754.8ee71fb814790bf345516ab8@canb.auug.org.au> <517E9A49.5080106@infradead.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-da0-f47.google.com ([209.85.210.47]:55866 "EHLO
	mail-da0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760840Ab3D3QhB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 30 Apr 2013 12:37:01 -0400
Received: by mail-da0-f47.google.com with SMTP id p1so318241dad.6
        for <linux-next@vger.kernel.org>; Tue, 30 Apr 2013 09:37:00 -0700 (PDT)
In-Reply-To: <517E9A49.5080106@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Al Viro <viro@zeniv.linux.org.uk>

On Mon, 29 Apr 2013, Randy Dunlap wrote:

> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix build error when CONFIG_PROC_FS is not enabled:
> (remove duplicated line)
> 
> include/linux/proc_fs.h:58:20: error: redefinition of 'proc_set_size'
> include/linux/proc_fs.h:51:20: note: previous definition of 'proc_set_size' was here
> 

I get more than that on linux-next:

include/linux/proc_fs.h:58:20: error: redefinition of 'proc_set_size'
include/linux/proc_fs.h:51:20: note: previous definition of 'proc_set_size' was here
include/linux/proc_fs.h: In function 'proc_net_mkdir':
include/linux/proc_fs.h:69:2: error: implicit declaration of function 'proc_mkdir_data' [-Werror=implicit-function-declaration]
include/linux/proc_fs.h:69:2: warning: return makes pointer from integer without a cast [enabled by default]

so don't we need to do this instead?

diff --git a/include/linux/proc_fs.h b/include/linux/proc_fs.h
--- a/include/linux/proc_fs.h
+++ b/include/linux/proc_fs.h
@@ -21,7 +21,6 @@ extern struct proc_dir_entry *proc_mkdir_data(const char *, umode_t,
 					      struct proc_dir_entry *, void *);
 extern struct proc_dir_entry *proc_mkdir_mode(const char *, umode_t,
 					      struct proc_dir_entry *);
- 
 extern struct proc_dir_entry *proc_create_data(const char *, umode_t,
 					       struct proc_dir_entry *,
 					       const struct file_operations *,
@@ -52,10 +51,11 @@ static inline void proc_set_size(struct proc_dir_entry *de, loff_t size) {}
 static inline void proc_set_user(struct proc_dir_entry *de, kuid_t uid, kgid_t gid) {}
 static inline void *proc_get_parent_data(const struct inode *inode) { return NULL; }
 
+static inline struct proc_dir_entry *proc_mkdir_data(const char *name, umode_t mode,
+	struct proc_dir_entry *parent, void *data) { return NULL; }
 static inline struct proc_dir_entry *proc_create_data(const char *name,
 	umode_t mode, struct proc_dir_entry *parent,
 	const struct file_operations *proc_fops, void *data) { return NULL; }
-static inline void proc_set_size(struct proc_dir_entry *de, loff_t size) {}
 
 static inline void proc_remove(struct proc_dir_entry *de) {}
 static inline void remove_proc_entry(const char *name, struct proc_dir_entry *parent) {}
