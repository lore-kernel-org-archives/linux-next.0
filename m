From: Stafford Horne <shorne@gmail.com>
Subject: Re: linux-next: Tree for Jan 19
Date: Thu, 26 Jan 2017 14:38:01 +0900
Message-ID: <20170126053801.GH7836@lianli.shorne-pla.net>
References: <20170119163959.07a25ca8@canb.auug.org.au>
 <CAP=VYLptRY21K58v6BXj-WoZ1cm9Hv=UPF6z8Owfzct=fobbzQ@mail.gmail.com>
 <20170123141159.GE7836@lianli.shorne-pla.net>
 <20170125163711.GE29778@windriver.com>
 <1014aa6f-447d-9dcc-2a60-01156dcdf88f@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:36159 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750930AbdAZFiF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 26 Jan 2017 00:38:05 -0500
Content-Disposition: inline
In-Reply-To: <1014aa6f-447d-9dcc-2a60-01156dcdf88f@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, fengguang.wu@intel.com, Stephen Rothwell <sfr@canb.auug.org.au>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Wed, Jan 25, 2017 at 08:54:53PM -0800, Guenter Roeck wrote:
> On 01/25/2017 08:37 AM, Paul Gortmaker wrote:
> > [Re: linux-next: Tree for Jan 19] On 23/01/2017 (Mon 23:11) Stafford Horne wrote:
> > 
> > [...]
> > 
> > > 
> > > Are all of these builds using the tests from lkp-tests [0]?
> > 
> > Not using any specific tests, other than compiling allmodconfig and
> > defconfig.
> > 
> > > 
> > > If so and no one is working on openrisc toolchain updates I will package up
> > > a modern toolchain for the cdn [1] and send patches for lkp-test.
> > > 
> > > If there is something else that needs to be done let me know.
> > > 
> > > [0] git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tests.git
> > > [1] https://www.kernel.org/pub/tools/crosstool/files/bin/x86_64/4.5.1/
> > 
> > If you could work with Tony (his email is at the bottom of the crosstool
> > front page in [1]) to get the or32 binutils updated, that would be
> > great.  With all the arch currrently in linux, I pretty much have to
> > just use what is available from kernel.org as prebuilts.
> > 
> 
> Different problem, but from the 0day info I thought you might be interested
> in the following breakage as well (seen in -next).
> 
> /opt/buildbot/slave/next-next/build/arch/score/kernel/traps.c: In function 'do_adedata':
> /opt/buildbot/slave/next-next/build/arch/score/kernel/traps.c:185:2: error: implicit declaration of function 'search_exception_tables'
> 
> Reported on kerneltests.org.

Thanks Guenter,

Is this for me of Paul?

You reported score above, but I think probably this is also impacting
openrisc.

Anyway,
I think this is due to Puals changes which separated out extable from
module.  traps.c in score and openrisc use search_exception_tables and
include <linux/module.h> to get it.

I did see Paul post a patch to fix traps.c too,

This should be fixed by today.

-Stafford
