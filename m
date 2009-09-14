From: Russell King <rmk+lkml@arm.linux.org.uk>
Subject: Re: linux-next: arm tree build failure
Date: Mon, 14 Sep 2009 09:20:05 +0100
Message-ID: <20090914082005.GB14204@flint.arm.linux.org.uk>
References: <20090910145944.690c873f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:53681 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754983AbZINIUU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 14 Sep 2009 04:20:20 -0400
Content-Disposition: inline
In-Reply-To: <20090910145944.690c873f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, sedji gaouaou <sedji.gaouaou@atmel.com>

On Thu, Sep 10, 2009 at 02:59:44PM +1000, Stephen Rothwell wrote:
> The next-20090907 and later builds (arm at91cap9adk_defconfig) failed
> like this:
> 
> arch/arm/mach-at91/at91cap9_devices.c:821: warning: 'struct atmel_ac97_data' declared inside parameter list
> arch/arm/mach-at91/at91cap9_devices.c:821: warning: its scope is only this definition or declaration, which is probably not what you want
> arch/arm/mach-at91/at91cap9_devices.c:821: error: conflicting types for 'at91_add_device_ac97'
> arch/arm/mach-at91/include/mach/board.h:178: note: previous declaration of 'at91_add_device_ac97' was here
> arch/arm/mach-at91/board-cap9adk.c:367: error: variable 'cap9adk_ac97_data' has initializer but incomplete type
> arch/arm/mach-at91/board-cap9adk.c: In function 'cap9adk_board_init':
> arch/arm/mach-at91/board-cap9adk.c:397: warning: passing argument 1 of 'at91_add_device_ac97' from incompatible pointer type
> arch/arm/mach-at91/include/mach/board.h:178: note: expected 'struct ac97c_platform_data *' but argument is of type 'struct atmel_ac97_data *'
> 
> Caused by commit d656f07a7405e788e1275d0238b67f593615f2bb ("ARM: 5640/1:
> This patch modifies the support of AC97 on the at91sam9263 ek board").

No idea.  I guess the Atmel folk have split one logical change up between
two trees, and its only been half merged.  I don't see anything in the
patch description which mentions this though.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
