From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: linux-next: build warning after merge of the phy-next tree
Date: Wed, 16 Nov 2016 22:09:36 +0530
Message-ID: <3319cf9e-a08e-6c83-ed27-a19b12491b46@ti.com>
References: <20161116140004.465a98af@canb.auug.org.au>
 <a1364db5-6700-49b6-1435-db9abf00f55d@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a1364db5-6700-49b6-1435-db9abf00f55d@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: wlf <wulf@rock-chips.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi,

On Wednesday 16 November 2016 06:58 PM, wlf wrote:
> Hi Stephen，
> 
> 在 2016年11月16日 11:00, Stephen Rothwell 写道:
>> Hi Kishon,
>>
>> After merging the phy-next tree, today's linux-next build (x86_64
>> allmodconfig) produced this warning:
>>
>> drivers/phy/phy-rockchip-inno-usb2.c: In function 'rockchip_chg_detect_work':
>> drivers/phy/phy-rockchip-inno-usb2.c:717:7: warning: 'tmout' may be used
>> uninitialized in this function [-Wmaybe-uninitialized]
>>      if (tmout) {
>>         ^
>>
>> Introduced by commit
>>
>>    0c42fe48fd23 ("phy: rockchip-inno-usb2: support otg-port for rk3399")

Thank you for reporting this issue.

> The variable "tmout" is initialized in the prior  code "case
> USB_CHG_STATE_WAIT_FOR_DCD",
> and this case will be executed before "if (tmout)", so I think it's a
> mis-warning for some
> special compiler.
> 
> Could you provide me some suggestion about this warning? Should I upload a new
> patch to
> fix this compiler mis-warning or just ignore it ？ :-)

Arnd has already sent a fix it. I've picked that one.

Thanks
Kishon
