From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: comedi: Range_table and range_table_list
Date: Mon, 27 Apr 2009 08:25:08 -0700
Message-ID: <20090427152508.GA23851@kroah.com>
References: <87skjvf5o8.fsf@free.fr> <20090427023822.GA7060@kroah.com> <72cf3fb0904270137s4ac40211i8965ef0110fad7dd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:36797 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755055AbZD0Pbt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Apr 2009 11:31:49 -0400
Content-Disposition: inline
In-Reply-To: <72cf3fb0904270137s4ac40211i8965ef0110fad7dd@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexis Berlemont <alexis.berlemont@gmail.com>
Cc: linux-next@vger.kernel.org

On Mon, Apr 27, 2009 at 10:37:43AM +0200, Alexis Berlemont wrote:
> Hi,
> 
> On Mon, Apr 27, 2009 at 4:38 AM, Greg KH <greg@kroah.com> wrote:
> > On Sun, Apr 26, 2009 at 11:47:51PM +0200, Alexis Berlemont wrote:
> >> Hi,
> >>
> >> Please, find attached two patches related with the Comedi layer.
> >
> > Can you resend this, and cc: the comedi developers at the same time so
> > that they can evaluate your change to the code?
> 
> I already did so. As a matter of fact, I reached comedi's mailing list
> first. Here is the original thread:
> http://groups.google.com/group/comedi_list/browse_thread/thread/85be8195ddf52896
> 
> Ian Abott told me that the original Comedi CVS tree will not integrate
> such a code change. He suggested me to redirect my mail to linux-next
> as the staging area is supposed to host any "cleanup effort".

Yes, the upstream comedi cvs tree is pretty much "gone" now, as all of
the comedi developers are working against the linux-next tree, as you
rightly did.

But, the discussion of the development still happens on the comedi
mailing list (and cc: me please if you want patches added).  Not on the
linux-next mailing list, which is only for linux-next specific issues,
not general development stuff like this.

Hope this helps clear things up.

thanks,

greg k-h
