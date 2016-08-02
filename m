From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: powerpc allyesconfig / allmodconfig linux-next next-20160729 -
 next-20160729 build failures
Date: Tue, 2 Aug 2016 14:58:39 -0700
Message-ID: <20160802215839.GA7383@roeck-us.net>
References: <CAB=NE6U18jv89pxqAeZY8eTj44mq90kyXGaQO-108+ZMTyxQiQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:40136 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753757AbcHBV7M (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Aug 2016 17:59:12 -0400
Content-Disposition: inline
In-Reply-To: <CAB=NE6U18jv89pxqAeZY8eTj44mq90kyXGaQO-108+ZMTyxQiQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Luis R. Rodriguez" <mcgrof@kernel.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Fengguang Wu <fengguang.wu@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Aug 02, 2016 at 01:07:09PM -0700, Luis R. Rodriguez wrote:
> Are linux-next builds being tested for powerpc with allyesconfig and
> allmodconfig ? I have some changes I'm making and while debugging my
> build issues I decided to give a clean build a shot and see linux-next
> next-20160729 up to next-20160729 all have build failures without my
> changes. I get:
> 
> /opt/gcc-4.9.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld:
> drivers/built-in.o: .opd is not a regular array of opd entries
>   MODPOST vmlinux.o
>   GEN     .version
>   CHK     include/generated/compile.h
>   UPD     include/generated/compile.h
>   CC      init/version.o
>   LD      init/built-in.o
> /opt/gcc-4.9.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld:
> drivers/built-in.o: .opd is not a regular array of opd entries
> drivers/built-in.o: In function `.ipw2100_up':
> ipw2100.c:(.text+0x1ff9c90): relocation truncated to fit:

"relocation truncated to fit"  errors are typical for ppc:allyesconfig.
allmodconfig should work, though.

Guenter
