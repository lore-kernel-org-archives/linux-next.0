From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: Tree for Feb 17 (pinctrl-msm)
Date: Tue, 25 Feb 2014 10:44:26 +0100
Message-ID: <CACRpkdbKmHW3OqDWs7Mj1eGE2foigUomMiMndejqY_2Yj-kznw@mail.gmail.com>
References: <20140217172329.2c61499f57842ec2ed177bc5@canb.auug.org.au>
	<530247FC.90606@infradead.org>
	<CACRpkdamW1-CxZV65at3PaPhY5nANRDd=SY=FsNPVnrPxyD81w@mail.gmail.com>
	<20140224174646.GA32621@sonymobile.com>
	<530B8C15.50100@infradead.org>
	<20140224184120.GB18563@joshc.qualcomm.com>
	<20140224192813.GA4451@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140224192813.GA4451@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Josh Cartwright <joshc@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Feb 24, 2014 at 8:28 PM, Bjorn Andersson
<bjorn.andersson@sonymobile.com> wrote:

> This comes from the request of having everything as a module, to reduce the
> size of the multi-platform ARM builds. I would say that the important part
> related to that would be to keep the platform specific tables in modules.
>
> But keeping these parts as modules would still mean that it's a module that
> install the chained irq handler.

Yeah that is a bit of double-command is it not :-)

> @Linus, I'm not sure about what should be module and not in pinctrl, but this
> part of pinctrl-msm is less important then the others to be able to be compiled
> as a module.
>
> FWIW;
> Reviewed-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>

Well we can't export that function in the rc series so I applied
this patch for fixes with your review tag.

We can discuss making chained IRQ handlers in modules
for the next merge window...

Linus
