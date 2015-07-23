From: Thomas Graf <tgraf@suug.ch>
Subject: Re: [PATCH net-next] ip_tunnel: Call ip_tunnel_core_init() from
 inet_init()
Date: Thu, 23 Jul 2015 10:17:19 +0200
Message-ID: <20150723081719.GC22790@pox.localdomain>
References: <20150723115824.071b84ff@canb.auug.org.au>
 <20150723080844.GB22790@pox.localdomain>
 <20150723.012849.1964809126719828221.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:35988 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752384AbbGWIRW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Jul 2015 04:17:22 -0400
Received: by wicgb10 with SMTP id gb10so131515324wic.1
        for <linux-next@vger.kernel.org>; Thu, 23 Jul 2015 01:17:21 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150723.012849.1964809126719828221.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/23/15 at 01:28am, David Miller wrote:
> From: Thomas Graf <tgraf@suug.ch>
> Date: Thu, 23 Jul 2015 10:08:44 +0200
> 
> > Convert the module_init() to a invocation from inet_init() since
> > ip_tunnel_core is part of the INET built-in.
> > 
> > Fixes: 3093fbe7ff4 ("route: Per route IP tunnel metadata via lightweight tunnel")
> > Signed-off-by: Thomas Graf <tgraf@suug.ch>
> 
> I applied this instead of my module.h include fix, thanks Thomas.

Thanks, sorry for the extra trouble you had to go through.
