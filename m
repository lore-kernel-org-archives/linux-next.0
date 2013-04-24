From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: linux-next: Tree for Apr 24 [ PM: Device 1-1.2 failed to resume
 async: error -32 ]
Date: Wed, 24 Apr 2013 17:17:41 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1304241715170.1548-100000@iolanthe.rowland.org>
References: <CA+icZUVkRCavG-gs6r2x_kyZe_Mm8WLewp-zpKn=f3GWU+jJZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+icZUVkRCavG-gs6r2x_kyZe_Mm8WLewp-zpKn=f3GWU+jJZw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linux PM List <linux-pm@lists.linux-foundation.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-usb@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, 24 Apr 2013, Sedat Dilek wrote:

> > Did this work differently under earlier kernels?
> >
> 
> Unfortunately, s/r did not work for several Linux-Next releases as
> there is missing tglx's patch pendinging in tip.git/timers/core.

Have you tried testing under 3.8?  Or earlier releases?

> > This indicates that the optical mouse didn't survive the suspend/resume
> > sequence and had to be reenumerated.  Without more information, there's
> > no way to tell specifically what went wrong during the initial reset at
> > timestamp 62.353997.
> >
> > If you want to pursue this farther, you could enable CONFIG_USB_DEBUG.
> > You could also collect a usbmon trace for bus 1 showing what happens
> > during the suspend and resume.
> >
> 
> Hmm, I can try to enable CONFIG_USB_DEBUG and build a new kernel.
> 
> Can you give me more hints how to do a usbmon-trace?

See Documentation/usb/usbmon.txt.

> > On the other hand, what difference does it really make if a mouse has
> > to be reenumerated?
> >
> 
> As a non-USB-expert it's hard to interprete such "bogus" lines in your logs.
> I am curious enough to ask which is fair :-).
> AFAICS in your eyes this is "harmless"?

If the device continues to work normally after the resume and none of
your programs are affected, then it is harmless.

Alan Stern
