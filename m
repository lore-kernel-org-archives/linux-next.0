From: Borislav Petkov <bp@amd64.org>
Subject: Re: linux-next: manual merge of the i7300_edac tree with Linus' tree
Date: Mon, 8 Aug 2011 09:24:19 +0200
Message-ID: <20110808072419.GB15180@aftab>
References: <20110808134808.263962c573bcffac2e28a003@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from s15228384.onlinehome-server.info ([87.106.30.177]:58392 "EHLO
	mail.x86-64.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751583Ab1HHHYZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 8 Aug 2011 03:24:25 -0400
Content-Disposition: inline
In-Reply-To: <20110808134808.263962c573bcffac2e28a003@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mauro Carvalho Chehab <mchehab@redhat.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hidetoshi Seto <seto.hidetoshi@jp.fujitsu.com>

On Sun, Aug 07, 2011 at 11:48:08PM -0400, Stephen Rothwell wrote:
> Hi Mauro,
> 
> Today's linux-next merge of the i7300_edac tree got a conflict in
> arch/x86/kernel/cpu/mcheck/mce.c between commit b77e70bf3535 ("x86, mce:
> Replace MCE_SELF_VECTOR by irq_work") from Linus' tree and commit
> cd90cc84c6bf ("i7core_edac: Drop the edac_mce facility") from the
> i7300_edac tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc arch/x86/kernel/cpu/mcheck/mce.c
> index 08363b0,9c03d98..0000000
> --- a/arch/x86/kernel/cpu/mcheck/mce.c
> +++ b/arch/x86/kernel/cpu/mcheck/mce.c
> @@@ -36,10 -37,12 +36,9 @@@
>   #include <linux/fs.h>
>   #include <linux/mm.h>
>   #include <linux/debugfs.h>
> - #include <linux/edac_mce.h>
>  +#include <linux/irq_work.h>

Yeah, that looks ok.

Thanks Stephen.

-- 
Regards/Gruss,
Boris.

Advanced Micro Devices GmbH
Einsteinring 24, 85609 Dornach
GM: Alberto Bozzo
Reg: Dornach, Landkreis Muenchen
HRB Nr. 43632 WEEE Registernr: 129 19551
