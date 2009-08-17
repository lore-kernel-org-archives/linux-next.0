From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH -next] trace_skb: fix build when CONFIG_NET is not
 enabled
Date: Mon, 17 Aug 2009 16:00:41 -0700 (PDT)
Message-ID: <20090817.160041.40869355.davem@davemloft.net>
References: <4A89BF90.5070202@oracle.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758327AbZHQXAb@vger.kernel.org>
In-Reply-To: <4A89BF90.5070202@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: randy.dunlap@oracle.com
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, akpm@linux-foundation.org, nhorman@tuxdriver.com, rostedt@goodmis.org
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>
Date: Mon, 17 Aug 2009 13:37:36 -0700

> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Fix trace_skb_sources build when CONFIG_NET is not enabled:
> 
> kernel/built-in.o: In function `probe_skb_dequeue':
> trace_skb_sources.c:(.text+0xd9152): undefined reference to `init_net'
> trace_skb_sources.c:(.text+0xd9188): undefined reference to `dev_get_by_index'
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>

Applied, thanks Randy.
