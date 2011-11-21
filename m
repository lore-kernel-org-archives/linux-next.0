From: Alessandro Rubini <rubini@gnudd.com>
Subject: [PATCH] debugfs: bugfix: include <linux/io.h> in file.c
Date: Mon, 21 Nov 2011 10:01:40 +0100
Message-ID: <20111121090140.GA17821@mail.gnudd.com>
References: <20111121125703.fbb955c4fc468ba176086168@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20111121125703.fbb955c4fc468ba176086168@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au
Cc: greg@kroah.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

The regs32 machinery uses readl. I forgot the mandatory include
and the code was not compiling on all archs.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Alessandro Rubini <rubini@gnudd.com>
---

> After merging the driver-core tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> fs/debugfs/file.c: In function 'debugfs_print_regs32':
> fs/debugfs/file.c:560:7: error: implicit declaration of function 'readl' [-
> Werror=implicit-function-declaration]

I'm learning the lesson. I'll be more careful next time.
Sorry for your patience.

/alessandro

 fs/debugfs/file.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
index fc98ec9..e0a3a59 100644
--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -19,6 +19,7 @@
 #include <linux/pagemap.h>
 #include <linux/namei.h>
 #include <linux/debugfs.h>
+#include <linux/io.h>
 
 static ssize_t default_read_file(struct file *file, char __user *buf,
 				 size_t count, loff_t *ppos)
-- 
1.6.0.2
