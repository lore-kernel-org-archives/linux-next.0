From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: Tree for August 13
Date: Wed, 13 Aug 2008 14:08:11 +0100
Message-ID: <20080813140811.030bb766@lxorguk.ukuu.org.uk>
References: <20080813172452.14b0775c.sfr@canb.auug.org.au>
	<s5h7ial9nvm.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:40961 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752557AbYHMNZ4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 13 Aug 2008 09:25:56 -0400
In-Reply-To: <s5h7ial9nvm.wl%tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

> When re-starting X, it complains that it cannot change to VT7.
> Via strace, 

Does this fix it

@@ -838,6 +839,7 @@ static int copy_signal(unsigned long clone_flags, struct task_struct *tsk)
 void __cleanup_signal(struct signal_struct *sig)
 {
 	exit_thread_group_keys(sig);
+	tty_kref_put(sig->tty);
 	kmem_cache_free(signal_cachep, sig);
 }
 
