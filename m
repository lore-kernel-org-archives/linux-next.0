From: Arnaud Lacombe <lacombar@gmail.com>
Subject: Re: linux-next: Tree for October 20
Date: Tue, 26 Oct 2010 12:22:15 -0400
Message-ID: <AANLkTimO9X1i5pBV-9wQau45q6FLjoDbA0jG-DdNQtBT@mail.gmail.com>
References: <20101020162053.5595e1bf.sfr@canb.auug.org.au>
	<20101021130925.GA32548@infradead.org>
	<4CC54437.8050607@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:55112 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751123Ab0JZQWQ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 26 Oct 2010 12:22:16 -0400
In-Reply-To: <4CC54437.8050607@suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Christoph Hellwig <hch@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Zimny Lech <napohybelskurwysynom2010@gmail.com>

Hi,

On Mon, Oct 25, 2010 at 4:47 AM, Michal Marek <mmarek@suse.cz> wrote:
> On 21.10.2010 15:09, Christoph Hellwig wrote:
>> I can't even get the required userspace code make oldconfig to compi=
le:
>>
>> hch@brick:~/work/linux-2.6/obj-kvm$ make oldconfig
>> make -C /home/hch/work/linux-2.6 O=3D/home/hch/work/linux-2.6/obj-kv=
m/. oldconfig
>> =A0 GEN =A0 =A0 /home/hch/work/linux-2.6/obj-kvm/Makefile
>> =A0 HOSTCC =A0scripts/kconfig/zconf.tab.o
>> In file included from scripts/kconfig/zconf.tab.c:2481:
>> scripts/kconfig/lex.zconf.c:2425: error: conflicting types for 'zcon=
f_curname'
>> /home/hch/work/linux-2.6/scripts/kconfig/lkc.h:79: note: previous de=
claration of 'zconf_curname' was here
>> scripts/kconfig/lex.zconf.c: In function 'zconf_curname':
>> scripts/kconfig/lex.zconf.c:2427: warning: return discards qualifier=
s from pointer target type
>
> The zconf_curname() prototype was changed in 2e7a091 and the
> scripts/kconfig/lex.zconf.c_shipped file was updated as well. What
> probably happened is that you ended up using an updated
> scripts/kconfig/lkc.h header versus an old version of
> scripts/kconfig/lex.zconf.c. Ie. the rule that copies
> scripts/kconfig/lex.zconf.c_shipped to scripts/kconfig/lex.zconf.c di=
d
> not trigger, very strange. I'll look further.
>
this is at least the third time there is such a report. I did
reproduce this issue while using an external build directory:

=46rom what I remind:

% gmake menuconfig # generate lex.zconf.c
% gmake O=3D/foo menuconfig # generate lex.zconf.c

% touch scripts/kconfig/lex.zconf.c_shipped

% gmake menuconfig # re-generated lex.zconf.c
% gmake O=3D/foo menuconfig # did _not_ re-generate lex.zconf.c

However, this tree was dirty (ie. included WIP stuff), switching to a
clean tree, and certainly updating a bunch of timestamps, make it
disappear.

 - Arnaud
