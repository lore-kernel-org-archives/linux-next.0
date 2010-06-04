From: "Luck, Tony" <tony.luck@intel.com>
Subject: RE: linux-next: Tree for June 3
Date: Fri, 4 Jun 2010 13:46:49 -0700
Message-ID: <987664A83D2D224EAE907B061CE93D530114C3DC47@orsmsx505.amr.corp.intel.com>
References: <20100603134753.710a64b3.sfr@canb.auug.org.au>
 <AANLkTilr92GkR8bfgyjtb8ToYEEAv4oCsFsfsy04HJRU@mail.gmail.com>
 <AANLkTim6v2s-Q5BndAKLOZKaA1wYgbU3UKJwNy-6Jkki@mail.gmail.com>
 <201006032222.57411.rusty@rustcorp.com.au>
 <AANLkTikN_3oLIFQ0CRiLwXUV79myy_aqriezdCgnZHFT@mail.gmail.com>
 <alpine.LFD.2.00.1006041255210.8175@i5.linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:33500 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756020Ab0FDUq4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 4 Jun 2010 16:46:56 -0400
In-Reply-To: <alpine.LFD.2.00.1006041255210.8175@i5.linux-foundation.org>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Dave Young <hidave.darkstar@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

> What does a NaT consumption fault mean, and does it give the invalid 
> address it was loaded off?

This almost always means that we dereferenced a NULL pointer ... though
any access into the bottom PAGE_SIZE of kernel virtual address space
will result in this trap.  This happens on ia64 because we have a "NaT"
page mapped at 0x0 so that speculative loads that chase NULL pointers
at the end of lists behave more rationally.

Sadly I don't have the actual address. The register that was used
for the dereference isn't included in the OOPS output.

-Tony
