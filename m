From: Andres Salomon <dilinger@queued.net>
Subject: Re: linux-next: manual merge of the mfd tree with the i.MX tree
Date: Tue, 1 Mar 2011 11:39:30 -0800
Message-ID: <20110301113930.4743a13c@debxo>
References: <20110301145436.b1ae1923.sfr@canb.auug.org.au>
	<20110301093528.00184f93@archvile>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110301093528.00184f93@archvile>
Sender: linux-kernel-owner@vger.kernel.org
To: David Jander <david.jander@protonic.nl>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Samuel Ortiz <sameo@linux.intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Jander <david@protonic.nl>, Sascha Hauer <s.hauer@pengutronix.de>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: linux-next.vger.kernel.org

On Tue, 1 Mar 2011 09:35:28 +0100
David Jander <david.jander@protonic.nl> wrote:

> 
> Hi Stephen,
> 
> On Tue, 1 Mar 2011 14:54:36 +1100
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Today's linux-next merge of the mfd tree got a conflict in
> > arch/arm/mach-imx/mach-mx27_3ds.c arch/arm/mach-imx/mach-pcm038.c
> > arch/arm/mach-mx3/mach-mx31_3ds.c
> > arch/arm/mach-mx3/mach-mx31moboard.c between commit
> > 5836372e8a0ba5cc633f61bc0484ee20c86f4b36 ("ARM: imx+mx3: convert to
> > mc13xxx MFD") from the i.MX tree and commit
> > e84e545d47d26644275a79fe5ebc1797bcb80910 ("mfd: mfd_cell is now
> > implicitly available to mc13xxx drivers") from the mfd tree.
> > 
> > I fixed it up (I think - see below) and can carry the fix as
> > necessary.
> 
> Your fix seems correct, although I fear I am too dumb to understand
> why commit e84e545d47d26644275a79fe5ebc1797bcb80910 introduces this
> extra struct nesting.... AFAICS gcc will end up doing the same as
> without the extra nest.

It was requested in this thread:
https://patchwork.kernel.org/patch/551441/
