From: Tony Luck <tony.luck@intel.com>
Subject: Re: linux-next: Tree for June 3
Date: Fri, 4 Jun 2010 12:46:59 -0700
Message-ID: <AANLkTikN_3oLIFQ0CRiLwXUV79myy_aqriezdCgnZHFT@mail.gmail.com>
References: <20100603134753.710a64b3.sfr@canb.auug.org.au>
	<AANLkTilr92GkR8bfgyjtb8ToYEEAv4oCsFsfsy04HJRU@mail.gmail.com>
	<AANLkTim6v2s-Q5BndAKLOZKaA1wYgbU3UKJwNy-6Jkki@mail.gmail.com>
	<201006032222.57411.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:57071 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751827Ab0FDTrB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 4 Jun 2010 15:47:01 -0400
In-Reply-To: <201006032222.57411.rusty@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Dave Young <hidave.darkstar@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>

> I've fixed it (by reversing the order of those lines) for tomorrow's
> linux-next.

Somewhere between next-20100602 and next-20100604
something was changed that results in ia64 taking deref
NULL oops in sys_init_module() ...

Freeing unused kernel memory: 1984kB freed
modprobe[1851]: NaT consumption 2216203124768 [1]
Modules linked in:

Pid: 1851, CPU 2, comm:             modprobe
psr : 0000121008526030 ifs : 8000000000000794 ip  :
[<a0000001000f0f31>]    Not tainted
(2.6.35-rc1-generic-smp-next-20100604)
ip is at sys_init_module+0x131/0x420

At the point of dereference it looks like we were trying
to load a 4-byte data object from offset 552 into the
"struct module *" that wa returned by load_module().

-Tony
