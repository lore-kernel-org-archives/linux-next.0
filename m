From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: next-2008-12-04: ubifs section fixlet
Date: Thu, 4 Dec 2008 17:04:18 +0300
Message-ID: <20081204140418.GB13953@x200.localdomain>
References: <20081204200745.eff0ac87.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ug-out-1314.google.com ([66.249.92.171]:6613 "EHLO
	ug-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751148AbYLDOAG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Dec 2008 09:00:06 -0500
Received: by ug-out-1314.google.com with SMTP id 39so3774617ugf.37
        for <linux-next@vger.kernel.org>; Thu, 04 Dec 2008 06:00:04 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20081204200745.eff0ac87.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Artem.Bityutskiy@nokia.com

Please, fold into 552ff3179d1e93a3e982357544c059f3e9a5516e
aka "UBIFS: add debugfs support":

WARNING: fs/ubifs/ubifs.o(.init.text+0xec): Section mismatch in reference from the function init_module() to the function .exit.text:ubifs_compressors_exit()

--- a/fs/ubifs/compress.c
+++ b/fs/ubifs/compress.c
@@ -244,7 +244,7 @@ out_lzo:
 /**
  * ubifs_compressors_exit - de-initialize UBIFS compressors.
  */
-void __exit ubifs_compressors_exit(void)
+void ubifs_compressors_exit(void)
 {
 	compr_exit(&lzo_compr);
 	compr_exit(&zlib_compr);
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index e658b06..055c6b5 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1700,7 +1700,7 @@ long ubifs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg);
 
 /* compressor.c */
 int __init ubifs_compressors_init(void);
-void __exit ubifs_compressors_exit(void);
+void ubifs_compressors_exit(void);
 void ubifs_compress(const void *in_buf, int in_len, void *out_buf, int *out_len,
 		    int *compr_type);
 int ubifs_decompress(const void *buf, int len, void *out, int *out_len,
