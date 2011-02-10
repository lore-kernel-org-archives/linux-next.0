From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: linux-next: manual merge of the tty tree with the m68knommu tree
Date: Fri, 11 Feb 2011 07:04:37 +1000
Message-ID: <4D5452E5.9080304@snapgear.com>
References: <20110210162914.eec2f4b5.sfr@canb.auug.org.au> <20110210185115.GB15944@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:34402 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757011Ab1BJVI1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 Feb 2011 16:08:27 -0500
In-Reply-To: <20110210185115.GB15944@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>, Tejun Heo <tj@kernel.org>

On 11/02/11 04:51, Greg KH wrote:
> On Thu, Feb 10, 2011 at 04:29:14PM +1100, Stephen Rothwell wrote:
>> Hi Greg,
>>
>> Today's linux-next merge of the tty tree got a conflict in
>> drivers/tty/serial/68328serial.c between commit
>> abf67e214f867d16df6a9c4ac7d8fc0b98ebad97 ("m68knommu: fix derefernce of
>> port.tty") from the m68knommu tree and commit
>> f094298bae5f5d0e1cb3bff4621aae7ef486812a ("68328serial: remove unsed
>> m68k_serial->tqueue_hangup") from the tty tree.
>>
>> I just used the latter since it removed some of the code modified by the
>> former.
>
> Sounds fine, thanks.

The fix in commit abf67e214f867d16df6a9c4ac7d8fc0b98ebad97 ("m68knommu:
fix derefernce of port.tty") are needed to get that file to compile.
So I will be sending that to Linus for 2.6.38 (ie very soon).

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
