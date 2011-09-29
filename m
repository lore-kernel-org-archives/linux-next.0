From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: manual merge of the moduleh tree with the staging tree
Date: Thu, 29 Sep 2011 11:15:24 -0400
Message-ID: <CAP=VYLp0zFMGtu2mTOvt5avyeGXQYD2NV=2z=anE1RwwyUw7SQ@mail.gmail.com>
References: <20110929155557.1baa18a46e6dc142a97cf1d0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:58749 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751478Ab1I2PPZ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 Sep 2011 11:15:25 -0400
In-Reply-To: <20110929155557.1baa18a46e6dc142a97cf1d0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Cameron <jic23@cam.ac.uk>, Greg KH <greg@kroah.com>

On Thu, Sep 29, 2011 at 1:55 AM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Paul,
>
> Today's linux-next merge of the moduleh tree got a conflict in
> drivers/staging/iio/accel/adis16220_core.c between commits 7991029a55=
fa
> ("staging:iio:accel:adis16220 iio_chan_spec conversion") and 6f4ebab5=
6870
> ("staging: iio: adis16220_core.c: add module.h") from the staging tre=
e
> and commit 6eee8b750254 ("staging: Add module.h to more drivers
> implicitly using it") from the moduleh tree.
>
> The staging commits are a superset of the part of the moduleh commit =
that
> affects this file, so I dropped the moduleh change (module.h was adde=
d in
> different places).

Yep, I'll drop that change; it got re-added when I re-did build testing=
 on the
baseline v3.1-rc6+module.h and saw a build failure.  I didn't clue into=
 that
even when I got the same conflict on my test merge with -next content..=
=2E

Thanks,
Paul.

> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
> http://www.canb.auug.org.au/~sfr/
>
