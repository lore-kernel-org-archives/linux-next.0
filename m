From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: next-20160915 build: 2 failures 16 warnings (next-20160915)
Date: Fri, 16 Sep 2016 16:59:03 +0200
Message-ID: <ae530830-21c0-444a-85df-fc3ddebb7ec6@redhat.com>
References: <E1bkV4u-0004AY-TY@optimist>
 <20160915154140.GM27974@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:45900 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1759654AbcIPO7I (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 16 Sep 2016 10:59:08 -0400
In-Reply-To: <20160915154140.GM27974@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi,

On 15-09-16 17:41, Mark Brown wrote:
> On Thu, Sep 15, 2016 at 12:43:41PM +0100, Build bot for Mark Brown wrote:
>
> Today's -next fails to build both arm and arm64 allmodconfigs due to:
>
>> 	arm64-allmodconfig
>> ERROR: "musb_root_disconnect" [drivers/usb/musb/sunxi.ko] undefined!
>
>> 	arm-allmodconfig
>> ERROR: "musb_root_disconnect" [drivers/usb/musb/sunxi.ko] undefined!
>
> due to 7cba17ec9adc8cf (musb: sunxi: Add support for platform_set_mode)
> which adds a call to that non-exported function to a module.

Thank you for catching / reporting this. One patch fixing this
coming up.

Regards,

Hans
