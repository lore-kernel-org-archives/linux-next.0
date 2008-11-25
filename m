From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: ftrace tree build warnings
Date: Tue, 25 Nov 2008 10:25:15 +0000
Message-ID: <20081125102515.54282c0d@lxorguk.ukuu.org.uk>
References: <20081125133828.8f9b49df.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:43260 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752885AbYKYKZ4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Nov 2008 05:25:56 -0500
In-Reply-To: <20081125133828.8f9b49df.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Steven Rostedt <srostedt@redhat.com>, Alan Cox <alan@redhat.com>

On Tue, 25 Nov 2008 13:38:28 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next build (x86_64 allmodconfig) produced lots of these
> warnings:
> 
> include/linux/tty.h:330: warning: '______f' is static but declared in inline function 'tty_kref_get' which is not static
> 
> Caused by commit 2bcd521a684cc94befbe2ce7d5b613c841b0d304 ("trace:
> profile all if conditionals").  Something needs to be done about
> this ...  maybe tty_kref_get needs to be "static inline" instead of
> "extern inline"?

If someone from the ftrace crew can sort the problem out and send me a
diff for the ttydev tree that shouldn't be a problem, but really it looks
like a problem with ftrace as that can't be the only case this happens
surely ?
