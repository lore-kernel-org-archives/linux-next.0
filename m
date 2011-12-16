From: Ashish Jangam <Ashish.Jangam@kpitcummins.com>
Subject: RE: linux-next: build failure after merge of the regmap tree
Date: Fri, 16 Dec 2011 08:15:05 +0000
Message-ID: <C3AE124F08223B42BC95AEB82F0F6CED1F9D1AD3@KCHJEXMB01.kpit.com>
References: <C3AE124F08223B42BC95AEB82F0F6CED1F9D0895@KCHJEXMB01.kpit.com>
 <1323941146.32031.49.camel@dhruva>
 <CACxGe6tfxGToC2ScUdQv7KNu2xdhxA4ZG=Ms=oZZCQ+2A-aiTQ@mail.gmail.com>
 <C3AE124F08223B42BC95AEB82F0F6CED1F9D1AB5@KCHJEXMB01.kpit.com>
 <CACxGe6tmqXWZJThk4m31=HzWMZPMMgO4f8h9H=xc_0thjWOJ8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from db3ehsobe001.messaging.microsoft.com ([213.199.154.139]:35775
	"EHLO DB3EHSOBE001.bigfish.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756416Ab1LPIPJ convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 16 Dec 2011 03:15:09 -0500
In-Reply-To: <CACxGe6tmqXWZJThk4m31=HzWMZPMMgO4f8h9H=xc_0thjWOJ8Q@mail.gmail.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Dajun <dajun.chen@diasemi.com>

-----Original Message-----
=46rom: glikely@secretlab.ca [mailto:glikely@secretlab.ca] On Behalf Of=
 Grant Likely
Sent: Friday, December 16, 2011 1:41 PM
To: Ashish Jangam
Cc: Stephen Rothwell; linux-next@vger.kernel.org; linux-kernel@vger.ker=
nel.org; Mark Brown; Dajun
Subject: Re: linux-next: build failure after merge of the regmap tree

On Fri, Dec 16, 2011 at 12:19 AM, Ashish Jangam
<Ashish.Jangam@kpitcummins.com> wrote:
>
>
> -----Original Message-----
> From: glikely@secretlab.ca [mailto:glikely@secretlab.ca] On Behalf Of=
 Grant Likely
> Sent: Thursday, December 15, 2011 11:55 PM
> To: Ashish Jangam
> Cc: Stephen Rothwell; linux-next@vger.kernel.org; linux-kernel@vger.k=
ernel.org; Mark Brown; Dajun
> Subject: Re: linux-next: build failure after merge of the regmap tree
>
> On Thu, Dec 15, 2011 at 2:25 AM, Ashish Jangam
> <ashish.jangam@kpitcummins.com> wrote:
>> Fixes DA9052 GPIO errors.
>>
>> This patch is functionally tested on Samsung SMDKV6410.
>>
>> Signed-off-by: David Dajun Chen <dchen@diasemi.com>
>> Signed-off-by: Ashish Jangam <ashish.jangam@kpitcummins.com>
>> ---
>> =A0drivers/gpio/gpio-da9052.c =A0 =A0 =A0| =A0 37 ++++--------------=
------------
>> =A0include/linux/mfd/da9052/gpio.h | =A0 48 ++++++++++++++++++++++++=
+++++++++++++++
>
> gpio-da9052.c is the only users of mfd/da9052/gpio.h. =A0Why is this
> include file needed? =A0The #defines can simply stay in the .c file.
> I've picked up the patch, but modified it to keep the header defines
> in the .c file. =A0If there is a reason this won't work, then please =
let
> me know.
>
> This header file is shared between GPIO and LED module. I have alread=
y
> posted this LED long back got ACK but did not got merged due to its
> dependency on MFD module.

Are the LEDs attached to GPIOs?  If so, then is there a reason that
the leds-gpio driver can't be used?

Oh yes we can use leds-gpio driver.

g.
