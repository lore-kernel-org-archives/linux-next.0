From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: new 64 bit math link fail in xfs in linux-next today
Date: Wed, 16 Apr 2014 17:45:23 -0400
Message-ID: <534EF9F3.7080805@windriver.com>
References: <534EAB41.60901@windriver.com> <534EEF47.4000706@sgi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:53760 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756664AbaDPVpV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 Apr 2014 17:45:21 -0400
In-Reply-To: <534EEF47.4000706@sgi.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Tinguely <tinguely@sgi.com>
Cc: Dave Chinner <david@fromorbit.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, xfs@oss.sgi.com

On 14-04-16 04:59 PM, Mark Tinguely wrote:
> On 04/16/14 11:09, Paul Gortmaker wrote:
>> Hi Dave,
>>
>> Not sure if this has been reported yet, but this new failure showed
>> up in the xtensa link of today's linux-next builds.
>>
>> http://kisskb.ellerman.id.au/kisskb/buildresult/10938384/
>>
>> Paul.
>>
> 
> Try this works on i386. sorry if my mailer wraps the line:

Yep, also works for xtensa too; feel free to add a reported-by
and/or tested-by from me if you want.

Thanks,
Paul.
--

> 
> The roundup in commit 68c1fb5d should be a roundup_64()
> because it is desired to round a 64 bit type by an integer
> and that will result in a 64 bit value. On 32 bit machines
> using roundup() in this case will result in the error:
> 
>   ERROR: "__divdi3" [fs/xfs/xfs.ko] undefined!
> 
> Signed-off-by: Mark Tinguely <tinguely@sgi.com>
> ---
>   fs/xfs/xfs_aops.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Index: b/fs/xfs/xfs_aops.c
> ===================================================================
> --- a/fs/xfs/xfs_aops.c
> +++ b/fs/xfs/xfs_aops.c
> @@ -1365,7 +1365,7 @@ __xfs_get_blocks(
>   		if (offset < i_size_read(inode) &&
>   		    offset + mapping_size >= i_size_read(inode)) {
>   			/* limit mapping to block that spans EOF */
> -			mapping_size = roundup(i_size_read(inode) - offset,
> +			mapping_size = roundup_64(i_size_read(inode) - offset,
>   					       1 << inode->i_blkbits);
>   		}
>   		if (mapping_size > LONG_MAX)
> 
