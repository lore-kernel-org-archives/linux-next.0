From: James Morse <james.morse@arm.com>
Subject: Re: linux-next: Tree for Mar 14
Date: Mon, 14 Mar 2016 16:51:51 +0000
Message-ID: <56E6EC27.2090700@arm.com>
References: <20160314174037.0097df55@canb.auug.org.au> <20160314143729.GA31845@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160314143729.GA31845@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Guenter,

On 14/03/16 14:37, Guenter Roeck wrote:
> To give people an idea what to expect in the merge window, here are my current
> build and runtime test results. Some of the runtime failures are due to the
> newly introduced i2c bug, but many (including the arm64 boot failures) have
> been around for a while.

> Qemu test results:
> 	total: 96 pass: 69 fail: 27
> Failed tests:

> 	arm64:smp:defconfig

This may be due to this qemu bug: http://patchwork.ozlabs.org/patch/585237/


> 	arm64:nosmp:defconfig

Since 4b3dc9679cf7 ("arm64: force CONFIG_SMP=y and remove redundant #ifdefs"),
this may just be testing the smp case again - unless your qemu config is
different too.


> Details are available at http://kerneltests.org/builders.

Thanks - this looks like a mine of information!


James
