From: Ashish Jangam <Ashish.Jangam@kpitcummins.com>
Subject: RE: linux-next: build failure after merge of the regmap tree
Date: Fri, 16 Dec 2011 07:19:50 +0000
Message-ID: <C3AE124F08223B42BC95AEB82F0F6CED1F9D1AB5@KCHJEXMB01.kpit.com>
References: <C3AE124F08223B42BC95AEB82F0F6CED1F9D0895@KCHJEXMB01.kpit.com>
 <1323941146.32031.49.camel@dhruva>
 <CACxGe6tfxGToC2ScUdQv7KNu2xdhxA4ZG=Ms=oZZCQ+2A-aiTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from va3ehsobe006.messaging.microsoft.com ([216.32.180.16]:46029
	"EHLO VA3EHSOBE007.bigfish.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1756067Ab1LPHT5 convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 16 Dec 2011 02:19:57 -0500
In-Reply-To: <CACxGe6tfxGToC2ScUdQv7KNu2xdhxA4ZG=Ms=oZZCQ+2A-aiTQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Dajun <dajun.chen@diasemi.com>



-----Original Message-----
=46rom: glikely@secretlab.ca [mailto:glikely@secretlab.ca] On Behalf Of=
 Grant Likely
Sent: Thursday, December 15, 2011 11:55 PM
To: Ashish Jangam
Cc: Stephen Rothwell; linux-next@vger.kernel.org; linux-kernel@vger.ker=
nel.org; Mark Brown; Dajun
Subject: Re: linux-next: build failure after merge of the regmap tree

On Thu, Dec 15, 2011 at 2:25 AM, Ashish Jangam
<ashish.jangam@kpitcummins.com> wrote:
> Fixes DA9052 GPIO errors.
>
> This patch is functionally tested on Samsung SMDKV6410.
>
> Signed-off-by: David Dajun Chen <dchen@diasemi.com>
> Signed-off-by: Ashish Jangam <ashish.jangam@kpitcummins.com>
> ---
> =A0drivers/gpio/gpio-da9052.c =A0 =A0 =A0| =A0 37 ++++---------------=
-----------
> =A0include/linux/mfd/da9052/gpio.h | =A0 48 +++++++++++++++++++++++++=
++++++++++++++

gpio-da9052.c is the only users of mfd/da9052/gpio.h.  Why is this
include file needed?  The #defines can simply stay in the .c file.
I've picked up the patch, but modified it to keep the header defines
in the .c file.  If there is a reason this won't work, then please let
me know.

This header file is shared between GPIO and LED module. I have already=20
posted this LED long back got ACK but did not got merged due to its
dependency on MFD module. =20

--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
