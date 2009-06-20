From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] Kallsyms problems (was: Re: linux-next: arm build failures)
Date: Sat, 20 Jun 2009 15:54:40 +1000
Message-ID: <20090620155440.a7dfb2d4.sfr@canb.auug.org.au>
References: <20090617162612.703adfd9.sfr@canb.auug.org.au>
	<tnx3a9ztg14.fsf@pc1117.cambridge.arm.com>
	<20090617230804.5e353ec9.sfr@canb.auug.org.au>
	<20090619151321.GA6223@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36587 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750818AbZFTFyi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 20 Jun 2009 01:54:38 -0400
In-Reply-To: <20090619151321.GA6223@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk+lkml@arm.linux.org.uk>
Cc: Sam Ravnborg <sam@ravnborg.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Mike Frysinger <vapier.adi@gmail.com>, "David S. Miller" <davem@davemloft.net>, Andrew Morton <akpm@linux-foundation.org>, Linus <torvalds@linux-foundation.org>

Hi Russell,

On Fri, 19 Jun 2009 16:13:21 +0100 Russell King <rmk+lkml@arm.linux.org.uk> wrote:
>
> On Wed, Jun 17, 2009 at 11:08:04PM +1000, Stephen Rothwell wrote:
> > 
> > On Wed, 17 Jun 2009 09:34:31 +0100 Catalin Marinas <catalin.marinas@arm.com> wrote:
> > >
> > > Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > > Over the past few days, I have started getting some arm configs (at least
> > > > iop13xx_defconfig and integrator_defconfig, but some others) failing to
> > > > build getting this error:
> > > >
> > > >   SYSMAP  System.map
> > > >   SYSMAP  .tmp_System.map
> > > > Inconsistent kallsyms data
> > > > Try setting CONFIG_KALLSYMS_EXTRA_PASS
> > > >
> > > > Is this something you have seen?  Could it be my toolchain (I am
> > > > currently using gcc 4.4.0 and have not changed it recently)?
> > > 
> > > I reported an error with kallsysms on ARM this Monday leading to
> > > inconsistent data:
> > > 
> > > http://lkml.org/lkml/2009/6/15/233
> > > 
> > > Could it be related?
> > 
> > Could be.  I have added the proposed fix patch to my fixes tree until
> > Linus or Sam gets around to including it.
> 
> No, I don't think it's got anything to do with it.  It's the kallsyms
> generator that's getting confused.
> 
> What's happening is that we're ending up with differences between the
> symbolic information generated for .tmp_vmlinux2 and vmlinux:

I do wonder if the above could be the root cause, though.  Since I added
the added the fix mentioned above to linux-next, my arm builds have not
failed do to this problem.  Or maybe this "fix" just works around another
problem?

In any case, it would be nice if the fix (repeated below) could be sent
to Linus by someone (it also fixes a problem that Dave Miller is seeing).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 15 Jun 2009 07:52:48 -0400
Subject: [PATCH] kallsyms: fix inverted valid symbol checking

The previous commit (17b1f0de) introduced a slightly broken consolidation
of the memory text range checking.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 scripts/kallsyms.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 3cb5789..64343cc 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -167,11 +167,11 @@ static int symbol_valid_tr(struct sym_entry *s)
 	for (i = 0; i < ARRAY_SIZE(text_ranges); ++i) {
 		tr = &text_ranges[i];
 
-		if (s->addr >= tr->start && s->addr < tr->end)
-			return 0;
+		if (s->addr >= tr->start && s->addr <= tr->end)
+			return 1;
 	}
 
-	return 1;
+	return 0;
 }
 
 static int symbol_valid(struct sym_entry *s)
-- 
1.6.3.1
