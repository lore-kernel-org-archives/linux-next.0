From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: manual merge of the kbuild tree with Linus' tree
Date: Thu, 2 Jul 2015 08:47:49 +0200
Message-ID: <CAMuHMdUCu7MWiUGW+TmVN8=T8SvPHgUoupSdf9XMn0e1mKQm3Q@mail.gmail.com>
References: <20150702103025.634ca1e5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:34823 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751194AbbGBGru (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 2 Jul 2015 02:47:50 -0400
In-Reply-To: <20150702103025.634ca1e5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michal Marek <mmarek@suse.cz>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Luis R. Rodriguez" <mcgrof@suse.com>, David Vrabel <david.vrabel@citrix.com>, Geert Uytterhoeven <geert+renesas@glider.be>

On Thu, Jul 2, 2015 at 2:30 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Today's linux-next merge of the kbuild tree got a conflict in:
>
>   scripts/kconfig/Makefile
>
> between commits:
>
>   9bcd776d299e ("kconfig: clarify kvmconfig is for kvm")
>   6c6685055a28 ("kconfig: add xenconfig defconfig helper")
>
> from Linus' tree and commit:
>
>   fa75a727c019 ("kconfig: Wrap long "make help" text lines")
>
> from the kbuild tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
>
> diff --cc scripts/kconfig/Makefile
> index f52abae0ec5f,930de225d52e..000000000000
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@@ -142,9 -139,9 +143,10 @@@ help
>         @echo  '  alldefconfig    - New config with all symbols set to default'
>         @echo  '  randconfig      - New config with random answer to all options'
>         @echo  '  listnewconfig   - List new options'
> -       @echo  '  olddefconfig    - Same as silentoldconfig but sets new symbols to their default value'
> +       @echo  '  olddefconfig    - Same as silentoldconfig but sets new symbols to their'
> +       @echo  '                    default value'
>  -      @echo  '  kvmconfig       - Enable additional options for guest kernel support'
>  +      @echo  '  kvmconfig       - Enable additional options for kvm guest kernel support'
>  +      @echo  '  xenconfig       - Enable additional options for xen dom0 and guest kernel support'

Doh, a new long line to be wrapped.

Michal: Shall I send a fix-up patch, or a new one against Linus' tree?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
