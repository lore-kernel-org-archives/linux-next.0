From: "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>
Subject: Re: linux-next: Tree for June 26
Date: Fri, 27 Jun 2008 01:38:52 +0200
Message-ID: <200806270138.53895.rjw@sisk.pl>
References: <20080627010842.e1a0c4b5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20080627010842.e1a0c4b5.sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Content-Disposition: inline
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Cc: linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, Jaswinder Singh <jaswinder-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, David Woodhouse <David.Woodhouse-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "Maciej W. Rozycki" <macro-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Thursday, 26 of June 2008, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since next-20080625:
> 
> The tip-core tree lost its three conflicts against Linus' tree.
> 
> The pci tree gained two conflicts against the x86 tree.
> 
> The v4l-dvb tree had the second revert undone.  We will see if this is
> right.
> 
> The net tree gained a conflict against the wireless-current tree.
> 
> The vfs tree lost its conflict against the sched tree.
> 
> The arm tree lost its conflict against Linus' tree.
> 
> The rr tree gained a patch for a build problem instead the revert.
> 
> The firmware tree lost a conflict against the usb tree.

commit 423c982fffb1cd95c8cdd654ce5ab59351ba41f5
Author: Jaswinder Singh <jaswinder-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Date:   Wed Jun 18 19:58:33 2008 +0530

    firmware: convert tg3 driver to request_firmware()

breaks my nx6325.

Apparently, with this patch applied the tg3 has a NULL pointer dereference
somewhere, but I can only see the first line of the oops, afterwards the box
hangs solid.

Please drop it if possible.

Also, arch/x86/kernel/io_apic_64.c seems wrong at the moment, as it checks
for conditions that are never satisfied etc.

Thanks,
Rafael
