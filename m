From: "Huang\, Ying" <ying.huang@intel.com>
Subject: Re: mmotm 2019-05-29-20-52 uploaded
Date: Fri, 31 May 2019 09:43:13 +0800
Message-ID: <87lfyn5rgu.fsf@yhuang-dev.intel.com>
References: <20190530035339.hJr4GziBa%akpm@linux-foundation.org>
        <fac5f029-ef20-282e-b0d2-2357589839e8@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fac5f029-ef20-282e-b0d2-2357589839e8@oracle.com> (Mike Kravetz's
        message of "Thu, 30 May 2019 13:54:07 -0700")
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Kravetz <mike.kravetz@oracle.com>
Cc: akpm@linux-foundation.org, broonie@kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-next@vger.kernel.org, mhocko@suse.cz, mm-commits@vger.kernel.org, sfr@canb.auug.org.au
List-Id: linux-next.vger.kernel.org

Hi, Mike,

Mike Kravetz <mike.kravetz@oracle.com> writes:

> On 5/29/19 8:53 PM, akpm@linux-foundation.org wrote:
>> The mm-of-the-moment snapshot 2019-05-29-20-52 has been uploaded to
>> 
>>    http://www.ozlabs.org/~akpm/mmotm/
>> 
>
> With this kernel, I seem to get many messages such as:
>
> get_swap_device: Bad swap file entry 1400000000000001
>
> It would seem to be related to commit 3e2c19f9bef7e
>> * mm-swap-fix-race-between-swapoff-and-some-swap-operations.patch

Hi, Mike,

Thanks for reporting!  I find an issue in my patch and I can reproduce
your problem now.  The reason is total_swapcache_pages() will call
get_swap_device() for invalid swap device.  So we need to find a way to
silence the warning.  I will post a fix ASAP.

Best Regards,
Huang, Ying
