From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: linux-next: Tree for Apr 17 (pci-sysfs.c and vga_switcheroo.c)
Date: Wed, 25 Apr 2012 10:37:26 -0600
Message-ID: <CAErSpo56ddRZCG=5yqcEUBPZ1_x76=33xkv5x-46gcNgQCA0Qg@mail.gmail.com>
References: <20120417144241.0d7dc5fde56b2a37ff0dcaba@canb.auug.org.au> <4F8DB90A.8050504@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:46907 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754714Ab2DYQhs (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Apr 2012 12:37:48 -0400
Received: by lahj13 with SMTP id j13so245461lah.19
        for <linux-next@vger.kernel.org>; Wed, 25 Apr 2012 09:37:46 -0700 (PDT)
In-Reply-To: <4F8DB90A.8050504@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org, Matthew Garrett <mjg@redhat.com>

On Tue, Apr 17, 2012 at 12:40 PM, Randy Dunlap <rdunlap@xenotime.net> wrote:
> On 04/16/2012 09:42 PM, Stephen Rothwell wrote:
>
>> Hi all,
>>
>> Changes since 20120416:
>
>
> When CONFIG_VGA_ARB is not enabled:
>
> drivers/built-in.o: In function `boot_vga_show':
> pci-sysfs.c:(.text+0x1060f): undefined reference to `vga_default_device'
>
>
> and
>
> drivers/built-in.o: In function `boot_vga_show':
> pci-sysfs.c:(.text+0x8cc2): undefined reference to `vga_default_device'
> drivers/built-in.o: In function `vga_switcheroo_register_client':
> (.text+0x76671): undefined reference to `vga_default_device'
> drivers/built-in.o: In function `vga_switchto_stage1':
> vga_switcheroo.c:(.text+0x767f4): undefined reference to `vga_set_default_device'

I assume this is related to 77b267c7549e3629ea55cf780aa3d474da7bc2d5
("vgaarb: Add support for setting the default video device") and that
Matthew will take care of whatever needs to be done (if it's not fixed
already).

Bjorn
