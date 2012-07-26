From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM: mxs: fix compile error caused by prom_update_property
 change
Date: Wed, 25 Jul 2012 22:38:22 -0700
Message-ID: <CAOesGMhwX_ZSZrUraMBazsj7BmJTi_ihGNoOjx__+kLS-SSJ=g@mail.gmail.com>
References: <1342160035-24170-1-git-send-email-shawn.guo@linaro.org>
	<5010D670.6070303@bluegiga.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:34775 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750916Ab2GZFiX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 26 Jul 2012 01:38:23 -0400
Received: by obbuo13 with SMTP id uo13so2189893obb.19
        for <linux-next@vger.kernel.org>; Wed, 25 Jul 2012 22:38:22 -0700 (PDT)
In-Reply-To: <5010D670.6070303@bluegiga.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Lauri Hintsala <lauri.hintsala@bluegiga.com>
Cc: Shawn Guo <shawn.guo@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Fabio Estevam <fabio.estevam@freescale.com>

On Wed, Jul 25, 2012 at 10:32 PM, Lauri Hintsala
<lauri.hintsala@bluegiga.com> wrote:
> Hi,
>
>
> On 07/13/2012 09:13 AM, Shawn Guo wrote:
>>
>> The commit 475d009 (of: Improve prom_update_property() function)
>> changed prom_update_property interface, and causes the compile
>> error below.
>>
>>    CC      arch/arm/mach-mxs/mach-mxs.o
>> arch/arm/mach-mxs/mach-mxs.c: In function =91update_fec_mac_prop=92:
>> arch/arm/mach-mxs/mach-mxs.c:216:4: error: too many arguments to fun=
ction
>> =91prom_update_property=92
>> include/linux/of.h:263:12: note: declared here
>>
>> Update the caller update_fec_mac_prop to fix the error.
>>
>> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
>> ---
>> The error is seen on next-20120712 where commit 475d009 (of: Improve
>> prom_update_property() function) emerges.
>
>
> What's the status of this patch? Current Torvald's master is unbuilda=
ble for
> mxs because of this issue.
>
> Compiler gives an error:
> arch/arm/mach-mxs/mach-mxs.c: In function 'update_fec_mac_prop':
> arch/arm/mach-mxs/mach-mxs.c:213: error: too many arguments to functi=
on
> 'prom_update_property'
> make[1]: *** [arch/arm/mach-mxs/mach-mxs.o] Error 1

Thanks for the follow-up, I had missed it when first sent out. I've
applied it to our fixes branch that will be sent out shortly.


-Olof
