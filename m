From: Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: build failure after merge of the device-mapper tree
Date: Fri, 22 May 2015 08:58:32 -0600
Message-ID: <555F4418.9030707@kernel.dk>
References: <20150522132721.43c296cb@canb.auug.org.au> <20150522124938.GA7471@redhat.com> <20150522132651.GA7590@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150522132651.GA7590@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Snitzer <snitzer@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alasdair G Kergon <agk@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 05/22/2015 07:26 AM, Mike Snitzer wrote:
> On Fri, May 22 2015 at  8:49am -0400,
> Mike Snitzer <snitzer@redhat.com> wrote:
>
>> On Thu, May 21 2015 at 11:27pm -0400,
>> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>>> Hi all,
>>>
>>> After merging the device-mapper tree, today's linux-next build (powerpc
>>> ppc64_defconfig) failed like this:
>>>
>>> block/bio.c:310:20: error: redefinition of 'bio_inc_remaining'
>>>   static inline void bio_inc_remaining(struct bio *bio)
>>>                      ^
>>> In file included from block/bio.c:20:0:
>>> include/linux/bio.h:664:20: note: previous definition of 'bio_inc_remaining' was here
>>>   static inline void bio_inc_remaining(struct bio *bio)
>>>                      ^
>>>
>>> Caused by commit d61b82161c5a ("block: remove management of
>>> bi_remaining when restoring original bi_end_io").
>>>
>>> OK, this is a bad automatic merge caused by the fact that the block
>>> tree and the device-mapper tree both contain the same set fo patches as
>>> different commits.
>>>
>>> Commit c4cf5261f8bf from the block tree is the same as commit
>>> 8395711c4f90 from the device-mapper tree and both add
>>> bio_inc_remaining() to include/linux/bio.h.  The above commit in the
>>> device-mapper tree removes it from there, but the merge decided to keep
>>> it.
>>>
>>> That shared patch above is part of a series of 14 patches that are
>>> identical patches but different commits and are causing quite a few
>>> conflicts.  It looks like those patches were rebased onto v4.10rc3 as
>>> the base for the device-mapper tree.  A better idea would have been to
>>> start with v4.1rc3 (if that is necessary) and merge commit 5b3f341f098d
>>> ("blk-mq: make plug work for mutiple disks and queues") from the block
>>> tree - assuming that Jens will guarantee not to rebase that part of his
>>> tree.
>>>
>>> Please clean this mess up.
>>
>> Will do.
>
> I've fixed linux-dm's for-next to be properly based on linux-block's
> for-4.2/core -- I also resent Jens three block patches for 4.2 that
> motivated me to rebase ontop of block to begin with.

3/3 is already in for-linus, it'll go in for 4.1. 1-2 will go to 4.2/core.


-- 
Jens Axboe
