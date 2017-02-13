From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: [PATCH] tile: fix build failure
Date: Mon, 13 Feb 2017 22:58:40 +0000
Message-ID: <58A23A20.30000@gmail.com>
References: <1485275961-20112-1-git-send-email-sudip.mukherjee@codethink.co.uk> <0a7c53b5-0d1f-baa1-b159-b188e68e8f26@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:33849 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750983AbdBMW6s (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Feb 2017 17:58:48 -0500
In-Reply-To: <0a7c53b5-0d1f-baa1-b159-b188e68e8f26@mellanox.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chris Metcalf <cmetcalf@mellanox.com>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Tuesday 24 January 2017 04:56 PM, Chris Metcalf wrote:
> On 1/24/2017 11:39 AM, Sudip Mukherjee wrote:
>> From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
>>
>> The build of tilegx allmodconfig was failing with errors like:
>> ../arch/tile/include/asm/div64.h:5:15: error: unknown type name 'u64'
>>   static inline u64 mul_u32_u32(u32 a, u32 b)
>>                 ^~~
>> ../arch/tile/include/asm/div64.h:5:31: error: unknown type name 'u32'
>>   static inline u64 mul_u32_u32(u32 a, u32 b)
>>                                 ^~~
>> ../arch/tile/include/asm/div64.h:5:38: error: unknown type name 'u32'
>>   static inline u64 mul_u32_u32(u32 a, u32 b)
>>                                        ^~~
>> In file included from ../fs/ubifs/ubifs.h:26:0,
>>                   from ../fs/ubifs/shrinker.c:42:
>> ../include/linux/math64.h: In function 'mul_u64_u32_shr':
>> ../arch/tile/include/asm/div64.h:9:21: error: implicit declaration of
>>     function 'mul_u32_u32' [-Werror=implicit-function-declaration]
>>
>> The simplest solution was to include the types header file.
>>
>> Fixes: 9e3d6223d209 ("math64, timers: Fix 32bit mul_u64_u32_shr() and
>> friends")
>> Cc: Peter Zijlstra <peterz@infradead.org>
>> Signed-off-by: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
>> ---
>>
>> build log is at:
>> https://travis-ci.org/sudipm-mukherjee/parport/jobs/194717687
>>
>>   arch/tile/include/asm/div64.h | 1 +
>>   1 file changed, 1 insertion(+)
>
> Acked-by: Chris Metcalf <cmetcalf@mellanox.com>
>

linux-next is still failing for this error. Who will pick this up?

Regards
Sudip
