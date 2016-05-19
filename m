From: Anna Schumaker <Anna.Schumaker@netapp.com>
Subject: Re: linux-next: build failure after merge of the nfs tree
Date: Thu, 19 May 2016 13:30:07 -0400
Message-ID: <372afe19-6003-7935-5d3e-295397d08530@Netapp.com>
References: <20160519105847.2b05c81f@canb.auug.org.au>
 <CAABAsM4xcQzxzjW8mDw=uQ14yZRhLmt92CSkCwSMSqJXX1iLSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx143.netapp.com ([216.240.21.24]:5380 "EHLO mx143.netapp.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753433AbcESRai (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 May 2016 13:30:38 -0400
In-Reply-To: <CAABAsM4xcQzxzjW8mDw=uQ14yZRhLmt92CSkCwSMSqJXX1iLSw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Linus <torvalds@linux-foundation.org>

On 05/19/2016 08:06 AM, Trond Myklebust wrote:
> Thanks Stephen!
> 
> Anna will be managing pushing the NFS client changes to Linus during
> this merge window, so I'm assuming she will include this and your
> other fixup in her pull request.

Yep!  I'll make sure it's in there.

Anna

> 
> Cheers
>   Trond
> 
> On Wed, May 18, 2016 at 8:58 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Hi Trond,
>>
>> After merging the nfs tree, today's linux-next build (x86_64 allmodconfig)
>> failed like this:
>>
>> In file included from include/linux/fs.h:19:0,
>>                  from fs/nfs/nfs42proc.c:4:
>> fs/nfs/nfs42proc.c: In function 'nfs42_proc_copy':
>> fs/nfs/nfs42proc.c:212:30: error: 'struct inode' has no member named 'i_mutex'
>>    mutex_lock(&file_inode(dst)->i_mutex);
>>                               ^
>> include/linux/mutex.h:146:44: note: in definition of macro 'mutex_lock'
>>  #define mutex_lock(lock) mutex_lock_nested(lock, 0)
>>                                             ^
>> fs/nfs/nfs42proc.c:215:32: error: 'struct inode' has no member named 'i_mutex'
>>    mutex_unlock(&file_inode(dst)->i_mutex);
>>                                 ^
>>
>> Caused by commit
>>
>>   2e72448b07dc ("NFS: Add COPY nfs operation")
>>
>> interacting with commit
>>
>>   9902af79c01a ("parallel lookups: actual switch to rwsem")
>>
>> from Linus' tree.
>>
>> I applied the following merge fix patch - you will need to send this to
>> Linus when you ask him to merge your tree.
>>
>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>> Date: Thu, 19 May 2016 10:50:26 +1000
>> Subject: [PATCH] nfs: fix for i_mutex to i_rwsem change
>>
>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> ---
>>  fs/nfs/nfs42proc.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/fs/nfs/nfs42proc.c b/fs/nfs/nfs42proc.c
>> index 20c44d1209dc..aa03ed09ba06 100644
>> --- a/fs/nfs/nfs42proc.c
>> +++ b/fs/nfs/nfs42proc.c
>> @@ -209,10 +209,10 @@ ssize_t nfs42_proc_copy(struct file *src, loff_t pos_src,
>>         dst_exception.state = dst_lock->open_context->state;
>>
>>         do {
>> -               mutex_lock(&file_inode(dst)->i_mutex);
>> +               inode_lock(file_inode(dst));
>>                 err = _nfs42_proc_copy(src, pos_src, src_lock,
>>                                        dst, pos_dst, dst_lock, count);
>> -               mutex_unlock(&file_inode(dst)->i_mutex);
>> +               inode_unlock(file_inode(dst));
>>
>>                 if (err == -ENOTSUPP) {
>>                         err = -EOPNOTSUPP;
>> --
>> 2.7.0
>>
>> --
>> Cheers,
>> Stephen Rothwell
