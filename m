From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: xtensa port maintenance
Date: Tue, 7 Aug 2012 18:57:44 +0200
Message-ID: <CAMuHMdXF+N2A5+=Y79dayffU8SYyhVG7yms_Edrrt388wjjMWA@mail.gmail.com>
References: <50205592.1030205@gmail.com>
	<5020AA5B.4080407@zankel.net>
	<CAMuHMdVh_D1yTYiPoRks8-sjoNb_dr5xpRbxv+AJLseUd2Kk0Q@mail.gmail.com>
	<CAMo8BfLw0Rt8Z-Tn0k40szP1ZPtwGcV27aEp3MOVEBNx+C3tgA@mail.gmail.com>
	<CAMuHMdU885PUSmqr53-UdJiVBgtMXxPk-pQ27-E=-aw=P=K+_w@mail.gmail.com>
	<CAMo8BfJMBRq5gBw-5SjS5r4NGsN9-TeGOcZf91-i=sVwM5=Thw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:38942 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755540Ab2HGQ5p (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 7 Aug 2012 12:57:45 -0400
In-Reply-To: <CAMo8BfJMBRq5gBw-5SjS5r4NGsN9-TeGOcZf91-i=sVwM5=Thw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: Chris Zankel <chris@zankel.net>, linux-kernel@vger.kernel.org, linux-xtensa@linux-xtensa.org, linux-next@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Marc Gauthier <marc@tensilica.com>, Kirill Krinkin <kirill.krinkin@gmail.com>

Hi Max,

On Tue, Aug 7, 2012 at 5:34 PM, Max Filippov <jcmvbkbc@gmail.com> wrote:
> On Tue, Aug 7, 2012 at 6:35 PM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> On Tue, Aug 7, 2012 at 1:56 PM, Max Filippov <jcmvbkbc@gmail.com> wrote:
>>> https://github.com/jcmvbkbc/linux-xtensa/commit/edd7c14132388d5c09c57cf12c76c6631a1e0277
>>
>> Thanks, that indeed fixes the link issue for me!
>>
>> BTW, how do you export a "commitdiff" from the github web interface?
>
> Not sure what you mean... You can get raw commitdiff by adding
> '.patch' to the URL above:
>
> https://github.com/jcmvbkbc/linux-xtensa/commit/edd7c14132388d5c09c57cf12c76c6631a1e0277.patch

Thanks, that's what I was looking for, but couldn't find, so I had to
apply it manually.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
