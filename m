From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH -next] trace_skb: fix build when CONFIG_NET is not
	enabled
Date: Tue, 18 Aug 2009 01:06:54 +0200
Message-ID: <20090817230654.GC16222@elte.hu>
References: <4A89BF90.5070202@oracle.com> <20090817.160041.40869355.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:45791 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751419AbZHQXHL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 17 Aug 2009 19:07:11 -0400
Content-Disposition: inline
In-Reply-To: <20090817.160041.40869355.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: randy.dunlap@oracle.com, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, akpm@linux-foundation.org, nhorman@tuxdriver.com, rostedt@goodmis.org


* David Miller <davem@davemloft.net> wrote:

> From: Randy Dunlap <randy.dunlap@oracle.com>
> Date: Mon, 17 Aug 2009 13:37:36 -0700
> 
> > From: Randy Dunlap <randy.dunlap@oracle.com>
> > 
> > Fix trace_skb_sources build when CONFIG_NET is not enabled:
> > 
> > kernel/built-in.o: In function `probe_skb_dequeue':
> > trace_skb_sources.c:(.text+0xd9152): undefined reference to `init_net'
> > trace_skb_sources.c:(.text+0xd9188): undefined reference to `dev_get_by_index'
> > 
> > Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Applied, thanks Randy.

... but these are the wrong patches, they should be removed or 
reverted and redone properly.

It's not just about keeping kernel/trace/* changes in the tracing 
tree (which we can relax on-demand given agreement), it's that 
these patches are also _wrong_ and we cannot relax anything about 
that.

	Ingo
