From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the akpm tree
Date: Wed, 10 Aug 2011 12:13:08 +1000
Message-ID: <20110810121308.0f591a8972f0ba454545224a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Will Drewry <wad@chromium.org>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

After merging the akpm tree, today's linux-next build (lost of them)
produced this warning:

WARNING: init/mounts.o(.text+0x192): Section mismatch in reference from the function devt_from_partuuid() to the variable .init.data:root_wait
The function devt_from_partuuid() references
the variable __initdata root_wait.
This is often because devt_from_partuuid lacks a __initdata 
annotation or the annotation of root_wait is wrong.

Commit 185237e4cfab ("This patch makes two changes:"
init-add-root=partuuid=uuid-partnroff=%d-support-update.patch) adds the
reference to root_wait from the non-init function devt_from_partuuid().

The easiest thing to do is to remove __init_date from root_wait.

I have applied this patch as a merge fixup for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 10 Aug 2011 12:09:35 +1000
Subject: [PATCH] do_mounts: remove __init_data from root_wait

as it is now used from a non init routine.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 init/do_mounts.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/init/do_mounts.c b/init/do_mounts.c
index bcbeca7..0f6e1d9 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -28,7 +28,7 @@ int __initdata rd_doload;	/* 1 = load RAM disk, 0 = don't load */
 int root_mountflags = MS_RDONLY | MS_SILENT;
 static char * __initdata root_device_name;
 static char __initdata saved_root_name[64];
-static int __initdata root_wait;
+static int root_wait;
 
 dev_t ROOT_DEV;
 
-- 
1.7.5.4

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
