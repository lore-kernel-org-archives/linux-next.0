From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: linux-next: manual merge of the tip tree with Linus' tree
Date: Fri, 17 Jan 2014 09:27:15 -0800
Message-ID: <9ebf3c00-ac91-41bd-8fd0-24dc09e61a05@DB9EHSMHS001.ehs.local>
References: <20140117143035.fa787a8203afaa83c64009bb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-db9lp0251.outbound.messaging.microsoft.com ([213.199.154.251]:50001
	"EHLO db9outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751951AbaAQR1W convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Jan 2014 12:27:22 -0500
Content-Disposition: inline
In-Reply-To: <20140117143035.fa787a8203afaa83c64009bb@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>

Hi Stephen,

On Fri, Jan 17, 2014 at 02:30:35PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the tip tree got a conflict in
> drivers/clocksource/cadence_ttc_timer.c between commit c1dcc927dae0
> ("clocksource: cadence_ttc: Fix mutex taken inside interrupt context"=
)
> from Linus' tree and commit dfded00902d7 ("clocksource:
> cadence_ttc_timer: Switch to sched_clock_register()") from the tip tr=
ee.
>=20
> I fixed it up (I think - see below) and can carry the fix as necessar=
y
> (no action is required).

The fix is correct.

	Thanks,
	S=C3=B6ren
