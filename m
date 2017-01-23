From: Stafford Horne <shorne@gmail.com>
Subject: Re: linux-next: Tree for Jan 19
Date: Mon, 23 Jan 2017 23:11:59 +0900
Message-ID: <20170123141159.GE7836@lianli.shorne-pla.net>
References: <20170119163959.07a25ca8@canb.auug.org.au>
 <CAP=VYLptRY21K58v6BXj-WoZ1cm9Hv=UPF6z8Owfzct=fobbzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAP=VYLptRY21K58v6BXj-WoZ1cm9Hv=UPF6z8Owfzct=fobbzQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>, linux@roeck-us.net, fengguang.wu@intel.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Jan 19, 2017 at 11:42:45AM -0500, Paul Gortmaker wrote:
> On Thu, Jan 19, 2017 at 12:39 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi all,
> >
> > Changes since 20170118:
> >
> > The audit tree gained a conflict against Linus' tree.
> >
> > The tip tree gained a conflict against the security tree.
> >
> > The rcu tree gained a semantic conflict against the net-next tree for
> > which I applied a merge fix patch.
> >
> > I dropped 4 patches from the akpm tree that turned up in the tip tree.
> >
> > Non-merge commits (relative to Linus' tree): 3931
> >  4740 files changed, 146960 insertions(+), 87918 deletions(-)
> >
> 
> The or32 builds started failing in the last couple days:
> 
> http://kisskb.ellerman.id.au/kisskb/buildresult/12912013/
> 
> I was able to reproduce it locally, and a mindless bisect says:
> 
> 116ded1356614cff3facc9010125b5a28718cbf1 is the first bad commit
> commit 116ded1356614cff3facc9010125b5a28718cbf1
> Author: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
> Date:   Mon May 12 14:08:26 2014 +0300
> 
>     openrisc: add atomic bitops
> 
> I expect the binutils sfr is using is probably similar vintage to
> what I've got here locally - from kernel.org crosstool stuff:
> 
> $ or32-linux-as --version
> GNU assembler (GNU Binutils) 2.20.1.20100303
> Copyright 2009 Free Software Foundation, Inc.
> This program is free software; you may redistribute it under the terms of
> the GNU General Public License version 3 or later.
> This program has absolutely no warranty.
> This assembler was configured for a target of `or32-linux'.
> 

Are all of these builds using the tests from lkp-tests [0]?

If so and no one is working on openrisc toolchain updates I will package up
a modern toolchain for the cdn [1] and send patches for lkp-test.

If there is something else that needs to be done let me know.

[0] git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tests.git
[1] https://www.kernel.org/pub/tools/crosstool/files/bin/x86_64/4.5.1/

-Stafford
