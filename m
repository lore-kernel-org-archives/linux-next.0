From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [GIT PATCH] Staging driver patches for 3.12-rc1
Date: Thu, 5 Sep 2013 08:05:27 -0700
Message-ID: <20130905150527.GA21185@kroah.com>
References: <20130902235853.GD4544@kroah.com>
 <CAMuHMdXfpMJeTPb4e11_oyqH5TRtTxrUMOnL9GKdSjv3VxDFww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:49887 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752789Ab3IEPF2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 5 Sep 2013 11:05:28 -0400
Content-Disposition: inline
In-Reply-To: <CAMuHMdXfpMJeTPb4e11_oyqH5TRtTxrUMOnL9GKdSjv3VxDFww@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: devel@linuxdriverproject.org, Andrew Morton <akpm@linux-foundation.org>, Linux-Next <linux-next@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Sep 05, 2013 at 04:09:48PM +0200, Geert Uytterhoeven wrote:
> On Tue, Sep 3, 2013 at 1:58 AM, Greg KH <gregkh@linuxfoundation.org> wrote:
> > Here's the bit staging tree pull request for 3.12-rc1.
> >
> > Lots of staging driver updates, and fixes.  Lustre is finally enabled in
> > the build, and lots of cleanup started happening in it.  There's a new
> 
> Lustre fails modpost on (at least) 4 architectures due to unexported arch
> support functions: m68k, mips, parisc and sparc64 (patches sent).

Odd, what functions were not present in those arches that lustre uses
that no other kernel code uses?

> All 4 failures were not visible in -next due to other build failures :-(

Ah, that's why it wasn't caught, thanks for doing this.

greg k-h
