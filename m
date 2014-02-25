From: Olof Johansson <olof@lixom.net>
Subject: Re: linux-next: manual merge of the staging tree with the arm-soc tree
Date: Tue, 25 Feb 2014 08:51:37 -0800
Message-ID: <CAOesGMiTZN3z441d3bOaCcF8Zsss4WZv6YkH9CJpZtTBGxadWw@mail.gmail.com>
References: <20140225170944.d322d9868871bc2f669b92e5@canb.auug.org.au>
	<20140225164921.GA4458@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qc0-f175.google.com ([209.85.216.175]:62301 "EHLO
	mail-qc0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752840AbaBYQvi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Feb 2014 11:51:38 -0500
Received: by mail-qc0-f175.google.com with SMTP id e16so4094805qcx.34
        for <linux-next@vger.kernel.org>; Tue, 25 Feb 2014 08:51:37 -0800 (PST)
In-Reply-To: <20140225164921.GA4458@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Shawn Guo <shawn.guo@linaro.org>

On Tue, Feb 25, 2014 at 8:49 AM, Greg KH <greg@kroah.com> wrote:
> On Tue, Feb 25, 2014 at 05:09:44PM +1100, Stephen Rothwell wrote:
>> Hi Greg,
>>
>> Today's linux-next merge of the staging tree got a conflict in
>> arch/arm/boot/dts/imx53-qsb.dts between commit d5eb195f26fa ("ARM: dts:
>> i.MX53: move common QSB nodes to new file") from the arm-soc tree and
>> commit 17b5001b5143 ("imx-drm: convert to componentised device support")
>> from the staging tree.
>>
>> I fixed it up (see at bottom) and can carry the fix as necessary (no
>> action is required).  I also added the following fix up patch:
>
> I think it's right, but I really have no idea about any of these.  I'll
> defer to Russell to ensure they are correct.

We normally merge all dts changes through arm-soc to avoid these kind
of conflicts. Since your tree is a stable one there isn't much to do
about it, but I'd appreciate it if we just got those parts of the
patch series in the future to avoid these situations. We've been bit
by it before.


-Olof
