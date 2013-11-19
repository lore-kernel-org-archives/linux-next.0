From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: manual merge of the gpio tree with the pm tree
Date: Tue, 19 Nov 2013 14:31:08 +0100
Message-ID: <4205130.mhhgmhmNgO@vostro.rjw.lan>
References: <20131119124357.a6191743b0f568d40c8291d5@canb.auug.org.au> <CACRpkdbSrWK2iaajYd7c-5sRXk+Cv2+s2TLbt4N8LzVKSKamNg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from v094114.home.net.pl ([79.96.170.134]:55084 "HELO
	v094114.home.net.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752447Ab3KSNSb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 19 Nov 2013 08:18:31 -0500
In-Reply-To: <CACRpkdbSrWK2iaajYd7c-5sRXk+Cv2+s2TLbt4N8LzVKSKamNg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>

On Tuesday, November 19, 2013 08:52:13 AM Linus Walleij wrote:
> On Tue, Nov 19, 2013 at 2:43 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Today's linux-next merge of the gpio tree got a conflict in
> > drivers/gpio/gpiolib.c between commit 7b1998116bbb ("ACPI / driver core:
> > Store an ACPI device pointer in struct acpi_dev_node") from the pm tree
> > and commit f760f1967ee8 ("gpiolib: use dedicated flags for GPIO
> > properties") from the gpio tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary (no action
> > is required).
> 
> Oh I never saw that patch before ...

Well, sorry about that ...

> anyway it seems to be correct, thanks.

Yes, it looks correct to me too.

Thanks for fixing this up Stephen!

Rafael
