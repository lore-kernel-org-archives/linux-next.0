From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the staging tree
Date: Tue, 09 Dec 2008 13:42:29 -0800 (PST)
Message-ID: <20081209.134229.255864200.davem@davemloft.net>
References: <20081209035318.GB22596@kroah.com>
	<20081208.235914.264894795.davem@davemloft.net>
	<20081209154053.GA25934@kroah.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:56128
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1754118AbYLIVm2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Dec 2008 16:42:28 -0500
In-Reply-To: <20081209154053.GA25934@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: greg@kroah.com
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, wangchen@cn.fujitsu.com

From: Greg KH <greg@kroah.com>
Date: Tue, 9 Dec 2008 07:40:53 -0800

> On Mon, Dec 08, 2008 at 11:59:14PM -0800, David Miller wrote:
> > BTW, there is something else we can do.
> > 
> > I can pull staging net driver changes into net-next-2.6
> > 
> > We can either do it as a one-time thing to alleviate this
> > merge hassle, or we can try and make it a more ongoing
> > merge mechanism.
> 
> I doubt you really want to do this, as there are some pretty big
> wireless driver additions in the staging tree right now, some under very
> heavy development.
> 
> I have no problem with this kind of merge issues, I'll fix it up on my
> end, don't worry about it.

Ok, I just thought I'd offer :-)
