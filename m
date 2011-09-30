From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Thu, 29 Sep 2011 23:22:32 -0400
Message-ID: <20110930032231.GB16194@windriver.com>
References: <20110930111241.829ed0ada733516b71ab120d@canb.auug.org.au>
 <CAP=VYLoycp1aUYGxQkb+U70CFRvu=nz6pdd63Zapn7a-+gXWVw@mail.gmail.com>
 <20110930130550.2f6597491fa1b59f3be839e0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:43309 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753919Ab1I3DWh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 Sep 2011 23:22:37 -0400
Content-Disposition: inline
In-Reply-To: <20110930130550.2f6597491fa1b59f3be839e0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

[Re: linux-next: build failure after merge of the final tree] On 30/09/=
2011 (Fri 13:05) Stephen Rothwell wrote:

> Hi Paul,
>=20
> On Thu, 29 Sep 2011 22:40:59 -0400 Paul Gortmaker <paul.gortmaker@win=
driver.com> wrote:
> >
> > On Thu, Sep 29, 2011 at 9:12 PM, Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
> > >
> > > After merging the final tree, today's linux-next build (avr32 all=
noconfig)
> > > failed like this:
> > >
> > > arch/avr32/mach-at32ap/pio.c: In function 'pio_probe':
> > > arch/avr32/mach-at32ap/pio.c:401: error: 'THIS_MODULE' undeclared=
 (first use in this function)
> > >
> > > Probably revealed by the module.h split up. =A0I guess it needs e=
xport.h
> > > included.
> >=20
> > Since export.h does not exist for most people, I'm OK adding it
> > in instances like this as a post-merge patch.
>=20
> I had another look at this and it turns out that export.h is already
> included, but only conditionally.  I guess the include just needs mov=
ing
> to the top of the file.

Agreed.  A side effect of my "find a linux include and add another belo=
w
it" script.   These conditional includes (which are dubious to begin
with) seem to always get caught by that.  I'll fix this up and make it
unconditional for tomorrow.

Thanks,
Paul.

>=20
> --=20
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
