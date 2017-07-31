From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure in the staging tree (Was: kisskb: FAILED
 linux-next/s390-allmodconfig/s390x Mon Jul 31, 17:24)
Date: Mon, 31 Jul 2017 19:35:46 +1000
Message-ID: <20170731193546.6d0538cf@canb.auug.org.au>
References: <20170731072425.1.95853@222023911cb9>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33753 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751910AbdGaJf5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 31 Jul 2017 05:35:57 -0400
In-Reply-To: <20170731072425.1.95853@222023911cb9>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: heiko.carstens@de.ibm.com, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

Hi all,

On Mon, 31 Jul 2017 07:24:25 -0000 noreply@ellerman.id.au wrote:
>
> FAILED linux-next/s390-allmodconfig/s390x Mon Jul 31, 17:24
> 
> http://kisskb.ellerman.id.au/kisskb/buildresult/13110910/
> 
> Commit:   Add linux-next specific files for 20170731
>           742f220ee69c8102eabea45e45d92aa18721fab1
> Compiler: s390x-linux-gcc (GCC) 4.6.3
> 
> Possible errors
> ---------------
> 
> include/linux/msi.h:196:21: fatal error: asm/msi.h: No such file or directory
> make[2]: *** [arch/s390/kernel/asm-offsets.s] Error 1
> make[1]: *** [prepare0] Error 2
> make: *** [sub-make] Error 2

Caused by commit

  03274850279c ("staging: fsl-mc: allow the driver compile multi-arch")

I will revert that commit tomorrow unless it if fixed in the mean time.
-- 
Cheers,
Stephen Rothwell
