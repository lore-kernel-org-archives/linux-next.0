From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: randconfig build error with next-20140523, in arch/x86/pci/fixup.c
Date: Fri, 23 May 2014 10:49:47 -0600
Message-ID: <CAErSpo6vJAEd2-qSCWt_j5L2sFDeh1iK3=G+_5pz32WdsNfhKA@mail.gmail.com>
References: <CA+r1ZhjZoDK-rxZ8EGDk==b7EXNDsdxo8EAt2WFhdHt4-W0k=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <CA+r1ZhjZoDK-rxZ8EGDk==b7EXNDsdxo8EAt2WFhdHt4-W0k=g@mail.gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: Jim Davis <jim.epost@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, tglx <tglx@linutronix.de>, hpa <hpa@zytor.com>, x86 <x86@kernel.org>, linux-pci <linux-pci@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, May 23, 2014 at 10:13 AM, Jim Davis <jim.epost@gmail.com> wrote=
:
> Building with the attached random configuration file,
>
> arch/x86/pci/fixup.c: In function =E2=80=98sb600_hpet_quirk=E2=80=99:
> arch/x86/pci/fixup.c:534:47: error: =E2=80=98hpet_address=E2=80=99 un=
declared (first use in this
>  function)
>   if (r->flags & IORESOURCE_MEM && r->start =3D=3D hpet_address) {
>                                                ^
> arch/x86/pci/fixup.c:534:47: note: each undeclared identifier is repo=
rted only o
> nce for each function it appears in
> make[1]: *** [arch/x86/pci/fixup.o] Error 1

Thanks, I updated that patch to test CONFIG_HPET_TIMER.

Bjorn
