From: Mason <slash.tmp@free.fr>
Subject: Re: linux-next: build failure after merge of the arm tree
Date: Fri, 21 Apr 2017 10:30:11 +0200
Message-ID: <216e8509-e7e8-5a5c-918c-a1a6e0e5285d@free.fr>
References: <20170421084033.5c987e13@canb.auug.org.au>
 <9858a4ed-bdd9-bd6c-d8a4-e9e6bd539904@free.fr>
 <20170421181230.05dcf937@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170421181230.05dcf937@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Russell King <rmk@armlinux.org.uk>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, arm-soc <arm@kernel.org>, Emilio Lopez <emilio@elopez.com.ar>, dmaengine@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>
List-Id: linux-next.vger.kernel.org

On 21/04/2017 10:12, Stephen Rothwell wrote:

> Mason wrote:
>
>> Anyway, the fix is trivial.
>>
>> The "pchans_used" field is an unsigned long array.
>> for_each_clear_bit_from() expects an unsigned long pointer,
>> not an array address.
>>
>> I'll send a patch to the drivers/dma maintainers.
> 
> The fix really needs to go into the arm tree (as well?) since that is
> the tree that has the patch that causes the build to break (even if the
> actual bug was preexisting).

Hello Stephen,

Since it's a trivial patch, and since Vinod is on vacation
until Monday, I suppose Russell could push the patch through
his own tree? (Maybe after an ACK from a sunxi maintainer.)

I am currently building an allyesconfig next-20170420 kernel.
Considering the speed of this system, this will take a while.

Regards.
