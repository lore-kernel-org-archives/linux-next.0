From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: linux-next: manual merge of the m68knommu tree with the m68k
 tree
Date: Wed, 9 Nov 2011 17:08:09 +1000
Message-ID: <4EBA26D9.3050108@snapgear.com>
References: <20111109111519.7d8969103ab32e7e8193c018@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20111109111519.7d8969103ab32e7e8193c018@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On 11/09/2011 10:15 AM, Stephen Rothwell wrote:
> Today's linux-next merge of the m68knommu tree got a conflict in
> arch/m68k/Kconfig between commit d890d7399525 ("m68k/irq: Remove obsolete
> m68k irq framework") from the m68k tree and commit 4e8a9e70dfe8 ("m68k:
> selection of GENERIC_ATOMIC64 is not MMU specific") from the m68knommu
> tree.
>
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Thanks. Both this and the previous m68k merge conflict patch look good.

Geert: would you prefer I hold off on these 2 patches until after
you merge your IRQ changes?

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close,                            FAX:         +61 7 3891 3630
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
