From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: Signed-off-by missing for commit in the block tree
Date: Sun, 16 Dec 2018 08:33:01 -0700
Message-ID: <b78c1177-7dfc-7eca-1b8b-2411cfc29d1e@kernel.dk>
References: <20181216172649.5278d8e6@canb.auug.org.au>
 <20181216101816.GA31756@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181216101816.GA31756@lst.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 12/16/18 3:18 AM, Christoph Hellwig wrote:
> On Sun, Dec 16, 2018 at 05:26:49PM +1100, Stephen Rothwell wrote:
>> Hi Jens,
>>
>> Commit
>>
>>   6f7ceaa0559b ("block: remove the bioset_integrity_free export")
>>
>> is missing a Signed-off-by from its author.
> 
> Ooops.  Jens, in case you still feel ok ammending the tree:
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

I guess I can do that, would like to squash a commit too.

-- 
Jens Axboe
