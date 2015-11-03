From: Jens Axboe <axboe@fb.com>
Subject: Re: linux-next: Tree for Nov 1 (lightnvm)
Date: Tue, 3 Nov 2015 09:53:51 -0700
Message-ID: <5638E69F.3010209@fb.com>
References: <20151102035340.17310681@canb.auug.org.au>
 <5636B979.9010507@infradead.org> <56375A8B.9090006@bjorling.me>
 <56378327.4020500@fb.com> <5637E4FD.403@bjorling.me>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:44463 "EHLO
	mx0b-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751787AbbKCQyf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Nov 2015 11:54:35 -0500
In-Reply-To: <5637E4FD.403@bjorling.me>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matias Bjorling <m@bjorling.me>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/02/2015 03:34 PM, Matias Bjorling wrote:
> On 11/02/2015 04:37 PM, Jens Axboe wrote:
>> On 11/02/2015 05:43 AM, Matias Bjorling wrote:
>>> On 11/02/2015 02:16 AM, Randy Dunlap wrote:
>>>> On 11/01/15 08:53, Stephen Rothwell wrote:
>>>>> Hi all,
>>>>>
>>>>> I start again a day early, and this is how you all repay me? ;-)
>>>>>
>>>>> Changes since 20151022:
>>>>>
>>>>
>>>> on i386:
>>>>
>>>> ../include/linux/lightnvm.h:143:4: error: width of 'resved' exceeds
>>>> its type
>>>>
>>>> # CONFIG_LBDAF is not set
>>>>
>>>>
>>>
>>> Thanks Randy.
>>>
>>> Jens, how would you like to receive the patch? (I've currently attached
>>> it in this mail)
>>
>> If it really needs to be 64-bit regardless of LBDAF, just make it a u64
>> instead of typedef'ing some new ppa_t that everybody would have to look up.
>>
>
> Sure, patch attached.

Applied, thanks.

-- 
Jens Axboe
