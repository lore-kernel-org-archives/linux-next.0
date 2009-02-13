From: Jaswinder Singh Rajput <jaswinderlinux@gmail.com>
Subject: Re: [PATCH -next] x86_32: fix printk formats
Date: Fri, 13 Feb 2009 22:19:26 +0530
Message-ID: <3f9a31f40902130849k7d9efb50v48a600aa16f41811@mail.gmail.com>
References: <20090212194408.ff7489c1.sfr@canb.auug.org.au>
	 <49946DB8.9030801@oracle.com> <20090213082556.GB4606@elte.hu>
	 <4995A20A.2060802@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wa-out-1112.google.com ([209.85.146.178]:17467 "EHLO
	wa-out-1112.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752226AbZBMQt2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Feb 2009 11:49:28 -0500
In-Reply-To: <4995A20A.2060802@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Ingo Molnar <mingo@elte.hu>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org

On Fri, Feb 13, 2009 at 10:08 PM, Randy Dunlap <randy.dunlap@oracle.com> wrote:
> Ingo Molnar wrote:
>> * Randy Dunlap <randy.dunlap@oracle.com> wrote:
>>
>>> From: Randy Dunlap <randy.dunlap@oracle.com>
>>>
>>> Fix printk format warnings and also change 2 %ld to %lu for unsigned long
>>> variables.
>>>
>>> arch/x86/mm/init_32.c:727: warning: format '%u' expects type 'unsigned int', but argument 2 has type 'long unsigned int'
>>> arch/x86/mm/init_32.c:735: warning: format '%u' expects type 'unsigned int', but argument 2 has type 'long unsigned int'
>>>
>>> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
>>> ---
>>>  arch/x86/mm/init_32.c |    8 ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> Already fixed in the x86 tree, but thanks.
>
> OK, but this still shows up in linux-next of 20090213.
> Did the fix just miss the today's pull or is there a git #branch issue
> or what?
>

Ahh, because I fixed for :
 arch/x86/mm/init_32.c:696: warning: format '%u' expects type
'unsigned int', but

This part was remaining.

Thanks Randy,
--
JSR
