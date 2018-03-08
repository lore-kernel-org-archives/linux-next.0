From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: manual merge of the mfd tree with Linus' tree
Date: Thu, 8 Mar 2018 08:12:15 +0000
Message-ID: <20180308081215.n2m6hixmpfhpgn6f@dell>
References: <20180308123331.36eab22c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180308123331.36eab22c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Baolin Wang <baolin.wang@linaro.org>, Mark Brown <broonie@kernel.org>, David Lechner <david@lechnology.com>
List-Id: linux-next.vger.kernel.org

On Thu, 08 Mar 2018, Stephen Rothwell wrote:

> Hi Lee,
> 
> Today's linux-next merge of the mfd tree got a conflict in:
> 
>   drivers/mfd/syscon.c
> 
> between commit:
> 
>   3bafc09e7797 ("mfd: syscon: Add hardware spinlock support")
> 
> from Linus' tree and commit:
> 
>   34c90dcce6b1 ("mfd: syscon: Set regmap name to DT node name")
> 
> from the mfd tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Now fixed in my tree.  You may withdraw your patch.

Thanks Stephen.

-- 
Lee Jones
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
