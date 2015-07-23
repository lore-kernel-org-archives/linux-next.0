From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next] ip_tunnel: Call ip_tunnel_core_init() from
 inet_init()
Date: Thu, 23 Jul 2015 01:28:49 -0700 (PDT)
Message-ID: <20150723.012849.1964809126719828221.davem@davemloft.net>
References: <20150723115824.071b84ff@canb.auug.org.au>
	<20150723080844.GB22790@pox.localdomain>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20150723080844.GB22790@pox.localdomain>
Sender: netdev-owner@vger.kernel.org
To: tgraf@suug.ch
Cc: sfr@canb.auug.org.au, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

From: Thomas Graf <tgraf@suug.ch>
Date: Thu, 23 Jul 2015 10:08:44 +0200

> Convert the module_init() to a invocation from inet_init() since
> ip_tunnel_core is part of the INET built-in.
> 
> Fixes: 3093fbe7ff4 ("route: Per route IP tunnel metadata via lightweight tunnel")
> Signed-off-by: Thomas Graf <tgraf@suug.ch>

I applied this instead of my module.h include fix, thanks Thomas.
