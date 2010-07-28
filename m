From: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Subject: Re: linux-next: Tree for July 27 (xen)
Date: Wed, 28 Jul 2010 16:06:26 +0100
Message-ID: <alpine.DEB.2.00.1007281601380.19809@kaball-desktop>
References: <20100727160708.722c39c1.sfr@canb.auug.org.au> <4C4F27A3.5040109@oracle.com> <alpine.DEB.2.00.1007281410030.19809@kaball-desktop> <4C504345.2050204@goop.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.ctxuk.citrix.com ([62.200.22.115]:52030 "EHLO
	SMTP.EU.CITRIX.COM" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754748Ab0G1PFg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 Jul 2010 11:05:36 -0400
In-Reply-To: <4C504345.2050204@goop.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: Stefano Stabellini <Stefano.Stabellini@eu.citrix.com>, Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Jeremy Fitzhardinge <Jeremy.Fitzhardinge@citrix.com>

On Wed, 28 Jul 2010, Jeremy Fitzhardinge wrote:
>   On 07/28/2010 06:11 AM, Stefano Stabellini wrote:
> > On Tue, 27 Jul 2010, Randy Dunlap wrote:
> >> Stephen Rothwell wrote:
> >>> Hi all,
> >>>
> >>> Changes since 20100726:
> >>>
> >>>
> >>> The xen tree lost its build problems but gained a conflict against Linus'
> >>> tree.
> >> when X86_32=y, SMP=n, X86_LOCAL_APIC=n:
> >>
> >> drivers/built-in.o: In function `xen_callback_vector':
> >> (.text+0x41238): undefined reference to `first_system_vector'
> >>
> >> alloc_intr_gate() calls alloc_system_vector(), which uses first_system_vector.
> > this patch should solve the issue:
> 
> So this is a generic x86 build problem?
> 

It is, but nobody else is calling alloc_intr_gate with X86_LOCAL_APIC=n;
being a static inline function it didn't cause any problems.
