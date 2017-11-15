From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warnings after merge of the gpio tree
Date: Thu, 16 Nov 2017 10:39:31 +1100
Message-ID: <20171116103931.3b4733fb@canb.auug.org.au>
References: <20171103163724.73fe268e@canb.auug.org.au>
        <20171109145125.4c505048@canb.auug.org.au>
        <CACRpkdahm-N7JyKQ8LA69qjvPG6Vf4TRKx67emxxFKVdszGiNA@mail.gmail.com>
        <CABGGisyhjtJN=Rgjb0MS9vg+TH2M8Rir27GNyv8jAT2LibjASg@mail.gmail.com>
        <20171116094244.55db9408@canb.auug.org.au>
        <CAL_JsqLMjMpz81rpZuG=TJSabLpstcU-=Ypnj4ARP2M+BesjVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51237 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751097AbdKOXjd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 15 Nov 2017 18:39:33 -0500
In-Reply-To: <CAL_JsqLMjMpz81rpZuG=TJSabLpstcU-=Ypnj4ARP2M+BesjVA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "arm@kernel.org" <arm@kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Rob,

On Wed, 15 Nov 2017 17:12:00 -0600 Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Nov 15, 2017 at 4:42 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > So these (many) warnings are now in Linus' tree :-(
> >
> > Please do something about them.  
> 
> Patches are in flight. I got all the low hanging fruit that are the
> most duplicated[1]. There's other patches in flight too.
> 
> Rob
> 
> [1] https://www.spinics.net/lists/arm-kernel/msg616518.html

Excellent, thanks.

-- 
Cheers,
Stephen Rothwell
