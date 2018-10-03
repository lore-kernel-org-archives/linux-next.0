From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [GIT PULL linux-next] Add Compiler Attributes tree
Date: Wed, 3 Oct 2018 23:41:08 +0200
Message-ID: <CANiq72nMu6NXg1Ovn49qJ=FP_S4_LQJSwPuS+Q_zofhOEbVZng@mail.gmail.com>
References: <CANiq72=rgT9cPWH64Tf_8gAU09EiH5FvGqFUdOjV=spVbM5m8Q@mail.gmail.com>
 <20181003071059.02b3fd6f@canb.auug.org.au> <CAKwvOdmt4-jFv6d-ZVUH5OOvXSz38jpuNvQy-jtoSS3xEoh78A@mail.gmail.com>
 <CANiq72mmxiO6RWBTQfWYDaa6gmOF01nXmN6BJNCAjAFz3QJqqA@mail.gmail.com>
 <20181002232454.GB2483@thunk.org> <CANiq72=cRpqnB3BxLsmj-rMdUGJK+pac1SRppoRgsON69ErfQg@mail.gmail.com>
 <20181003153303.GC2835@thunk.org> <CANiq72=Jq8HZ1=CsSvV4GenG+F6z3vRFmiB7Joct5VKdUFo8pA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANiq72=Jq8HZ1=CsSvV4GenG+F6z3vRFmiB7Joct5VKdUFo8pA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ted Ts'o <tytso@mit.edu>, Nick Desaulniers <ndesaulniers@google.com>, Andrew Morton <akpm@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Steven Rostedt <rostedt@goodmis.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Olof Johansson <olof@lxom.net>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, David Miller <davem@davemloft.net>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Paul Lawrence <paullawrence@google.com>, Sandipan
List-Id: linux-next.vger.kernel.org

On Wed, Oct 3, 2018 at 11:23 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Wed, Oct 3, 2018 at 5:33 PM Theodore Y. Ts'o <tytso@mit.edu> wrote:
> > had done with full consideration, specifically for this reason.  Even
> > if the definition was different, my definition *had* been fully tested
> > with over a 27+ VM hours of regression testing, and if it turned out

I forgot to mention that if the definitions were different, it could
have caused a problem, because your definition wouldn't apply, so your
27+ hours of testing wouldn't have mattered :-P Without the #ifndef,
we would have at least got a redefinition warning about it.

Cheers,
Miguel
