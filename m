From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the final tree (staging
 tree related)
Date: Tue, 2 Aug 2011 16:17:38 -0700
Message-ID: <20110802231738.GA2764@kroah.com>
References: <20110718193646.33fb3f41db9d84974913657d@canb.auug.org.au>
 <20110719010104.GA12591@kroah.com>
 <20110728133523.9a080472cad87be3fff982ac@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out2.smtp.messagingengine.com ([66.111.4.26]:47842 "EHLO
	out2.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752966Ab1HBXRq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Aug 2011 19:17:46 -0400
Content-Disposition: inline
In-Reply-To: <20110728133523.9a080472cad87be3fff982ac@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ondrej Zary <linux@rainbow-software.org>

On Thu, Jul 28, 2011 at 01:35:23PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 18 Jul 2011 18:01:04 -0700 Greg KH <greg@kroah.com> wrote:
> >
> > On Mon, Jul 18, 2011 at 07:36:46PM +1000, Stephen Rothwell wrote:
> > > 
> > > After merging the final tree, today's linux-next build (powerpc
> > > allysconfig) failed like this:
> > > 
> > > In file included from drivers/staging/ft1000/ft1000-pcmcia/ft1000_proc.c:26:0:
> > > drivers/staging/ft1000/ft1000-pcmcia/ft1000.h: In function 'ft1000_read_reg':
> > > drivers/staging/ft1000/ft1000-pcmcia/ft1000.h:80:2: error: implicit declaration of function 'inw'
> > > drivers/staging/ft1000/ft1000-pcmcia/ft1000.h: In function 'ft1000_write_reg':
> > > drivers/staging/ft1000/ft1000-pcmcia/ft1000.h:86:2: error: implicit declaration of function 'outw'
> > 
> > PowerPC supports PCMCIA?  Anyway, Ondrej, care to provide a fix for this
> > please?
> 
> Ping ... this is now in Linus' tree.

Thanks, I now have a fix for it that should show up in the next
linux-next release and be sent to Linus soon.

thanks,

greg k-h
