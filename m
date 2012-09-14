From: Daniel Wagner <daniel.wagner@bmw-carit.de>
Subject: Re: linux-next: build failure after merge of the cgroup tree
Date: Fri, 14 Sep 2012 08:56:29 +0200
Message-ID: <5052D51D.3060106@bmw-carit.de>
References: <20120914131700.dd3d01a7d17b78082a9bcd55@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.bmw-carit.de ([62.245.222.98]:37862 "EHLO
	mail.bmw-carit.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751542Ab2INHDF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 14 Sep 2012 03:03:05 -0400
In-Reply-To: <20120914131700.dd3d01a7d17b78082a9bcd55@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Tejun Heo <tj@kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Li Zefan <lizefan@huawei.com>, Neil Horman <nhorman@tuxdriver.com>

Hi Stephen,

On 14.09.2012 05:17, Stephen Rothwell wrote:
> Hi Tejun,
>
> After merging the cgroup tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> drivers/net/tun.c: In function 'tun_alloc_skb':
> drivers/net/tun.c:589:2: error: implicit declaration of function 'sock_update_classid' [-Werror=implicit-function-declaration]
>
> Caused by commit 1f66c0a8833c ("cgroup: net_cls: Move sock_update_classid()
> declaration to cls_cgroup.h").  Grep is your friend ...

Sorry about missing to update tun.c. I *swear* I used grep to search
for sock_update_classid() users. It is not the tool's fault when my
brain is not able to decode the things it wants to tell me.

> I have used the cgroup tree from next-20120913 for today.

Obviously, it is straight forward to fix this but I do not know what is 
the preferred solution. Shall I spin an updated version of this patch or 
add a patch on top of the series?

sorry again,
daniel
