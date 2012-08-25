From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: manual merge of the rr tree with the mips tree
Date: Sat, 25 Aug 2012 21:32:37 +0200
Message-ID: <CAMuHMdV9VdJ__yWZwzUnM3=XiRo7NWxiJnnoOBgZ9Jg8v0RTNg@mail.gmail.com>
References: <20120822131130.d669275edf903d9a38a35789@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <20120822131130.d669275edf903d9a38a35789@canb.auug.org.au>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Howells <dhowells@redhat.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen, David,

On Wed, Aug 22, 2012 at 5:11 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Today's linux-next merge of the rr tree got a conflict in
> arch/mips/kernel/module.c between commit c54de490a2e4 ("MIPS: Module:
> Deal with malformed HI16/LO16 relocation sequences") from the mips tree
> and commit 9db0bbe072c8 ("MIPS: Fix module.c build for 32 bit") from the
> rr tree.
>
> Just context changes (I think).  I fixed it up (see below) and can carry
> the fix as necessary.

> + #endif

At first I thought this merge conflict resolution introduced the bogus #endif:

arch/mips/kernel/module.c:247:2: error: #endif without #if

(e.g. http://kisskb.ellerman.id.au/kisskb/buildresult/6999289/)

but it seems to be present already in David's commit
bd029f48459adc8a72a2db95f7d79a7296c5ad5a ("Make most arch
asm/module.h files use asm-generic/module.h")..

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
