From: Boaz Harrosh <bharrosh-C4P08NqkoRlBDgjK7y7TUQ@public.gmane.org>
Subject: ore: FIX breakage when MISC_FILESYSTEMS is not set
Date: Mon, 28 Nov 2011 16:13:03 -0800
Message-ID: <4ED4238F.4090407@panasas.com>
References: <20111124174358.d88f11c0ff700e5e6b3bf73b@canb.auug.org.au> <4ECE91F3.9010007@xenotime.net> <4ED422CC.60706@panasas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4ED422CC.60706-C4P08NqkoRlBDgjK7y7TUQ@public.gmane.org>
Sender: linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>, Trond Myklebust <Trond.Myklebust-HgOvQuBEEgTQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benny Halevy <bhalevy-4/WYdZTkCtzQT0dZR+AlfA@public.gmane.org>, Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>, NFS list <linux-nfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open-osd <osd-dev-yNzVSZO3znNg9hUCZPvPmw@public.gmane.org>
List-Id: linux-next.vger.kernel.org


As Reported by Randy Dunlap

When MISC_FILESYSTEMS is not enabled:

fs/built-in.o: In function `objio_alloc_io_state':
objio_osd.c:(.text+0xcb525): undefined reference to `ore_get_rw_state'
fs/built-in.o: In function `_write_done':
objio_osd.c:(.text+0xcb58d): undefined reference to `ore_check_io'
fs/built-in.o: In function `_read_done':
...

When MISC_FILESYSTEMS, which is more of a GUI thing then anything else,
is not selected. exofs/Kconfig is never examined during Kconfig,
and it can not do it's magic stuff to automatically select everything
needed.

The solution is to force all users of ORE (exofs, nfs) to manually
select everything auto-magically selected before.

(This is  why it is a bad idea to put libraries in random parts of
 the tree)

Reported-by: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Signed-off-by: Boaz Harrosh <bharrosh-C4P08NqkoRlBDgjK7y7TUQ@public.gmane.org>
---
 fs/exofs/Kconfig |   17 +++++++++--------
 fs/nfs/Kconfig   |    2 ++
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/fs/exofs/Kconfig b/fs/exofs/Kconfig
index da42f32..6b05d99 100644
--- a/fs/exofs/Kconfig
+++ b/fs/exofs/Kconfig
@@ -1,17 +1,18 @@
-# Note ORE needs to "select ASYNC_XOR". So Not to force multiple selects
-# for every ORE user we do it like this. Any user should add itself here
-# at the "depends on EXOFS_FS || ..." with an ||. The dependencies are
-# selected here, and we default to "ON". So in effect it is like been
-# selected by any of the users.
+# ORE - Objects Raid Engine (libore.ko)
+# This library needs to be selected by it's users for example the below EXOFS
+# filesystem.
+# All users must do:
+#	depends on SCSI_OSD_ULD
+#	select ASYNC_XOR
+#	select ORE
 config ORE
 	tristate
-	depends on EXOFS_FS || PNFS_OBJLAYOUT
-	select ASYNC_XOR
-	default SCSI_OSD_ULD
 
 config EXOFS_FS
 	tristate "exofs: OSD based file system support"
 	depends on SCSI_OSD_ULD
+	select ASYNC_XOR
+	select ORE
 	help
 	  EXOFS is a file system that uses an OSD storage device,
 	  as its backing storage.
diff --git a/fs/nfs/Kconfig b/fs/nfs/Kconfig
index dbcd821..3708d76 100644
--- a/fs/nfs/Kconfig
+++ b/fs/nfs/Kconfig
@@ -96,6 +96,8 @@ config PNFS_BLOCK
 config PNFS_OBJLAYOUT
 	tristate
 	depends on NFS_FS && NFS_V4_1 && SCSI_OSD_ULD
+	select ASYNC_XOR
+	select ORE
 	default m
 
 config ROOT_NFS
-- 
1.7.6.4


--
To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
