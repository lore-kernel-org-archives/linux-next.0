From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: mac80211.h (was: Re: linux-next: Tree for November 12)
Date: Wed, 12 Nov 2008 08:56:31 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0811120854290.13217@anakin>
References: <20081112182818.6e259488.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752009AbYKLH4p@vger.kernel.org>
In-Reply-To: <20081112182818.6e259488.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, 12 Nov 2008, Stephen Rothwell wrote:
> Status of my local build tests will be at
> http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
> advice about cross compilers/configs that work, we are always open to add
> more builds.

http://kisskb.ellerman.id.au/kisskb/buildresult/54400/

include/net/mac80211.h:400: error: size of array 'type name' is negative
include/net/mac80211.h:405: error: size of array 'type name' is negative

| struct ieee80211_tx_info {
| 	/* common information */
| 	u32 flags;
| 	u8 band;
| 
| 	u8 antenna_sel_tx;
| 
| 	/* 2 byte hole */
        ^^^^^^^^^^^^^^^^^^

This must be made explicit using padding, as on some architecture the alignment
of 32-bit values is 2 bytes, not 4.

| 	union {

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
