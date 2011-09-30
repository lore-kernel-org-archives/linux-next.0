From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Thu, 29 Sep 2011 22:40:59 -0400
Message-ID: <CAP=VYLoycp1aUYGxQkb+U70CFRvu=nz6pdd63Zapn7a-+gXWVw@mail.gmail.com>
References: <20110930111241.829ed0ada733516b71ab120d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:33403 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751739Ab1I3ClA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 Sep 2011 22:41:00 -0400
In-Reply-To: <20110930111241.829ed0ada733516b71ab120d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Sep 29, 2011 at 9:12 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi all,
>
> After merging the final tree, today's linux-next build (avr32 allnoco=
nfig)
> failed like this:
>
> arch/avr32/mach-at32ap/pio.c: In function 'pio_probe':
> arch/avr32/mach-at32ap/pio.c:401: error: 'THIS_MODULE' undeclared (fi=
rst use in this function)
>
> Probably revealed by the module.h split up. =A0I guess it needs expor=
t.h
> included.

Since export.h does not exist for most people, I'm OK adding it
in instances like this as a post-merge patch.  For instances where
it is obvious that the full module.h is required, I'd rather the origin=
ator
of the new module dependent code simply add the required module.h
themselves. (I think this is consistent with what Stephen has been
recommending to people on a case-by-case basis anyway).

I can/will temporarily add the module.h cases to the post-merge queue
too, but my intention is to move as many of these post-merge commits
off to the sub-maintainers as possible.

P.

> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
> http://www.canb.auug.org.au/~sfr/
>
