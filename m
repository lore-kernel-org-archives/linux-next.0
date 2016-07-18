From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH/RFC] Re: linux-next: build failure after merge of the
 luto-misc tree
Date: Mon, 18 Jul 2016 13:04:34 -0700
Message-ID: <CALCETrWqdi=7hsXTx=WKf-=He-9GP-WNLXppijeZgcoZDCq=bg@mail.gmail.com>
References: <20160715170654.0b09a8bc@canb.auug.org.au> <20160715072243.GP30154@twins.programming.kicks-ass.net>
 <20160715073119.GR30927@twins.programming.kicks-ass.net> <20160715150903.GA2523@redhat.com>
 <20160715152436.GB2523@redhat.com> <20160715154326.GC2523@redhat.com> <20160718151845.4de6e274@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vk0-f43.google.com ([209.85.213.43]:36802 "EHLO
	mail-vk0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751601AbcGRUEz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 18 Jul 2016 16:04:55 -0400
Received: by mail-vk0-f43.google.com with SMTP id j126so200326822vkg.3
        for <linux-next@vger.kernel.org>; Mon, 18 Jul 2016 13:04:55 -0700 (PDT)
In-Reply-To: <20160718151845.4de6e274@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>

On Sun, Jul 17, 2016 at 10:18 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Arnaldo,
>
> On Fri, 15 Jul 2016 12:43:26 -0300 Arnaldo Carvalho de Melo <acme@redhat.com> wrote:
>>
>> Ok, same results, it works, queuing this one, ack? Stephen, does it work
>> for you?
>
> Sorry, no.  See my other email.
>
> I am cross building (if that makes a difference).

I wonder if something's wrong with the way that hostprogs-y works if
the program includes kernel headers.

It's plausible that something like this:

https://git.kernel.org/cgit/linux/kernel/git/luto/linux.git/commit/?h=x86/vdso&id=424eb7848324efbfcffaf58b142db1a455a9628b

coupled with a change to make vdso2c or, more generally, hostprogs-y
use USERINCLUDE would help.

--Andy
