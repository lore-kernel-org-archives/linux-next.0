From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: linux-next: manual merge of the m68knommu tree with Linus' treee
Date: Wed, 21 Jan 2009 10:59:24 +1000
Message-ID: <4976736C.1060009@snapgear.com>
References: <20090120105551.a01eb74f.sfr@canb.auug.org.au> <497519A8.3020706@snapgear.com> <20090120070609.GA16511@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rex.securecomputing.com ([203.24.151.4]:60530 "EHLO
	cyberguard.com.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1757651AbZAUA71 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 20 Jan 2009 19:59:27 -0500
In-Reply-To: <20090120070609.GA16511@uranus.ravnborg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Harvey Harrison <harvey.harrison@gmail.com>

Hi Sam,

Sam Ravnborg wrote:
> On Tue, Jan 20, 2009 at 10:24:08AM +1000, Greg Ungerer wrote:
>> Hi Stephen,
>>
>> Stephen Rothwell wrote:
>>> Today's linux-next merge of the m68knommu tree got a conflict in
>>> arch/m68knommu/include/asm/Kbuild between commit
>>> 74d96f018673759d04d032c137d132f6447bfb1e ("byteorder: make swab.h include
>>> asm/swab.h like a regular header") from Linus' tree and commit
>>> 49148020bcb6910ce71417bd990a5ce7017f9bd3 ("m68k,m68knommu: merge header
>>> files") from the m68knommu tree.
>>>
>>> The latter removed the file and the former removed a line from it.  So I
>>> just removed the file.  I can keep doing that or you could do a merge
>>> with Linus' tree.
>> The current thinking was to merge this with Linus' tree as quick
>> as possible. But at the very least that will have to wait till he
>> gets back from LCA.
> 
> Just try to push it to Linus. He may very well take it depite
> having fun at LCA.
> It is:
>  - only touching m68k and m68knommu
>  - he is usual quick to take the header move patches
>  - it removes more lines than it add (IIRC)

Pull request sent. Lets see what happens.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear, a McAfee Company                  PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
