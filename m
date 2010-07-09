From: Sachin Sant <sachinp@in.ibm.com>
Subject: Re: [-next July 9 - s390 ] Badness at fs/sysfs/symlink.c:82 during
 qeth initalization
Date: Fri, 09 Jul 2010 15:57:00 +0530
Message-ID: <4C36F974.4030608@in.ibm.com>
References: <20100709150117.51612026.sfr@canb.auug.org.au> <4C36EF9C.7010804@in.ibm.com> <m1d3ux55od.fsf@fess.ebiederm.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp07.au.ibm.com ([202.81.31.140]:53897 "EHLO
	e23smtp07.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752940Ab0GIK1F (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 9 Jul 2010 06:27:05 -0400
In-Reply-To: <m1d3ux55od.fsf@fess.ebiederm.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: linux-s390@vger.kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>

Eric W. Biederman wrote:
>> With today's next(20100709) qeth interface fails to initialize
>> with following Badness message:
>>     
>> sysfs: symlink across ns_types 0.0.6000/net:eth0 -> net/eth0
>>     
>
> Is this with CONFIG_SYSFS_DEPRECATED set?
>
> I think I may have made my warning check a little extra strict.
>   
Yes.

CONFIG_SYSFS_DEPRECATED=y
CONFIG_SYSFS_DEPRECATED_V2=y

Thanks
-Sachin


-- 

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------
