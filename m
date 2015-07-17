From: Oleg Nesterov <oleg@redhat.com>
Subject: Re: [PATCH]
	mm-move-mremap-from-file_operations-to-vm_operations_struct-fix
Date: Fri, 17 Jul 2015 20:19:40 +0200
Message-ID: <20150717181940.GA946@redhat.com>
References: <20150716231405.GA25147@redhat.com> <20150716162444.26425f5e227387f1166a6d16@linux-foundation.org> <20150716235227.GA26551@redhat.com> <20150717140615.GA2779@kvack.org> <20150717172726.GA30443@redhat.com> <20150717173757.GD2779@kvack.org> <20150717175542.GA31888@redhat.com> <55A94578.5050306@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:52568 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752776AbbGQSV0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Jul 2015 14:21:26 -0400
Content-Disposition: inline
In-Reply-To: <55A94578.5050306@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Austin S Hemmelgarn <ahferroin7@gmail.com>
Cc: Benjamin LaHaise <bcrl@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, Joonsoo Kim <js1304@gmail.com>, Fengguang Wu <fengguang.wu@intel.com>, Jeff Moyer <jmoyer@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/17, Austin S Hemmelgarn wrote:
>
> On 2015-07-17 13:55, Oleg Nesterov wrote:
>> On 07/17, Benjamin LaHaise wrote:
>>>
>>> Don't add BUG().  It's the equivalent approach of saying "I think this code
>>> isn't needed, but I'm lazy and not going to remove it properly."
>>
>> There is another interpretation: I think this code must be never called,
>> if it is actually called we have a serious problem which should be loudly
>> reported.
>>
> And not compiling it at all _will_ loudly report it, it'll just report
> it during linking instead of at run-time, which is a much better time to
> shout about it.

And how can we do this?

Oleg.
