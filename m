From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
Date: Tue, 10 Apr 2012 09:42:26 +0200
Message-ID: <CACRpkdY57hQOvpqxaaYyJoH0ewfOAj9RqzWtC=aOWQyNMoG6fg@mail.gmail.com>
References: <20120404124437.ff05ebcc4db98109d5fcee22@canb.auug.org.au>
	<4F7BC36E.4070000@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:43614 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752498Ab2DJHm1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Apr 2012 03:42:27 -0400
Received: by gghe5 with SMTP id e5so2166506ggh.19
        for <linux-next@vger.kernel.org>; Tue, 10 Apr 2012 00:42:27 -0700 (PDT)
In-Reply-To: <4F7BC36E.4070000@wwwdotorg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Apr 4, 2012 at 5:43 AM, Stephen Warren <swarren@wwwdotorg.org> =
wrote:
> On 04/03/2012 08:44 PM, Stephen Rothwell wrote:
>> Hi Linus,
>>
>> After merging the pinctrl tree, today's linux-next build (powerpc
>> ppc64_defconfig) failed like this:
>>
>> drivers/pinctrl/devicetree.c: In function 'dt_free_map':
>> drivers/pinctrl/devicetree.c:44:42: error: dereferencing pointer to
>> incomplete type drivers/pinctrl/devicetree.c:45:6: error:
>> dereferencing pointer to incomplete type
>> drivers/pinctrl/devicetree.c: In function 'dt_to_map_one_config':
>> drivers/pinctrl/devicetree.c:140:21: error: dereferencing pointer
>> to incomplete type drivers/pinctrl/devicetree.c:141:10: error:
>> dereferencing pointer to incomplete type
>> drivers/pinctrl/devicetree.c:146:11: error: dereferencing pointer
>> to incomplete type
>
> This doesn't repro for me with tegra_defconfig, which has both
> CONFIG_PINCTRL and CONFIG_OF enabled.
>
> I believe this happens because of the following in
> drivers/pinctrl/Makefile:
>
> obj-$(CONFIG_OF) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D devicetree.o
>
> On ppc64, CONFIG_OF is probably true, yet the rest of PINCTRL isn't
> enabled, hence the headers that are included probably don't declare
> all the types needed to compile that file.
>
> In fact, the file shouldn't be compiled, since it's not needed if
> !CONFIG_PINCTRL. So perhaps the Makefile should be more like:
>
> ifeq ($(CONFIG_OF),y)
> obj-$(CONFIG_PINCTRL) =A0 =A0 =A0 =A0 =A0 +=3D devicetree.o
> endif

Easiest fixed with a new Kconfig like CONFIG_PINCTRL_OF that
depend on both right?

I'll cook a patch.

Yours,
Linus Walleij
