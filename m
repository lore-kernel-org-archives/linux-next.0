From: "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>
Subject: Re: linux-next: Tree for June 26
Date: Sat, 28 Jun 2008 01:04:16 +0200
Message-ID: <200806280104.17527.rjw@sisk.pl>
References: <20080627010842.e1a0c4b5.sfr@canb.auug.org.au> <200806270138.53895.rjw@sisk.pl> <1214563913.10393.180.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1214563913.10393.180.camel-ZP4jZrcIevRpWr+L1FloEB2eb7JE58TQ@public.gmane.org>
Content-Disposition: inline
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <david.woodhouse-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, Jaswinder Singh <jaswinder-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "Maciej W. Rozycki" <macro-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Friday, 27 of June 2008, David Woodhouse wrote:
> On Fri, 2008-06-27 at 01:38 +0200, Rafael J. Wysocki wrote:
> > commit 423c982fffb1cd95c8cdd654ce5ab59351ba41f5
> > Author: Jaswinder Singh <jaswinder-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
> > Date:   Wed Jun 18 19:58:33 2008 +0530
> > 
> >     firmware: convert tg3 driver to request_firmware()
> > 
> > breaks my nx6325.
> > 
> > Apparently, with this patch applied the tg3 has a NULL pointer dereference
> > somewhere, but I can only see the first line of the oops, afterwards the box
> > hangs solid.
> 
> That's a 5705, isn't it? So using the 'tso5' firmware?
> 
> Is that firmware available (did you either build it into your kernel, or
> run 'make INSTALL_FW_PATH=/lib/firmware firmware_install')? 

I built it into the kernel.

> Not that it matters; I suspect the driver isn't trying to load it at
> all. Can you test this patch, please?

Unfortunately, it doesn't help.  The driver either oopses or just doesn't work
(I don't know what exactly causes it to oops, although that only happens during
boot).

However, Ingo wrote that

" the firmware image, if i compare the before and after tg3FwText 
hex dump is blatantly different. Is this some different format, or did 
the "convert to request_firmware()" commit also embed an undocumented 
version jump in the binary blob that is loaded to your card? "

May this be the source of the problem?

Rafael
