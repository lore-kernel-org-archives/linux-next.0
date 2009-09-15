From: Greg KH <greg@kroah.com>
Subject: Re: [linux-next PATCH] MAINTAINERS: Generic UIO use M: "Michael S.
 Tsirkin" <mst@redhat.com>
Date: Tue, 15 Sep 2009 11:35:44 -0700
Message-ID: <20090915183544.GA32688@kroah.com>
References: <1252999424.19910.6.camel@Joe-Laptop.home>
 <20090915153204.GA22774@kroah.com>
 <1253039667.7215.11.camel@Joe-Laptop.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:35830 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758361AbZIOTH2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 15 Sep 2009 15:07:28 -0400
Content-Disposition: inline
In-Reply-To: <1253039667.7215.11.camel@Joe-Laptop.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Tue, Sep 15, 2009 at 11:34:27AM -0700, Joe Perches wrote:
> On Tue, 2009-09-15 at 08:32 -0700, Greg KH wrote:
> > >  GENERIC UIO DRIVER FOR PCI DEVICES
> > > -P:	Michael S. Tsirkin <mst@redhat.com>
> > > +M:	"Michael S. Tsirkin" <mst@redhat.com>
> > 
> > I will edit the patch in my tree that causes this to happen.
> 
> Could you also take out the "L: linux-kernel@vger..." entry.
> It's not necessary.

Argh, I just sent it off to Linus :(

Care to send me a patch removing that?  I'll queue it up for the next
round to go off.  Or you can send it if you have MAINTAINERS file
updates as well.

sorry about that.

greg k-h
