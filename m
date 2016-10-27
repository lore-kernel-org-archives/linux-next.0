From: Alexander Potapenko <glider@google.com>
Subject: Re: linux-next: build warning in Linus' tree
Date: Thu, 27 Oct 2016 16:05:58 -0700
Message-ID: <CAG_fn=WCvtf7yvj7JT5ahA21+P3F0Q==fqhS4e-3B=oRuPnVrA@mail.gmail.com>
References: <20161028092920.4d84f8f1@canb.auug.org.au> <CA+55aFztZ1VuMhmx0_DX3ubrFNKcLTcW0OqDLRfxa0g2AeGY-w@mail.gmail.com>
 <CA+55aFwDL2_Ecuei4tYLH34RDmOba_COfr5JajasvYXA++yUgA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+55aFwDL2_Ecuei4tYLH34RDmOba_COfr5JajasvYXA++yUgA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Dmitry Vyukov <dvyukov@google.com>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Oct 27, 2016 at 4:01 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Thu, Oct 27, 2016 at 3:48 PM, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> I wonder if we should make KASAN depend on !COMPILE_TEST, because it
>> does seem to disable a lot of build-time testing.
>
> Actually, we should probably just make the MEMORY_HOTPLUG dependency be
>
>         depends on COMPILE_TEST || !KASAN

Maybe we could just reverse the MEMORY_HOTPLUG->!KASAN dependency to
make it KASAN->!MEMORY_HOTPLUG?

Is it at all correct that allmodconfig enables KASAN? If/when we have
other compiler-based tools, which of them will allmodconfig pick?
> since the memory-hotplug code should still *build* with KASAN, it just
> doesn't work. That's exactly what the COMPILE_TEST config option is
> there for - to get build coverage even for things that aren't
> necessarily sane to run.
>
> I'll do that, to get my build coverage up. I really expected my
> allmodconfig builds to verify that I had removed the per-zone
> waitqueue code completely, and I'm happy that the breakage was
> apparently limited to that unused variable..
>
> In the meantime, thanks for noticing and letting me know.
>
>             Linus



--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Matthew Scott Sucherman, Paul Terence Manicle
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
