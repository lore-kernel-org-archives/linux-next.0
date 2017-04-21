From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the arm tree
Date: Fri, 21 Apr 2017 18:12:30 +1000
Message-ID: <20170421181230.05dcf937@canb.auug.org.au>
References: <20170421084033.5c987e13@canb.auug.org.au>
        <9858a4ed-bdd9-bd6c-d8a4-e9e6bd539904@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52647 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1032187AbdDUIMe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 21 Apr 2017 04:12:34 -0400
In-Reply-To: <9858a4ed-bdd9-bd6c-d8a4-e9e6bd539904@free.fr>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mason <slash.tmp@free.fr>
Cc: Russell King <rmk@armlinux.org.uk>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, arm-soc <arm@kernel.org>, Emilio Lopez <emilio.lopez@collabora.co.uk>, dmaengine@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>

Hi Mason,

On Fri, 21 Apr 2017 09:58:58 +0200 Mason <slash.tmp@free.fr> wrote:
>
> Anyway, the fix is trivial.
> 
> The "pchans_used" field is an unsigned long array.
> for_each_clear_bit_from() expects an unsigned long pointer,
> not an array address.
> 
> I'll send a patch to the drivers/dma maintainers.

The fix really needs to go into the arm tree (as well?) since that is
the tree that has the patch that causes the build to break (even if the
actual bug was preexisting).

-- 
Cheers,
Stephen Rothwell
