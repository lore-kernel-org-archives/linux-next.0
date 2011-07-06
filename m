From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: linux-next: manual merge of the rr tree with the  tree
Date: Thu, 7 Jul 2011 09:44:51 +1000
Message-ID: <4E14F373.1020307@snapgear.com>
References: <20110705135932.de7f0526.sfr@canb.auug.org.au> <1309967847.3393.44.camel@jerome>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1309967847.3393.44.camel@jerome>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jonas Bonn <jonas@southpole.se>, Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: linux-next.vger.kernel.org

On 07/07/11 01:57, Jonas Bonn wrote:
>
> On Tue, 2011-07-05 at 13:59 +1000, Stephen Rothwell wrote:
>> Hi Rusty,
>>
>> Today's linux-next merge of the rr tree got a conflict in
>> arch/m68k/kernel/module_mm.c arch/m68k/kernel/module_no.c between commit
>> 4528acce2607 ("m68k: merge the non-mmu and mmu versions of module.c")
>> from the m68knommu tree and commit 7b935befe6bc ("modules: make arch's
>> use default loader hooks") from the rr tree.
>>
>> The former removes these files, so I did that.
>>
>> I then added this merge fix up patch (which I can carry as necessary and
>> may not be coorrect):
>>
>> From: Stephen Rothwell<sfr@canb.auug.org.au>
>> Date: Tue, 5 Jul 2011 13:12:26 +1000
>> Subject: [PATCH] modules/m68k: make arch's use default loader hooks
>>
>> Signed-off-by: Stephen Rothwell<sfr@canb.auug.org.au>
>> ---
>>   arch/m68k/kernel/module.c |   27 ---------------------------
>>   1 files changed, 0 insertions(+), 27 deletions(-)
>>
>
> That patch looks good to me.
>
> Acked-by: Jonas Bonn<jonas@southpole.se>

Looks fine to me too:

Acked-by: Greg Ungerer <gerg@uclinux.org>

Thanks
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
