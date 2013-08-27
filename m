From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: linux-next: manual merge of the clk tree with Linus' tree
Date: Tue, 27 Aug 2013 08:44:11 -0700
Message-ID: <20f57100-4440-4353-9c84-6e5781f7c6d3@DB9EHSMHS025.ehs.local>
References: <20130827190304.c3f2f891f20d078d66b703b1@canb.auug.org.au>
 <521C7AF0.1020903@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-db9lp0251.outbound.messaging.microsoft.com ([213.199.154.251]:42523
	"EHLO db9outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752192Ab3H0Po1 convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 27 Aug 2013 11:44:27 -0400
Content-Disposition: inline
In-Reply-To: <521C7AF0.1020903@imgtec.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Hogan <james.hogan@imgtec.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Mike Turquette <mturquette@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>

On Tue, Aug 27, 2013 at 11:09:52AM +0100, James Hogan wrote:
> On 27/08/13 10:03, Stephen Rothwell wrote:
> > Hi Mike,
> >=20
> > Today's linux-next merge of the clk tree got a conflict in
> > drivers/clk/zynq/clkc.c between commits 252957cc3a2d ("clk/zynq/clk=
c: Add
> > dedicated spinlock for the SWDT") and 765b7d4c4cb3
> > ("clk/zynq/clkc: Add CLK_SET_RATE_PARENT flag to ethernet muxes") f=
rom
> > Linus' tree and commit 819c1de344c5 ("clk: add CLK_SET_RATE_NO_REPA=
RENT
> > flag") from the clk tree.
> >=20
> > I fixed it up (see below and in a couple of places I chose
> > CLK_SET_RATE_NO_REPARENT over CLK_SET_RATE_PARENT, which may, of co=
urse,
> > be wrong) and can carry the fix as necessary (no action is required=
).
>=20
> The case you mentioned looks correct to me.
>=20
> I can't see todays -next yet, but if by "choose CLK_SET_RATE_NO_REPAR=
ENT
> over CLK_SET_RATE_PARENT" you mean one branch adds CLK_SET_RATE_PAREN=
T,
> clk-next adds CLK_SET_RATE_NO_REPARENT, and the resolution ends up wi=
th
> only CLK_SET_RATE_NOREPARENT then that sounds wrong, as the two flags
> are orthogonal.

I can just agree, the case included in the mail looks correct, but in
case of other conflicts both flags should be set. Just like in the case
shown here.

	S=C3=B6ren
