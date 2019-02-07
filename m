From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: linux-next: Fixes tag needs some work in the sunxi tree
Date: Thu, 7 Feb 2019 21:53:22 +0800
Message-ID: <CAGb2v650UCEXbEnNPTiPPSn_5Tznso4gg5W23P9K8Y7f_pAqxw@mail.gmail.com>
References: <20190208005042.6b353e17@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190208005042.6b353e17@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Feb 7, 2019 at 9:50 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   df0aeb208b24 ("ARM: dts: sun9i: a80-optimus: Add node for AXP809's unused dc1sw regulator")
>
> Fixes tag
>
>   Fixes: aa4a27bc819e ("ARM: dts: sun9i: a80-optimus: Add AXP809 PMIC
>
> has these problem(s):
>
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
>
> Please don't wrap the Fixes tag over more than one line.

Right. I forgot to update the messages from these I made in the past.

Maxime, can you fix it up?

Thanks
ChenYu
