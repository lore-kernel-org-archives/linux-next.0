From: Joe Perches <joe@perches.com>
Subject: Re: [linux-next PATCH] MAINTAINERS: Generic UIO use M: "Michael S.
 Tsirkin" <mst@redhat.com>
Date: Tue, 15 Sep 2009 11:34:27 -0700
Message-ID: <1253039667.7215.11.camel@Joe-Laptop.home>
References: <1252999424.19910.6.camel@Joe-Laptop.home>
	 <20090915153204.GA22774@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.perches.com ([173.55.12.10]:1192 "EHLO mail.perches.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758223AbZIOSeZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 15 Sep 2009 14:34:25 -0400
In-Reply-To: <20090915153204.GA22774@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Tue, 2009-09-15 at 08:32 -0700, Greg KH wrote:
> >  GENERIC UIO DRIVER FOR PCI DEVICES
> > -P:	Michael S. Tsirkin <mst@redhat.com>
> > +M:	"Michael S. Tsirkin" <mst@redhat.com>
> 
> I will edit the patch in my tree that causes this to happen.

Could you also take out the "L: linux-kernel@vger..." entry.
It's not necessary.

cheers, Joe
