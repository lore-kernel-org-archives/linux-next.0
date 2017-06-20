From: John Johansen <john.johansen@canonical.com>
Subject: Re: linux-next: build failure after merge of the kspp tree
Date: Mon, 19 Jun 2017 22:42:04 -0700
Message-ID: <6b1f24e3-aa8a-a746-75f5-dbf0cfbccede@canonical.com>
References: <20170620145655.4b7f3efb@canb.auug.org.au>
 <CAGXu5jKt7zoyobNADYyoEasuWY89=PtQiw+tfJqetAR8t=jmpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:49589 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750869AbdFTFmN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Jun 2017 01:42:13 -0400
In-Reply-To: <CAGXu5jKt7zoyobNADYyoEasuWY89=PtQiw+tfJqetAR8t=jmpg@mail.gmail.com>
Content-Language: en-GB
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kees Cook <keescook@google.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Morris <jmorris@namei.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 06/19/2017 10:39 PM, Kees Cook wrote:
> On Mon, Jun 19, 2017 at 9:56 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Hi all,
>>
>> After merging the kspp tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> security/apparmor/file.c: In function 'aa_path_link':
>> security/apparmor/file.c:475:23: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
>>   struct path link = { new_dir->mnt, new_dentry };
>>                        ^
>> security/apparmor/file.c:475:23: note: (near initialization for 'link')
>> security/apparmor/file.c:475:37: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
>>   struct path link = { new_dir->mnt, new_dentry };
>>                                      ^
>> security/apparmor/file.c:475:37: note: (near initialization for 'link')
>> security/apparmor/file.c:476:25: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
>>   struct path target = { new_dir->mnt, old_dentry };
>>                          ^
>> security/apparmor/file.c:476:25: note: (near initialization for 'target')
>> security/apparmor/file.c:476:39: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
>>   struct path target = { new_dir->mnt, old_dentry };
>>                                        ^
>> security/apparmor/file.c:476:39: note: (near initialization for 'target')
>>
>> Caused by commit
>>
>>   1a12979f61e4 ("randstruct: Mark various structs for randomization")
>>
>> interacting with commit
>>
>>   8014370f1257 ("apparmor: move path_link mediation to using labels")
>>
>> from the security tree.
>>
>> I added the following merge fix patch for today:
>>
>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>> Date: Tue, 20 Jun 2017 14:50:36 +1000
>> Subject: [PATCH] apparmor: put back designators in struct initialisers
>>
>> Fixes: 8014370f1257 ("apparmor: move path_link mediation to using labels")
>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> ---
>>  security/apparmor/file.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/security/apparmor/file.c b/security/apparmor/file.c
>> index b6e8e5b11e05..3382518b87fa 100644
>> --- a/security/apparmor/file.c
>> +++ b/security/apparmor/file.c
>> @@ -472,8 +472,8 @@ static int profile_path_link(struct aa_profile *profile,
>>  int aa_path_link(struct aa_label *label, struct dentry *old_dentry,
>>                  const struct path *new_dir, struct dentry *new_dentry)
>>  {
>> -       struct path link = { new_dir->mnt, new_dentry };
>> -       struct path target = { new_dir->mnt, old_dentry };
>> +       struct path link = { .mnt = new_dir->mnt, .dentry = new_dentry };
>> +       struct path target = { .mnt = new_dir->mnt, .dentry = old_dentry };
>>         struct path_cond cond = {
>>                 d_backing_inode(old_dentry)->i_uid,
>>                 d_backing_inode(old_dentry)->i_mode
>> --
>> 2.11.0
> 
> Thanks for the fix! That looks correct to me. It seems the refactoring
> in 8014370f1257 ("apparmor: move path_link mediation to using labels")
> didn't take 8486adf0d755 ("apparmor: use designated initializers")
> into account. John, if this looks okay, can you Ack it for James to
> carry in security-next?
> 
yep, already done. Sorry I missed that one :(
