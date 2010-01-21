From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: tty tree build warning
Date: Thu, 21 Jan 2010 15:03:31 -0800
Message-ID: <20100121230331.GA29796@kroah.com>
References: <20100120171901.b2e06465.sfr@canb.auug.org.au>
 <b9df5fa11001202022q22c2d81cs5b90f694be37c1f4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:60838 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754601Ab0AUXLB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 21 Jan 2010 18:11:01 -0500
Content-Disposition: inline
In-Reply-To: <b9df5fa11001202022q22c2d81cs5b90f694be37c1f4@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rakib Mullick <rakib.mullick@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jan 21, 2010 at 10:22:19AM +0600, Rakib Mullick wrote:
> On 1/20/10, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi Greg,
> >
> >  Today's linux-next build (x86_64 allmodconfig) produced this warning:
> >
> >  drivers/char/ip2/ip2main.c:511: warning: 'ip2_setup' defined but not used
> >
> Can we use module parameters? A check could be made if parameter hasn't
> passed then we'll just return.

That sounds right.  Care to send a patch?

thanks,

greg k-h
