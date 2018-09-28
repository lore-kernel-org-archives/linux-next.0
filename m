From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: build warning after merge of the block tree
Date: Fri, 28 Sep 2018 08:26:47 -0600
Message-ID: <ca2a5d5a-5330-53ce-2fc6-d2cfb44c3401@kernel.dk>
References: <20180928111124.745bf2ef@canb.auug.org.au>
 <20180928064319.GD29754@vader>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180928064319.GD29754@vader>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Omar Sandoval <osandov@osandov.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Omar Sandoval <osandov@fb.com>
List-Id: linux-next.vger.kernel.org

On 9/28/18 12:43 AM, Omar Sandoval wrote:
> On Fri, Sep 28, 2018 at 11:11:24AM +1000, Stephen Rothwell wrote:
>> Hi Jens,
>>
>> After merging the block tree, today's linux-next build (arm
>> multi_v7_defconfig) produced this warning:
>>
>> block/kyber-iosched.c:84:22: warning: integer overflow in expression of type 'long int' results in '705032704' [-Woverflow]
>>   [KYBER_DISCARD] = 5 * NSEC_PER_SEC,
>>                       ^
>>
>> Introduced by commit
>>
>>   6e25cb01ea20 ("kyber: implement improved heuristics")
> 
> Ugh, thanks for the report. This should fix it:
> 
> diff --git a/block/kyber-iosched.c b/block/kyber-iosched.c
> index 2b62e362fb36..eccac01a10b6 100644
> --- a/block/kyber-iosched.c
> +++ b/block/kyber-iosched.c
> @@ -79,9 +79,9 @@ static const unsigned int kyber_depth[] = {
>   * Default latency targets for each scheduling domain.
>   */
>  static const u64 kyber_latency_targets[] = {
> -	[KYBER_READ] = 2 * NSEC_PER_MSEC,
> -	[KYBER_WRITE] = 10 * NSEC_PER_MSEC,
> -	[KYBER_DISCARD] = 5 * NSEC_PER_SEC,
> +	[KYBER_READ] = 2ULL * NSEC_PER_MSEC,
> +	[KYBER_WRITE] = 10ULL * NSEC_PER_MSEC,
> +	[KYBER_DISCARD] = 5ULL * NSEC_PER_SEC,
>  };
>  
>  /*
> 
> Jens, do you mind folding that in, or should I send it separately?

It's already applied, so please send it in separately. We only
really need it for the last one, NSEC_PER_SEC, but I agree let's do
all just in case it's changed later.

-- 
Jens Axboe
