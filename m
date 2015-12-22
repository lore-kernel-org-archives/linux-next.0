From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: linux-next: build failure after merge of the rtc tree
Date: Tue, 22 Dec 2015 20:27:51 +0100
Message-ID: <20151222192751.GG8623@piout.net>
References: <20151217160344.096b4a9e@canb.auug.org.au>
 <20151217112154.GE13078@piout.net>
 <5674268E.508@oracle.com>
 <20151218164341.GB3541@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:37179 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752261AbbLVT2D (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 Dec 2015 14:28:03 -0500
Content-Disposition: inline
In-Reply-To: <20151218164341.GB3541@piout.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sasha Levin <sasha.levin@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Sasha,

On 18/12/2015 at 17:43:41 +0100, Alexandre Belloni wrote :
> > > Sasha, I think I prefer having 32 bit platforms fail on the 21st of
> > > January 11761191 rather than adding more uses of do_div in the function.
> > > I'll have a look at the performance impact on 32 bit platforms.
> > 
> > I'm really fine with just adding a WARN_ON() and aborting if it's the year
> > 11761191 :)
> > 
> 
> One simple way to solve it for 64bit platforms is to define days as
> unsigned long. Maybe throw a comment that it will fail for 32bit
> platforms in January 11761191 ;).
> 

I did that:

http://git.kernel.org/cgit/linux/kernel/git/abelloni/linux.git/commit/?h=rtc-next&id=0d3da1806b985f1100615c2c09033b404941b63e

Unless you disagree, that is what I'm planning to send to Linus.

I wish you a happy end of year.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
