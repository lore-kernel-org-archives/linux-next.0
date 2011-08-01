From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Aug 1
Date: Mon, 1 Aug 2011 14:54:22 -0700
Message-ID: <20110801145422.cccff7aa.rdunlap@xenotime.net>
References: <20110801144732.7f5204b219f628f2a2a63b0c@canb.auug.org.au>
	<CA+icZUXq9V6h6kJrjckpeDXQAbQ-skiKLwTjD7Luhz1mTqSM1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy6-pub.bluehost.com ([67.222.54.6]:46218 "HELO
	oproxy6-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752473Ab1HAVyY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 1 Aug 2011 17:54:24 -0400
In-Reply-To: <CA+icZUXq9V6h6kJrjckpeDXQAbQ-skiKLwTjD7Luhz1mTqSM1w@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: Sedat Dilek <sedat.dilek@googlemail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Andrew Morton <akpm@linux-foundation.org>

On Mon, 1 Aug 2011 09:01:21 +0200 Sedat Dilek wrote:

> On Mon, Aug 1, 2011 at 6:47 AM, Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote:
> > Hi all,
> >
> > Just in case anyone needs reminding: =A0Please do not add anything =
destined
> > for v3.2 into linux-next included trees until after v3.1-rc1.
> >
> > The powerpc allyesconfig build (at least) fails today.
> >
> > Changes since 20110729:
> >
> > Linus' tree still lost its build failure.
> >
> > The v4l-dvb tree lost its conflicts.
> >
> > The kgdb tree gained a build failure for which I reverted 3 commits=
=2E
> >
> > The moduleh tree gained a conflict against the slabe-dma tree but l=
ost
> > its build failures (except for a few remaining merge fixups).
> >
> > -------------------------------------------------------------------=
---------
> >
>=20
> Just FYI: mmotm-tree still misses the fixup-patch from [1].
>=20
> - Sedat -
>=20
> [1] https://patchwork.kernel.org/patch/1021602/

Yes, I am applying this patch daily (among others).  :(

Acked-by: Randy Dunlap <rdunlap@xenotime.net>

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your cod=
e ***
