From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: linux-next: manual merge of the clk tree with Linus' tree
Date: Wed, 28 Aug 2013 08:48:03 -0700
Message-ID: <e0d9bd21-a5dd-496c-aa3b-38ef55b34de5@DB8EHSMHS028.ehs.local>
References: <20130827190304.c3f2f891f20d078d66b703b1@canb.auug.org.au>
 <521C7AF0.1020903@imgtec.com>
 <20f57100-4440-4353-9c84-6e5781f7c6d3@DB9EHSMHS025.ehs.local>
 <20130827165319.8231.9@quantum>
 <20130828100431.3005d52d77c565c241399269@canb.auug.org.au>
 <20130828172225.97f295645c9de0bbd2979fcd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-db8lp0186.outbound.messaging.microsoft.com ([213.199.154.186]:10753
	"EHLO db8outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752677Ab3H1PsN convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 28 Aug 2013 11:48:13 -0400
Content-Disposition: inline
In-Reply-To: <20130828172225.97f295645c9de0bbd2979fcd@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mike Turquette <mturquette@linaro.org>, James Hogan <james.hogan@imgtec.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>

On Wed, Aug 28, 2013 at 05:22:25PM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> On Wed, 28 Aug 2013 10:04:31 +1000 Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
> >
> > On Tue, 27 Aug 2013 09:53:19 -0700 Mike Turquette <mturquette@linar=
o.org> wrote:
> > >
> > > Quoting S=C3=B6ren Brinkmann (2013-08-27 08:44:11)
> > > > On Tue, Aug 27, 2013 at 11:09:52AM +0100, James Hogan wrote:
> > > > > On 27/08/13 10:03, Stephen Rothwell wrote:
> > > > > > Hi Mike,
> > > > > >=20
> > > > > > Today's linux-next merge of the clk tree got a conflict in
> > > > > > drivers/clk/zynq/clkc.c between commits 252957cc3a2d ("clk/=
zynq/clkc: Add
> > > > > > dedicated spinlock for the SWDT") and 765b7d4c4cb3
> > > > > > ("clk/zynq/clkc: Add CLK_SET_RATE_PARENT flag to ethernet m=
uxes") from
> > > > > > Linus' tree and commit 819c1de344c5 ("clk: add CLK_SET_RATE=
_NO_REPARENT
> > > > > > flag") from the clk tree.
> > > > > >=20
> > > > > > I fixed it up (see below and in a couple of places I chose
> > > > > > CLK_SET_RATE_NO_REPARENT over CLK_SET_RATE_PARENT, which ma=
y, of course,
> > > > > > be wrong) and can carry the fix as necessary (no action is =
required).
> > > > >=20
> > > > > The case you mentioned looks correct to me.
> > > > >=20
> > > > > I can't see todays -next yet, but if by "choose CLK_SET_RATE_=
NO_REPARENT
> > > > > over CLK_SET_RATE_PARENT" you mean one branch adds CLK_SET_RA=
TE_PARENT,
> > > > > clk-next adds CLK_SET_RATE_NO_REPARENT, and the resolution en=
ds up with
> > > > > only CLK_SET_RATE_NOREPARENT then that sounds wrong, as the t=
wo flags
> > > > > are orthogonal.
> > > >=20
> > > > I can just agree, the case included in the mail looks correct, =
but in
> > > > case of other conflicts both flags should be set. Just like in =
the case
> > > > shown here.
> > >=20
> > > Stephen's fix is correct. The Zynq patches came in as fixes so I =
think
> > > this will be a rare event.
> >=20
> > Can you guys discuss this and come up with a single answer.  I read=
 the above as:
> >=20
> > (for the two places I used CLK_SET_RATE_NO_REPARENT where the two
> > branches each added that and CLK_SET_RATE_NOREPARENT respectively)
> >=20
> > "Stephen was wrong"
> > "Stephen should have taken both"
> > "Stephen was right"
> >=20
> > :-)
> >=20
> > I can fix up my merge resolution if you tell me the correct fix.  A=
lso,
> > you will need to know so that you can tell Linus (or whoever else h=
as to
> > resolve these conflicts).
>=20
> OK, I thought about it some more and the resolution now looks like
> below.  Is this correct/better?

Yes, looks correct to me.

	S=C3=B6ren
