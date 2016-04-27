From: Michal Marek <mmarek@suse.cz>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Wed, 27 Apr 2016 11:02:08 +0200
Message-ID: <57208010.7030505@suse.cz>
References: <20160426133812.366dc031@canb.auug.org.au>
 <571F6D59.8040402@suse.cz> <v3THaCMkCzylcv3TJavAje@videotron.ca>
 <alpine.LFD.2.20.1604261037410.5091@knanqh.ubzr>
 <20160427011825.06c64502@canb.auug.org.au>
 <alpine.LFD.2.20.1604261603310.5091@knanqh.ubzr>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:37800 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751992AbcD0JCL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 27 Apr 2016 05:02:11 -0400
In-Reply-To: <alpine.LFD.2.20.1604261603310.5091@knanqh.ubzr>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, Randy Dunlap <rdunlap@infradead.org>

On 2016-04-26 22:48, Nicolas Pitre wrote:
> On Wed, 27 Apr 2016, Stephen Rothwell wrote:
> 
>> Hi Nicolas,
>>
>> On Tue, 26 Apr 2016 10:40:57 -0400 (EDT) Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
>>>
>>> If you can reproduce this build failure, could you try a make mrproper 
>>> and attempt it again?  I, too, would like to find an explanation and a 
>>> way to reproduce.
>>
>> I reset my build tree to commit 9d67df654092 ("Merge remote-tracking
>> branch 'block/for-next'") and the build failed with:
>>
>> ERROR: ".local_clock" [drivers/vhost/vhost_net.ko] undefined!
>> ERROR: ".local_clock" [drivers/misc/cxl/cxl.ko] undefined!
>>
>> :-(
>>
>> So I did a "make mrproper" and did the build again.
>>
>> That built correctly.
>>
> [...]
> 
> OK!  After digging and diffing through 750 megabytes of make debug logs 
> I finally found the explanation.  The if_changed directive is useless 
> against phony targets.
> 
> @Stephen: could you replace the revert with the patch below in your tree?
> 
> @Michal: could you fold the patch below into commit 2441e78b19 in your tree?

I prefer not to overwrite the topic branches unless necessary and I
wanted to credit Stephen, so I committed your patch with a fabricated
commit message and your signoff (since you wanted to fold it into a
patch that you had already signed off).

Michal
