From: Michal Marek <mmarek@suse.cz>
Subject: Re: linux-next: Tree for October 20
Date: Wed, 27 Oct 2010 23:20:01 +0200
Message-ID: <4CC89781.4000309@suse.cz>
References: <20101020162053.5595e1bf.sfr@canb.auug.org.au>	<20101021130925.GA32548@infradead.org>	<4CC54437.8050607@suse.cz> <AANLkTimO9X1i5pBV-9wQau45q6FLjoDbA0jG-DdNQtBT@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:58294 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757158Ab0J0VT5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 27 Oct 2010 17:19:57 -0400
In-Reply-To: <AANLkTimO9X1i5pBV-9wQau45q6FLjoDbA0jG-DdNQtBT@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Zimny Lech <napohybelskurwysynom2010@gmail.com>

On 26.10.2010 18:22, Arnaud Lacombe wrote:
> Hi,
> 
> On Mon, Oct 25, 2010 at 4:47 AM, Michal Marek <mmarek@suse.cz> wrote:
>> On 21.10.2010 15:09, Christoph Hellwig wrote:
>>> I can't even get the required userspace code make oldconfig to compile:
>>>
>>> hch@brick:~/work/linux-2.6/obj-kvm$ make oldconfig
>>> make -C /home/hch/work/linux-2.6 O=/home/hch/work/linux-2.6/obj-kvm/. oldconfig
>>>   GEN     /home/hch/work/linux-2.6/obj-kvm/Makefile
>>>   HOSTCC  scripts/kconfig/zconf.tab.o
>>> In file included from scripts/kconfig/zconf.tab.c:2481:
>>> scripts/kconfig/lex.zconf.c:2425: error: conflicting types for 'zconf_curname'
>>> /home/hch/work/linux-2.6/scripts/kconfig/lkc.h:79: note: previous declaration of 'zconf_curname' was here
>>> scripts/kconfig/lex.zconf.c: In function 'zconf_curname':
>>> scripts/kconfig/lex.zconf.c:2427: warning: return discards qualifiers from pointer target type
>>
>> The zconf_curname() prototype was changed in 2e7a091 and the
>> scripts/kconfig/lex.zconf.c_shipped file was updated as well. What
>> probably happened is that you ended up using an updated
>> scripts/kconfig/lkc.h header versus an old version of
>> scripts/kconfig/lex.zconf.c. Ie. the rule that copies
>> scripts/kconfig/lex.zconf.c_shipped to scripts/kconfig/lex.zconf.c did
>> not trigger, very strange. I'll look further.
>>
> this is at least the third time there is such a report. I did
> reproduce this issue while using an external build directory:
> 
> From what I remind:
> 
> % gmake menuconfig # generate lex.zconf.c
> % gmake O=/foo menuconfig # generate lex.zconf.c
> 
> % touch scripts/kconfig/lex.zconf.c_shipped
> 
> % gmake menuconfig # re-generated lex.zconf.c
> % gmake O=/foo menuconfig # did _not_ re-generate lex.zconf.c

OK, if you mix O= and non-O= builds then things can break in various
ways. That's why the top-level Makefile tries to detect this and abort,
unfortunately the check is not strict enough (it checks for the presence
of include/config/kernel.release, which is not created yet when you run
make *config). Christoph, is it possible that your case was the same,
ie. that you had run make *config in the source tree before?

In that case, I'd like to skip this bug for 2.6.37-rc1, because 1) it's
a user error, 2) Linus shortened the merge window and last-minute
changes to the top-level Makefile can cause more harm and good, 3) I
have flu and I only check my mail occasionally this week, so the less
stuff to deal with, the better :). I'll come up with a fix for -rc2 or so.

Michal
