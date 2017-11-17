From: Zhangshaokun <zhangshaokun@hisilicon.com>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Date: Fri, 17 Nov 2017 17:36:44 +0800
Message-ID: <24a5b70c-aac4-29b5-6a4d-38ac3d10d475@hisilicon.com>
References: <20171113164206.187a790d@canb.auug.org.au>
 <20171113080955.zcdzx2p5kzoa4d7s@dhcp22.suse.cz>
 <CAK8P3a36vx6fnXz=QWxqpCb3TC2XZeKLe3Or7Wvrac5=C3RaxA@mail.gmail.com>
 <20171117094439.5287c715@canb.auug.org.au>
 <20171117145320.714972ca@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from szxga05-in.huawei.com ([45.249.212.191]:11007 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751161AbdKQJhn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Nov 2017 04:37:43 -0500
In-Reply-To: <20171117145320.714972ca@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Michal Hocko <mhocko@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi,

On 2017/11/17 11:53, Stephen Rothwell wrote:
> Hi all,
> 
> On Fri, 17 Nov 2017 09:44:39 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> On Mon, 13 Nov 2017 12:43:08 +0100 Arnd Bergmann <arnd@arndb.de> wrote:
>>>
>>> On Mon, Nov 13, 2017 at 9:09 AM, Michal Hocko <mhocko@kernel.org> wrote:  
>>>> On Mon 13-11-17 16:42:06, Stephen Rothwell wrote:    
>>>>>
>>>>> After merging the akpm-current tree, today's linux-next build (powerpc
>>>>> ppc64_defconfig) produced this warning:
>>>>>
>>>>> In file included from include/linux/mmzone.h:17:0,
>>>>>                  from include/linux/mempolicy.h:10,
>>>>>                  from mm/mempolicy.c:70:
>>>>> mm/mempolicy.c: In function 'mpol_to_str':
>>>>> include/linux/nodemask.h:107:41: warning: the address of 'nodes' will always evaluate as 'true' [-Waddress]
>>>>>  #define nodemask_pr_args(maskp) (maskp) ? MAX_NUMNODES : 0, (maskp) ? (maskp)->bits : NULL
>>>>>                                          ^
>>>>> mm/mempolicy.c:2817:11: note: in expansion of macro 'nodemask_pr_args'
>>>>>            nodemask_pr_args(&nodes));
>>>>>            ^    
>>>>
>>>> Hmm, this warning is quite surprising to me. Sure in this particular
>>>> case maskp will always be non-NULL so we always expand to
>>>>         MAX_NUMNODES, maskp->bits
>>>> which is what we want. But we have other users which may be NULL. Does
>>>> anybody understan why this warns at all?    
>>>
>>> As I understand it, the warning tries to address a common typo of accidentally
>>> testing the pointer to a stack object for being non-NULL, rather than the object
>>> pointed to for being non-zero.
>>>
>>> Adding an extra '!= NULL' comparison gets rid of the warning for me:
>>>
>>> #define nodemask_pr_args(maskp)  \
>>>    ((maskp) != NULL) ? MAX_NUMNODES : 0, \
>>>    ((maskp) != NULL) ?(maskp)->bits : NULL
>>>
>>>        Arnd  
>>
>> This warning now exists in Linus' tree :-(
> 
> Looking closer, it seems that the above workaround doesn't work for my
> compiler (gcc v5.2.0):
> 

I also came across this issue using Linus' tree and my gcc is gcc version 5.4.0 20160609
 (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.5).

  CC      drivers/clk/renesas/rcar-gen3-cpg.o
In file included from ./include/linux/mmzone.h:17:0,
                 from ./include/linux/mempolicy.h:10,
                 from mm/mempolicy.c:70:
mm/mempolicy.c: In function ‘mpol_to_str’:
./include/linux/nodemask.h:108:11: warning: the comparison will always evaluate as ‘true’ for the address of ‘nodes’ will never be NULL [-Waddress]
  ((maskp) != NULL) ? MAX_NUMNODES : 0,  \
           ^
mm/mempolicy.c:2817:11: note: in expansion of macro ‘nodemask_pr_args’
           nodemask_pr_args(&nodes));
           ^
./include/linux/nodemask.h:109:11: warning: the comparison will always evaluate as ‘true’ for the address of ‘nodes’ will never be NULL [-Waddress]
  ((maskp) != NULL) ? (maskp)->bits : NULL
           ^
mm/mempolicy.c:2817:11: note: in expansion of macro ‘nodemask_pr_args’
           nodemask_pr_args(&nodes));
           ^
  CC      drivers/clk/renesas/renesas-cpg-mssr.o

Thanks,
Shaokun

> In file included from include/linux/mmzone.h:17:0,
>                  from include/linux/mempolicy.h:10,
>                  from mm/mempolicy.c:70:
> mm/mempolicy.c: In function 'mpol_to_str':
> include/linux/nodemask.h:108:11: warning: the comparison will always evaluate as 'true' for the address of 'nodes' will never be NULL [-Waddress]
>   ((maskp) != NULL) ? MAX_NUMNODES : 0,  \
>            ^
> mm/mempolicy.c:2817:11: note: in expansion of macro 'nodemask_pr_args'
>            nodemask_pr_args(&nodes));
>            ^
> include/linux/nodemask.h:109:11: warning: the comparison will always evaluate as 'true' for the address of 'nodes' will never be NULL [-Waddress]
>   ((maskp) != NULL) ? (maskp)->bits : NULL
>            ^
> mm/mempolicy.c:2817:11: note: in expansion of macro 'nodemask_pr_args'
>            nodemask_pr_args(&nodes));
>            ^
> 
