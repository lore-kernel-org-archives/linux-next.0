From: "Eric Van Hensbergen" <ericvh@gmail.com>
Subject: Re: linux-next: v9fs patch comment
Date: Wed, 22 Oct 2008 19:03:21 -0500
Message-ID: <a4e6962a0810221703p624fb5f9idaa7f662def5266e@mail.gmail.com>
References: <20081023093651.1b8b92d3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.226]:15988 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752124AbYJWADW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 22 Oct 2008 20:03:22 -0400
Received: by rv-out-0506.google.com with SMTP id k40so58044rvb.1
        for <linux-next@vger.kernel.org>; Wed, 22 Oct 2008 17:03:21 -0700 (PDT)
In-Reply-To: <20081023093651.1b8b92d3.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

Thanks -- I've update my for-next branch as suggested and it looks
like I've got to go back and look through the rest of the code for
similar situations.

             -eric


On Wed, Oct 22, 2008 at 5:36 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Eric,
>
>> commit d48be775412f4d9526da636754ebc108eac54b80
>> Author: Eric Van Hensbergen <ericvh@gmail.com>
>> Date:   Wed Oct 22 16:58:59 2008 -0500
>>
>>     9p: fix format warning
>>
>>     This patch fixes a format warning which appears on 64-bit builds.
>>
>>     Signed-off-by: Eric Van Hensbergen <ericvh@gmail.com>
>>
>> diff --git a/fs/9p/vfs_file.c b/fs/9p/vfs_file.c
>> index 041c526..b218e23 100644
>> --- a/fs/9p/vfs_file.c
>> +++ b/fs/9p/vfs_file.c
>> @@ -178,7 +178,8 @@ v9fs_file_read(struct file *filp, char __user *udata, size_t count,
>>       int ret;
>>       struct p9_fid *fid;
>>
>> -     P9_DPRINTK(P9_DEBUG_VFS, "count %d offset %lld\n", count, *offset);
>> +     P9_DPRINTK(P9_DEBUG_VFS, "count %lu offset %lld\n",
>> +                                             (unsigned long) count, *offset);
>
> This is not the correct fix, you should use %zu to print size_t variables
> and then you don't need the cast.
>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
>
