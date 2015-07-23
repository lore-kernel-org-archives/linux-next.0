From: Rob Herring <robherring2@gmail.com>
Subject: Re: next-20150722 build: 2 failures 75 warnings (next-20150722)
Date: Thu, 23 Jul 2015 10:54:41 -0500
Message-ID: <CAL_Jsq+Kw-PFQVm2bAy-CnF=UMqrRvjde+TSu2mn+DpPFK0=LA@mail.gmail.com>
References: <E1ZHv2t-0004JI-0H@optimist> <20150722184345.GB11162@sirena.org.uk>
 <CAGhQ9VxXdFOCZhEi07X_k-+zV9NpYG+Brnt_fjPT=3mdyeSrgg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yk0-f181.google.com ([209.85.160.181]:33936 "EHLO
	mail-yk0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752897AbbGWPzC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Jul 2015 11:55:02 -0400
Received: by ykax123 with SMTP id x123so223845920yka.1
        for <linux-next@vger.kernel.org>; Thu, 23 Jul 2015 08:55:01 -0700 (PDT)
In-Reply-To: <CAGhQ9VxXdFOCZhEi07X_k-+zV9NpYG+Brnt_fjPT=3mdyeSrgg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joachim Eastwood <manabian@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, Olof Johansson <olof@lixom.net>, kernel-build-reports@lists.linaro.org, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, linux-next <linux-next@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Wed, Jul 22, 2015 at 4:26 PM, Joachim  Eastwood <manabian@gmail.com> wrote:
> On 22 July 2015 at 20:43, Mark Brown <broonie@kernel.org> wrote:
>> On Wed, Jul 22, 2015 at 03:30:56PM +0100, Build bot for Mark Brown wrote:
>>
>> Today's linux-next fails to build an ARM allmodconfig due to:
>>
>>> ERROR: "of_default_bus_match_table" [drivers/memory/pl172.ko] undefined!
>>
>> 17c50b700c3b4 (memory: add ARM PL172 MultiPort Memory Controller
>> driver).  The symbol of_default_bus_match_table isn't exported by the OF
>> core code so can't be referenced from modules.
>
> Sorry about that. Seems like I didn't do a modular build after I
> started to use "of_default_bus_match_table".
> A quick fix would be to just replace "of_default_bus_match_table" with
> NULL, but that means that child nodes that use "simple-bus" wouldn't
> work. Since I don't have any nodes with "simple-bus" I'll send this
> fix ASAP to Olof.

I think generally there is no reason to use NULL and most users can
safely pass of_default_bus_match_table. It would only matter if you
had children matching simple-*, but that should not be the case
typically.

> Grant/Rob: Would you be okay with a patch that exports
> "of_default_bus_match_table"?
> I think it would be useful for memory controllers to allow child nodes
> that use "simple-bus" and "simple-mfd".
>
> Note that "of_default_bus_match_table" is also used by
> memory/omap-gpmc.c, but this drivers can only be built-in so it
> doesn't face this problem.
> memory/ti-aemif.c and memory/mvebu-devbus.c doesn't use
> "of_default_bus_match_table", but again that means they can't have
> child nodes with "simple-bus".

I would prefer to see a wrapper function exported that internally
passes of_default_bus_match_table rather than exporting it. And then
clean-up all the callers including the ones passing NULL. Or if we
need to keep the NULL variant, perhaps 2 variants clearly named for
what they do: of_populate_children and of_populate_buses.

Rob
