From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: linux-next: usb tree build failure
Date: Wed, 5 Nov 2008 16:19:16 -0200
Message-ID: <20081105161916.78713e20@pedra.chehab.org>
References: <20081103113640.1ad6899d.sfr@canb.auug.org.au>
	<20081105044745.GB3668@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:55987 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753339AbYKESTK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 5 Nov 2008 13:19:10 -0500
In-Reply-To: <20081105044745.GB3668@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Alexey Klimov <klimov.linux@gmail.com>, Douglas Schilling Landgraf <dougsland@gmail.com>

On Tue, 4 Nov 2008 20:47:45 -0800
Greg KH <greg@kroah.com> wrote:

> On Mon, Nov 03, 2008 at 11:36:40AM +1100, Stephen Rothwell wrote:
> > Hi Greg,
> > 
> > I am still getting these errors after merging the usb tree:
> > 
> > drivers/media/radio/radio-mr800.c: In function 'vidioc_s_frequency':
> > drivers/media/radio/radio-mr800.c:362: error: implicit declaration of function 'warn'
> > drivers/media/radio/radio-mr800.c: In function 'usb_amradio_suspend':
> > drivers/media/radio/radio-mr800.c:513: error: implicit declaration of function 'info'
> > 
> > I have been reverting these patches for a while:
> > 	USB: remove info() macro from usb.h
> > 	USB: remove warn() macro from usb.h
> > 
> > Today, I excluded those patches completely from my tree and they will
> > stay excluded until a fix is applied to drivers/media/radio/radio-mr800.c.
> > 
> > Alexey sent a patch on Oct 12 (see below).  Greg, you might as well put
> > this your series until Mauro or Douglas gets around to sending it to
> > Linus.  However, that patch does not address the warn() usage ...
> > 
> > Mauro, Douglas, any comment?
> 
> Mauro, do you want me to send patches cleaning this up to you?

Greg,

You don't need to bother with this. Alexey already sent me a patch hopefully
fixing this. I'm about to check and apply.



Cheers,
Mauro
