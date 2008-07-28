From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH-next] pcmcia: fix sparse integer as NULL pointer warning
Date: Mon, 28 Jul 2008 16:53:35 +0200
Message-ID: <20080728145335.GA30258@comet.dominikbrodowski.net>
References: <1216863248.30386.61.camel@brick> <20080724143634.74fe3b8d.sfr@canb.auug.org.au> <1216875606.30386.74.camel@brick>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from isilmar.linta.de ([213.133.102.198]:37425 "EHLO linta.de"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1757801AbYG1O4A (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Jul 2008 10:56:00 -0400
Content-Disposition: inline
In-Reply-To: <1216875606.30386.74.camel@brick>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Harvey Harrison <harvey.harrison@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>

On Wed, Jul 23, 2008 at 10:00:05PM -0700, Harvey Harrison wrote:
> On Thu, 2008-07-24 at 14:36 +1000, Stephen Rothwell wrote:
> > On Wed, 23 Jul 2008 18:34:08 -0700 Harvey Harrison <harvey.harrison@gmail.com> wrote:
> > >
> > > +++ b/drivers/pcmcia/rsrc_nonstatic.c
> > > @@ -275,7 +275,7 @@ static int readable(struct pcmcia_socket *s, struct resource *res,
> > >  		destroy_cis_cache(s);
> > >  	}
> > >  	s->cis_mem.res = NULL;
> > > -	if ((ret != 0) || (count == 0))
> > > +	if ((ret != 0) || (count == NULL))
> > 
> > I was wondering if it should be
> > 			   (*count == 0)
> > 
> 
> Actually, it looks that way as in this case count can never be none.
> 
> readable() is only called in one place where it is passed the addresses
> of two local variables.  Looking at pccard_validate_cis(), the number
> of valid tuples found is returned through the info pointer, or zero
> if invalid cis is found.
> 
> So I'd say *count == 0 is probably right.
> 
> Dominik?

Yes, *count == 0 is what we'd need to check here.

Thanks!

	Dominik

From: Dominik Brodowski <linux@dominikbrodowski.net>
Date: Mon, 28 Jul 2008 16:37:10 +0200
Subject: [PATCH 1/1] pcmcia: rsrc_nonstatic: check value, not pointer

Bug found by Harvey Harrison and Stephen Rothwell.

Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>
---
 drivers/pcmcia/rsrc_nonstatic.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/pcmcia/rsrc_nonstatic.c b/drivers/pcmcia/rsrc_nonstatic.c
index d0c1d63..203e579 100644
--- a/drivers/pcmcia/rsrc_nonstatic.c
+++ b/drivers/pcmcia/rsrc_nonstatic.c
@@ -275,7 +275,7 @@ static int readable(struct pcmcia_socket *s, struct resource *res,
 		destroy_cis_cache(s);
 	}
 	s->cis_mem.res = NULL;
-	if ((ret != 0) || (count == 0))
+	if ((ret != 0) || (*count == 0))
 		return 0;
 	return 1;
 }
-- 
1.5.4.3
