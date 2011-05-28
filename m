From: Jean Delvare <khali@linux-fr.org>
Subject: Re: linux-next: manual merge of the async_tx tree with Linus' tree
Date: Sat, 28 May 2011 10:20:53 +0200
Message-ID: <20110528102053.58a6d67f@endymion.delvare>
References: <20110527133003.8299b429.sfr@canb.auug.org.au>
	<20110527095336.25007886@endymion.delvare>
	<BANLkTikAShzPv_6c6Z8Z9Xdt9TgQbcM-xA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zone0.gcu-squad.org ([212.85.147.21]:35148 "EHLO
	services.gcu-squad.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752357Ab1E1IWd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 28 May 2011 04:22:33 -0400
In-Reply-To: <BANLkTikAShzPv_6c6Z8Z9Xdt9TgQbcM-xA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Havard Skinnemoen <hskinnemoen@gmail.com>, Jiri Kosina <jkosina@suse.cz>, Viresh Kumar <viresh.kumar@st.com>

Hi Dan,

On Fri, 27 May 2011 12:08:37 -0700, Dan Williams wrote:
> On Fri, May 27, 2011 at 12:53 AM, Jean Delvare <khali@linux-fr.org> w=
rote:
> > Hi Stephen, Dan,
> >
> > On Fri, 27 May 2011 13:30:03 +1000, Stephen Rothwell wrote:
> >> Today's linux-next merge of the async_tx tree got a conflict in
> >> drivers/dma/dw_dmac.c between commit e05503ef1186 ("Haavard Skinne=
moen
> >> has left Atmel") from Linus' tree and commit aecb7b64dd9e
> >> ("dmaengine/dw_dmac: Update maintainer-ship") from the async_tx tr=
ee.
> >>
> >> Just context changes. =A0I fixed it up (see below) and can carry t=
he fix as
> >> necessary.
> >
> > Dan's patch is just plain wrong. MODULE_AUTHOR is about who wrote t=
he
> > code, not who maintains it. A change of maintainer should lead to a=
n
> > update or addition to file MAINTAINERS.
>=20
> The patch in question did also update MAINTAINERS.  Since Viresh has
> done a good amount of work on the driver (top-developer by commits
> since the initial merge) and likely cares about user reports (now tha=
t
> he has stepped up to maintain it) is there a reason that he should no=
t
> have his own MODULE_AUTHOR line in the driver as well?

Sorry, I guess I shouldn't have commented on a driver I don't know
anything about. Furthermore, I didn't read the patch carefully, it is
adding a MODULE_AUTHOR, when I thought it was replacing it (in all
honestly I didn't even know it was possible to have more than one
MODULE_AUTHOR statement per driver.)

So really it's alright, just ignore me, and sorry for the noise.

> > (...)
> > (As a side note, the relevance of MODULE_AUTHOR given the developme=
nt
> > and maintenance model the Linux kernel has embraced can certainly b=
e
> > discussed, but that's a different story.)
>=20
> We don't seem to have documentation around it, but making a bunch of
> commits and stepping up to be a maintainer seems enough justification
> to have your contact info show up in modinfo...

My point is that the authors of a driver aren't necessarily the right
persons to contact in case of problem. Given that distribution users
won't find the MAINTAINERS file (and the files entries there point to
source files anyway), users don't have a proper way to find the right
contact. I suspect that driver authors are better located in the source
code (it is already there most of the time) and we'd rather need a
MODULE_MAINTAINER() macro, ideally generated automatically from
MAINTAINERS. But again it is a wider debate, not related with the
problem at hand.

--=20
Jean Delvare
