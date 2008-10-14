From: "Alexey Klimov" <klimov.linux@gmail.com>
Subject: Re: linux-next: usb tree build failure
Date: Tue, 14 Oct 2008 09:51:21 +0400
Message-ID: <208cbae30810132251k7c671a12rf259855a252d093@mail.gmail.com>
References: <20081014150802.e043baf3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from qb-out-0506.google.com ([72.14.204.225]:18674 "EHLO
	qb-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751374AbYJNFvX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 14 Oct 2008 01:51:23 -0400
Received: by qb-out-0506.google.com with SMTP id o24so1627108qba.1
        for <linux-next@vger.kernel.org>; Mon, 13 Oct 2008 22:51:22 -0700 (PDT)
In-Reply-To: <20081014150802.e043baf3.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, Mauro Carvalho Chehab <mchehab@redhat.com>, Douglas Schilling Landgraf <dougsland@gmail.com>

Hi, all

On Tue, Oct 14, 2008 at 8:08 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Greg,
>
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>
> drivers/media/radio/radio-mr800.c: In function 'vidioc_s_frequency':
> drivers/media/radio/radio-mr800.c:362: error: implicit declaration of function 'warn'
> drivers/media/radio/radio-mr800.c: In function 'usb_amradio_suspend':
> drivers/media/radio/radio-mr800.c:508: error: implicit declaration of function 'info'
>
> Direct cause is commits 9ade02815223bc15481f64dc9bef0ba7493d9fdc ("USB:
> remove info() macro from usb.h") and
> fb2d8e064998cfc6fdc3f8e2d30382e4f8dfd40a ("USB: remove warn() macro from
> usb.h") which I have reverted.

Again, i didn't know about removing warn()-macro. When i saw patch
that removes info()-macro from usb.h, i created patch for radio-mr800,
and sent it to Douglas Schilling Landgraf. Bad delay!

> Commit 2aa72f3b63e4b524e9e4b1438f6c0d50a214d836 ("4L/DVB (9101):
> radio-mr800: Add driver for AverMedia MR 800 USB FM radio devices") in
> Linus' tree added new references to warn() and info().
>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/

-- 
Best regards, Klimov Alexey
