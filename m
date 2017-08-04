From: Lars Persson <lars.persson@axis.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the crypto tree
Date: Fri, 4 Aug 2017 11:48:55 +0200
Message-ID: <357d39d7-a33c-d5e1-31f6-456fba191482@axis.com>
References: <20170804075022.02c9ce09@canb.auug.org.au>
 <20170804012955.GA15200@gondor.apana.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bastet.se.axis.com ([195.60.68.11]:52116 "EHLO
        bastet.se.axis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751864AbdHDJtC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 4 Aug 2017 05:49:02 -0400
In-Reply-To: <20170804012955.GA15200@gondor.apana.org.au>
Content-Language: sv
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rabin Vincent <rabinv@axis.com>, Lars Persson <larper@axis.com>



On 08/04/2017 03:29 AM, Herbert Xu wrote:
> On Fri, Aug 04, 2017 at 07:50:22AM +1000, Stephen Rothwell wrote:
>> Hi all,
>>
>> Commit
>>
>>    9577212cc0e2 ("crypto: hash - add crypto_(un)register_ahashes()")
>>
>> is missing a Signed-off-by from its author.
> 
> OK, I've backed out the patches in question.  Please resubmit
> with a sign-off.  Thanks!
> 

Sorry for missing this. We fixed it in patch set v3.

BR,
  Lars Persson
