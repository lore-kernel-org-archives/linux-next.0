From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [tip:x86/asm] bitops: Optimise get_order()
Date: Thu, 01 Mar 2012 13:02:47 -0800
Message-ID: <4F4FE3F7.5030508@zytor.com>
References: <20120220223928.16199.29548.stgit@warthog.procyon.org.uk> <tip-d66acc39c7cee323733c8503b9de1821a56dff7e@git.kernel.org> <CAP=VYLr5id0TrsQFbaKOi6FoK7=_zW-Q9dwH+rAEbnmYunHvNQ@mail.gmail.com> <20120301113106.020c3ad0560425970c9de34e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:40294 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932534Ab2CAVDK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 1 Mar 2012 16:03:10 -0500
In-Reply-To: <20120301113106.020c3ad0560425970c9de34e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, mingo@redhat.com, linux-kernel@vger.kernel.org, arnd@arndb.de, dhowells@redhat.com, tglx@linutronix.de, linux-tip-commits@vger.kernel.org, linux-next@vger.kernel.org

David, could you make a fix for this?

	-hpa

On 02/29/2012 04:31 PM, Stephen Rothwell wrote:
> On Wed, 29 Feb 2012 15:29:04 -0500 Paul Gortmaker<paul.gortmaker@windriver.com>  wrote:
>>
>> On Mon, Feb 20, 2012 at 6:20 PM, tip-bot for David Howells
>> <dhowells@redhat.com>  wrote:
>>> Commit-ID:  d66acc39c7cee323733c8503b9de1821a56dff7e
>>> Gitweb:     http://git.kernel.org/tip/d66acc39c7cee323733c8503b9de1821a56dff7e
>>> Author:     David Howells<dhowells@redhat.com>
>>> AuthorDate: Mon, 20 Feb 2012 22:39:29 +0000
>>> Committer:  H. Peter Anvin<hpa@zytor.com>
>>> CommitDate: Mon, 20 Feb 2012 14:47:02 -0800
>>>
>>> bitops: Optimise get_order()
>>
>> This is causing build failures on non-x86 in linux next according to git bisect.
>
> Presumably it needs to include linux/bitops.h (and see below).
>
>>> +static inline __attribute_const__
>>> +int __get_order(unsigned long size)
>>> +{
>>> +       int order;
>>> +
>>> +       size--;
>>> +       size>>= PAGE_SHIFT;
>>> +#if BITS_PER_LONG == 32
>>> +       order = fls(size);
>>> +#else
>>> +       order = fls64(size);
>>> +#endif
>
> linux/bitops.h has fls_long() that does this size test and calls the right thing.
>
