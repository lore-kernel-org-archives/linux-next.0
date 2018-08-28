From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: new maintainer/tree for the libata tree?
Date: Mon, 27 Aug 2018 19:30:09 -0600
Message-ID: <0ee8b9e0-1576-c8c1-ed22-dd76a8d378ba@kernel.dk>
References: <20180828071944.02b13db4@canb.auug.org.au>
 <27ef8afc-c490-5984-5a18-1ee5ce51d556@kernel.dk>
 <20180828112851.19c64e80@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180828112851.19c64e80@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Tejun Heo <tj@kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 8/27/18 7:28 PM, Stephen Rothwell wrote:
> Hi Jens,
> 
> On Mon, 27 Aug 2018 19:15:23 -0600 Jens Axboe <axboe@kernel.dk> wrote:
>>
>> On 8/27/18 3:20 PM, Stephen Rothwell wrote:
>>>
>>> I noticed the maintaership change - so what shuld I sues for linux-next,
>>> now?
>>>
>>> I currently have
>>>
>>> git://git.kernel.org/pub/scm/linux/kernel/git/tj/libata.git#for-next  
>>
>> I'll merge into my for-next branch on the block tree, I'm don't plan on
>> doing separate trees for this, just separate branches. And everything I
>> queue up for the next version will end up in my for-next branch.
> 
> So I'll just drop the libata tree from linux-next, then?

Yeah, that should be all that's needed.

-- 
Jens Axboe
