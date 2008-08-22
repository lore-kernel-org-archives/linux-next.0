From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: linux-next: input tree build failure
Date: Fri, 22 Aug 2008 16:29:10 -0400
Message-ID: <20080822162832.ZZRA012@mailhub.coreip.homeip.net>
References: <20080819163148.159c7d8c.sfr@canb.auug.org.au> <20080819200057.GD10502@kroah.com> <20080820154924.51ac3495.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from an-out-0708.google.com ([209.85.132.251]:4209 "EHLO
	an-out-0708.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753424AbYHVU3O (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 22 Aug 2008 16:29:14 -0400
Received: by an-out-0708.google.com with SMTP id d40so97238and.103
        for <linux-next@vger.kernel.org>; Fri, 22 Aug 2008 13:29:13 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20080820154924.51ac3495.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, "Alfred E. Heggestad" <aeh@db.org>

On Wed, Aug 20, 2008 at 03:49:24PM +1000, Stephen Rothwell wrote:
> Hi Greg, Dmitry,
> 
> On Tue, 19 Aug 2008 13:00:57 -0700 Greg KH <greg@kroah.com> wrote:
> >
> > No, these should all use dev_info() instead.
> > 
> > Actually, they should all use dev_dbg() and drop the #if entirely.  With
> > the dynamic dev_dbg() patch that is in -next, that will work just fine,
> > no need to rebuild modules which is almost impossible for most users to
> > do.
> 
> Today I used the following patch instead.  Dmitry, this should be able to
> be applied to your tree (I think) assuming that it is OK.
> 

Applied, thank you Stephen.

-- 
Dmitry
