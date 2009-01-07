From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: ftrace tree build failure
Date: Wed, 7 Jan 2009 10:55:05 +0100
Message-ID: <20090107095505.GA23386@elte.hu>
References: <20090107115317.77085a13.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:40498 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751903AbZAGJz0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 7 Jan 2009 04:55:26 -0500
Content-Disposition: inline
In-Reply-To: <20090107115317.77085a13.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> init/main.c:653: undefined reference to `kmemtrace_init'
> 
> I have cherry-picked the fix from the tip/master tree.

thanks! I've pushed out the latest tracing tree so it should be resolved 
in your next iteration.

	Ingo
