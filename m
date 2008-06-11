From: Nigel Cunningham <nigel@tuxonice.net>
Subject: Re: [ANNOUNCE] linux-staging tree created
Date: Wed, 11 Jun 2008 14:00:12 +1000
Message-ID: <1213156812.16146.37.camel@nigel-laptop>
References: <20080610190540.GA25066@kroah.com>
	 <1213146346.16146.17.camel@nigel-laptop>  <20080611032948.GB4483@kroah.com>
Reply-To: nigel@tuxonice.net
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.tuxonice.net ([67.207.135.122]:55537 "EHLO
	mail.tuxonice.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754827AbYFKD5H (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Jun 2008 23:57:07 -0400
In-Reply-To: <20080611032948.GB4483@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-kernel@vger.kernel.org, devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

Hi Greg.

On Tue, 2008-06-10 at 20:29 -0700, Greg KH wrote:
> On Wed, Jun 11, 2008 at 11:05:46AM +1000, Nigel Cunningham wrote:
> > Hi.
> >=20
> > Would you consider including TuxOnIce in it?
> >=20
> > I do still want to get it merged and would appreciate feedback.
>=20
> Is the patch "stand-alone", only adding new code in discrete chunks l=
ike
> a new driver or filesystem would?

=EF=BB=BFThe patch I distribute now does have a few parts to it that co=
uld be
separated into distinct patches (cryptoapi LZF support, fuse freezer
support), but the bulk of it is TuxOnIce itself, which just adds new
files and inserts the hooks necessary to share the lowlevel code with
[u]swsusp. I think, therefore, it would akin to adding a new driver or
filesystem.

> If not, I don't think it is relevant.  Odds are you want to be your o=
wn
> series of patches, like we discussed years ago, right?

I don't think I do want to have my own series of patches, because
TuxOnIce doesn't remove or rework swsusp or uswsusp, but sits along sid=
e
them. I'm not trying to mutate swsusp into TuxOnIce, because that would
require a complete rework of swsusp from the ground up (TuxOnIce does
everything but the atomic copy/restore =EF=BB=BFand associated prep/cle=
anup
differently).

Regards,

Nigel

--
To unsubscribe from this list: send the line "unsubscribe linux-next" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
