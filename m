From: Harvey Harrison <harvey.harrison@gmail.com>
Subject: Re: [PATCH-next] pcmcia: fix sparse integer as NULL pointer warning
Date: Wed, 23 Jul 2008 22:00:05 -0700
Message-ID: <1216875606.30386.74.camel@brick>
References: <1216863248.30386.61.camel@brick>
	 <20080724143634.74fe3b8d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wa-out-1112.google.com ([209.85.146.183]:34330 "EHLO
	wa-out-1112.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750975AbYGXFAE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 24 Jul 2008 01:00:04 -0400
Received: by wa-out-1112.google.com with SMTP id j37so1581305waf.23
        for <linux-next@vger.kernel.org>; Wed, 23 Jul 2008 22:00:04 -0700 (PDT)
In-Reply-To: <20080724143634.74fe3b8d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dominik Brodowski <linux@brodo.de>, linux-next <linux-next@vger.kernel.org>

On Thu, 2008-07-24 at 14:36 +1000, Stephen Rothwell wrote:
> On Wed, 23 Jul 2008 18:34:08 -0700 Harvey Harrison <harvey.harrison@gmail.com> wrote:
> >
> > +++ b/drivers/pcmcia/rsrc_nonstatic.c
> > @@ -275,7 +275,7 @@ static int readable(struct pcmcia_socket *s, struct resource *res,
> >  		destroy_cis_cache(s);
> >  	}
> >  	s->cis_mem.res = NULL;
> > -	if ((ret != 0) || (count == 0))
> > +	if ((ret != 0) || (count == NULL))
> 
> I was wondering if it should be
> 			   (*count == 0)
> 

Actually, it looks that way as in this case count can never be none.

readable() is only called in one place where it is passed the addresses
of two local variables.  Looking at pccard_validate_cis(), the number
of valid tuples found is returned through the info pointer, or zero
if invalid cis is found.

So I'd say *count == 0 is probably right.

Dominik?

Harvey
