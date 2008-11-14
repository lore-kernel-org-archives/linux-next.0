From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Can you add the staging tree to -next?
Date: Fri, 14 Nov 2008 15:16:25 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0811141515470.26818@anakin>
References: <20081112235600.GA27554@kroah.com> <Pine.LNX.4.64.0811140825410.11953@anakin>
 <20081114185016.0097d4eb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752818AbYKNOQj@vger.kernel.org>
In-Reply-To: <20081114185016.0097d4eb.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Fri, 14 Nov 2008, Stephen Rothwell wrote:
> On Fri, 14 Nov 2008 08:42:48 +0100 (CET) Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > Apart from the patches you receive against -next, is there any other
> > advantage, giving staging is disabled?
> 
> Others compile linux-next with all sorts of configs, so we hopefully will
> see any build failures.  In fact, Greg might even built it with staging
> enabled :-)
> 
> We will also see any merge conflicts (though there probably won't be
> many).
> 
> I may also see if I can arrange for a build in each architecture with
> staging enabled in my infrastructure here, but it may take a little while.

I build them for m68k anyway, but due to timezone differences, you usually find
(and sometimes even fix ;-) the problems long before I notice them.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
