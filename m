From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: sound tree build failure
Date: Fri, 17 Jul 2009 09:27:52 -0700
Message-ID: <20090717162752.GA7949@kroah.com>
References: <20090717112935.2e831eee.sfr@canb.auug.org.au>
 <20090717045620.GC17656@kroah.com>
 <20090717153243.b8392c24.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:60093 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934725AbZGQQ2c (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Jul 2009 12:28:32 -0400
Content-Disposition: inline
In-Reply-To: <20090717153243.b8392c24.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Takashi Iwai <tiwai@suse.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Barry Song <21cnbao@gmail.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>

On Fri, Jul 17, 2009 at 03:32:43PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Thu, 16 Jul 2009 21:56:20 -0700 Greg KH <greg@kroah.com> wrote:
> >
> > It turned out to be "too late" to make the change, I missed the -rc2
> > window, so it will be a .32 thing.
> > 
> > I'll move it from my driver-core.current to my driver-core tree to clear
> > up any confusion.
> 
> OK, thanks.

Now done.

thanks,

greg k-h
