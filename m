From: Daniel Micay <danielmicay@gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 14 Jun 2017 23:18:29 -0400
Message-ID: <1497496709.1435.7.camel@gmail.com>
References: <20170605170117.6a1fc15e@canb.auug.org.au>
         <20170615113548.3e4edcf4@canb.auug.org.au>
         <CAGXu5jJyjymPfRNcKrRruYzZFUR-W8H7EWUnYR-6PJi3HcQ+-A@mail.gmail.com>
         <20170615120631.121c6c9b@canb.auug.org.au>
         <CAGXu5jK2N349VCRb6ROAa=mMvF7bPqjEs3HofXVjzPQqWzRD3A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:33477 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751590AbdFODSb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Jun 2017 23:18:31 -0400
In-Reply-To: <CAGXu5jK2N349VCRb6ROAa=mMvF7bPqjEs3HofXVjzPQqWzRD3A@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, 2017-06-14 at 19:16 -0700, Kees Cook wrote:
> On Wed, Jun 14, 2017 at 7:06 PM, Stephen Rothwell <sfr@canb.auug.org.a
> u> wrote:
> > Hi Kees,
> > 
> > On Wed, 14 Jun 2017 18:56:30 -0700 Kees Cook <keescook@chromium.org>
> > wrote:
> > > 
> > > I sent a series for -mm (or maintainers) to merge that should
> > > catch
> > > everything. Do you want me to carry it in my kspp tree instead?
> > > (My
> > > original intention was to carry all the fixes and the fortify
> > > patch in
> > > kspp but akpm took it into -mm somewhat unexpectedly, not that I'm
> > > complaining.)
> > 
> > Andrew is currently not responding to stuff (he warned us last
> > week),
> > so if you do put the series in your tree, I will remove it from my
> > copy
> > of Andrew's quilt series.  All the fixes necessary to make this
> > usable
> > should really be in the same tree if possible.
> > 
> > (I am assuming that the fix patches have been reviewed and acked by
> > appropriate people.)
> 
> Mostly, yes. But they're usually trivial. All have been sent out for
> review (some a few times).
> 
> Given that the fixes are already scattered between various trees and
> you merge -mm last in -next, I'll just carry the remaining fixes and
> you can leave akpm's fortify patch in -mm.
> 
> -Kees

I think compile-time fixes should be totally done for 32-bit x86,
x86_64, arm64 and powerpc but the patches just aren't all queued up in
-mm/-next.

The arch mailing list was pinged about this which is how the powerpc
folks got involved and fixed the issues there, including at least one
runtime one. Not sure where (if anywhere) those are queued up, but Kees
could pick those up too.

For other archs, these might end up being issues requiring #ifndef
CONFIG_FORTIFY_SOURCE wrapped around them as was done for 32-bit x86, or
just removal because it's obsolete with GCC from the past 6+ years:

arch/alpha/include/asm/string.h:21:#define memcpy __builtin_memcpy
arch/m68k/include/asm/string.h:63:#define memcmp(d, s, n) __builtin_memcmp(d, s, n)
arch/m68k/include/asm/string.h:67:#define memset(d, c, n) __builtin_memset(d, c, n)
arch/m68k/include/asm/string.h:71:#define memcpy(d, s, n) __builtin_memcpy(d, s, n)

I didn't do anything about those because I can't compile it or test it
right now, but maybe someone can be pinged about it. Might be a one or
two other archs with the same issue. An -mm build bot complained about
alpha (probably that) and xtensa (seems to define inline functions in
arch/xtensa/include/asm/string.h).
