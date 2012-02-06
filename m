From: Huang Changming-R66093 <r66093@freescale.com>
Subject: RE: linux-next: build failure after merge of the final tree (mmc
 tree related)
Date: Mon, 6 Feb 2012 04:50:03 +0000
Message-ID: <110EED8CC96DFC488B7E717A2027A27C01B3F2@039-SN1MPN1-002.039d.mgd.msft.net>
References: <20120206153916.48adb1f48711f665274909b7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120206153916.48adb1f48711f665274909b7@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Chris Ball <cjb@laptop.org>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jiang Yutang-B14898 <B14898@freescale.com>, Anton Vorontsov <cbouatmailru@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi, 
Chris' patch which defined the "platform_suspend" is needed.

> -----Original Message-----
> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> Sent: Monday, February 06, 2012 12:39 PM
> To: Chris Ball
> Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Huang
> Changming-R66093; Jiang Yutang-B14898; Anton Vorontsov
> Subject: linux-next: build failure after merge of the final tree (mmc
> tree related)
> 
> Hi all,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/mmc/host/sdhci-of-esdhc.c:143:2: error: unknown field
> 'platform_suspend' specified in initializer
> drivers/mmc/host/sdhci-of-esdhc.c:143:2: warning: initialization from
> incompatible pointer type [enabled by default]
> drivers/mmc/host/sdhci-of-esdhc.c:143:2: warning: (near initialization
> for 'sdhci_esdhc_ops.get_timeout_clock') [enabled by default]
> drivers/mmc/host/sdhci-of-esdhc.c:144:2: error: unknown field
> 'platform_resume' specified in initializer
> drivers/mmc/host/sdhci-of-esdhc.c:144:2: warning: initialization from
> incompatible pointer type [enabled by default]
> drivers/mmc/host/sdhci-of-esdhc.c:144:2: warning: (near initialization
> for 'sdhci_esdhc_ops.platform_8bit_width') [enabled by default]
> 
> Caused by commit 4f6eeb41eee9 ("mmc: esdhc: Implement power management
> for ESDHC").  I can't see how that was ever even build tested ..
> 
> I have reverted that commit for today.
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
