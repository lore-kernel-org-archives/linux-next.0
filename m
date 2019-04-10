From: Rob Herring <robherring2@gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the devicetree tree
Date: Wed, 10 Apr 2019 16:34:53 -0500
Message-ID: <CAL_JsqLWOtOe5CTOe0YbJ_mCqnz6zEcFEA8zWAW9YDhr=6+yYA@mail.gmail.com>
References: <20190411072758.4fa7b9a8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411072758.4fa7b9a8@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: linux-next.vger.kernel.org

On Wed, Apr 10, 2019 at 4:28 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Rob,
>
> In commit
>
>   7800990023f4 ("of: use correct function prototype for of_overlay_fdt_apply()")
>
> Fixes tag
>
>   Fixes: commit 39a751a4cb7e ("of: change overlay apply input data from unflattened to FDT")
>
> has these problem(s):
>
>   - leading word 'commit' unexpected

I've fixed it up now.

Rob
