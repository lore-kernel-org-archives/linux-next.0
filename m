From: "=?ISO-8859-1?Q?Fr=E9d=E9ric_Weisbecker?=" <fweisbec@gmail.com>
Subject: Re: linux-next: kernel/trace/trace.c:658: error:
Date: Thu, 23 Oct 2008 16:57:35 +0200
Message-ID: <c62985530810230757r411b4e3dj4ecec649cf8cf0b3@mail.gmail.com>
References: <20081023213637.eff9b414.sfr@canb.auug.org.au>
	 <20081023121145.GB27984@x200.localdomain>
	 <c62985530810230548t1b569f61g34d1900bb94fde83@mail.gmail.com>
	 <c62985530810230615s3252a54ao6488e763d72dc939@mail.gmail.com>
	 <49008D12.5090204@gmail.com>
	 <Pine.LNX.4.64.0810231635440.18978@anakin>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755379AbYJWO5t@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0810231635440.18978@anakin>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@elte.hu>
List-Id: linux-next.vger.kernel.org

2008/10/23 Geert Uytterhoeven <geert@linux-m68k.org>:
> If kernel/trace/trace.c calls irqs_disabled_flags(), it should include
> the include that defines irqs_disabled_flags(). You should not add it to
> some other random include.
>
> It's also happening on m68k:
> http://kisskb.ellerman.id.au/kisskb/buildresult/50641/

The fact is that other archs include this header into their
asm/system.h. It seems that's because
they need some non-traced irq_save/restore .
I wanted to stay in the same approach because future use of
raw_local_irq could be used elsewhere
and seem to work perfectly whithout adding special headers on most
arch. But there will be some
bug report for each future use of these functions for alpha.... (and
even m68k as it seems).

What do you think? Should I let this patch as is or send a new one
(and one other for m68k).
