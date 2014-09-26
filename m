From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: linux-next: New build failures in Sep 25 tree
Date: Fri, 26 Sep 2014 02:23:19 +0000
Message-ID: <C2D7FE5348E1B147BCA15975FBA230753C5DECF4@IN01WEMBXA.internal.synopsys.com>
References: <20140925202559.GA1750@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-next.vger.kernel.org

Hi,

On Friday 26 September 2014 01:56 AM, Guenter Roeck wrote:
> arc:defconfig
>
> arch/arc/kernel/setup.c: In function 'customize_machine':
> arch/arc/kernel/setup.c:354: error: implicit declaration of function 'of_clk_init'

This is now fixed/pushed.

Thx,
-Vineet
