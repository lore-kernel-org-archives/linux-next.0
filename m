From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: linux-next: manual merge of the wireless-drivers-next tree with the wireless-drivers tree
Date: Thu, 26 Apr 2018 13:33:09 +0300
Message-ID: <87a7tq6yvu.fsf@kamboji.qca.qualcomm.com>
References: <20180426110917.446204af@canb.auug.org.au>
        <6f5ba028f120d092bd5c96557144750518faf9c1.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6f5ba028f120d092bd5c96557144750518faf9c1.camel@intel.com>
        (Luciano Coelho's message of "Thu, 26 Apr 2018 10:38:11 +0300")
Sender: linux-kernel-owner@vger.kernel.org
To: Luciano Coelho <luciano.coelho@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Wireless <linux-wireless@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Haim Dreyfuss <haim.dreyfuss@intel.com>, Shaul Triebitz <shaul.triebitz@intel.com>
List-Id: linux-next.vger.kernel.org

Luciano Coelho <luciano.coelho@intel.com> writes:

> On Thu, 2018-04-26 at 11:09 +1000, Stephen Rothwell wrote:
>> Hi all,
>> 
>> Today's linux-next merge of the wireless-drivers-next tree got a
>> conflict in:
>> 
>>   drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.c
>> 
>> between commit:
>> 
>>   77e30e10ee28 ("iwlwifi: mvm: query regdb for wmm rule if needed")
>> 
>> from the wireless-drivers tree and commits:
>> 
>>   9c4f7d512740 ("iwlwifi: move all NVM parsing code to the common
>> files")
>>   4c625c564ba2 ("iwlwifi: get rid of fw/nvm.c")
>> 
>> from the wireless-drivers-next tree.
>> 
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your
>> tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any
>> particularly
>> complex conflicts.
>
> Thanks for resolving this, Stephen!
>
> I checked your resolution and it's spot on.

I now merged w-d to w-d-next to fix this, please check:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-drivers-next.git/commit/?id=0ddcf3e76ae4d02918e609342a1020b50258fadd

I was not sure what to do with these includes so I left them in:

#include "fw/api/commands.h"
#include "fw/api/cmdhdr.h"
#include "fw/img.h"

-- 
Kalle Valo
