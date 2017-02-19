From: Corey Minyard <minyard@acm.org>
Subject: Re: linux-next: error fetching the ipmi tree
Date: Sun, 19 Feb 2017 16:26:18 -0600
Message-ID: <1d5ff522-7a88-ff61-bc0c-fff28d6882ae@acm.org>
References: <20150722082946.39366276@canb.auug.org.au>
 <55AED99D.1060405@mvista.com> <20150722110331.2ed76955@canb.auug.org.au>
 <20170220080019.7972746b@canb.auug.org.au>
Reply-To: minyard@acm.org
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:34899 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751362AbdBSW0X (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 19 Feb 2017 17:26:23 -0500
In-Reply-To: <20170220080019.7972746b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Corey Minyard <cminyard@mvista.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 02/19/2017 03:00 PM, Stephen Rothwell wrote:
> Hi Corey,
>
> On Wed, 22 Jul 2015 11:03:31 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> On Tue, 21 Jul 2015 18:45:33 -0500 Corey Minyard <cminyard@mvista.com> wrote:
>>> On 07/21/2015 05:29 PM, Stephen Rothwell wrote:
>>>> While fetching the ipmi tree
>>>> (git://git.code.sf.net/p/openipmi/linux-ipmi#for-next), I get this
>>>> error:
>>>>
>>>> fatal: unable to connect to git.code.sf.net:
>>>> git.code.sf.net[0: 216.34.181.155]: errno=Connection refused
>>>>
>>>> I have been getting this for a few days now.  The http and https URLs
>>>> don't work either (for me in Firefox).
>>> Looks like sourceforge had a serious outage on the 18th and are still
>>> working on restoring it. http://sourceforge.net/blog/category/sitestatus/
>>>
>>> Would you like me to move this someplace else?
>> Its not a real problem as long as you don't have any updates for the
>> tree before SF restore things.
> OK, it looks like SourceForge is out again:
>
> $ git fetch ipmi
> fatal: unable to connect to git.code.sf.net:
> git.code.sf.net[0: 216.34.181.155]: errno=Connection refused
>
> It might be worth considering moving to git.kernel.org if possible and
> not too much effort.
>
Dang, I was hoping SourceForge had cleaned up their act.  I can ask for 
an account on
kernel.org, but I'm not sure I will be able to get one.

I'm in the process of moving userland things I support to github, which 
seems more
stable than SourceForge.  Would that be better?

-corey
