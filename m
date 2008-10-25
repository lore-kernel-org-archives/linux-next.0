From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: left over things in linux-next after 2.6.28-c1
Date: Sat, 25 Oct 2008 14:16:51 -0700
Message-ID: <20081025211651.GA32027@kroah.com>
References: <20081026005009.50dbbb33.sfr@canb.auug.org.au> <20081025143715.GB30900@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:52979 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751190AbYJYVWt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 25 Oct 2008 17:22:49 -0400
Content-Disposition: inline
In-Reply-To: <20081025143715.GB30900@uranus.ravnborg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

On Sat, Oct 25, 2008 at 04:37:15PM +0200, Sam Ravnborg wrote:
> > tests
> > 
> > 	Ananth N Mavinakayanahalli (7):
> > 	      Add tests/ directory
> > 	      Move locking selftests to tests/
> > 	      Move rcutorture to tests/
> > 	      Move rtmutex tester to tests/
> > 	      Move lkdtm to tests/
> > 	      Move kprobes smoke tests to tests/
> > 	      Move backtrace selftests to tests/
> 
> I have almost given up on this.
> Three merge attemps failed for different reasons,
> and I will not even have time for my maintainership
> duties the next months.
> 
> Anyone that can bring it forward?

What are the reasons this is failing?  Is it just moving different files
around into the tests/ directory?  Or is it new functionality here?

If just moving stuff, is that really needed?

thanks,

greg k-h
