From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: Re: linux-next: ubi tree build failure
Date: Fri, 05 Jun 2009 08:54:44 +0300
Message-ID: <4A28B324.2090806@nokia.com>
References: <20090603184408.49c7fb1f.sfr@canb.auug.org.au>	<4A265DF6.3070602@nokia.com> <20090605105842.de948d0b.sfr@canb.auug.org.au>
Reply-To: Artem.Bityutskiy@nokia.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.nokia.com ([192.100.122.230]:49390 "EHLO
	mgw-mx03.nokia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750768AbZFEFzG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 5 Jun 2009 01:55:06 -0400
In-Reply-To: <20090605105842.de948d0b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dmitry Pervushin <dpervushin@embeddedalley.com>

Stephen Rothwell wrote:
> Always directly include the header files for APIs you use ...

Yes, right, those were forgotten.

> I see that this particular problem is now fixed, thanks.

Good, thanks!

--=20
Best Regards,
Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
