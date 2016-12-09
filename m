From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: enabling COMPILE_TEST support for GCC plugins in v4.11
Date: Fri, 9 Dec 2016 11:40:29 -0800
Message-ID: <CA+55aFwyDj21NDiQExue-z19NwZ7N4HmFV-ACKENSXhj1ETOyA@mail.gmail.com>
References: <CAGXu5jLEg_4oOyT-rB8QaaYos854xp39_hNf7haNp=8frcPS0Q@mail.gmail.com>
 <2680957.ot0HfIkH6p@wuerfel> <CAGXu5jJpBiffFhdQ+sjwWeeWOnpEkz4JQyH8VwmVCWP3TzXmLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:33158 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752965AbcLITka (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Dec 2016 14:40:30 -0500
In-Reply-To: <CAGXu5jJpBiffFhdQ+sjwWeeWOnpEkz4JQyH8VwmVCWP3TzXmLQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kees Cook <keescook@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <rdunlap@infradead.org>, Olof Johansson <olof@lixom.net>, Mark Brown <broonie@kernel.org>, info@kernelci.org, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will.deacon@arm.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, LKML <linux-kernel@vger.kernel.org>, Linux-Next <linux-next@vger.kernel.org>, Fengguang Wu <fengguang.wu@intel.com>, Andrew Donnellan <andrew.donnellan@au1.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Laura Abbott <labbott@redhat.com>, "x86@kernel.org" <x86@kernel.org>, PaX Team <pageexec@freemail.hu>, Emese Revfy <re.emese@gmail.com>

On Fri, Dec 9, 2016 at 11:12 AM, Kees Cook <keescook@google.com> wrote:
>
> I'm starting to wonder if we need to expose the compiler version to
> Kconfig so that "all*config" builds for earlier compiler will
> automatically leave things like plugins off. But I have no idea what
> the right approach for that might be.

We had some broken mock-up of a config option that did a "system()"
call to do some shell scripting for filling in config options (ie turn
a fail/pass into false/true boolean automatically with something like

   config COMPILER_SUPPORTS_XYZ
       bool
       option shell="gcc -XYZ"

The idea is really solid: move a lot of the nasty ad-hoc runtime
testing in the Makefiles to the configuration stage. I would seriously
like to see this, so that we could replace the stupid

  CFLAGS_KCOV     := $(call cc-option,-fsanitize-coverage=trace-pc,)

with just nicer thing (ok, that's a bad example, but some of the other
cc-option cases are really pretty fundamental to kernel configuration,
and it really matters whether the compiler supports something or not).

The main problem was actually that we don't have good infrastructure
for passing in the compiler environment etc to kbuild.

I forgot who did that mock-up (and what the exact syntax was), but it
was pretty simple.

                 Linus
