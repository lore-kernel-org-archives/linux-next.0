From: Jens Axboe <axboe@fb.com>
Subject: Re: linux-next: Tree for Nov 1 (lightnvm)
Date: Mon, 2 Nov 2015 08:37:11 -0700
Message-ID: <56378327.4020500@fb.com>
References: <20151102035340.17310681@canb.auug.org.au>
 <5636B979.9010507@infradead.org> <56375A8B.9090006@bjorling.me>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:8215 "EHLO
	mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753160AbbKBPhp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Nov 2015 10:37:45 -0500
In-Reply-To: <56375A8B.9090006@bjorling.me>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matias Bjorling <m@bjorling.me>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/02/2015 05:43 AM, Matias Bjorling wrote:
> On 11/02/2015 02:16 AM, Randy Dunlap wrote:
>> On 11/01/15 08:53, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> I start again a day early, and this is how you all repay me? ;-)
>>>
>>> Changes since 20151022:
>>>
>>
>> on i386:
>>
>> ../include/linux/lightnvm.h:143:4: error: width of 'resved' exceeds its type
>>
>> # CONFIG_LBDAF is not set
>>
>>
>
> Thanks Randy.
>
> Jens, how would you like to receive the patch? (I've currently attached
> it in this mail)

If it really needs to be 64-bit regardless of LBDAF, just make it a u64 
instead of typedef'ing some new ppa_t that everybody would have to look up.

-- 
Jens Axboe
