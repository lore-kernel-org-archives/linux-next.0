From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the devicetree tree
Date: Wed, 3 May 2017 15:44:33 +1000
Message-ID: <20170503154433.25ea1d10@canb.auug.org.au>
References: <20170428124503.172ce783@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36897 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751476AbdECFoh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 May 2017 01:44:37 -0400
In-Reply-To: <20170428124503.172ce783@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Herring <robherring2@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Frank Rowand <frank.rowand@sony.com>

Hi Rob,

On Fri, 28 Apr 2017 12:45:03 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the devicetree tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/of/unittest.c: In function 'of_unittest':
> drivers/of/unittest.c:2199:25: warning: 'last_sibling' may be used uninitialized in this function [-Wmaybe-uninitialized]
>    last_sibling->sibling = overlay_base_root->child;
>                          ^
> drivers/of/unittest.c:2122:22: note: 'last_sibling' was declared here
>   struct device_node *last_sibling;
>                       ^
> 
> Introduced by commit
> 
>   81d0848fc8d2 ("of: Add unit tests for applying overlays")

Ping?
-- 
Cheers,
Stephen Rothwell
