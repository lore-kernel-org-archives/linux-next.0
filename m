From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next:  tree build warning
Date: Thu, 23 Apr 2009 08:43:19 +0200
Message-ID: <20090423064319.GA14063@elte.hu>
References: <20090423161724.6e6aa769.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:43945 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752040AbZDWGnf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Apr 2009 02:43:35 -0400
Content-Disposition: inline
In-Reply-To: <20090423161724.6e6aa769.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Steven Rostedt <srostedt@redhat.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next build (powerpc allyesconfig gcc4.4.0) produced this
> warning:
> 
> kernel/trace/ring_buffer.c: In function 'trace_recursive_unlock':
> kernel/trace/ring_buffer.c:1522: warning: suggest parentheses around operand of '!' or change '&' to '&&' or '!' to '~'
> 
> Introduced by commit 261842b7c9099f56de2eb969c8ad65402d68e00e ("tracing:
> add same level recursion detection") from the tracing tree.

already fixed in the tracing tree.

Thanks,

	Ingo
