From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net tree build failure
Date: Fri, 23 Jan 2009 00:13:37 -0800 (PST)
Message-ID: <20090123.001337.179440063.davem@davemloft.net>
References: <20090123182847.718fdb85.sfr@canb.auug.org.au>
	<20090122.235612.256786187.davem@davemloft.net>
	<20090123190103.1420c62f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:40776
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1752149AbZAWINf (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 23 Jan 2009 03:13:35 -0500
In-Reply-To: <20090123190103.1420c62f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, shemminger@linux-foundation.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 23 Jan 2009 19:01:03 +1100

> On Thu, 22 Jan 2009 23:56:12 -0800 (PST) David Miller <davem@davemloft.net> wrote:
> >
> > Does this patch fix it? I can't see any other way to end up
> > with a multiple definition like that.
> 
> It confused me as well (one of the defintions is in the bss and one in
> ro-data).  I will give your patch a try later tonight.

Ok, if one was in the BSS then very likely my patch will fix
things.

Look forward to your test results :)
