From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Apr 20 (bfq)
Date: Thu, 20 Apr 2017 09:10:40 -0700
Message-ID: <0ce951b0-7feb-80f0-bfed-cc244701259e@infradead.org>
References: <20170420164341.77790320@canb.auug.org.au>
 <83a9471d-08d3-6c78-f778-0896896faafa@infradead.org>
 <c2bd1807-8911-747e-24f5-b5b556e58b8b@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c2bd1807-8911-747e-24f5-b5b556e58b8b@kernel.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paolo Valente <paolo.valente@linaro.org>
List-Id: linux-next.vger.kernel.org

On 04/20/17 08:36, Jens Axboe wrote:
> On 04/20/2017 09:24 AM, Randy Dunlap wrote:
>> On 04/19/17 23:43, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20170419:
>>>
>>
>> on i386:
>> when CONFIG_CGROUPS is not enabled:
>>
>> In file included from ../block/bfq-iosched.c:105:0:
>> ../block/bfq-iosched.h:819:22: error: array type has incomplete element type
>>  extern struct cftype bfq_blkcg_legacy_files[];
>>                       ^
>> ../block/bfq-iosched.h:820:22: error: array type has incomplete element type
>>  extern struct cftype bfq_blkg_files[];
> 
> This should fix it:
> 

Yes, it does.  Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>



-- 
~Randy
