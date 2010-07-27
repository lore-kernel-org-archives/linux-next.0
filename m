From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for July 27 (xen)
Date: Tue, 27 Jul 2010 11:38:27 -0700
Message-ID: <4C4F27A3.5040109@oracle.com>
References: <20100727160708.722c39c1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:25192 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753360Ab0G0Sir (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Jul 2010 14:38:47 -0400
In-Reply-To: <20100727160708.722c39c1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, jeremy@goop.org, Jeremy Fitzhardinge <jeremy@xensource.com>

Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20100726:
> 
> 
> The xen tree lost its build problems but gained a conflict against Linus'
> tree.

when X86_32=y, SMP=n, X86_LOCAL_APIC=n:

drivers/built-in.o: In function `xen_callback_vector':
(.text+0x41238): undefined reference to `first_system_vector'

alloc_intr_gate() calls alloc_system_vector(), which uses first_system_vector.
