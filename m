From: "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>
Subject: Re: linux-next: Tree for June 25
Date: Thu, 26 Jun 2008 02:28:38 +0200
Message-ID: <200806260228.38674.rjw@sisk.pl>
References: <20080626003554.b2623aba.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20080626003554.b2623aba.sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Content-Disposition: inline
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Wednesday, 25 of June 2008, Stephen Rothwell wrote:
> Hi all,

Hi,

> Changes since next-20080624:
> 
> The tip-core tree gained three conflicts against Linus' tree.
> 
> The sched tree gained a conflict against the cpus4096 tree.
> 
> The x86 tree gained a conflict against the ftrace tree.  It also required
> three patches that Ingo supplied.
> 
> The pci tree gained two conflicts against the x86 tree.
> 
> The v4l-dvb tree has had another commit reverted for a build problem,
> however that may have been due to a mismerge in yesterday's tree.
> 
> The acpi tree gained two conflicts against the x86 tree.
> 
> The tests tree gained a conflict against the sched tree.
> 
> The vfs tree gained a conflict against the sched tree.
> 
> The rr tree gained a conflict against each of the sched and powerpc
> trees.  It also required a patch and a commit reverted for build problems.
> 
> The pcmcia tree lost its conflict against Linus' tree.

This tree is completely broken on my test box (x86-64 HP nx6325) and I can't
even bisect it. :-(

It hits a NULL pointer dereference in find_symbol during boot, but when I tried
to bisect this issue, I hit another one that made the box hang solid during
boot (early, no messages available).

If things continue going this way, 2.6.27 will be a disaster ...

Thanks,
Rafael
