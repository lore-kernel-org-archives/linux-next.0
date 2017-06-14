From: Mason <slash.tmp@free.fr>
Subject: Re: linux-next: build failure after merge of the arm tree
Date: Wed, 14 Jun 2017 21:23:07 +0200
Message-ID: <b5189473-bfdd-4e4e-711f-0f48ac9da5c8@free.fr>
References: <20170421084033.5c987e13@canb.auug.org.au>
 <9858a4ed-bdd9-bd6c-d8a4-e9e6bd539904@free.fr>
 <20170421181230.05dcf937@canb.auug.org.au>
 <20170421234315.GO17774@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp2-g21.free.fr ([212.27.42.2]:33147 "EHLO smtp2-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751714AbdFNTXn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Jun 2017 15:23:43 -0400
In-Reply-To: <20170421234315.GO17774@n2100.armlinux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@armlinux.org.uk>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, arm-soc <arm@kernel.org>, Emilio Lopez <emilio.lopez@collabora.co.uk>, dmaengine@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>

On 22/04/2017 01:43, Russell King - ARM Linux wrote:
> On Fri, Apr 21, 2017 at 06:12:30PM +1000, Stephen Rothwell wrote:
>> Hi Mason,
>>
>> On Fri, 21 Apr 2017 09:58:58 +0200 Mason <slash.tmp@free.fr> wrote:
>>>
>>> Anyway, the fix is trivial.
>>>
>>> The "pchans_used" field is an unsigned long array.
>>> for_each_clear_bit_from() expects an unsigned long pointer,
>>> not an array address.
>>>
>>> I'll send a patch to the drivers/dma maintainers.
>>
>> The fix really needs to go into the arm tree (as well?) since that is
>> the tree that has the patch that causes the build to break (even if the
>> actual bug was preexisting).
> 
> Or I drop the offending patch (done) and we get the DMA subsystem fixed
> first.  Given how long it's been this way, I doubt there's any hurry to
> get this change in for the next merge window.

Hello Russell,

Is it safe to apply the patch now?
http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=8679/1

Regards.
