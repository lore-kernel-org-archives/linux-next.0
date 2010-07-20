From: Ryan Mallon <ryan@bluewatersys.com>
Subject: Re: linux-next: manual merge of the sound tree with the arm tree
Date: Wed, 21 Jul 2010 08:54:35 +1200
Message-ID: <4C460D0B.4040407@bluewatersys.com>
References: <20100719110054.de489964.sfr@canb.auug.org.au> <20100720090355.GL10222@rakim.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100720090355.GL10222@rakim.wolfsonmicro.main>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Takashi Iwai <tiwai@suse.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk+kernel@arm.linux.org.uk>
List-Id: linux-next.vger.kernel.org

On 07/20/2010 09:03 PM, Mark Brown wrote:
> On Mon, Jul 19, 2010 at 11:00:54AM +1000, Stephen Rothwell wrote:
> 
>> Today's linux-next merge of the sound tree got a conflict in
>> arch/arm/mach-ep93xx/clock.c between commit
>> 5c6649e3c1511b183f12d2e884d2c172fe9001e0 ("ARM: AMBA: Add pclk definition
>> for platforms using primecells") from the arm tree and commit
>> ed67ea82c0d9a163458dc6a69a7a3123db1a8b3b ("EP93xx: Add i2s core support")
>> from the sound tree.
> 
>> Just overlapping additions.  I fixed it up (see below) and can carry the
>> fix as necessary.
> 
> Ryan, can you investigate where (if anywhere is good) the best place to
> carry the merge fixup is please?

The fix is fine. I don't really know much about how merge conflicts are
handled across trees, but I would think that it is probably easiest if
Stephen carries it.

~Ryan

-- 
Bluewater Systems Ltd - ARM Technology Solution Centre

Ryan Mallon         		5 Amuri Park, 404 Barbadoes St
ryan@bluewatersys.com         	PO Box 13 889, Christchurch 8013
http://www.bluewatersys.com	New Zealand
Phone: +64 3 3779127		Freecall: Australia 1800 148 751
Fax:   +64 3 3779135			  USA 1800 261 2934
