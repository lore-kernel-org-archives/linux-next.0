From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: linux-next: build failure after merge of the input-current tree
Date: Thu, 23 May 2019 15:52:31 -0700
Message-ID: <20190523225231.GD176265@dtor-ws>
References: <20190524082446.7d5bc21c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190524082446.7d5bc21c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Fabien Parent <fparent@baylibre.com>
List-Id: linux-next.vger.kernel.org

On Fri, May 24, 2019 at 08:24:46AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the input-current tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/input/keyboard/mtk-pmic-keys.c:21:10: fatal error: linux/mfd/mt6392/registers.h: No such file or directory
>  #include <linux/mfd/mt6392/registers.h>
>           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   78094276ca6a ("Input: mtk-pmic-keys - add support for MT6392")
> 
> I have reverted that commit for today.

Sorry about that, I dropped the patch from the tree.

Thanks.

-- 
Dmitry
