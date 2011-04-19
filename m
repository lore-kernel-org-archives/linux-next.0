From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH -next] driver core: syscore exports for modular APM
Date: Wed, 20 Apr 2011 00:04:27 +0200
Message-ID: <201104200004.27331.rjw@sisk.pl>
References: <20110419150641.644638d5.sfr@canb.auug.org.au> <20110419083546.e8981e49.randy.dunlap@oracle.com> <20110419211741.GA19576@kroah.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:36707 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753597Ab1DSWEE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 19 Apr 2011 18:04:04 -0400
In-Reply-To: <20110419211741.GA19576@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tuesday, April 19, 2011, Greg KH wrote:
> On Tue, Apr 19, 2011 at 08:35:46AM -0700, Randy Dunlap wrote:
> > From: Randy Dunlap <randy.dunlap@oracle.com>
> > 
> > When CONFIG_APM=m, build fails with:
> > 
> > ERROR: "syscore_suspend" [arch/x86/kernel/apm.ko] undefined!
> > ERROR: "syscore_resume" [arch/x86/kernel/apm.ko] undefined!
> > 
> > Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Acked-by: Greg Kroah-Hartman <gregkh@suse.de>
> 
> Rafael, care to send this to Linus?  Or do you want me to?

I will.  Or better I'll fold it into the patch, it hasn't been
sent to Linus yet.

Thanks,
Rafael
