From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: Tree for March 12 (tty)
Date: Sat, 14 Mar 2009 14:19:59 +0000
Message-ID: <20090314141959.418ea04c@lxorguk.ukuu.org.uk>
References: <20090312171154.11c6ec31.sfr@canb.auug.org.au>
	<200903141411.50185.bzolnier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:43573 "EHLO
	www.etchedpixels.co.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752858AbZCNOTZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 14 Mar 2009 10:19:25 -0400
In-Reply-To: <200903141411.50185.bzolnier@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Sat, 14 Mar 2009 14:11:49 +0100
Bartlomiej Zolnierkiewicz <bzolnier@gmail.com> wrote:

> 
> Hi,
> 
> On Thursday 12 March 2009, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20090311:
> 
> It fails to boot here (both with QEMU and the real hardware):
> 
> ...
> Warning: unable to open an initial console.
> Kernel panic - not syncing: Attempted to kill init!
> ...
> 
> I bisected the problem to:
> 
> From 31f8326f981117fc548d292656fa8dbed28bc42b Mon Sep 17 00:00:00 2001
> From: Alan Cox <alan@lxorguk.ukuu.org.uk>
> Date: Thu, 12 Mar 2009 10:00:15 +110

GAK thanks - I'll sort that mess out monday.
