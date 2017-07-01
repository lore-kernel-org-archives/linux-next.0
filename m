From: Darren Hart <dvhart@infradead.org>
Subject: Re: linux-next: build warning after merge of the drivers-x86 tree
Date: Fri, 30 Jun 2017 20:32:06 -0700
Message-ID: <20170701033206.GB24772@fury>
References: <20170630140054.38f98968@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:56326 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751657AbdGADcJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 30 Jun 2017 23:32:09 -0400
Content-Disposition: inline
In-Reply-To: <20170630140054.38f98968@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arvind Yadav <arvind.yadav.cs@gmail.com>

On Fri, Jun 30, 2017 at 02:00:54PM +1000, Stephen Rothwell wrote:
> Hi Darren,
> 
> After merging the drivers-x86 tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/platform/x86/sony-laptop.c: In function 'sony_laptop_setup_input':
> drivers/platform/x86/sony-laptop.c:494:19: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-array-qualifiers]
>   key_dev->keycode = &sony_laptop_input_keycode_map;
>                    ^
> 
> Introduced by commit
> 
>   a0f0a5e1978b ("platform/x86: sony-laptop: constify few static structures")

Apologies, and thanks for the catch. Rolled the fix from Arnd together with this
and the new one from Arvind. for-next had to be rebased to avoid introducing
this error into mainline.

-- 
Darren Hart
VMware Open Source Technology Center
