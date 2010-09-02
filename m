From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build warning after merge of the driver-core tree
Date: Thu, 2 Sep 2010 12:59:53 -0700
Message-ID: <20100902195953.GA16897@kroah.com>
References: <20100902131835.6a8f8c83.sfr@canb.auug.org.au>
 <20100902032911.GA28546@kroah.com>
 <201009021214.27970.trenn@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:57300 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754639Ab0IBULq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 2 Sep 2010 16:11:46 -0400
Content-Disposition: inline
In-Reply-To: <201009021214.27970.trenn@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Renninger <trenn@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Baron <jbaron@redhat.com>

On Thu, Sep 02, 2010 at 12:14:27PM +0200, Thomas Renninger wrote:
> On Thursday 02 September 2010 05:29:11 Greg KH wrote:
> > On Thu, Sep 02, 2010 at 01:18:35PM +1000, Stephen Rothwell wrote:
> > > Hi Greg,
> ...
> > > kernel/params.c: In function 'parse_args':
> > > kernel/params.c:200: warning: passing argument 2 of 'snprintf' makes integer from pointer without a cast
> > > include/linux/kernel.h:203: note: expected 'size_t' but argument is of type 'char *'
> > > 
> > > Caused by commit d1aa8e2ab38942b21d543611d4f829597d8791d4 ("Dynamic
> > > Debug: Introduce global fake module param module.ddebug").
> > > 
> > > Some warnings should not be ignored ... and it does make me wonder how
> > > much testing this has had ...
> Strange, I tried this out and it worked, I doubt that this version could.
> Possibly it slipped in when getting dddebug patches together for resending
> to Greg, no idea.

Ok, I've replaced it with this version, looks better.

thanks,

greg k-h
