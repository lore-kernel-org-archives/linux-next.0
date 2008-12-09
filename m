From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: avr32 build failure
Date: Wed, 10 Dec 2008 09:18:02 +1030
Message-ID: <200812100918.02369.rusty@rustcorp.com.au>
References: <20081209174043.966eda84.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:53521 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754044AbYLIWsH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Dec 2008 17:48:07 -0500
In-Reply-To: <20081209174043.966eda84.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Haavard Skinnemoen <hskinnemoen@atmel.com>

On Tuesday 09 December 2008 17:10:43 Stephen Rothwell wrote:
> Hi Rusty,
> 
> The linux-next build (avr32 defconfig) failed like this:
> 
> arch/avr32/lib/lib.a(findbit.o): In function `generic_find_next_le_bit':
> arch/avr32/lib/findbit.S:(.text+0xa6): multiple definition of `generic_find_next_le_bit'
> lib/lib.a(find_next_bit.o):find_next_bit.c:(.text+0x58): first defined here

OK, fixed by moving find_last_bit to its own file.

Thanks,
Rusty.
