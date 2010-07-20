From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: manual merge of the sound tree with the arm tree
Date: Tue, 20 Jul 2010 10:03:55 +0100
Message-ID: <20100720090355.GL10222@rakim.wolfsonmicro.main>
References: <20100719110054.de489964.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100719110054.de489964.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Takashi Iwai <tiwai@suse.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk+kernel@arm.linux.org.uk>, Ryan Mallon <ryan@bluewatersys.com>
List-Id: linux-next.vger.kernel.org

On Mon, Jul 19, 2010 at 11:00:54AM +1000, Stephen Rothwell wrote:

> Today's linux-next merge of the sound tree got a conflict in
> arch/arm/mach-ep93xx/clock.c between commit
> 5c6649e3c1511b183f12d2e884d2c172fe9001e0 ("ARM: AMBA: Add pclk definition
> for platforms using primecells") from the arm tree and commit
> ed67ea82c0d9a163458dc6a69a7a3123db1a8b3b ("EP93xx: Add i2s core support")
> from the sound tree.

> Just overlapping additions.  I fixed it up (see below) and can carry the
> fix as necessary.

Ryan, can you investigate where (if anywhere is good) the best place to
carry the merge fixup is please?
