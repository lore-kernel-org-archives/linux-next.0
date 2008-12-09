From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the staging tree
Date: Mon, 08 Dec 2008 23:59:14 -0800 (PST)
Message-ID: <20081208.235914.264894795.davem@davemloft.net>
References: <20081208151750.GE19711@kroah.com>
	<20081208.123557.22263181.davem@davemloft.net>
	<20081209035318.GB22596@kroah.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:57134
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751466AbYLIH7O (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Dec 2008 02:59:14 -0500
In-Reply-To: <20081209035318.GB22596@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: greg@kroah.com
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, wangchen@cn.fujitsu.com

From: Greg KH <greg@kroah.com>
Date: Mon, 8 Dec 2008 19:53:18 -0800

> On Mon, Dec 08, 2008 at 12:35:57PM -0800, David Miller wrote:
> > Because I have to do allmodconfig test builds _too_, and the build
> > will fail for me if I do these reverts which really would suck.
> 
> Ok, that's fine, as long as stephen can keep this patch in his tree,
> I'll apply it to mine when you merge with Linus, as the staging tree
> will probably be one of the last things before the next -rc1 window
> closes.

BTW, there is something else we can do.

I can pull staging net driver changes into net-next-2.6

We can either do it as a one-time thing to alleviate this
merge hassle, or we can try and make it a more ongoing
merge mechanism.
