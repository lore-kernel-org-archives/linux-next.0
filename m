From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: is the weeks before -rc1 the time to really be working on -next?
Date: Wed, 15 Oct 2008 22:04:17 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0810152202230.25933@anakin>
References: <20081015174015.GB8663@kroah.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754862AbYJOUEb@vger.kernel.org>
In-Reply-To: <20081015174015.GB8663@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, 15 Oct 2008, Greg KH wrote:
> Just wondering, I know that -next is failing right now, and is a major
> pain to produce, but that seems to be primarily due to all of the
> subsystems merging with Linus right now.
> 
> So does it even make sense to try to create a -next during the 2 weeks
> of the major merge window?  It seems to just cause you a whole lot of
> work, that in the end, is mostly unecessary as all of the subsystem
> maintainers are doing the merging themselves as trees move into Linus's
> tree?

I don't know if it's worth the effort...

However, we definitely missed linux-next during the last few weeks, seeing
things getting into mainline that don't even survive simple compile tests.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
