From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: RE: linux-next: Tree for June 3
Date: Fri, 4 Jun 2010 15:57:13 -0700 (PDT)
Message-ID: <alpine.LFD.2.00.1006041548480.8175@i5.linux-foundation.org>
References: <20100603134753.710a64b3.sfr@canb.auug.org.au> <AANLkTilr92GkR8bfgyjtb8ToYEEAv4oCsFsfsy04HJRU@mail.gmail.com> <AANLkTim6v2s-Q5BndAKLOZKaA1wYgbU3UKJwNy-6Jkki@mail.gmail.com> <201006032222.57411.rusty@rustcorp.com.au>
 <AANLkTikN_3oLIFQ0CRiLwXUV79myy_aqriezdCgnZHFT@mail.gmail.com> <alpine.LFD.2.00.1006041255210.8175@i5.linux-foundation.org> <987664A83D2D224EAE907B061CE93D530114C3DC47@orsmsx505.amr.corp.intel.com> <alpine.LFD.2.00.1006041452130.8175@i5.linux-foundation.org>
 <987664A83D2D224EAE907B061CE93D530114C3DE4D@orsmsx505.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <987664A83D2D224EAE907B061CE93D530114C3DE4D@orsmsx505.amr.corp.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Dave Young <hidave.darkstar@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org



On Fri, 4 Jun 2010, Luck, Tony wrote:
> 
> It gets rid of the oops. So that's good.  Something is still
> hokey in linux-next land though because no modules get loaded.
> So no ehci/uhci available :-(

So maybe the error (the one that caused us to exit and caused the oops due 
to the wrong return value) is the one that now causes it to not load.

I note that ia64 has a pretty big/complex module_frob_arch_sections(). 
Many architectures (like x86) has a trivial one ("return 0;"), and there 
might be some ordering differences in the setup that only matter with 
architectures that do odd things there..

		Linus
