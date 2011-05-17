From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] proc_fs: add stub for proc_mkdir_mode
Date: Tue, 17 May 2011 12:31:53 -0700
Message-ID: <20110517123153.6fed984d.randy.dunlap@oracle.com>
References: <20110517142749.8927b65b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110517142749.8927b65b.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Alexey Dobriyan <adobriyan@gmail.com>, akpm <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-wireless@vger.kernel.org
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Provide a stub for proc_mkdir_mode() when CONFIG_PROC_FS is not
enabled, just like the stub for proc_mkdir().

Fixes this build error:
drivers/net/wireless/airo.c:4504: error: implicit declaration of function 'proc_mkdir_mode'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 include/linux/proc_fs.h |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20110517.orig/include/linux/proc_fs.h
+++ linux-next-20110517/include/linux/proc_fs.h
@@ -210,6 +210,8 @@ static inline struct proc_dir_entry *pro
 		struct proc_dir_entry *parent,const char *dest) {return NULL;}
 static inline struct proc_dir_entry *proc_mkdir(const char *name,
 	struct proc_dir_entry *parent) {return NULL;}
+static inline struct proc_dir_entry *proc_mkdir_mode(const char *name,
+	mode_t mode, struct proc_dir_entry *parent) { return NULL; }
 
 static inline struct proc_dir_entry *create_proc_read_entry(const char *name,
 	mode_t mode, struct proc_dir_entry *base, 
