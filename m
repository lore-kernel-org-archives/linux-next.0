From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the staging tree
Date: Fri, 26 Jul 2013 14:56:34 -0700
Message-ID: <20130726215634.GA31820@kroah.com>
References: <20130726160254.83bbe994219d6ee732c64b7d@canb.auug.org.au>
 <20130726210335.GA2788@kroah.com>
 <51F2E8A4.2010405@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:35019 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757248Ab3GZV4g (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 26 Jul 2013 17:56:36 -0400
Content-Disposition: inline
In-Reply-To: <51F2E8A4.2010405@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eli Billauer <eli.billauer@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Jul 27, 2013 at 12:22:44AM +0300, Eli Billauer wrote:
> Hello Greg,
> 
> I was just about to submit a patch fixing this issue. Should arrive
> in a few minutes. Sorry.

Got it, thanks.

> Will this be the follow-on patch you mentioned for fixing the
> "sparse errors" this driver produced? I'm wasn't sure what you meant
> with that.

No, I need you to do that.  Can you do a kernel build with:
	make M=drivers/staging/xillybus C=1
and fix up the errors that sparse reports and send a patch for that?

thanks,

greg k-h
