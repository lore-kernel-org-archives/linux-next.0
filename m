From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: Removal of GENERIC_GPIO breaks -next
Date: Wed, 17 Apr 2013 22:04:03 +0900
Message-ID: <CAAVeFuL6qAz1OvnxtMj4jCjR3YR8C218+8oAgGRkCaWQJ_-KEg@mail.gmail.com>
References: <CAAVeFu+fM=fJ2zp-gX4T07COMB31yvs74dXUqrw1LH09M7MXLg@mail.gmail.com>
 <516E9083.6050808@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ia0-f169.google.com ([209.85.210.169]:48720 "EHLO
	mail-ia0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965132Ab3DQNEZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 17 Apr 2013 09:04:25 -0400
Received: by mail-ia0-f169.google.com with SMTP id l29so147406iag.0
        for <linux-next@vger.kernel.org>; Wed, 17 Apr 2013 06:04:24 -0700 (PDT)
In-Reply-To: <516E9083.6050808@synopsys.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Shaveta Leekha <shaveta@freescale.com>, Christian Ruppert <christian.ruppert@abilis.com>, linux-next <linux-next@vger.kernel.org>

On Wed, Apr 17, 2013 at 9:07 PM, Vineet Gupta
<Vineet.Gupta1@synopsys.com> wrote:
> On 04/17/2013 04:07 PM, Alexandre Courbot wrote:
>>
>> Also arch/arc/plat-tb10x/Kconfig now defines GENERIC_GPIO, this will
>> not cause breakage but should not be here anymore (ideally removed by
>> the "Remove GENERIC_GPIO config option" patch)
>>
>> Apart from these two issues, things seem to have gone fine, but I'm
>> not sure how they should be addressed and by who?
>
> For the arc issue - I thought we'd come to consensus already. Quoting your earlier
> email:
>
> "If the only reference to GENERIC_GPIO in your architecture or drivers is the
> declaration of this config option, then it is perfectly fine - I will take care of
> removing it when the time is right."
>
> Anyhow it's a minor issue - since your code is in -next, maybe you can add the
> following patch to your branch - rather than routing via my tree - better for
> bisectablity. I compile tested here !

Yes, I am not too worried about arc since it doesn't break anything.
But as you mention it would be better if the whole job could be done
by the same patch. The problem here is the merge order, for me to
address this I need to work after your patches. So maybe in the end my
series should be merged at the end of the merge window, and after all
architecture code is merged, to make sure I can address all instances.

Alex.
