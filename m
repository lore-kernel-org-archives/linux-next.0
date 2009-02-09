From: Cyrill Gorcunov <gorcunov@gmail.com>
Subject: Re: linux-next: manual merge of the tip-core tree with the x86 tree
Date: Mon, 9 Feb 2009 09:00:29 +0300
Message-ID: <aa79d98a0902082200v5dc6326fy80ffd9a868bc84dc@mail.gmail.com>
References: <20090209112453.7bb773f5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f20.google.com ([209.85.220.20]:39362 "EHLO
	mail-fx0-f20.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751505AbZBIGAb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 9 Feb 2009 01:00:31 -0500
Received: by fxm13 with SMTP id 13so2360971fxm.13
        for <linux-next@vger.kernel.org>; Sun, 08 Feb 2009 22:00:29 -0800 (PST)
In-Reply-To: <20090209112453.7bb773f5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Jaswinder Singh Rajput <jaswinderrajput@gmail.com>

On Mon, Feb 9, 2009 at 3:24 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Today's linux-next merge of the tip-core tree got a trivial conflict in
> arch/x86/include/asm/setup.h between commit
> dbca1df48e89d8aa59254fdc10ef16c16e73d94e ("x86: headers cleanup -
> setup.h") from the x86 tree and commit
> 15c554439faedfa490389b31db893dc764245e88 ("headers_check fix: x86,
> setup.h") from the tip-core tree.
>
> I fixed it up as in tip/master.
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
>

Thanks Stephen.
