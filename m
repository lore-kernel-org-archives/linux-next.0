From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip tree
Date: Wed, 16 Sep 2015 08:58:32 +0200
Message-ID: <CAMuHMdUFnQBYr8tt7GsZw+6s_raFct+vDoRf6F=QnEC6ehqmPw@mail.gmail.com>
References: <20150728160015.142f588f@canb.auug.org.au>
	<20150729171256.GA10863@redhat.com>
	<20150908093524.507a19d8@canb.auug.org.au>
	<CA+55aFw=mTzTg8BS1Oo27qoybYYzweRvDNv-3U2V4gOpJ6FqrA@mail.gmail.com>
	<20150909085603.0173ac4e@canb.auug.org.au>
	<CA+55aFzNTO-VRD25QyopovfbVN3m3XMogruRE0L7G51AKOAb2g@mail.gmail.com>
	<20150908162115.fc494463.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:34019 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751822AbbIPG6d (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 Sep 2015 02:58:33 -0400
In-Reply-To: <20150908162115.fc494463.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Andrea Arcangeli <aarcange@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, Eric B Munson <emunson@akamai.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Hi Andrew,

On Wed, Sep 9, 2015 at 1:21 AM, Andrew Morton <akpm@linux-foundation.org> wrote:
> New syscalls are rather a pain, both from the patch-monkeying POV and
> also because nobody knows what the syscall numbers will be until
> everything lands in mainline.  Oh well, it doesn't happen often and
> it's easy stuff.

One more reason to let the assignment of syscall numbers be handled
(1) by the architecture maintainer, (2) after -rc1, even for x86.

If x86 is no more the canonical source, scripts/checksyscalls.sh needs an
update, though.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
