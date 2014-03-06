From: Arend van Spriel <arend@broadcom.com>
Subject: Re: linux-next: build failure after merge of the wireless-next tree
Date: Thu, 6 Mar 2014 09:53:58 +0100
Message-ID: <531837A6.8090406@broadcom.com>
References: <20140306134332.0c3f12ec6849d1b2ccefda6e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140306134332.0c3f12ec6849d1b2ccefda6e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hante Meuleman <meuleman@broadcom.com>
List-Id: linux-next.vger.kernel.org

On 03/06/2014 03:43 AM, Stephen Rothwell wrote:
> Hi John,
> 
> After merging the wireless-next tree, today's linux-next build
> (arm multi_v7_defconfig) failed like this:
> 
> drivers/net/wireless/brcm80211/brcmfmac/dhd_sdio.c: In function
> 'brcmf_sdio_intr_rstatus': 
> drivers/net/wireless/brcm80211/brcmfmac/dhd_sdio.c:2464:3: error:
> implicit declaration of function 'atomic_set_mask'
> [-Werror=implicit-function-declaration]
> 
> Caused by commit c98db0bec72a ("brcmfmac: Use atomic functions for 
> intstatus update").  Arm does not seem to provide
> atomic_set_mask()?
> 
> I reverted that commit for today.

That is fine. The kbuild robot also found issue with this function on
other archs. I must say I am surprised as this code fragment in
asm-generic/atomic.h suggests it is needed for SMP to work (?):

 20 #ifdef CONFIG_SMP
 21 /* Force people to define core atomics */
 22 # if !defined(atomic_add_return) || !defined(atomic_sub_return) || \
 23      !defined(atomic_clear_mask) || !defined(atomic_set_mask)
 24 #  error "SMP requires a little arch-specific magic"
 25 # endif
 26 #endif

Maybe this requirement is no longer valid. Anyway. I will sent revert
patch and replacement to John.

Thanks,
Arend
