From: Tony Luck <tony.luck@intel.com>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Thu, 24 Mar 2011 12:55:33 -0700
Message-ID: <AANLkTimx77O+cc_kVkTQOYxrCHetUcmiu6NE1Oz5_83o@mail.gmail.com>
References: <20110324143019.cce06baa.sfr@canb.auug.org.au>
	<20110323211346.9ae51356.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:38631 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933832Ab1CXTze convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 24 Mar 2011 15:55:34 -0400
In-Reply-To: <20110323211346.9ae51356.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linus <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, David Rientjes <rientjes@google.com>

On Wed, Mar 23, 2011 at 9:13 PM, Andrew Morton
<akpm@linux-foundation.org> wrote:
> Meanwhile, ddd588b5dd55f143203799 reverts cleanly and I'd suggest we =
do
> that.

I tried that revert (from Linus' tree this morning HEAD
=3D6c5103890057b1bb781b26b7aae38d33e4c517d8)
and got:


  CC      mm/page_alloc.o
mm/page_alloc.c: In function =91__alloc_pages_slowpath=92:
mm/page_alloc.c:2180: error: =91SHOW_MEM_FILTER_NODES=92 undeclared (fi=
rst
use in this function)
mm/page_alloc.c:2180: error: (Each undeclared identifier is reported on=
ly once
mm/page_alloc.c:2180: error: for each function it appears in.)
mm/page_alloc.c:2198: error: implicit declaration of function =91__show=
_mem=92
make[1]: *** [mm/page_alloc.o] Error 1
make: *** [mm] Error 2

-Tony
