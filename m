From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: Tree for Oct 31 (vboxguest)
Date: Fri, 2 Nov 2018 16:54:25 +0100
Message-ID: <CAK8P3a1w8p8OC-9_0mtMUxEojvyVfXvF8Ka4J7TnoyZ=gr2Fow@mail.gmail.com>
References: <20181031145907.1ee2e866@canb.auug.org.au> <661e44c7-396a-6d58-efa7-ed292f2677c6@infradead.org>
 <CAK8P3a3aygFrD3PyZ8P==JzeYamE-x--MWCL54xzXDE_8u_R6Q@mail.gmail.com>
 <CAK7LNATirQwke8tqk5XukhkwKra6mWEXZ3AHcywNcwGFD2-voA@mail.gmail.com>
 <20181101142946.u5luuctqav6fec6k@mail.google.com> <CAK7LNAQbBG=KV5Q8o5-JiNCswuse94jECoqT+T+UEY7bLCRPNw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNAQbBG=KV5Q8o5-JiNCswuse94jECoqT+T+UEY7bLCRPNw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Changbin Du <changbin.du@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Hans de Goede <hdegoede@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-next.vger.kernel.org

On 11/2/18, Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> On Thu, Nov 1, 2018 at 11:32 PM Changbin Du <changbin.du@gmail.com> wrote:
>> On Thu, Nov 01, 2018 at 12:32:48PM +0900, Masahiro Yamada wrote:
>
> How about clang?
>
> For clang, -Og might be equivalent to -O1 at this moment, but I am not
> sure.
>
> In my understanding, Clang does not inline functions marked with 'static
> inline'
> for -Og (or -O1) optimization level.
>
> Theoretically, 'inline' keyword is a just hint for the compiler, after all.

I think this means that we cannot build the kernel in that configuration,
at least with CONFIG_OPTIMIZE_INLINING=y. Without that option,
every 'inline' becomes 'always_inline'.

       Arnd
