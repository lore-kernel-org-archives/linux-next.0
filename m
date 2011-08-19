From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: linux-next blackfin builds
Date: Thu, 18 Aug 2011 23:16:23 -0400
Message-ID: <CAMjpGUe=xYNuFm9pKp6vSLavE4Vpki25qkrC406cH7MAXBzRrQ@mail.gmail.com>
References: <CAMjpGUe_zTuXMNNQfnpg3Tueijr=CCXpPG7JOP9tqNNtC2wsrw@mail.gmail.com>
 <20110812131750.73f1257494fd7dad45c96131@canb.auug.org.au> <20110817162248.6e2af136fe580e5ab4994b0b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:50050 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751148Ab1HSDQo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 18 Aug 2011 23:16:44 -0400
Received: by bke11 with SMTP id 11so1909510bke.19
        for <linux-next@vger.kernel.org>; Thu, 18 Aug 2011 20:16:43 -0700 (PDT)
In-Reply-To: <20110817162248.6e2af136fe580e5ab4994b0b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, uclinux-dist-devel@blackfin.uclinux.org

On Wed, Aug 17, 2011 at 02:22, Stephen Rothwell wrote:
> I have found a compiler (gcc 4.4.0, no libc) that seem to work.

where did you find it so that i can poke it directly ?

> see the results here: http://kisskb.ellerman.id.au/kisskb/branch/9/ .
> Of course, some of the build errors may be due to the tool chain, I guess.

awesome.  let's see ...

this error is due to your u-boot mkimage being too old.  this has been
fixed for quite a while now (at least since the 2010.03 release):
/usr/local/bin/mkimage: For XIP, the entry point must be the load addr + 64

this errors out for the same reason ... your local mkimage needs to be upgraded.
  UIMAGE  arch/blackfin/boot/vmImage.lzma
Invalid Compression Type - valid names are: none, bzip2, gzip

this is a known bug in the common musb code.  not much we can do atm.
ERROR: "dma_controller_destroy" [drivers/usb/musb/musb_hdrc.ko] undefined!
ERROR: "dma_controller_create" [drivers/usb/musb/musb_hdrc.ko] undefined!

this is interesting ... probably a bug in the Blackfin linker you're
using.  what version is it ?
/tmp/cccKdWmY.s:908: Error: pcrel too far BFD_RELOC_BFIN_10

probably need an updated gcc, although it might not be in a release yet.
cc1: error: -mcpu=bf518-0.1 has invalid silicon revision
-mike
