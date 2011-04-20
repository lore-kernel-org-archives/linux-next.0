From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH -next] driver core: syscore exports for modular APM
Date: Wed, 20 Apr 2011 22:39:10 +0200
Message-ID: <201104202239.10921.rjw@sisk.pl>
References: <20110419150641.644638d5.sfr@canb.auug.org.au> <20110419211741.GA19576@kroah.com> <201104200004.27331.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:39637 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751307Ab1DTUiq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 Apr 2011 16:38:46 -0400
In-Reply-To: <201104200004.27331.rjw@sisk.pl>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wednesday, April 20, 2011, Rafael J. Wysocki wrote:
> On Tuesday, April 19, 2011, Greg KH wrote:
> > On Tue, Apr 19, 2011 at 08:35:46AM -0700, Randy Dunlap wrote:
> > > From: Randy Dunlap <randy.dunlap@oracle.com>
> > > 
> > > When CONFIG_APM=m, build fails with:
> > > 
> > > ERROR: "syscore_suspend" [arch/x86/kernel/apm.ko] undefined!
> > > ERROR: "syscore_resume" [arch/x86/kernel/apm.ko] undefined!
> > > 
> > > Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> > 
> > Acked-by: Greg Kroah-Hartman <gregkh@suse.de>
> > 
> > Rafael, care to send this to Linus?  Or do you want me to?
> 
> I will.  Or better I'll fold it into the patch, it hasn't been
> sent to Linus yet.

The problem should be fixed in today's linux-next.  Randy, can you confirm,
please?

Rafael
