From: Fu Wei <fu.wei@linaro.org>
Subject: Re: linux-next: manual merge of the watchdog tree with the arm-soc tree
Date: Tue, 8 Mar 2016 23:03:57 +0700
Message-ID: <CADyBb7tUjFoV6HbJRnuvB1ZhJ8KXFsXzW66v1AaYc9+UyH4i8A@mail.gmail.com>
References: <20160307150402.191ba735@canb.auug.org.au>
	<56DEF546.9090900@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:33105 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752969AbcCHQD6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 8 Mar 2016 11:03:58 -0500
Received: by mail-oi0-f52.google.com with SMTP id d205so13787050oia.0
        for <linux-next@vger.kernel.org>; Tue, 08 Mar 2016 08:03:58 -0800 (PST)
In-Reply-To: <56DEF546.9090900@arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Wim Van Sebroeck <wim@iguana.be>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>, Sudeep Holla <sudeep.holla@arm.com>

Hi All,

On 8 March 2016 at 22:52, Andr=C3=A9 Przywara <andre.przywara@arm.com> =
wrote:
> On 07/03/16 11:04, Stephen Rothwell wrote:
>> Hi Wim,
>>
>> Today's linux-next merge of the watchdog tree got a conflict in:
>>
>>   arch/arm64/boot/dts/arm/foundation-v8.dts
>>
>> between commit:
>>
>>   d11a89796678 ("arm64: dts: split Foundation model dts to put the G=
IC separately")
>>
>> from the arm-soc tree and commit:
>>
>>   fe3a97e8ed02 ("ARM64: add SBSA Generic Watchdog device node in fou=
ndation-v8.dts")
>>
>> from the watchdog tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary (no act=
ion
>> is required).
>
> But unfortunately this is the wrong solution. The watchdog DT node
> belongs into the (newly created) common foundation-v8.dtsi, not into =
the
> GICv2-only .dts.
> So whoever now provides the watchdog patch, can it be rebased on top =
of
> the foundation model .dts rework, so that the new node ends up in the
> .dtsi file?

I can rebase this patch to make a  watchdog DT patch for
foundation-v8.dtsi ASAP.

Thanks

> If this is too much hassle I could also send a fix after -rc1 (as the
> breakage is not really critical).
>
> Cheers,
> Andre.
>



--=20
Best regards,

=46u Wei
Software Engineer
Red Hat Software (Beijing) Co.,Ltd.Shanghai Branch
Ph: +86 21 61221326(direct)
Ph: +86 186 2020 4684 (mobile)
Room 1512, Regus One Corporate Avenue,Level 15,
One Corporate Avenue,222 Hubin Road,Huangpu District,
Shanghai,China 200021
