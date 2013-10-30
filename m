From: Jason Baron <jbaron@akamai.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 30 Oct 2013 14:44:09 -0400
Message-ID: <52715379.3020808@akamai.com>
References: <20131030180042.7db60252a0779f89483ef51b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131030180042.7db60252a0779f89483ef51b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 10/30/2013 03:00 AM, Stephen Rothwell wrote:
> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> In file included from include/linux/init.h:4:0,
>                  from fs/eventpoll.c:14:
> fs/eventpoll.c: In function 'eventpoll_init':
> include/linux/compiler.h:321:20: error: call to '__compiletime_assert_2137' declared with attribute error: BUILD_BUG_ON failed: sizeof(void *) <= 8 && sizeof(struct epitem) > 128
>     prefix ## suffix();    \

Yes, my fault for not compiling on more arches - I've posted a fix for this today as:

Subject: [PATCH] epoll: remove the on_list check for 'struct epitem'

Thanks,

-Jason
