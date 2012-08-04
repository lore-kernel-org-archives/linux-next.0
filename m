From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: manual merge of the signal tree with the arm-current tree
Date: Sat, 4 Aug 2012 21:19:17 +0200
Message-ID: <CAMuHMdVBMu5KxPTGPzAk3u3W=o-=gsKa6K=q_-Z4YnELKvmZRw@mail.gmail.com>
References: <20120705173526.bf8772adb18edfc91adddea8@canb.auug.org.au>
	<20120705075204.GA12344@flint.arm.linux.org.uk>
	<20120715112735.GI31729@ZenIV.linux.org.uk>
	<CAMuHMdXP_rjwPhfTwcY+Jf3+Dq=AkWtMZvUUibCQ9D=c60_j5Q@mail.gmail.com>
	<20120715120457.GJ31729@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120715120457.GJ31729@ZenIV.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Russell King <rmk@arm.linux.org.uk>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Will Deacon <will.deacon@arm.com>
List-Id: linux-next.vger.kernel.org

Hi Al,

On Sun, Jul 15, 2012 at 2:04 PM, Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Sun, Jul 15, 2012 at 01:47:59PM +0200, Geert Uytterhoeven wrote:
>> On Sun, Jul 15, 2012 at 1:27 PM, Al Viro <viro@zeniv.linux.org.uk> wrote:
>> > On Thu, Jul 05, 2012 at 08:52:04AM +0100, Russell King wrote:
>> >> Will has concerns with Al's proposed fixes for the signal handling.
>> >
>> > Could you please resend whatever concerns those had been my way?
>> > The last I've seen from Will had been about the stuff in mainline,
>> > not in -next; I might have missed something quite easily, though -
>> > net.access had been really lousy lately and piles in l-k mbox... ouch.
>>
>> Speaking about -next, there's still this fix for an avr32 regression:
>
> Yeah, grabbed it.  Will be in the next rebase (hopefully in a few hours).

Still not there, though.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
