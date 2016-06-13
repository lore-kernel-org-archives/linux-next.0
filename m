From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] gcc-plugins: disable under COMPILE_TEST
Date: Mon, 13 Jun 2016 13:15:40 -0700
Message-ID: <CAGXu5j+uDDeU0aYzD-4EqaBYyZUMR1bVS=Dqx+byYpR4NPkvhQ@mail.gmail.com>
References: <20160611161212.GA29370@www.outflux.net> <CA+icZUW-OZMh2foyiQK=0NfakwbiFHTkouMjptgokKTFLZQFQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:36294 "EHLO
	mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753603AbcFMUPn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 13 Jun 2016 16:15:43 -0400
Received: by mail-wm0-f44.google.com with SMTP id n184so93683518wmn.1
        for <linux-next@vger.kernel.org>; Mon, 13 Jun 2016 13:15:42 -0700 (PDT)
In-Reply-To: <CA+icZUW-OZMh2foyiQK=0NfakwbiFHTkouMjptgokKTFLZQFQQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Michal Marek <mmarek@suse.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Emese Revfy <re.emese@gmail.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Linux-Next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "kernel-hardening@lists.openwall.com" <kernel-hardening@lists.openwall.com>

On Mon, Jun 13, 2016 at 1:40 AM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
> On Sat, Jun 11, 2016 at 6:12 PM, Kees Cook <keescook@chromium.org> wrote:
>> Since adding the gcc plugin development headers is required for the
>> gcc plugin support, we should ease into this new kernel build dependency
>> more slowly. For now, disable the gcc plugins under COMPILE_TEST so that
>> all*config builds will skip it.
>>
>
> [ This might be a bit off-topic - Feel free to answer ]
>
> Hi,
>
> I want to try that new "GCC-plugin" feature.
> Do you have a Git repo for "easy-testing"?

Start with linux-next. It has the basic infrastructure. The
"latent_entropy" plugin is in my kssp tree here:
http://git.kernel.org/cgit/linux/kernel/git/kees/linux.git/log/?h=kspp/gcc-plugins/latent_entropy
though it is not the most up to date version.

> Does the kernel's build-system check for installed "gcc-plugin
> development headers"?

Yes, when the plugins have been selected.

> Which GCC versions support "gcc-plugin" feature?

gcc-4.5 and newer.

> I am here on Ubuntu/precise AMD64 and have gcc-4.6.4 and gcc-4.9.2.

I strongly recommend upgrading to Ubuntu 16.04, but regardless, using
gcc 4.9 should be fine.

> [ Optional ]
> What about the topic and support for "LLVM/Clang and hardening" of the
> Linux-kernel?

I haven't been involved in that project, sorry.

-Kees

-- 
Kees Cook
Chrome OS & Brillo Security
