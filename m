From: Dan Williams <dan.j.williams@intel.com>
Subject: dmaengine new location Re: linux-next: dropping trees
Date: Tue, 24 Jan 2012 00:40:55 -0800
Message-ID: <CABE8wwsnQUJeHU7FoK0VkwRVRChVF2_7kQQPfPvtCOr2eF9hcw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.89]:50024 "EHLO
	fmsmga101.fm.intel.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753766Ab2AXIk5 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 24 Jan 2012 03:40:57 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, "Koul, Vinod" <vinod.koul@intel.com>

On Thu, Jan 19, 2012 at 4:40 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi all,
>
> The trees listed below were all hosted on git.kernel.org until the
> breakin. =A0These have not been restored and I have not been given an
> alternate location for them, so I will drop them all on Monday unless=
 I
> hear from their maintainers (all cc'd). =A0On the other hand, if your=
 tree
> is no longer needed, it would be good to know that as well.
>
[..]
> async_tx =A0 =A0 =A0 =A0git://git.kernel.org/pub/scm/linux/kernel/git=
/djbw/async_tx.git#next

Please add:

   git://git.kernel.org/pub/scm/linux/kernel/git/djbw/dmaengine.git nex=
t

to -next to replace the old async_tx.git tree.  It should be included
in the merge order after Vinod's slave dma tree at:

   git://git.infradead.org/users/vkoul/slave-dma.git next

I still expect the majority of dmaengine traffic to go through
slave-dma.git, with dmaengine.git picking up the memory-to-memory
offload specific bits.  The name change of async_tx.git to
dmaengine.git relates to the reworks needed to async_tx api which
needs replacement to fix dma mapping api violations.

Right now it only contains one patch:

commit d07a74a546981a09ba490936645fbf0d1340b96c
Author: Dr. David Alan Gilbert <linux@treblig.org>
Date:   Thu Aug 25 16:13:55 2011 -0700

    dmaengine: fix missing 'cnt' in ?: in dmatest

    Hi,
      On the latest tree my compiler has started giving the warning:

    drivers/dma/dmatest.c:575:28: warning: the omitted middle operand
in ?: will always be ?true?, suggest explicit middle op

    The following patch fixes the missing middle clause with the same
    fix that Nicolas Ferre used in the similar clauses.
    (There seems to have been a race between him fixing that and
    the extra clause going in a little later).

    I don't actually know the dmatest code/structures, nor do I own
    any hardware to test it on (assuming it needs a DMA engine);
     but this patch builds, the existing code is almost certainly
    wrong and the fix is the same as the corresponding lines above it.

    (WTH is x=3Dy?:z legal C anyway?)

    Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
    Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
    Reported-by: Paul Gortmaker <paul.gortmaker@windriver.com>
    Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>
    Signed-off-by: Dan Williams <dan.j.williams@intel.com>


--
Dan
