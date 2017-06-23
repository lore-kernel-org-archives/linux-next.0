From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: manual merge of the block tree with Linus' tree
Date: Thu, 22 Jun 2017 21:56:16 -0600
Message-ID: <53dcc297-d279-6211-7767-816776f2c569@kernel.dk>
References: <20170623130632.03bc60af@canb.auug.org.au>
 <f94e6ae4-e4d9-61fb-9e69-7b2ef08a38aa@kernel.dk>
 <20170623132433.5aff6b19@canb.auug.org.au>
 <612521b1-f272-3e4a-e295-c3bac3e54f25@kernel.dk>
 <20170623133314.3df3dbbe@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170623133314.3df3dbbe@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

On 06/22/2017 09:33 PM, Stephen Rothwell wrote:
> Hi Jens,
> 
> On Thu, 22 Jun 2017 21:27:04 -0600 Jens Axboe <axboe@kernel.dk> wrote:
>>
>> On 06/22/2017 09:24 PM, Stephen Rothwell wrote:
>>> Hi Jens,
>>>
>>> On Thu, 22 Jun 2017 21:09:22 -0600 Jens Axboe <axboe@kernel.dk> wrote:  
>>>>
>>>> I'll cherry pick that commit into the 4.13 branch to get this resolved.  
>>>
>>> Merging commit 8e8320c9315c might give a better result ...  
>>
>> I don't want to pull the whole thing in, just that offending commit.
> 
> Your tree is already based on v4.12-rc5 so you are not really pulling
> much in at all:
> 
> $ git rev-list --count --no-merges 8e8320c9315c ^block/for-next 
> 14

Yeah good point, I guess not a lot has happened since -rc5.

-- 
Jens Axboe
