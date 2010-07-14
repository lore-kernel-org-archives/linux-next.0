From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: sound/oss-msnd-pinnacle: ioctl needs the inode
Date: Wed, 14 Jul 2010 08:54:50 -0700
Message-ID: <4C3DDDCA.50900@oracle.com>
References: <20100713144007.55d3abc9.sfr@canb.auug.org.au> <20100713103623.bfb0d9b8.randy.dunlap@oracle.com> <201007141511.39507.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:62771 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754592Ab0GNP4V (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 14 Jul 2010 11:56:21 -0400
In-Reply-To: <201007141511.39507.arnd@arndb.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 07/14/10 06:11, Arnd Bergmann wrote:
> This broke in sound/oss: convert to unlocked_ioctl, when I missed one
> of the ioctl functions still using the inode pointer.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Randy Dunlap <randy.dunlap@oracle.com>

Thanks.

> ---
> On Tuesday 13 July 2010, Randy Dunlap wrote:
>> On Tue, 13 Jul 2010 14:40:07 +1000 Stephen Rothwell wrote:
>>
>>> Hi all,
>>>
>>> Not unexpectedly, we got some conflicts with the arm defconfig files
>>> today ...
>>
>>
>> sound/oss/msnd_pinnacle.c:644:error: 'inode' undeclared (first use in this function)
>>
> 
> Sorry about that, my fault. Please apply.
> 
> I checked all the other files I touched in the same patch, they either did
> not have this problem, or I had done it correctly.
> 
> --- a/sound/oss/msnd_pinnacle.c
> +++ b/sound/oss/msnd_pinnacle.c
> @@ -641,7 +641,7 @@ static int mixer_ioctl(unsigned int cmd, unsigned long arg)
>  
>  static long dev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  {
> -	int minor = iminor(inode);
> +	int minor = iminor(file->f_path.dentry->d_inode);
>  	int ret;
>  
>  	if (cmd == OSS_GETVERSION) {


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
