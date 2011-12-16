From: Glauber Costa <glommer@parallels.com>
Subject: Re: linux-next: Tree for Dec 15 (memcontrol)
Date: Fri, 16 Dec 2011 06:07:11 +0400
Message-ID: <4EEAA7CF.8010006@parallels.com>
References: <20111215191115.fd4ef2ab8fa11872ea22d70e@canb.auug.org.au> <4EEA8693.8020905@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.parallels.com ([64.131.90.16]:38730 "EHLO mx2.parallels.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756420Ab1LPCHu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 15 Dec 2011 21:07:50 -0500
In-Reply-To: <4EEA8693.8020905@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>

On 12/16/2011 03:45 AM, Randy Dunlap wrote:
> On 12/15/2011 12:11 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20111214:
>
>
> memcontrol.c:(.text+0x31f9d): undefined reference to `mem_cgroup_sockets_init'
> memcontrol.c:(.text+0x326dd): undefined reference to `mem_cgroup_sockets_destroy'
>
> Full randconfig file is attached.
>
Hi.

Thanks. This one is also fixed by one patch I am about to send.
