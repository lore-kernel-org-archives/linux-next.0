From: Jiri Slaby <jslaby@suse.cz>
Subject: Re: linux-next: manual merge of the tty tree with the tty.current
 tree
Date: Fri, 18 Nov 2011 09:41:15 +0100
Message-ID: <4EC61A2B.5060501@suse.cz>
References: <20111118143010.4a6c9eb17b86d24b9ebe706b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:50989 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752158Ab1KRIlT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 18 Nov 2011 03:41:19 -0500
In-Reply-To: <20111118143010.4a6c9eb17b86d24b9ebe706b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Young <dyoung@redhat.com>, Jiri Slaby <jirislaby@gmail.com>

On 11/18/2011 04:30 AM, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the tty tree got a conflict in
> drivers/tty/tty_ldisc.c between commits df92d0561de3 ("TTY: ldisc, allow
> waiting for ldisc arbitrarily long") and 0c73c08ec73d ("TTY: ldisc, wait
> for ldisc infinitely in hangup") from the tty.current tree and commits
> 66ef27c3fd0e ("tty_ldisc: remove unnecessary negative return check for
> wait_event_timeout") and 8b3ffa173ffa ("TTY: ldisc, remove some unneeded
> includes") from the tty tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Looks good. Thanks.

> drivers/tty/tty_ldisc.c index 8e0924f,174db3b..0000000 ---
> a/drivers/tty/tty_ldisc.c +++ b/drivers/tty/tty_ldisc.c @@@ -24,19 -16,8
> +16,9 @@@ #include <linux/device.h> #include <linux/wait.h> #include
> <linux/bitops.h> - #include <linux/delay.h> #include <linux/seq_file.h>
> - #include <linux/uaccess.h> - #include <asm/system.h> - - #include
> <linux/kbd_kern.h> - #include <linux/vt_kern.h> - #include
> <linux/selection.h> - - #include <linux/kmod.h> - #include
> <linux/nsproxy.h> +#include <linux/ratelimit.h> /* * This guards the
> refcounted line discipline lists. The lock @@@ -553,13 -533,11 +535,11
> @@@ static void tty_ldisc_flush_works(struc * Wait for the line
> discipline to become idle. The discipline must * have been halted for
> this to guarantee it remains idle. */ -static int
> tty_ldisc_wait_idle(struct tty_struct *tty) +static int
> tty_ldisc_wait_idle(struct tty_struct *tty, long timeout) { - int ret; +
> long ret; ret = wait_event_timeout(tty_ldisc_idle, -
> atomic_read(&tty->ldisc->users) == 1, 5 * HZ); +
> atomic_read(&tty->ldisc->users) == 1, timeout); - if (ret < 0) - return
> ret; return ret > 0 ? 0 : -EBUSY; }
> 
-- 
js
suse labs
