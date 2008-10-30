From: "=?ISO-8859-1?Q?Fr=E9d=E9ric_Weisbecker?=" <fweisbec@gmail.com>
Subject: Re: [PATCH] tracing: fix a build error on alpha and m68k
Date: Thu, 30 Oct 2008 23:57:36 +0100
Message-ID: <c62985530810301557x2c92a78ay49cdc72931b6caae@mail.gmail.com>
References: <20081023213637.eff9b414.sfr@canb.auug.org.au>
	 <c62985530810230548t1b569f61g34d1900bb94fde83@mail.gmail.com>
	 <c62985530810230615s3252a54ao6488e763d72dc939@mail.gmail.com>
	 <49008D12.5090204@gmail.com>
	 <Pine.LNX.4.64.0810231635440.18978@anakin>
	 <c62985530810230757r411b4e3dj4ecec649cf8cf0b3@mail.gmail.com>
	 <Pine.LNX.4.64.0810231727430.18978@anakin>
	 <4900B414.7090002@gmail.com> <20081023163433.GA3160@x200.localdomain>
	 <20081030214910.GA14679@x200.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rn-out-0910.google.com ([64.233.170.187]:48696 "EHLO
	rn-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752648AbYJ3W5j (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 30 Oct 2008 18:57:39 -0400
In-Reply-To: <20081030214910.GA14679@x200.localdomain>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Ingo Molnar <mingo@elte.hu>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>

2008/10/30 Alexey Dobriyan <adobriyan@gmail.com>:
> On Thu, Oct 23, 2008 at 08:34:33PM +0400, Alexey Dobriyan wrote:
>> On Thu, Oct 23, 2008 at 07:27:48PM +0200, Frederic Weisbecker wrote:
>> > When tracing is enabled, some arch have included <linux/irqflags.h>
>> > on their <asm/system.h> but others like alpha or m68k don't.
>> >
>> > Build error on alpha:
>> >
>> > kernel/trace/trace.c: In function 'tracing_generic_entry_update':
>> > kernel/trace/trace.c:658: error: implicit declaration of function 'irqs_disabled_flags'
>
> FYI, this error still exists in mainline (7f82f000ed030d1108b4de47d9e2d556092980c6).
>

Thanks.

Yes Steven sent a patch to correct it: http://lkml.org/lkml/2008/10/24/205
But it has not been applied yet (still in discussion?).
