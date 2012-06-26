From: Hans-Christian Egtvedt <egtvedt@samfundet.no>
Subject: Re: [PATCH -next] av32: Make sure _TIF_BREAKPOINT is defined
Date: Tue, 26 Jun 2012 09:17:57 +0200
Message-ID: <20120626071757.GA7484@samfundet.no>
References: <1340657896-23274-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cassarossa.samfundet.no ([129.241.93.19]:33466 "EHLO
	cassarossa.samfundet.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756580Ab2FZHSG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 26 Jun 2012 03:18:06 -0400
Content-Disposition: inline
In-Reply-To: <1340657896-23274-1-git-send-email-geert@linux-m68k.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Haavard Skinnemoen <hskinnemoen@gmail.com>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

Around Mon 25 Jun 2012 22:58:16 +0200 or thereabout, Geert Uytterhoeven wrote:
> commit 1deb667af4fc713364fed72ccdf217162b62ec7f ("avr32: trim masks")
> replaced "1 << TIF_BREAKPOINT" by "_TIF_BREAKPOINT", but forgot to define
> the latter:
> 
> arch/avr32/kernel/entry-avr32b.S: Assembler messages:
> arch/avr32/kernel/entry-avr32b.S:232: Error: undefined symbol `_TIF_BREAKPOINT' in operation
> arch/avr32/kernel/entry-avr32b.S:258: Error: undefined symbol `_TIF_BREAKPOINT' in operation
> arch/avr32/kernel/entry-avr32b.S:852: Error: undefined symbol `_TIF_BREAKPOINT' in operation
> arch/avr32/kernel/entry-avr32b.S:631: Error: undefined symbol `_TIF_BREAKPOINT' in operation
> arch/avr32/kernel/entry-avr32b.S:631: Error: undefined symbol `_TIF_BREAKPOINT' in operation
> arch/avr32/kernel/entry-avr32b.S:852: Error: undefined symbol `_TIF_BREAKPOINT' in operation
> arch/avr32/kernel/entry-avr32b.S:852: Error: undefined symbol `_TIF_BREAKPOINT' in operation
> arch/avr32/kernel/entry-avr32b.S:852: Error: undefined symbol `_TIF_BREAKPOINT' in operation
> arch/avr32/kernel/entry-avr32b.S:852: Error: undefined symbol `_TIF_BREAKPOINT' in operation
> 
> Add the missing definition to fix this.

Thanks for fixing this.

> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Acked-by: Hans-Christian Egtvedt <egtvedt@samfundet.no>

<snipp>

-- 
mvh
Hans-Christian Egtvedt
