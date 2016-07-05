From: Nicholas Mc Guire <der.herr@hofr.at>
Subject: Re: process question - linux-next conflicts
Date: Tue, 5 Jul 2016 17:42:51 +0000
Message-ID: <20160705174251.GA20939@osadl.at>
References: <20160705130124.GA18622@osadl.at>
 <20160705233634.55d802c3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.osadl.at ([92.243.35.153]:42994 "EHLO mail.osadl.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751407AbcGERnA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 5 Jul 2016 13:43:00 -0400
Content-Disposition: inline
In-Reply-To: <20160705233634.55d802c3@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Tue, Jul 05, 2016 at 11:36:34PM +1000, Stephen Rothwell wrote:
> Hi Nicholas,
>=20
> On Tue, 5 Jul 2016 13:01:24 +0000 Nicholas Mc Guire <der.herr@hofr.at=
> wrote:
> >
> >  linux-next daily tree mails include information on conflicts like=20
> >=20
> >  "The drm-misc tree gained a conflict against Linus' tree."
> >=20
> >  and if one looks at these email-reported conflicts they are quite
> >  inffrequent, e.g. March 2016 range from 0-5 with a mean of about 1=
=2E5,
> >  but the plots on http://neuling.org/linux-next-size.html for=20
> >  conflicts show significantly higher numbers, again March 2016
> >  range between aprox. 10 and 75 with a mean of aprox. 40 - so I=B4m=
=20
> >  mixing up something here - are the plots refereing to different=20
> >  conflicts or am I just interpreting the e-mail notes incorectly ?
>=20
> The graphs show the total number of conflicts you would get if you di=
d
> the merges of all the trees from scratch on any one day.  But I only
> report new conflicts each day.
>

thanks - that explains it - what confused me is that the plot never see=
ms
to reach 0 which I would have expected - but I guess that is due to the=
=20
fixes you are applying and/or trees that get temporarily dropping trees=
=20
that dont resolve conflicts.

thx!
hofrat
