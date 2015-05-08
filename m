From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for May 7 (avr32 build failure)
Date: Thu, 7 May 2015 18:33:57 -0700
Message-ID: <20150508013357.GA26772@roeck-us.net>
References: <20150507164715.4eec2e84@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:42132 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751707AbbEHBeG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 May 2015 21:34:06 -0400
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.85)
	(envelope-from <linux@roeck-us.net>)
	id 1YqXAz-002ra1-GS
	for linux-next@vger.kernel.org; Fri, 08 May 2015 01:34:05 +0000
Content-Disposition: inline
In-Reply-To: <20150507164715.4eec2e84@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Haavard Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>

On Thu, May 07, 2015 at 04:47:15PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20150506:
> 
> The ext4 tree gained a build failure so I used the version from
> next-20150506.
> 
> The vfs tree gained a conflict against the f2fs tree.
> 
> The rcu tree gained conflicts against the tip tree.
> 
> Non-merge commits (relative to Linus' tree): 2460
>  2454 files changed, 114321 insertions(+), 47105 deletions(-)
> 
> ----------------------------------------------------------------------------
> 
New build failure with avr32:atngw100mkii_evklcd101_defconfig (and several
other avr32 builds):

vsprintf.c:(.text+0x16a8): relocation truncated to fit:
	R_AVR32_16N_PCREL against symbol `_ctype' defined in .text section in lib/lib.a(ctype.o)

This is with 4.2.4-atmel.1.1.3.avr32linux.1.

Possibly commit 'lib/vsprintf: add %pT format specifier' caused the object
file size to exceed some limit.

Guenter
