From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: build failure after merge of the vfs tree
Date: Mon, 29 Oct 2018 09:21:20 +0000
Message-ID: <5183.1540804880@warthog.procyon.org.uk>
References: <20181029200620.75f71e94@canb.auug.org.au> <20180910133525.28c5dd20@canb.auug.org.au> <20181029153334.7c8d16cc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181029200620.75f71e94@canb.auug.org.au>
Content-ID: <5182.1540804880.1@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, Al Viro <viro@ZenIV.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

I think these changes should cover them all.

David
---
diff --git a/samples/vfs/test-fs-query.c b/samples/vfs/test-fs-query.c
index 511541d12b9e..4635bf1eb3d4 100644
--- a/samples/vfs/test-fs-query.c
+++ b/samples/vfs/test-fs-query.c
@@ -27,6 +27,13 @@
 #include <linux/socket.h>
 #include <sys/stat.h>
 
+#ifndef __NR_fsopen
+#define __NR_fsopen -1
+#endif
+#ifndef __NR_fsinfo
+#define __NR_fsinfo -1
+#endif
+
 static int fsopen(const char *fs_name, unsigned int flags)
 {
 	return syscall(__NR_fsopen, fs_name, flags);
diff --git a/samples/vfs/test-fsinfo.c b/samples/vfs/test-fsinfo.c
index 75f5c2a61445..125010212eee 100644
--- a/samples/vfs/test-fsinfo.c
+++ b/samples/vfs/test-fsinfo.c
@@ -28,6 +28,10 @@
 #include <sys/stat.h>
 #include <arpa/inet.h>
 
+#ifndef __NR_fsinfo
+#define __NR_fsinfo -1
+#endif
+
 static bool debug = 0;
 
 static __attribute__((unused))
diff --git a/samples/vfs/test-statx.c b/samples/vfs/test-statx.c
index 9ac4b7707aba..4ef0c914a62a 100644
--- a/samples/vfs/test-statx.c
+++ b/samples/vfs/test-statx.c
@@ -161,7 +161,8 @@ static void dump_statx(struct statx *stx)
 			"?dai?c??"	/*  7- 0	0x00000000-000000ff */
 			;
 
-		printf("Attributes: %016llx (", stx->stx_attributes);
+		printf("Attributes: %016llx (",
+		       (unsigned long long)stx->stx_attributes);
 		for (byte = 64 - 8; byte >= 0; byte -= 8) {
 			bits = stx->stx_attributes >> byte;
 			mbits = stx->stx_attributes_mask >> byte;
