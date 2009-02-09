From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: [PATCH -next] alpha: fix link error re stacktrace
Date: Tue, 10 Feb 2009 00:38:36 +0300
Message-ID: <20090209213836.GA9492@x200.localdomain>
References: <20090209193908.1a448944.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.155]:11052 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754186AbZBIVc3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 9 Feb 2009 16:32:29 -0500
Received: by fg-out-1718.google.com with SMTP id 16so1156152fgg.17
        for <linux-next@vger.kernel.org>; Mon, 09 Feb 2009 13:32:27 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20090209193908.1a448944.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, mingo@elte.hu
Cc: linux-next@vger.kernel.org, acme@redhat.com

Please, fold this into 32c0bd9624115041cfec31c0436995418083090a
"blktrace: the ftrace interface needs CONFIG_TRACING"
to fix link error on alpha (which doesn't implenent stacktrace support)

--- a/block/Kconfig
+++ b/block/Kconfig
@@ -51,7 +51,7 @@ config BLK_DEV_IO_TRACE
 	select DEBUG_FS
 	select TRACEPOINTS
 	select TRACING
-	select STACKTRACE
+	select STACKTRACE if STACKTRACE_SUPPORT
 	help
 	  Say Y here if you want to be able to trace the block layer actions
 	  on a given queue. Tracing allows you to see any traffic happening
