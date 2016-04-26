From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Tue, 26 Apr 2016 08:41:54 -0600
Message-ID: <571F7E32.80208@kernel.dk>
References: <20160426133812.366dc031@canb.auug.org.au>
 <571F6D59.8040402@suse.cz> <v3THaCMkCzylcv3TJavAje@videotron.ca>
 <alpine.LFD.2.20.1604261037410.5091@knanqh.ubzr>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ig0-f174.google.com ([209.85.213.174]:38808 "EHLO
	mail-ig0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751951AbcDZOl5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 26 Apr 2016 10:41:57 -0400
Received: by mail-ig0-f174.google.com with SMTP id m9so15233632ige.1
        for <linux-next@vger.kernel.org>; Tue, 26 Apr 2016 07:41:56 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1604261037410.5091@knanqh.ubzr>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michal Marek <mmarek@suse.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>

On 04/26/2016 08:40 AM, Nicolas Pitre wrote:
> On Tue, 26 Apr 2016, Stephen Rothwell wrote:
>
>> Hi Michal,
>>
>> On Tue, 26 Apr 2016 15:30:01 +0200 Michal Marek <mmarek@suse.cz> wrote:
>>>
>>> On 2016-04-26 05:38, Stephen Rothwell wrote:
>>>> Hi Nicolas,
>>>>
>>>> After merging the block tree, today's linux-next build (powerpc
>>>> ppc64_defconfig) failed like this:
>>>>
>>>> ERROR: ".blk_queue_write_cache" [drivers/block/virtio_blk.ko] undefined!
>>>> ERROR: ".blk_queue_write_cache" [drivers/block/ps3disk.ko] undefined!
>>>> ERROR: ".blk_queue_write_cache" [drivers/block/nbd.ko] undefined!
>>>>
>>>> Caused by commit
>>>>
>>>>    089095b8eef9 ("kbuild: better abstract vmlinux sequential prerequisites")
>>>>
>>>> from the kbuild-pite tree.
>>>>
>>>> I have reverted that commit for today.
>>>
>>> I can't reproduce this with today's linux-next and the revert reverted.
>>> Also, CONFIG_TRIM_UNUSED_KSYMS is disabled in the defconfig as expected,
>>> so I have no idea what went wrong.
>>
>> Yeah, I couldn't figure it out either, but the revert made it work for
>> me.  Could it be that I do incremental builds - so today, I would have
>> built commit b087ce990625 ("Merge remote-tracking branch 'input/next'")
>> which worked, then commit 9d67df654092 ("Merge remote-tracking branch
>> 'block/for-next'") which failed.
>>
>> The only suspect code in the block tree has been there since April 13
>> with no build failures.
>>
>> Anyway, I can see how things go tomorrow, but I hate it when things
>> seem fragile like this.
>
> If you can reproduce this build failure, could you try a make mrproper
> and attempt it again?  I, too, would like to find an explanation and a
> way to reproduce.

I just took a look at it, and it doesn't make any sense to me...

-- 
Jens Axboe
