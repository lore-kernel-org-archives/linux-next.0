From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: Tree for Jan 19
Date: Wed, 25 Jan 2017 11:37:11 -0500
Message-ID: <20170125163711.GE29778@windriver.com>
References: <20170119163959.07a25ca8@canb.auug.org.au>
 <CAP=VYLptRY21K58v6BXj-WoZ1cm9Hv=UPF6z8Owfzct=fobbzQ@mail.gmail.com>
 <20170123141159.GE7836@lianli.shorne-pla.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170123141159.GE7836@lianli.shorne-pla.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Stafford Horne <shorne@gmail.com>
Cc: linux@roeck-us.net, fengguang.wu@intel.com, Stephen Rothwell <sfr@canb.auug.org.au>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

[Re: linux-next: Tree for Jan 19] On 23/01/2017 (Mon 23:11) Stafford Horne wrote:

[...]

> 
> Are all of these builds using the tests from lkp-tests [0]?

Not using any specific tests, other than compiling allmodconfig and
defconfig.

> 
> If so and no one is working on openrisc toolchain updates I will package up
> a modern toolchain for the cdn [1] and send patches for lkp-test.
> 
> If there is something else that needs to be done let me know.
> 
> [0] git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tests.git
> [1] https://www.kernel.org/pub/tools/crosstool/files/bin/x86_64/4.5.1/

If you could work with Tony (his email is at the bottom of the crosstool
front page in [1]) to get the or32 binutils updated, that would be
great.  With all the arch currrently in linux, I pretty much have to
just use what is available from kernel.org as prebuilts.

Paul.
--

> 
> -Stafford
