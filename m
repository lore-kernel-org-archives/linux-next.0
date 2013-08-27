From: Mike Turquette <mturquette@linaro.org>
Subject: Re: linux-next: manual merge of the clk tree with Linus' tree
Date: Tue, 27 Aug 2013 09:53:19 -0700
Message-ID: <20130827165319.8231.9@quantum>
References: <20130827190304.c3f2f891f20d078d66b703b1@canb.auug.org.au>
 <521C7AF0.1020903@imgtec.com>
 <20f57100-4440-4353-9c84-6e5781f7c6d3@DB9EHSMHS025.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:57301 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753205Ab3H0QxZ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Aug 2013 12:53:25 -0400
Received: by mail-pa0-f42.google.com with SMTP id lj1so5093410pab.29
        for <linux-next@vger.kernel.org>; Tue, 27 Aug 2013 09:53:25 -0700 (PDT)
In-Reply-To: <20f57100-4440-4353-9c84-6e5781f7c6d3@DB9EHSMHS025.ehs.local>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?utf-8?q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, James Hogan <james.hogan@imgtec.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>

Quoting S=C3=B6ren Brinkmann (2013-08-27 08:44:11)
> On Tue, Aug 27, 2013 at 11:09:52AM +0100, James Hogan wrote:
> > On 27/08/13 10:03, Stephen Rothwell wrote:
> > > Hi Mike,
> > >=20
> > > Today's linux-next merge of the clk tree got a conflict in
> > > drivers/clk/zynq/clkc.c between commits 252957cc3a2d ("clk/zynq/c=
lkc: Add
> > > dedicated spinlock for the SWDT") and 765b7d4c4cb3
> > > ("clk/zynq/clkc: Add CLK_SET_RATE_PARENT flag to ethernet muxes")=
 from
> > > Linus' tree and commit 819c1de344c5 ("clk: add CLK_SET_RATE_NO_RE=
PARENT
> > > flag") from the clk tree.
> > >=20
> > > I fixed it up (see below and in a couple of places I chose
> > > CLK_SET_RATE_NO_REPARENT over CLK_SET_RATE_PARENT, which may, of =
course,
> > > be wrong) and can carry the fix as necessary (no action is requir=
ed).
> >=20
> > The case you mentioned looks correct to me.
> >=20
> > I can't see todays -next yet, but if by "choose CLK_SET_RATE_NO_REP=
ARENT
> > over CLK_SET_RATE_PARENT" you mean one branch adds CLK_SET_RATE_PAR=
ENT,
> > clk-next adds CLK_SET_RATE_NO_REPARENT, and the resolution ends up =
with
> > only CLK_SET_RATE_NOREPARENT then that sounds wrong, as the two fla=
gs
> > are orthogonal.
>=20
> I can just agree, the case included in the mail looks correct, but in
> case of other conflicts both flags should be set. Just like in the ca=
se
> shown here.

Stephen's fix is correct. The Zynq patches came in as fixes so I think
this will be a rare event.

Regards,
Mike

>=20
>         S=C3=B6ren
