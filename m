From: Jarek Poplawski <jarkao2@gmail.com>
Subject: Re: linux-next: Tree for January 8 (net/ip.h, BUG=n)
Date: Wed, 13 Jan 2010 08:54:18 +0000
Message-ID: <20100113085418.GB6053@ff.dom.local>
References: <20100113073540.GA30577@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f225.google.com ([209.85.220.225]:33006 "EHLO
	mail-fx0-f225.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753343Ab0AMIy1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 13 Jan 2010 03:54:27 -0500
Content-Disposition: inline
In-Reply-To: <20100113073540.GA30577@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, "David S. Miller" <davem@davemloft.net>, Stephen Rothwell <sfr@canb.auug.org.au>, netdev@vger.kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Octavian Purdila <opurdila@ixiacom.com>

Octavian added to cc.

Jarek P.

On 13-01-2010 08:35, Ingo Molnar wrote:
> * Randy Dunlap <randy.dunlap@oracle.com> wrote:
> 
>> On Fri, 8 Jan 2010 16:42:32 +1100 Stephen Rothwell wrote:
>>
>>> Hi all,
>>>
>>> Changes since 20100107:
>>
>> When CONFIG_BUG=n, CONFIG_GENERIC_BUG=n:
>>
>> include/net/ip.h:341: error: implicit declaration of function '__WARN'
>>
>> This affects:
>> make[3]: *** [security/selinux/hooks.o] Error 1
>> make[3]: *** [fs/ceph/messenger.o] Error 1
>> make[3]: *** [net/core/sock.o] Error 1
>> make[4]: *** [drivers/net/benet/be_main.o] Error 1
> 
> FYI, this new build bug is now upstream and triggers in -tip testing as well.
> 
> 	Ingo
