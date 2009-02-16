From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: arm tree build failure
Date: Mon, 16 Feb 2009 09:23:26 +0000
Message-ID: <1234776206.30601.6.camel@pc1117.cambridge.arm.com>
References: <20090214152755.6f672b37.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([193.131.176.58]:45469 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752238AbZBPJXo (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Feb 2009 04:23:44 -0500
In-Reply-To: <20090214152755.6f672b37.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Russell King <rmk@arm.linux.org.uk>, linux-next@vger.kernel.org

On Sat, 2009-02-14 at 15:27 +1100, Stephen Rothwell wrote:
> Today's linux-next build (arm versatile_defconfig and many other configs)
> failed like this:
> 
>   AS      usr/initramfs_data.o
> arch/arm/include/asm/unwind.h: Assembler messages:
> arch/arm/include/asm/unwind.h:68: Error: Bad macro parameter list
[...]
> Does this require a particular binutils version?

It looks like constructs like below are only supported by newer
binutils:

	.macro	unwind	instr:vararg
	\instr
	.endm

I'll change it to classic C macros and re-post on the ARM kernel list.

Thanks.

-- 
Catalin
