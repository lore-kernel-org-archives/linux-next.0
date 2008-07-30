From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: linux-next: Tree for July 29
Date: Wed, 30 Jul 2008 21:27:41 +0200
Message-ID: <200807302127.42148.bzolnier@gmail.com>
References: <20080729172337.b3d74100.sfr@canb.auug.org.au> <20080730090650.79a5a749@kopernikus.site> <20080730021947.def99edc.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fk-out-0910.google.com ([209.85.128.189]:4426 "EHLO
	fk-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754644AbYG3TqI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 30 Jul 2008 15:46:08 -0400
Received: by fk-out-0910.google.com with SMTP id 18so131605fkq.5
        for <linux-next@vger.kernel.org>; Wed, 30 Jul 2008 12:46:07 -0700 (PDT)
In-Reply-To: <20080730021947.def99edc.akpm@linux-foundation.org>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Bernhard Walle <bwalle@suse.de>, Greg KH <greg@kroah.com>, Hugh Dickins <hugh@veritas.com>, Greg KH <gregkh@suse.de>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Dave Hansen <haveblue@us.ibm.com>

On Wednesday 30 July 2008, Andrew Morton wrote:
> On Wed, 30 Jul 2008 09:06:50 +0200 Bernhard Walle <bwalle@suse.de> wrote:
> 
> > * Greg KH <greg@kroah.com> [2008-07-29 21:48]:
> > > > Isn't this the opposite end of the same problem for which Bernhard
> > > > has been repeatedly trying to find a taker for his patch:
> > > > 
> > > > http://article.gmane.org/gmane.linux.kernel.kexec/1882
> > > 
> > > Yes.  It's not the kobject patch at fault here, it's the use of kobjects
> > > so early in the boot process.  That needs to be fixed.
> 
> It was a bit optimistic to stick an unconditional GFP_KERNEL allocation
> into the previously-atomic kobject_init().
> 
> It's only 128 bytes, so why can't we fix both problems thusly?

Fixes the bug for me (also true for previous patch from Bernhard).

Thanks!
