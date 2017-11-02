From: Jessica Yu <jeyu@kernel.org>
Subject: Re: linux-next: manual merge of the ipmi tree with the modules tree
Date: Thu, 2 Nov 2017 17:58:14 +0100
Message-ID: <20171102165813.mfeo35s5rscspdtz@redbean>
References: <20171102145808.5bb97c3a@canb.auug.org.au>
 <16c92e03-98b8-3121-cdd8-2e6371451724@acm.org>
 <20171102142722.xletcv3hip3x7qmc@redbean>
 <6646da34-6d1e-687d-52e9-b7d65259ce4b@acm.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:41128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751587AbdKBQ6T (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 2 Nov 2017 12:58:19 -0400
Content-Disposition: inline
In-Reply-To: <6646da34-6d1e-687d-52e9-b7d65259ce4b@acm.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Corey Minyard <minyard@acm.org>
Cc: Corey Minyard <cminyard@mvista.com>, Kees Cook <keescook@chromium.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

+++ Corey Minyard [02/11/17 11:40 -0500]:
>On 11/02/2017 09:27 AM, Jessica Yu wrote:
>>+++ Corey Minyard [02/11/17 08:31 -0500]:
>>>On 11/01/2017 10:58 PM, Stephen Rothwell wrote:
>>>>Hi Corey,
>>>>
>>>>Today's linux-next merge of the ipmi tree got a conflict in:
>>>>
>>>>  drivers/char/ipmi/ipmi_si_intf.c
>>>>
>>>>between commit:
>>>>
>>>>  e4dca7b7aa08 ("treewide: Fix function prototypes for 
>>>>module_param_call()")
>>>>
>>>>from the modules tree and commit:
>>>>
>>>>  44814ec982d2 ("ipmi_si: Move the hotmod handling to another file.")
>>>>
>>>>from the ipmi tree.
>>>
>>>Thanks Stephen.
>>>
>>>Kees, do you have a tree I can merge so we can avoid this going 
>>>upstream?
>>
>>Hi Corey,
>>
>>the modules-next tree (with the conflicting commit) is found here:
>>git://git.kernel.org/pub/scm/linux/kernel/git/jeyu/linux.git#modules-next
>>
>
>Hi Jessica,
>
>I merged this into the ipmi for-next tree, so we should be good now,
>assuming I did this right.

Thanks Corey!

Jessica
