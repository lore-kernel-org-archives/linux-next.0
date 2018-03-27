From: Bart Van Assche <bart.vanassche@wdc.com>
Subject: Re: linux-next: build failure after merge of the device-mapper tree
Date: Tue, 27 Mar 2018 08:39:09 -0700
Message-ID: <9c4b1f71-157b-ffc9-a245-b1a967cc8bac@wdc.com>
References: <20180327133923.53b8954d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180327133923.53b8954d@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>, Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Denis Semakin <d.semakin@omprussia.ru>
List-Id: linux-next.vger.kernel.org

On 03/26/18 19:39, Stephen Rothwell wrote:
> diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
> index d5db9df7ea4b..0589a4da12bb 100644
> --- a/drivers/md/dm-table.c
> +++ b/drivers/md/dm-table.c
> @@ -1896,7 +1896,7 @@ void dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
>   		blk_queue_flag_set(QUEUE_FLAG_DISCARD, q);
>   
>   	if (dm_table_supports_secure_erase(t))
> -		queue_flag_set_unlocked(QUEUE_FLAG_SECERASE, q);
> +		blk_queue_flag_set(QUEUE_FLAG_SECERASE, q);
>   
>   	if (dm_table_supports_flush(t, (1UL << QUEUE_FLAG_WC))) {
>   		wc = true;
> 

The above patch looks fine to me. Thank you Stephen for having resolved 
this merge conflict.

Bart.
