From: Greg KH <greg@kroah.com>
Subject: Re: [ANNOUNCE] linux-staging tree created
Date: Wed, 11 Jun 2008 09:24:14 -0700
Message-ID: <20080611162414.GB22134@kroah.com>
References: <20080610190540.GA25066@kroah.com> <1213146346.16146.17.camel@nigel-laptop> <20080611032948.GB4483@kroah.com> <1213156812.16146.37.camel@nigel-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:57457 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751309AbYFKQ1q (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Jun 2008 12:27:46 -0400
Content-Disposition: inline
In-Reply-To: <1213156812.16146.37.camel@nigel-laptop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nigel Cunningham <nigel@tuxonice.net>
Cc: linux-kernel@vger.kernel.org, devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Wed, Jun 11, 2008 at 02:00:12PM +1000, Nigel Cunningham wrote:
> Hi Greg.
>=20
> On Tue, 2008-06-10 at 20:29 -0700, Greg KH wrote:
> > On Wed, Jun 11, 2008 at 11:05:46AM +1000, Nigel Cunningham wrote:
> > > Hi.
> > >=20
> > > Would you consider including TuxOnIce in it?
> > >=20
> > > I do still want to get it merged and would appreciate feedback.
> >=20
> > Is the patch "stand-alone", only adding new code in discrete chunks=
 like
> > a new driver or filesystem would?
>=20
> =EF=BB=BFThe patch I distribute now does have a few parts to it that =
could be
> separated into distinct patches (cryptoapi LZF support, fuse freezer
> support), but the bulk of it is TuxOnIce itself, which just adds new
> files and inserts the hooks necessary to share the lowlevel code with
> [u]swsusp. I think, therefore, it would akin to adding a new driver o=
r
> filesystem.
>=20
> > If not, I don't think it is relevant.  Odds are you want to be your=
 own
> > series of patches, like we discussed years ago, right?
>=20
> I don't think I do want to have my own series of patches, because
> TuxOnIce doesn't remove or rework swsusp or uswsusp, but sits along s=
ide
> them. I'm not trying to mutate swsusp into TuxOnIce, because that wou=
ld
> require a complete rework of swsusp from the ground up (TuxOnIce does
> everything but the atomic copy/restore =EF=BB=BFand associated prep/c=
leanup
> differently).

Like always, you need to divide your changes up into logical chunks in
order to get them approved and reviewed.  For such a core functionality
like suspend, this is extra important.

I do not think that -staging is proper for this kind of feature at this
point in time.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-next" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
