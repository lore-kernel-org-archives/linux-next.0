From: Arnaldo Carvalho de Melo <acme@ghostprotocols.net>
Subject: Re: [PATCH] tools/perf: fix build when WERROR=1
Date: Wed, 8 Aug 2012 13:38:29 -0300
Message-ID: <20120808163829.GD2210@infradead.org>
References: <1344438350-22574-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <20120808161849.GC2210@infradead.org>
 <1344443566.24513.35.camel@smile>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:44947 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752037Ab2HHQie (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 8 Aug 2012 12:38:34 -0400
Received: by yhmm54 with SMTP id m54so964463yhm.19
        for <linux-next@vger.kernel.org>; Wed, 08 Aug 2012 09:38:34 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1344443566.24513.35.camel@smile>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-next@vger.kernel.org

Em Wed, Aug 08, 2012 at 07:32:46PM +0300, Andy Shevchenko escreveu:
> On Wed, 2012-08-08 at 13:18 -0300, Arnaldo Carvalho de Melo wrote: 
> > >  {
> > > -	const char *p = ptr;
> > > +	char *p;
> > >  
> > >  	*long_val = strtoull(ptr, &p, 16);
> > 
> > What tree is this against? Here I have:
> Ah, it's a fix on top on mine other fix.
> I'll resend squashed version soon.

But are you having trouble with the current implementation of hex2u64?

- Arnaldo
