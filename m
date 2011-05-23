From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: [bloat] Measuring header file bloat effects on kernel build
 performance: a more than 2x slowdown ...
Date: Mon, 23 May 2011 13:21:22 +0300
Message-ID: <BANLkTi=Vbr+DRBy6sa7omGpvAb0uGunYMA@mail.gmail.com>
References: <20110520161210.81bbef3a.sfr@canb.auug.org.au>
	<BANLkTi=Dn_jvJ8mLY0Bc6C1Ptoqa-kJrCg@mail.gmail.com>
	<20110523090918.GA5474@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:58448 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751767Ab1EWKVX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 23 May 2011 06:21:23 -0400
In-Reply-To: <20110523090918.GA5474@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Andrew Morton <akpm@linux-foundation.org>

On Mon, May 23, 2011 at 12:09 PM, Ingo Molnar <mingo@elte.hu> wrote:
> =A0 =A0 =A024594a2bfcaa: [PATCH] x86-64 merge
>
> =A0 =A0 - Remove some unneeded prefetches. =A0Just two are enough to =
kickstart
> =A0 =A0 =A0 the hardware prefetcher.
>
> =A0 But despite touching prefetches explicitly, this too sloppily lef=
t the (now
> =A0 dangling) prefetch.h include file around.

Well, developer removes include, developer risks compile breakage.

> Anway, what i tried to demonstrate with this mail how much *real* slo=
wdown in
> the kernel build our current header file bloat is causing. We could l=
iterally
> halve our kernel build times if we fixed this!

News at 11!

Ingo, you're running x86 compile tests nonstop, you can very well make =
asm-x86
headers the strictest ones to make problem less problematic.

You (x86 merge people), removed header guards from quite a lot of asm-x=
86/*.h
files breaking gcc "do not open(2) second time" heuristics. It became b=
etter
since last I've noticed it, but maybe start with that?
