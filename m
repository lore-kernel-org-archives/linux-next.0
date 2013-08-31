From: Ian Kent <raven@themaw.net>
Subject: [PATCH 09/10] autofs - update fs/autofs4/Makefile
Date: Sat, 31 Aug 2013 19:43:07 +0800
Message-ID: <20130831114307.11807.68114.stgit@perseus.themaw.net>
References: <20130831114133.11807.35953.stgit@perseus.themaw.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130831114133.11807.35953.stgit@perseus.themaw.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-next@vger.kernel.org
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>, autofs mailing list <autofs@vger.kernel.org>, Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Update Makefile to build from source in fs/autofs instead of
fs/autofs4.

Signed-off-by: Ian Kent <raven@themaw.net>
---
 fs/autofs4/Makefile |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/autofs4/Makefile b/fs/autofs4/Makefile
index a811c1f..417dd72 100644
--- a/fs/autofs4/Makefile
+++ b/fs/autofs4/Makefile
@@ -4,4 +4,6 @@
 
 obj-$(CONFIG_AUTOFS4_FS) += autofs4.o
 
-autofs4-objs := init.o inode.o root.o symlink.o waitq.o expire.o dev-ioctl.o
+autofs4-objs := ../autofs/init.o ../autofs/inode.o ../autofs/root.o \
+	../autofs/symlink.o ../autofs/waitq.o ../autofs/expire.o \
+	../autofs/dev-ioctl.o
