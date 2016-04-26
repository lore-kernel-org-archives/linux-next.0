From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Tue, 26 Apr 2016 16:48:44 -0400 (EDT)
Message-ID: <alpine.LFD.2.20.1604261603310.5091@knanqh.ubzr>
References: <20160426133812.366dc031@canb.auug.org.au> <571F6D59.8040402@suse.cz> <v3THaCMkCzylcv3TJavAje@videotron.ca> <alpine.LFD.2.20.1604261037410.5091@knanqh.ubzr> <20160427011825.06c64502@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qk0-f172.google.com ([209.85.220.172]:35738 "EHLO
	mail-qk0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752216AbcDZUst (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 26 Apr 2016 16:48:49 -0400
Received: by mail-qk0-f172.google.com with SMTP id q76so9628348qke.2
        for <linux-next@vger.kernel.org>; Tue, 26 Apr 2016 13:48:48 -0700 (PDT)
In-Reply-To: <20160427011825.06c64502@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Michal Marek <mmarek@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, Randy Dunlap <rdunlap@infradead.org>

On Wed, 27 Apr 2016, Stephen Rothwell wrote:

> Hi Nicolas,
> 
> On Tue, 26 Apr 2016 10:40:57 -0400 (EDT) Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
> >
> > If you can reproduce this build failure, could you try a make mrproper 
> > and attempt it again?  I, too, would like to find an explanation and a 
> > way to reproduce.
> 
> I reset my build tree to commit 9d67df654092 ("Merge remote-tracking
> branch 'block/for-next'") and the build failed with:
> 
> ERROR: ".local_clock" [drivers/vhost/vhost_net.ko] undefined!
> ERROR: ".local_clock" [drivers/misc/cxl/cxl.ko] undefined!
> 
> :-(
> 
> So I did a "make mrproper" and did the build again.
> 
> That built correctly.
> 
[...]

OK!  After digging and diffing through 750 megabytes of make debug logs 
I finally found the explanation.  The if_changed directive is useless 
against phony targets.

@Stephen: could you replace the revert with the patch below in your tree?

@Michal: could you fold the patch below into commit 2441e78b19 in your tree?

diff --git a/Makefile b/Makefile
index ca46af5cc0..3a7b9a93b2 100644
--- a/Makefile
+++ b/Makefile
@@ -953,7 +953,7 @@ include/generated/autoksyms.h: FORCE
       cmd_link-vmlinux = $(CONFIG_SHELL) $< $(LD) $(LDFLAGS) $(LDFLAGS_vmlinux)
 quiet_cmd_link-vmlinux = LINK    $@
 
-vmlinux: scripts/link-vmlinux.sh vmlinux_prereq FORCE
+vmlinux: scripts/link-vmlinux.sh vmlinux_prereq $(vmlinux-deps) FORCE
 	+$(call if_changed,link-vmlinux)
 
 # Build samples along the rest of the kernel
