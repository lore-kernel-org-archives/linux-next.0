From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for March 24 (staging/vt66*)
Date: Thu, 25 Mar 2010 08:38:10 -0700
Message-ID: <4BAB8362.7030005@oracle.com>
References: <20100324161746.85edc5a3.sfr@canb.auug.org.au> <4BAA6B88.2080803@oracle.com> <20100325130003.GB24056@alittletooquiet.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:53283 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755052Ab0CYPic (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 25 Mar 2010 11:38:32 -0400
In-Reply-To: <20100325130003.GB24056@alittletooquiet.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Forest Bond <forest@alittletooquiet.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, devel@driverdev.osuosl.org, Greg KH <gregkh@suse.de>

On 03/25/10 06:00, Forest Bond wrote:
> Hi,
> 
> On Wed, Mar 24, 2010 at 12:44:08PM -0700, Randy Dunlap wrote:
>> On 03/23/10 22:17, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20100323:
>>
>>
>>
>> (.text+0x5d140): multiple definition of `hostap_set_hostapd'
>> (.text+0x5ccab): multiple definition of `hostap_ioctl'
>>
>> when
>> CONFIG_HOSTAP=y
>> and
>> CONFIG_VT665[56]=y
>>
>> or just both of the latter are =y.
> 
> Is there any way to limit CONFIG_VT665[56] to ("n", "m")?  That would be
> sufficient as a work-around, right?

A driver can be limited to [nm] by adding:
	depends on m

> Or is it preferable to rename the offending functions?

Yes, it's preferable to rename them.

-- 
~Randy
