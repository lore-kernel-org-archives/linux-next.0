From: "Eric Miao" <ymiao3@marvell.com>
Subject: RE: linux-next: manual merge of the mtd tree
Date: Thu, 11 Dec 2008 02:32:38 -0800
Message-ID: <E913911567467945BBEB9277E27868B0015DC4A2@msiexch01.marvell.com>
References: <20081211134307.b7ce748d.sfr@canb.auug.org.au><bc64b4640812110211h294707d8ndd58f611152b893d@mail.gmail.com> <20081211212335.828b902c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from host2.marvell.com ([65.219.4.2]:21114 "EHLO maili.marvell.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1755132AbYLKKn4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 11 Dec 2008 05:43:56 -0500
Content-class: urn:content-classes:message
In-Reply-To: <20081211212335.828b902c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-next@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>


> -----Original Message-----
> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> Sent: 2008=C4=EA12=D4=C211=C8=D5 18:24
> To: Dmitry Eremin-Solenikov
> Cc: David Woodhouse; linux-next@vger.kernel.org; Eric Miao; Russell K=
ing
> Subject: Re: linux-next: manual merge of the mtd tree
>=20
> Hi Dmitry,
>=20
> On Thu, 11 Dec 2008 13:11:20 +0300 "Dmitry Eremin-Solenikov"
> <dbaryshkov@gmail.com> wrote:
> >
> > Unfortunately those changes are independant, so I don't quite
> > understand what to do.
> > If you'd prefer, I can provide merged versions of all 3 files, so t=
hat
> > you can use this
> > as merge resolution via git-rerere. Is that suitable for you?
>=20
> That would be a great help, thanks.

I can do a trivial merge of mtd tree and resolve this, but it would be
more reasonable if the merge can be made within one tree (I don't think
cross-merging back-n-forth is something interesting)
