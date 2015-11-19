From: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: linux-next: manual merge of the audit tree with Linus' tree
Date: Thu, 19 Nov 2015 13:30:12 -0500
Message-ID: <20151119183012.GA1080@madcap2.tricolour.ca>
References: <20151119120615.13b6ce0b@canb.auug.org.au>
 <CAHC9VhS3VGaAn34dM6pJ5KGM=jZ9bdyA71xMjD_t--YsPXF8pw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:42472 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753168AbbKSSaQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Nov 2015 13:30:16 -0500
Content-Disposition: inline
In-Reply-To: <CAHC9VhS3VGaAn34dM6pJ5KGM=jZ9bdyA71xMjD_t--YsPXF8pw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Moore <paul@paul-moore.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mel Gorman <mgorman@techsingularity.net>, Andrew Morton <akpm@linux-foundation.org>

On 15/11/19, Paul Moore wrote:
> On Wed, Nov 18, 2015 at 8:06 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi Paul,
> >
> > Today's linux-next merge of the audit tree got a conflict in:
> >
> >   kernel/audit.c
> >
> > between commit:
> >
> >   d0164adc89f6 ("mm, page_alloc: distinguish between being unable to sleep, unwilling to sleep and avoiding waking kswapd")
> >
> > from Linus' tree and commit:
> >
> >   14eeba1d242e ("audit: include auditd's threads in audit_log_start() wait exception")
> >
> > from the audit tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary (no action
> > is required).
> 
> Thanks Stephen, I found the same thing yesterday while doing some
> testing; your patch looks good to me.

Stephen, your patch looks fine to me.  I had some minor concerns about
deeper issues as to whether the original intent of that part of the
audit subsystem was affected by this change, but that is WRT the
conflicting patch rather than your merge.  After poking around a bit, I
don't have any outstanding concerns.

> > diff --cc kernel/audit.c
> > index bc2ff61bc1d6,ca1b9cda2766..000000000000
> > --- a/kernel/audit.c
> > +++ b/kernel/audit.c
> > @@@ -1371,9 -1371,9 +1371,9 @@@ struct audit_buffer *audit_log_start(st
> >         if (unlikely(audit_filter_type(type)))
> >                 return NULL;
> >
> >  -      if (gfp_mask & __GFP_WAIT) {
> >  +      if (gfp_mask & __GFP_DIRECT_RECLAIM) {
> > -               if (audit_pid && audit_pid == current->pid)
> > +               if (audit_pid && audit_pid == current->tgid)
> >  -                      gfp_mask &= ~__GFP_WAIT;
> >  +                      gfp_mask &= ~__GFP_DIRECT_RECLAIM;
> >                 else
> >                         reserve = 0;
> >         }
> 
> paul moore

- RGB

--
Richard Guy Briggs <rbriggs@redhat.com>
Senior Software Engineer, Kernel Security, AMER ENG Base Operating Systems, Red Hat
Remote, Ottawa, Canada
Voice: +1.647.777.2635, Internal: (81) 32635, Alt: +1.613.693.0684x3545
