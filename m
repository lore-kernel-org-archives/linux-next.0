From: Lee Jones <lee.jones@linaro.org>
Subject: Re: linux-next: build warning after merge of the mfd tree
Date: Tue, 5 Jun 2018 07:55:13 +0100
Message-ID: <20180605065513.GD21163@dell>
References: <20180605131507.3f217038@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180605131507.3f217038@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Gwendal Grignou <gwendal@chromium.org>
List-Id: linux-next.vger.kernel.org

On Tue, 05 Jun 2018, Stephen Rothwell wrote:

> Hi Lee,
> 
> After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> drivers/mfd/cros_ec_dev.c:265:13: warning: '__remove' defined but not used [-Wunused-function]
>  static void __remove(struct device *dev) { }
>              ^~~~~~~~
> 
> Introduced by commit
> 
>   3aa2177e4787 ("mfd: cros_ec: Use devm_kzalloc for private data")

Thanks Stephen.  Will chase today.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
