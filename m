From: Micah Morton <mortonm@chromium.org>
Subject: Re: linux-next: Tree for Jan 29 (security/safesetid/)
Date: Tue, 29 Jan 2019 10:21:16 -0800
Message-ID: <CAJ-EccMgDvx81g-XgWymdYn_G5Ou8mgbef3GUbx-C_Ai5qF-pQ@mail.gmail.com>
References: <20190129171143.3945af24@canb.auug.org.au> <a4e95bee-e5c5-94f5-a577-d55cdd419e86@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a4e95bee-e5c5-94f5-a577-d55cdd419e86@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-security-module <linux-security-module@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

I noticed you don't have the following lines (or some of the other
related security ones) in your .config.

CONFIG_SECURITY=y
CONFIG_SECURITY_WRITABLE_HOOKS=y

Seems like we need a 'depends on SECURITY' line (or something like
that) in security/safesetid/Kconfig -- let me see if that fixes things
and if so I'll upload a patch

On Tue, Jan 29, 2019 at 9:04 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 1/28/19 10:11 PM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20190125:
> >
>
> on x86_64:
>
> ld: security/safesetid/lsm.o:(.data+0x10): undefined reference to `security_hook_heads'
> ld: security/safesetid/lsm.o:(.data+0x38): undefined reference to `security_hook_heads'
> ld: security/safesetid/lsm.o: in function `safesetid_security_init':
> lsm.c:(.init.text+0x14): undefined reference to `security_add_hooks'
>
>
> Full randconfig file is attached.
>
> --
> ~Randy
