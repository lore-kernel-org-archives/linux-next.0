From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Oct 16
Date: Wed, 16 Oct 2013 22:12:54 -0700
Message-ID: <525F71D6.5080805@roeck-us.net>
References: <1381949500-501-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.active-venture.com ([67.228.131.205]:49448 "EHLO
	mail.active-venture.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750739Ab3JQFNA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 Oct 2013 01:13:00 -0400
In-Reply-To: <1381949500-501-1-git-send-email-treding@nvidia.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>

On 10/16/2013 11:51 AM, Thierry Reding wrote:
> Hi all,
>
> I've uploaded today's linux-next tree to the master branch of the
> repository below:
>
>          git://gitorious.org/thierryreding/linux-next.git
>
> A next-20131016 tag is also provided for convenience.
>
> Gained two new conflicts, but nothing too exciting. x86 and ARM default
> configurations as well as the x86 allmodconfig mostly build fine on the
> final tree. There was a failure for the ARM at91x40_defconfig, but the
> proper fix wasn't immediately obvious to me, so I've left it broken for
> now.
>

Upside: mips qemu run now passes (mips64 qemu build still fails).

Downside: Up to 13 build failures, from 12.

Besides the mips64 qemu build, current failures are:

arm:allmodconfig
blackfin:defconfig
mips:nlm_xlp_defconfig
mips:cavium_octeon_defconfig
powerpc: (7 out of 14)
sparc64:allmodconfig
xtensa:allmodconfig (new failure)

Details are at http://server.roeck-us.net:8010/builders.

Guenter
