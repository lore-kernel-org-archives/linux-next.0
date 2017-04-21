From: "santosh.shilimkar@oracle.com" <santosh.shilimkar@oracle.com>
Subject: Re: linux-next: manual merge of the pm tree with the arm-soc tree
Date: Thu, 20 Apr 2017 23:39:11 -0700
Message-ID: <4b58d5ab-c924-97af-728f-b9f524e62a53@oracle.com>
References: <20170421105405.6a690b35@canb.auug.org.au>
 <CAK8P3a3kHO1NZFJXvDwWO625aEmXoo2540FRKe+YYzoYE9NCSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:37044 "EHLO
        aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1035757AbdDUGj5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 21 Apr 2017 02:39:57 -0400
In-Reply-To: <CAK8P3a3kHO1NZFJXvDwWO625aEmXoo2540FRKe+YYzoYE9NCSg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Olof Johansson <olof@lixom.net>, ARM <linux-arm-kernel@lists.infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Gerlach <d-gerlach@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Nishanth Menon <nm@ti.com>

On 4/20/17 10:53 PM, Arnd Bergmann wrote:
> On Fri, Apr 21, 2017 at 2:54 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Hi all,
>>
>> Today's linux-next merge of the pm tree got a conflict in:
>>
>>   include/dt-bindings/genpd/k2g.h
>>
>> between commit:
>>
>>   7cc119f29b19 ("dt-bindings: Add TI SCI PM Domains")
>>
>> from the arm-soc tree and commit:
>>
>>   45da8edd1741 ("dt-bindings: Add TI SCI PM Domains")
>>
>> from the pm tree.
>>
>> I fixed it up (I just used the pm tree version) and can carry the fix as
>> necessary. This is now fixed as far as linux-next is concerned, but any
>> non trivial conflicts should be mentioned to your upstream maintainer
>> when your tree is submitted for merging.  You may also want to consider
>> cooperating with the maintainer of the conflicting tree to minimise any
>> particularly complex conflicts.
>
> Dave, Santosh,
>
> any idea what happened here? It seems that we picked up the wrong
> version of the tree, do we need to drop this from arm-soc?
>
Nope. Its because this series was in my 'next' branch for a week or
so and now it made it via arm-soc tree next as well.

I just cleaned up my next head so it linux-next next tag should have
only arm-soc copy.

Regards,
Santosh
