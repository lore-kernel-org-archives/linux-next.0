From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: linux-next: usb tree fix (Was: Re: linux-next: Tree for July 29)
Date: Wed, 30 Jul 2008 21:38:47 +0200
Message-ID: <200807302138.47972.bzolnier@gmail.com>
References: <20080729172337.b3d74100.sfr@canb.auug.org.au> <200807291825.14281.bzolnier@gmail.com> <20080730110554.9bea652b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fk-out-0910.google.com ([209.85.128.186]:5305 "EHLO
	fk-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754649AbYG3TqJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 30 Jul 2008 15:46:09 -0400
Received: by fk-out-0910.google.com with SMTP id 18so131597fkq.5
        for <linux-next@vger.kernel.org>; Wed, 30 Jul 2008 12:46:08 -0700 (PDT)
In-Reply-To: <20080730110554.9bea652b.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Dave Hansen <haveblue@us.ibm.com>, Greg KH <gregkh@suse.de>

On Wednesday 30 July 2008, Stephen Rothwell wrote:
> Hi Bart,
> 
> On Tue, 29 Jul 2008 18:25:14 +0200 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com> wrote:
> >
> > I keep reverting commit 0e3638d1e04040121af00195f7e4628078246489 ("warn
> > when statically-allocated kobjects are used") with each linux-next release
> > to make it work on my x86_32 laptop (http://lkml.org/lkml/2008/7/19/114).
> > 
> > Depending on the day I either forget to revert it on a first try or (lead by
> > incurable optimism) I don't try to revert it in hope that it was fixed.
> > 
> > Unfortunately the result is always the same cursing-during-qemu-test-run
> > -> git-revert -> recompile cycle and a needless time loss.
> > 
> > Could we have some action taken please?
> 
> I have reverted that commit from linux-next today (its id has changed)
> and will do so until Greg or Dave tells me it has been fixed.  To make
> life easier for me, Greg, it would be nice if you removed it from your
> series until that time.

Thanks but since now there is a fix (even two!) for the issue and Dave's
patch has the value of catching real bugs maybe we could have one of the
fixes in linux-next instead of revert?

PS ironically today's linux-next broke xorg for me... call me lucky...

Bart
