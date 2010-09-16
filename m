From: Daniel Walker <dwalker@fifo99.com>
Subject: Re: FW: next build fails
Date: Thu, 16 Sep 2010 15:08:55 -0700
Message-ID: <1284674935.2411.54.camel@c-dwalke-linux.qualcomm.com>
References: <33A307AF30D7BF4F811B1568FE7A9B18043784FF99@EXDCVYMBSTM006.EQ1STM.local>
	 <20100916164442.df749cc1.sfr@canb.auug.org.au>
	 <1284656407.2411.5.camel@c-dwalke-linux.qualcomm.com>
	 <20100917075242.e0bc4b54.sfr@canb.auug.org.au>
	 <1284674337.2411.53.camel@c-dwalke-linux.qualcomm.com>
	 <20100917080439.7c35775a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fifo99.com ([67.223.236.141]:58257 "EHLO fifo99.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753195Ab0IPWJQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Sep 2010 18:09:16 -0400
In-Reply-To: <20100917080439.7c35775a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Sundar R IYER <sundar.iyer@stericsson.com>, Linus WALLEIJ <linus.walleij@stericsson.com>, Russell King <rmk@arm.linux.org.uk>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 2010-09-17 at 08:04 +1000, Stephen Rothwell wrote:
> Hi Daniel,
> 
> On Thu, 16 Sep 2010 14:58:57 -0700 Daniel Walker <dwalker@fifo99.com> wrote:
> >
> > Yeah, exactly .. This is what I did to update my patch .. Do you want to
> > include this, or should I update my version and my tree.. Ultimately my
> > version has to go into Russell's tree..
> 
> Well, you can't really update that in your tree until after your tree is
> merged with Russell's, right (since ALT_UP etc are not defined in your
> tree)?  In that case, I need to do the fix when I merge your tree into
> linux-next (and so with Russell's tree).

Right, I see what your saying .. Ok, thanks.

Daniel
