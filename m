From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Subject: Re: linux-next: manual merge of the v4l-dvb tree with the arm-soc
 tree
Date: Wed, 11 Jan 2012 09:36:51 +0100 (CET)
Message-ID: <Pine.LNX.4.64.1201110933480.1191@axis700.grange>
References: <20120111133146.990e2b7115c9fa80e8fc3234@canb.auug.org.au>
 <CAOesGMh0W1hvpySB8jtVBojZtoniHXur98Bzq1Feh3vAD4CkOg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:52466 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757032Ab2AKIhN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Jan 2012 03:37:13 -0500
In-Reply-To: <CAOesGMh0W1hvpySB8jtVBojZtoniHXur98Bzq1Feh3vAD4CkOg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Nicolas Ferre <nicolas.ferre@atmel.com>

On Tue, 10 Jan 2012, Olof Johansson wrote:

> On Tue, Jan 10, 2012 at 6:31 PM, Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
> > Hi Mauro,
> >
> > Today's linux-next merge of the v4l-dvb tree got conflicts in a lar=
ge
> > number of files between commits from the arm-soc tree and commits f=
rom the
> > v4l-dvb tree. =A0You have rebased the v4l-dvb tree onto v3.2 while =
the
> > arm-soc tree had merged a previous version. you have then added a l=
ot
> > more commits on top of the result - which produces all the conflict=
s. =A0:-(
> >
> > This is exactly the sort of pain I alluded to when I first noted th=
at the
> > v4l-dvb tree had been merged into the arm-soc tree ...
>=20
> We do this every now and then though, it's not an issue as long as
> nothing stupid is done with the dependent branch at the other end.
> I.e. if it's actually a stable branch (which we got promised that it
> was).
>=20
> So, why was the whole v4l tree rebased? Guennadi, you said it was
> going to be a stable branch? What happened?

Sorry, I don't think I _promised_ anything, I even don't think I said=20
anything at all about the stability of that branch. On the contrary - I=
=20
suggested you to only take _one_ patch, about which we knew, that some =
ARM=20
patches depended upon, for which I've got Mauro's ack. This has been do=
ne=20
with the sole purpose for you to avoid any dependencies. Instead you=20
decided to pull the whole branch.

> > Not happy.
>=20
> No kidding.  Mauro, can you undo your rebase or should I remove the
> dependent branch (and the at91 branch that needs it) from arm-soc
> instead?

Thanks
Guennadi
---
Guennadi Liakhovetski, Ph.D.
=46reelance Open-Source Software Developer
http://www.open-technology.de/
