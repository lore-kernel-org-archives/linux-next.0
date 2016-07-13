From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: please clean up the hid tree
Date: Thu, 14 Jul 2016 01:24:38 +1000
Message-ID: <20160714012438.2468f816@canb.auug.org.au>
References: <20160713092809.566559b5@canb.auug.org.au>
	<20160713112001.641f6bf1@canb.auug.org.au>
	<alpine.LNX.2.00.1607131111340.24757@cbobk.fhfr.pm>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47147 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750923AbcGMPYl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 13 Jul 2016 11:24:41 -0400
In-Reply-To: <alpine.LNX.2.00.1607131111340.24757@cbobk.fhfr.pm>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Jiri,

On Wed, 13 Jul 2016 11:21:36 +0200 (CEST) Jiri Kosina <jikos@kernel.org> wrote:
>
> On Wed, 13 Jul 2016, Stephen Rothwell wrote:
> 
> > The hid tree
> > (git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid.git#for-next)
> > seems to be based on v3.19 and constists of a large number of merges
> > (of stuff that is now in Linus' tree) and ends with one particulary
> > large revert (of a merge).  
> 
> I try to keep the tree completely non-rebasing, as people are actually 
> using it for development. But for-next is a bit special in this respect, 
> and if there is a branch that could potentially be considered for 
> ocasional rebasing, it's probably for-next one.

The non-rebasing bit is good if your branch is exactly what goes
upstream because if (after it is merged by upstream) you do a back
merge of upstream, that merge will just fast forward your branch and
your tree will be empty  - all with no rebasing.  In the case of your
for-next branch, that is not what is happening.

> OTOH, what issues exactly are the extra merges causing for you please?

Well, if you have a look at the diffstat of the last revert of a merge,
you get this:

$ git diff --stat hid/for-next^..hid/for-next
 .mailmap                                           |   4 -
 Documentation/ABI/testing/configfs-usb-gadget-uvc  |  58 ++---
 .../ABI/testing/sysfs-bus-iio-proximity-as3935     |   2 +-
 Documentation/scsi/scsi_eh.txt                     |   8 +-
 MAINTAINERS                                        |  13 +-
 Makefile                                           |   4 +-
 arch/Kconfig                                       |   7 +-
 arch/alpha/include/asm/pgalloc.h                   |   4 +-
	.
	.  Lots elided
	.
 sound/hda/hdac_regmap.c                            |   4 +-
 sound/pci/hda/hda_tegra.c                          |  20 +-
 sound/pci/hda/patch_realtek.c                      |   6 -
 .../ftrace/test.d/trigger/trigger-hist-mod.tc      |   9 +-
 .../ftrace/test.d/trigger/trigger-hist.tc          |   9 +-
 .../ftrace/test.d/trigger/trigger-multihist.tc     |   9 +-
 tools/testing/selftests/vm/compaction_test.c       |   2 +-
 tools/vm/slabinfo.c                                |   2 +-
 404 files changed, 2141 insertions(+), 3636 deletions(-)

So that git sees that you have this enormous change in your tree ...

Also, the more merges your tree contains and the further back it is
branched, the harder git has to work to do the merge against the other
trees I have and Linus' tree.

> Ok, this is pretty odd. I'll look into what happened, it'll be resolved in 
> a couple minutes, so please start pulling for-next again.

See above.

Anyway, thanks for the cleanup, the tree looks much better now.
-- 
Cheers,
Stephen Rothwell
