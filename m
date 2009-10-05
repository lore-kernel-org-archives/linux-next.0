From: Jens Axboe <jens.axboe-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: linux-next: block/drbd tree build failure
Date: Mon, 5 Oct 2009 10:49:50 +0200
Message-ID: <20091005084949.GU26573@kernel.dk>
References: <20091005143552.977a2d4d.sfr@canb.auug.org.au>
	<20091005063138.GO26573@kernel.dk>
	<alpine.DEB.2.00.0910050138351.9391@asgard.lang.hm>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.0910050138351.9391-Z4YwzcCRHZnr5h6Zg1Auow@public.gmane.org>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org>
List-Help: <mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org?subject=subscribe>
Sender: drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
Errors-To: drbd-dev-bounces-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org
To: david-gFPdbfVZQbY@public.gmane.org
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, drbd-dev-cunTk1MwBs8qoQakbn7OcQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Reisner <philipp.reisner-63ez5xqkn6DQT0dZR+AlfA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Mon, Oct 05 2009, david-gFPdbfVZQbY@public.gmane.org wrote:
> On Mon, 5 Oct 2009, Jens Axboe wrote:
>
>> On Mon, Oct 05 2009, Stephen Rothwell wrote:
>>> Hi Jens,
>>>
>>> Today's linux-next build (x86_64 allmodconfig) failed like this:
>>>
>>> drivers/block/drbd/drbd_req.c: In function '_drbd_start_io_acct':
>>> drivers/block/drbd/drbd_req.c:43: error: subscripted value is neither array nor pointer
>>> drivers/block/drbd/drbd_req.c: In function '_drbd_end_io_acct':
>>> drivers/block/drbd/drbd_req.c:56: error: subscripted value is neither array nor pointer
>>>
>>> I reported a similar error against the dbd tree, which was fixed, but now
>>> the commit that caused that error has been reverted and thus we get
>>> this :-(
>>>
>>> I have reverted the drbd commits from the block tree for today.
>>
>> That's probably my fault, not drbd. I moved it to a new branch since it
>> isn't going into 2.6.32, and perhaps dropped that fix along the way.
>> I'll look into it.
>
>
> what needs to happen to get drbd accepted at this point? It sounded like  
> they had the tree in good shape to be merged, except for the desire that  
> was expressed to have them re-work all existing raid implementations  
> before adding their code (and it sounded like that was not going to be  
> allowed to hold it up)

Linus said he was happy to merge it, but that .32 had slipped now
unfortunately. Usually it's not a problem to merge drivers later than
-rc1, but the discussion surrounding drdb makes it less of a no brainer.

So I expect to merge drbd for .33.

-- 
Jens Axboe
