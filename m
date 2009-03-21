From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: Tree for March 18 (staging/comedi)
Date: Fri, 20 Mar 2009 21:36:12 -0700
Message-ID: <20090321043612.GA482@kroah.com>
References: <20090318173830.7ea03dfb.sfr@canb.auug.org.au> <49C121C7.1040903@oracle.com> <20090318163319.GA9706@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:40408 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750912AbZCUEj3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 21 Mar 2009 00:39:29 -0400
Content-Disposition: inline
In-Reply-To: <20090318163319.GA9706@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <gregkh@suse.de>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, Mar 18, 2009 at 09:33:19AM -0700, Greg KH wrote:
> On Wed, Mar 18, 2009 at 09:31:03AM -0700, Randy Dunlap wrote:
> > Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Changes since 20090317:
> > 
> > 
> > drivers/staging/comedi/comedi_compat32.c: In function 'compat_chaninfo':
> > drivers/staging/comedi/comedi_compat32.c:135: error: dereferencing pointer to incomplete type
> 
> <snip>
> 
> Ick, sorry about that, I'll fix it up for tomorrows -next release.

Now fixed.

thanks,

greg k-h
