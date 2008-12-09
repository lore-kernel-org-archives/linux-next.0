From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree
Date: Tue, 9 Dec 2008 07:40:53 -0800
Message-ID: <20081209154053.GA25934@kroah.com>
References: <20081208151750.GE19711@kroah.com> <20081208.123557.22263181.davem@davemloft.net> <20081209035318.GB22596@kroah.com> <20081208.235914.264894795.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:51372 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751232AbYLIPu4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Dec 2008 10:50:56 -0500
Content-Disposition: inline
In-Reply-To: <20081208.235914.264894795.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, wangchen@cn.fujitsu.com

On Mon, Dec 08, 2008 at 11:59:14PM -0800, David Miller wrote:
> From: Greg KH <greg@kroah.com>
> Date: Mon, 8 Dec 2008 19:53:18 -0800
> 
> > On Mon, Dec 08, 2008 at 12:35:57PM -0800, David Miller wrote:
> > > Because I have to do allmodconfig test builds _too_, and the build
> > > will fail for me if I do these reverts which really would suck.
> > 
> > Ok, that's fine, as long as stephen can keep this patch in his tree,
> > I'll apply it to mine when you merge with Linus, as the staging tree
> > will probably be one of the last things before the next -rc1 window
> > closes.
> 
> BTW, there is something else we can do.
> 
> I can pull staging net driver changes into net-next-2.6
> 
> We can either do it as a one-time thing to alleviate this
> merge hassle, or we can try and make it a more ongoing
> merge mechanism.

I doubt you really want to do this, as there are some pretty big
wireless driver additions in the staging tree right now, some under very
heavy development.

I have no problem with this kind of merge issues, I'll fix it up on my
end, don't worry about it.

thanks,

greg k-h
