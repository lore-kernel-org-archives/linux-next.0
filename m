From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: Tree for July 29
Date: Wed, 30 Jul 2008 13:04:19 -0700
Message-ID: <20080730130419.49986a25.akpm@linux-foundation.org>
References: <20080729172337.b3d74100.sfr@canb.auug.org.au>
	<20080730090650.79a5a749@kopernikus.site>
	<20080730021947.def99edc.akpm@linux-foundation.org>
	<200807302127.42148.bzolnier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:56936 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752940AbYG3UFI (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 30 Jul 2008 16:05:08 -0400
In-Reply-To: <200807302127.42148.bzolnier@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: bwalle@suse.de, greg@kroah.com, hugh@veritas.com, gregkh@suse.de, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, haveblue@us.ibm.com

On Wed, 30 Jul 2008 21:27:41 +0200
Bartlomiej Zolnierkiewicz <bzolnier@gmail.com> wrote:

> On Wednesday 30 July 2008, Andrew Morton wrote:
> > On Wed, 30 Jul 2008 09:06:50 +0200 Bernhard Walle <bwalle@suse.de> wrote:
> > 
> > > * Greg KH <greg@kroah.com> [2008-07-29 21:48]:
> > > > > Isn't this the opposite end of the same problem for which Bernhard
> > > > > has been repeatedly trying to find a taker for his patch:
> > > > > 
> > > > > http://article.gmane.org/gmane.linux.kernel.kexec/1882
> > > > 
> > > > Yes.  It's not the kobject patch at fault here, it's the use of kobjects
> > > > so early in the boot process.  That needs to be fixed.
> > 
> > It was a bit optimistic to stick an unconditional GFP_KERNEL allocation
> > into the previously-atomic kobject_init().
> > 
> > It's only 128 bytes, so why can't we fix both problems thusly?
> 
> Fixes the bug for me (also true for previous patch from Bernhard).
> 

Cool.

The offending patch has just got itself turfed from linux-next so my
fix now has nothing to fix.

We'll see what happens!
