From: Mason <slash.tmp@free.fr>
Subject: Re: linux-next: build failure after merge of the arm tree
Date: Fri, 21 Apr 2017 13:27:27 +0200
Message-ID: <935aedd3-b80e-dd2a-150e-84af1115539d@free.fr>
References: <20170421084033.5c987e13@canb.auug.org.au>
 <9858a4ed-bdd9-bd6c-d8a4-e9e6bd539904@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9858a4ed-bdd9-bd6c-d8a4-e9e6bd539904@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Russell King <rmk@armlinux.org.uk>
Cc: linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, arm-soc <arm@kernel.org>, dmaengine@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>
List-Id: linux-next.vger.kernel.org

On 21/04/2017 09:58, Mason wrote:

> Weird that I didn't catch this when I ran make allyesconfig.

Doh! make allyesconfig builds for BE systems.

CONFIG_CPU_BIG_ENDIAN=y
CONFIG_CPU_ENDIAN_BE8=y

But the patch I originally tested with only updated the LE bitops.

With the complete patch, I didn't see any build issues, other than
drivers/dma/sun4i-dma.c

Regards.
