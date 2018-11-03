From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: linux-next: Tree for Nov 2 (compiler-gcc.h)
Date: Sat, 3 Nov 2018 13:43:40 +0100
Message-ID: <CANiq72kBx4+R4SVFZ_iTfk61=oHMLwvhHdmBDe=cBFP5Lp7bSQ@mail.gmail.com>
References: <20181102143018.09feb051@canb.auug.org.au> <CANiq72m65bQZefAoFF5dTUB-rPzm4vofZFnDn0nYBG3MsGrjZg@mail.gmail.com>
 <20181103002218.3bd015b3@canb.auug.org.au> <CANiq72=kHErmujzMgM4akXeoWkSR0Q3VLd-6Mwiaj5mGan8yZw@mail.gmail.com>
 <20227164-2ef3-d684-bf4e-fb69ac828789@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20227164-2ef3-d684-bf4e-fb69ac828789@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Nov 2, 2018 at 4:56 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Hi,
>
> on i386 or x86_64, with gcc (SUSE Linux) 4.8.5, I am seeing this problem:
>
> In file included from <command-line>:0:0:
> ../include/linux/compiler-gcc.h:75:45: internal compiler error: in functi=
on_and_variable_visibility, at ipa.c:825
>  #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COU=
NTER__)
>  [...]
> ../drivers/media/usb/dvb-usb/pctv452e.c:1102:1: note: in expansion of mac=
ro =E2=80=98MODULE_LICENSE=E2=80=99
>  MODULE_LICENSE("GPL");
>  ^
> Please submit a full bug report,
> with preprocessed source if appropriate.
> See <http://bugs.opensuse.org/> for instructions.
> ../scripts/Makefile.build:293: recipe for target 'drivers/media/usb/dvb-u=
sb/pctv452e.o' failed

Is any plugin enabled? I can't reproduce here on a compiled 4.8.5
using a minimal config with pctv452e.c and a few other things enabled,
although with a full allyesconfig I got another problem:

*** WARNING *** there are active plugins, do not report this as a bug
unless you can reproduce it without enabling any plugins.
Event                            | Plugins
PLUGIN_FINISH_TYPE               | randomize_layout_plugin structleak_plugi=
n
PLUGIN_FINISH_DECL               | randomize_layout_plugin
PLUGIN_ATTRIBUTES                | randomize_layout_plugin
latent_entropy_plugin structleak_plugin
PLUGIN_START_UNIT                | latent_entropy_plugin stackleak_plugin
PLUGIN_ALL_IPA_PASSES_START      | randomize_layout_plugin
arch/x86/kernel/apic/apic_noop.c: In function 'noop_init_apic_ldr':
arch/x86/kernel/apic/apic_noop.c:32:1: internal compiler error:
Segmentation fault
 static void noop_init_apic_ldr(void) { }
 ^
0x7f18e09006d5 stackleak_cleanup_execute
scripts/gcc-plugins/stackleak_plugin.c:253
Please submit a full bug report,
with preprocessed source if appropriate.
Please include the complete backtrace with any bug report.
See <http://gcc.gnu.org/bugs.html> for instructions.
scripts/Makefile.build:293: recipe for target
'arch/x86/kernel/apic/apic_noop.o' failed
make[3]: *** [arch/x86/kernel/apic/apic_noop.o] Error 1
scripts/Makefile.build:518: recipe for target 'arch/x86/kernel/apic' failed
make[2]: *** [arch/x86/kernel/apic] Error 2
scripts/Makefile.build:518: recipe for target 'arch/x86/kernel' failed
make[1]: *** [arch/x86/kernel] Error 2
Makefile:1071: recipe for target 'arch/x86' failed
make: *** [arch/x86] Error 2

Cheers,
Miguel
