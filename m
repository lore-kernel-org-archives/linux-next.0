From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: linux-next: build failure after merge of the tty tree
Date: Tue, 18 Sep 2018 07:54:09 +0300
Message-ID: <CAHp75Ve8ecT4ziJrV9Edq6u0+jg-eQ1Z9wpXn4dvxTqFDHRFrA@mail.gmail.com>
References: <20180911125857.5e5c34f4@canb.auug.org.au> <20180911082534.GA4185@dell>
 <84bafe76-741e-7dc1-d985-62027f4f634a@microchip.com> <20180911084346.GB4185@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180911084346.GB4185@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Radu Pirea <radu.pirea@microchip.com>, Rob Herring <robh@kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Sep 11, 2018 at 11:43 AM Lee Jones <lee.jones@linaro.org> wrote:
> On Tue, 11 Sep 2018, Nicolas Ferre wrote:

> > Actually it is due to the missing of  <linux/mod_devicetable.h> as Stephen
> > suggested. It is due to the patch ac3167257b9f ("headers: separate
> > linux/mod_devicetable.h from linux/platform_device.h") merged in v4.19-rc1.
>
> Since this set uses Device Tree, it really should include the of.h.

I didn't remember the contents of the driver, but I would disagree on
a statement that
*using* of_device_id table implies necessity of linux/of.h inclusion.

>
> This solves the issue reported above.
>
> I will fix-up and re-send the pull-request.


-- 
With Best Regards,
Andy Shevchenko
