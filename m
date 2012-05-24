From: David Rientjes <rientjes@google.com>
Subject: Re: [patch -linus] regmap: REMAP_IRQ should select IRQ_DOMAIN
 itself
Date: Wed, 23 May 2012 17:36:38 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1205231735100.8785@chino.kir.corp.google.com>
References: <20120522183037.75ec03c9d8881ec188e7f787@canb.auug.org.au> <4FBBAF1B.1070702@xenotime.net> <alpine.DEB.2.00.1205222339030.9290@chino.kir.corp.google.com> <20120523093208.GB4085@opensource.wolfsonmicro.com> <CA+55aFynyjrHUCh48aXSQpZpboQM7MCCtMHvxBxCf+gDoCVWXg@mail.gmail.com>
 <20120523173342.GB4064@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:33133 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751805Ab2EXAgk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 23 May 2012 20:36:40 -0400
Received: by dady13 with SMTP id y13so10490363dad.19
        for <linux-next@vger.kernel.org>; Wed, 23 May 2012 17:36:40 -0700 (PDT)
In-Reply-To: <20120523173342.GB4064@opensource.wolfsonmicro.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 23 May 2012, Mark Brown wrote:

> > Multi-level pure selects *should* work correctly. So you can select
> > stuff that then in turn selects other stuff - and that should all be
> > fine.
> 
> They're supposed to, and mostly do, but there's been some fragility
> there.  That said there's not been anything recently, perhaps I just got
> hit with fallout from some development that was going on.
> 
> > It's *dependencies* that do not work.
> 
> Right, and nor are they supposed to since it's not clear what they
> should do.  That's a completely different thing.
> 

So my patch to select IRQ_DOMAIN for REGMAP_IRQ is correct since 
REGMAP_IRQ now requires IRC_DOMAIN since the commit listed in the 
changelog.

What's fragile is going around and adding "select IRQ_DOMAIN" to 
everything that does "select REGMAP_IRQ".  So I removed that and just made 
IRQ_DOMAIN select REGMAP_IRQ itself.

So can this be merged or what's the issue?
