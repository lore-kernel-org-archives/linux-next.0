From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the arc-current
 tree
Date: Wed, 30 Aug 2017 09:11:54 -0700
Message-ID: <de35cfab-e727-f35f-fd41-4e553e696de2@synopsys.com>
References: <20170829082325.2fb5aaa9@canb.auug.org.au>
 <6c1f0464-92a1-7845-5de5-68e0a906675c@synopsys.com>
 <20170830225905.4ddb08c8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtprelay.synopsys.com ([198.182.60.111]:41134 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751456AbdH3QMB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Aug 2017 12:12:01 -0400
In-Reply-To: <20170830225905.4ddb08c8@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 08/30/2017 05:59 AM, Stephen Rothwell wrote:
> Hi Vineet,
>
> On Mon, 28 Aug 2017 15:28:32 -0700 Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
>> On 08/28/2017 03:23 PM, Stephen Rothwell wrote:
>>> Commit
>>>
>>>     279921e080b9 ("ARCv2: SLC: provide a line based flush routine for debugging")
>>>
>>> is missing a Signed-off-by from its author and committer.
>>>   
>> /me slaps myself. Fixed/pushed now.
> slap again :-)

:-(

> You seem to have republished the old branch. :-(

I recently switched to a workflow where I push from 2 trees hence these SNAFUs.
Sorry for the trouble.

-Vineet
