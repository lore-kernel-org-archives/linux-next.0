From: Avi Kivity <avi@redhat.com>
Subject: Re: linux-next: build failure after merge of the final tree (kvm
 tree related)
Date: Mon, 28 Feb 2011 11:36:56 +0200
Message-ID: <4D6B6CB8.7050209@redhat.com>
References: <20110221175658.2dc4d1ac.sfr@canb.auug.org.au>	 <20110228131556.3822f3ca.sfr@canb.auug.org.au> <1298860124.27725.2.camel@yhuang-dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:20162 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752655Ab1B1JhO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Feb 2011 04:37:14 -0500
In-Reply-To: <1298860124.27725.2.camel@yhuang-dev>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Huang Ying <ying.huang@intel.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Miller <davem@davemloft.net>, Andrew Morton <akpm@linux-foundation.org>

On 02/28/2011 04:28 AM, Huang Ying wrote:
> Hi, Avi and Marcelo,
>
> On Mon, 2011-02-28 at 10:15 +0800, Stephen Rothwell wrote:
> >  Hi All,
> >
> >  On Mon, 21 Feb 2011 17:56:58 +1100 Stephen Rothwell<sfr@canb.auug.org.au>  wrote:
> >  >
> >  >  After merging the final tree, today's linux-next build (sparc64 defconfig)
> >  >  failed like this:
> >  >
> >  >  mm/memory.c: In function '__get_user_pages':
> >  >  mm/memory.c:1584: error: 'EHWPOISON' undeclared (first use in this function)
> >  >
> >  >  Caused by commit b1c4f2836370f5c8207d4c61e91c93bd6a4ce27a ("mm: make
> >  >  __get_user_pages return -EHWPOISON for HWPOISON page optionally") from
> >  >  the kvm tree.
> >  >
> >  >  Not all architectures use include/asm-generic/errno.h ...
> >  >
> >  >  I have reverted that commit (and commits
> >  >  d47b742c5661385b927c03188549b2d2004b80f4 "KVM: Replace
> >  >  is_hwpoison_address with __get_user_pages" and
> >  >  eef8839430b72deac59e9ec51eb56c44512fcc66 "mm: remove is_hwpoison_address"
> >  >  which depend on it) for today.
> >
> >  I am still doing those reverts ...
>
> Can you merge the fixes following the email into my original EHWPOISON
> patch to check if that fixes linux-next issue?
>

I folded this into the original patch, will show up in next linux-next.

-- 
error compiling committee.c: too many arguments to function
