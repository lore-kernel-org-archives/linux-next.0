From: Kay Sievers <kay.sievers@vrfy.org>
Subject: Re: linux-next: driver-core tree build failure
Date: Mon, 4 May 2009 15:00:51 +0200
Message-ID: <ac3eb2510905040600k6fca3d88tb7f282e1f94df085@mail.gmail.com>
References: <20090504162542.41b1cb57.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f174.google.com ([209.85.218.174]:60579 "EHLO
	mail-bw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754591AbZEDNBH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 May 2009 09:01:07 -0400
Received: by bwz22 with SMTP id 22so370804bwz.37
        for <linux-next@vger.kernel.org>; Mon, 04 May 2009 06:01:06 -0700 (PDT)
In-Reply-To: <20090504162542.41b1cb57.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org

On Mon, May 4, 2009 at 08:25, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
>
> drivers/hid/usbhid/hiddev.c:965: error: unknown field 'nodename' specified in initializer
> drivers/hid/usbhid/hiddev.c:965: warning: initialization from incompatible pointer type

Sorry, that was my fault. I merged a fix wrongly with the original
patch. I sent an updated patch to Greg.

Thanks a lot and sorry for the mess,
Kay
