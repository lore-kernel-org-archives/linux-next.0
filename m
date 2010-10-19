From: Daniel Walker <dwalker@fifo99.com>
Subject: Re: linux-next: manual merge of the msm tree with the arm tree
Date: Tue, 19 Oct 2010 10:03:26 -0700
Message-ID: <1287507806.10071.16.camel@c-dwalke-linux.qualcomm.com>
References: <20101018103540.7bd9c535.sfr@canb.auug.org.au>
	 <alpine.LFD.2.00.1010181833440.2764@xanadu.home>
	 <1287442418.5376.38.camel@Joe-Laptop>  <201010191518.04147.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fifo99.com ([67.223.236.141]:33345 "EHLO fifo99.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753402Ab0JSRD6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 19 Oct 2010 13:03:58 -0400
In-Reply-To: <201010191518.04147.arnd@arndb.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Joe Perches <joe@perches.com>, Nicolas Pitre <nico@fluxnic.net>, Russell King <rmk@arm.linux.org.uk>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Jeremy Kerr <jeremy.kerr@canonical.com>, Jeff Ohlstein <johlstei@codeaurora.org>

On Tue, 2010-10-19 at 15:18 +0200, Arnd Bergmann wrote:
> On Tuesday 19 October 2010, Joe Perches wrote:
> > This could have been done:
> > 
> > $ git show 08a610d9ef5394525b0328da0162d7b58c982cc4 | ./scripts/get_maintainer.pl --nogit | wc -l
> > 35
> > 
> > Even then, using 35 CCs is generally silly.
> > 
> > It might make some sense for a cover letter and a
> > patch series where the series made tree-wide changes
> > in multiple directories.
> 
> Probably not even then: When a single mail header gets too long, you usually land
> in some spam filter and get hate mail from the list owners. The lkml limit is 1024
> characters (this may come from an official RFC, don't know), which is usually less
> than 35 recipients.

Patches just shouldn't be this large. You want smaller patches for a lot
of reason. Take the BKL, would it have been acceptable to make all the
BKL changes in a single patch (and what would the CC have looked like)?
If you do anything remotely sophisticated then , from my perspective, a
tree wide patch just isn't going to work.

Daniel
