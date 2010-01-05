From: Pekka Enberg <penberg@cs.helsinki.fi>
Subject: Re: linux-next: tip tree build failure
Date: Tue, 5 Jan 2010 09:39:40 +0200
Message-ID: <84144f021001042339r29f151feja00d7af12a82c9a2@mail.gmail.com>
References: <20100104235931.abcf2bc5.sfr@canb.auug.org.au>
	 <20100104163159.GD23652@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f225.google.com ([209.85.220.225]:47954 "EHLO
	mail-fx0-f225.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750910Ab0AEHjm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Jan 2010 02:39:42 -0500
In-Reply-To: <20100104163159.GD23652@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thiago Farina <tfransosi@gmail.com>

On Mon, Jan 4, 2010 at 6:32 PM, Ingo Molnar <mingo@elte.hu> wrote:
>
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
>> Hi all,
>>
>> Today's linux-next build (s390x defconfig) failed like this:
>>
>> kernel/panic.c:134: error: 'CALLER_ADDR0' undeclared (first use in this function)
>>
>> Caused by commit eba3fe4416f3cc2ce043fb304b6c35a69dca3bdb ("kernel: Use
>> CALLER_ADDR0 macro").
>
> Thanks - apparently CALLER_ADDR0 isnt generally available. I've reverted this
> patch for now.

Btw, we have _RET_IP_ which is pretty much the same thing and it is
available everywhere (SLUB uses it).
