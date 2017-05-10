From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: build warning after merge of the block tree
Date: Tue, 9 May 2017 21:00:52 -0600
Message-ID: <90588794-4b7a-e89b-84aa-db93cfbd9be4@kernel.dk>
References: <20170510112411.1e785033@canb.auug.org.au>
 <20170510022054.GA23014@x4>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170510022054.GA23014@x4>
Sender: linux-kernel-owner@vger.kernel.org
To: Markus Trippelsdorf <markus@trippelsdorf.de>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bart Van Assche <bart.vanassche@sandisk.com>
List-Id: linux-next.vger.kernel.org

On 05/09/2017 08:20 PM, Markus Trippelsdorf wrote:
> On 2017.05.10 at 11:24 +1000, Stephen Rothwell wrote:
>> Hi Jens,
>>
>> After merging the block tree, today's linux-next build (arm
>> multi_v7_defconfig) produced this warning:
>>
>> block/elevator.c: In function 'elv_iosched_store':
>> block/elevator.c:1102:2: warning: ignoring return value of 'strstrip', declared with attribute warn_unused_result [-Wunused-result]
>>   strstrip(elevator_name);
>>   ^
>>
>> Introduced by commit
>>
>>   d0f6e2da5871 ("block: Remove leading whitespace and trailing newline in elevator switch error message")
> 
> Yes, it was missing a (void) like "(void)strlcpy(...)". But Jens
> unfortunately removed both warnings, so the following patch should now
> be enough:
> 
> diff --git a/block/elevator.c b/block/elevator.c
> index fda6be933130..dd0ed19e4fb7 100644
> --- a/block/elevator.c
> +++ b/block/elevator.c
> @@ -1099,8 +1099,7 @@ ssize_t elv_iosched_store(struct request_queue *q, const char *name,
>  		return count;
>  
>  	strlcpy(elevator_name, skip_spaces(name), sizeof(elevator_name));
> -	strstrip(elevator_name);
> -	ret = __elevator_change(q, elevator_name);
> +	ret = __elevator_change(q, strstrip(elevator_name));
>  	if (!ret)
>  		return count;

Care to send that as a proper patch? I don't see that warning here, fwiw.

-- 
Jens Axboe
