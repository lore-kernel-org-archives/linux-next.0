From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH -next] alpha: fix link error re stacktrace
Date: Mon, 9 Feb 2009 23:39:45 +0100
Message-ID: <20090209223945.GA11841@elte.hu>
References: <20090209193908.1a448944.sfr@canb.auug.org.au> <20090209213836.GA9492@x200.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:53963 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752491AbZBIWj5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 9 Feb 2009 17:39:57 -0500
Content-Disposition: inline
In-Reply-To: <20090209213836.GA9492@x200.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, acme@redhat.com


* Alexey Dobriyan <adobriyan@gmail.com> wrote:

> Please, fold this into 32c0bd9624115041cfec31c0436995418083090a
> "blktrace: the ftrace interface needs CONFIG_TRACING"
> to fix link error on alpha (which doesn't implenent stacktrace support)
> 
> --- a/block/Kconfig
> +++ b/block/Kconfig
> @@ -51,7 +51,7 @@ config BLK_DEV_IO_TRACE
>  	select DEBUG_FS
>  	select TRACEPOINTS
>  	select TRACING
> -	select STACKTRACE
> +	select STACKTRACE if STACKTRACE_SUPPORT
>  	help
>  	  Say Y here if you want to be able to trace the block layer actions
>  	  on a given queue. Tracing allows you to see any traffic happening

This didnt apply to the latest tracing tree due to other, interacting changes - i 
have applied the commit below - thanks Alexey!

	Ingo

----------------->
>From 510223da040cb7a7d6f524b12eeed03b3845aea1 Mon Sep 17 00:00:00 2001
From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 10 Feb 2009 00:38:36 +0300
Subject: [PATCH] alpha: fix link error re stacktrace

Fix link error on alpha (which doesn't implenent stacktrace support).

Signed-off-by: Ingo Molnar <mingo@elte.hu>
---
 kernel/trace/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index 3a33128..79be773 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -310,7 +310,7 @@ config BLK_DEV_IO_TRACE
 	select DEBUG_FS
 	select TRACEPOINTS
 	select TRACING
-	select STACKTRACE
+	select STACKTRACE if STACKTRACE_SUPPORT
 	help
 	  Say Y here if you want to be able to trace the block layer actions
 	  on a given queue. Tracing allows you to see any traffic happening
