From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: Tree for September 3
Date: Mon, 8 Sep 2008 21:39:03 -0700
Message-ID: <200809082139.03714.jbarnes@virtuousgeek.org>
References: <20080903191619.6b6b230e.sfr@canb.auug.org.au> <20080904012544.cabed847.akpm@linux-foundation.org> <alpine.LFD.1.10.0809040143350.3452@nehalem.linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754625AbYIIEj1@vger.kernel.org>
In-Reply-To: <alpine.LFD.1.10.0809040143350.3452@nehalem.linux-foundation.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Yinghai Lu <yhlu.kernel@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>
List-Id: linux-next.vger.kernel.org

On Thursday, September 04, 2008 1:50 am Linus Torvalds wrote:
> On Thu, 4 Sep 2008, Andrew Morton wrote:
> > <plugs it in>
> >
> > cs: pcmcia_socket0: unable to apply power.
> > pccard: CardBus card inserted into slot 0
> > pci 0000:07:00.0: supports D1
> > pci 0000:07:00.0: supports D2
> > pci 0000:07:00.0: PME# supported from D1 D2 D3hot D3cold
> > pci 0000:07:00.0: PME# disabled
> >
> > sony:/home/akpm> lspci -s07:00
> > 07:00.0 Ethernet controller: 3Com Corporation 3cCFE575CT CardBus
> > [Cyclone] (rev 10)
>
> Ok, the PCI resource side definitely works.
>
> I've committed the fix as follows.. (the explanation is about three times
> the size, but whatever ;)
>
> As to that "unable to apply power" thing, that's a separate issue.. And
> in fact one that probably doesn't even matter to a CardBus card, since
> cardbus doesn't care about the insane CS state machines anyway.
>
> Anyway, Ivan and Jesse cc'd for the patch, but I committed it, since I
> was involved in causing the bug in the first place.

Yeah, looks reasonable.  Thanks for pushing it already; I've had crappy to 
non-existent network access for the past week...

Thanks,
Jesse
