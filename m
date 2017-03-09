From: Corey Minyard <tcminyard@gmail.com>
Subject: Re: linux-next: error fetching the ipmi tree
Date: Thu, 9 Mar 2017 15:41:47 -0600
Message-ID: <26148384-6fcb-0805-4d40-cce050ce8914@gmail.com>
References: <20150722082946.39366276@canb.auug.org.au>
 <55AED99D.1060405@mvista.com> <20150722110331.2ed76955@canb.auug.org.au>
 <20170220080019.7972746b@canb.auug.org.au>
 <1d5ff522-7a88-ff61-bc0c-fff28d6882ae@acm.org>
 <20170220103301.24f1ac6c@canb.auug.org.au>
Reply-To: minyard@acm.org
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:35359 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751619AbdCIVlv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Mar 2017 16:41:51 -0500
In-Reply-To: <20170220103301.24f1ac6c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Corey Minyard <minyard@acm.org>
Cc: Corey Minyard <cminyard@mvista.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 02/19/2017 05:33 PM, Stephen Rothwell wrote:
> Hi Corey,
>
> On Sun, 19 Feb 2017 16:26:18 -0600 Corey Minyard <minyard@acm.org> wrote:
>> Dang, I was hoping SourceForge had cleaned up their act.  I can ask for
>> an account on
>> kernel.org, but I'm not sure I will be able to get one.
> Yeah, you need a well signed GPG key ...
>
>> I'm in the process of moving userland things I support to github, which
>> seems more
>> stable than SourceForge.  Would that be better?
> Probably better than SourceForge :-)  Keep in mind that Linus requires
> signed tags for pulls from basically anywhere besides kernel.org.
>
Ok, I've moved over to:

   https://github.com/cminyard/linux-ipmi.git  for-next

for now.  I have created a new GPG key, when I get a chance to get 
signatures
(probably not until Plumbers) I will attempt to move over to kernel.org.

Thank you,

-corey
