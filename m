From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: Tree for July 27 (tty locking)
Date: Mon, 27 Jul 2009 22:34:15 +0100
Message-ID: <20090727223415.5e79159c@lxorguk.ukuu.org.uk>
References: <20090727180552.eb32515b.sfr@canb.auug.org.au>
	<200907272235.08319.bzolnier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:33693 "EHLO
	www.etchedpixels.co.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754518AbZG0VdR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 27 Jul 2009 17:33:17 -0400
In-Reply-To: <200907272235.08319.bzolnier@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, 27 Jul 2009 22:35:08 +0200
Bartlomiej Zolnierkiewicz <bzolnier@gmail.com> wrote:

> 
> Hi,
> 
> On Monday 27 July 2009 10:05:52 Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20090724:
> 
> Alan, it seems that tty still needs some polishing,
> I'm getting the following warning on boot:

Oh the -next tty patches need quite a bit of polishing yet. I've been
flat out dealing with fallout from the current kernel though so haven't
got time to deal with -next bugs just yet.

I know which diff that is however so I'll drop it out and push a new
-next tree.
