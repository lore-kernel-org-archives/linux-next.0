From: Anton Vorontsov <cbouatmailru@gmail.com>
Subject: Re: linux-next: Tree for August 4 (olpc_battery)
Date: Mon, 9 Aug 2010 21:25:42 +0400
Message-ID: <20100809172542.GA6388@oksana.dev.rtsoft.ru>
References: <20100804151035.14678528.sfr@canb.auug.org.au>
 <20100804094755.e0377eb0.randy.dunlap@oracle.com>
 <20100809093925.1ff3dc11.randy.dunlap@oracle.com>
 <1281374272.7143.23.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:46003 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751113Ab0HIRZt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 9 Aug 2010 13:25:49 -0400
Content-Disposition: inline
In-Reply-To: <1281374272.7143.23.camel@localhost>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Andres Salomon <dilinger@collabora.co.uk>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, Aug 09, 2010 at 06:17:52PM +0100, David Woodhouse wrote:
[...]
> > > drivers/power/olpc_battery.c:387: error: unknown field 'owner' specified in initializer
> > > drivers/power/olpc_battery.c:387: warning: excess elements in struct initializer
> > > drivers/power/olpc_battery.c:387: warning: (near initialization for 'olpc_bat_eeprom.attr')
> > > 
> > > 
> > > The .owner field has been dropped from the attr struct.
> > 
> > 
> > Build still fails in linux-next 20100809.
> 
> Anton, please pull from git://git.infradead.org/~dwmw2/battery-2.6.git
> (or I can just push it, but I figured I'd ask first).

Pulled and pushed back out, thanks!

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
