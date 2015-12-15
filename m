From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: randconfig build error with next-20151215, in arch/x86/entry/vdso/vma.c
Date: Tue, 15 Dec 2015 08:42:09 -0800
Message-ID: <CALCETrX+jKpVXbSVn6D_3Wpt9+7+ce7oqmB-CADrh1JgDH9wKg@mail.gmail.com>
References: <CA+r1ZhiiBsov6ytQNapg140c7mR1iZZT+7UqxDq2LNGbKZ-DoQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+r1ZhiiBsov6ytQNapg140c7mR1iZZT+7UqxDq2LNGbKZ-DoQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jim Davis <jim.epost@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, tglx <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, hpa <hpa@zytor.com>, x86 <x86@kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Dec 15, 2015 at 8:32 AM, Jim Davis <jim.epost@gmail.com> wrote:
> Building with the attached random configuration file,
>
> arch/x86/built-in.o: In function `map_vdso':
> vma.c:(.text+0x13fc): undefined reference to `pvclock_pvti_cpu0_va'

Whoops, thanks!  I confused CONFIG_PARAVIRT_CLOCK and CONFIG_KVM_GUEST.

Ingo, what should I do?  AFAICS these aren't currently in -tip or
queued for -next at all.  Should I send a fixup on top of the pending
patches?  Should I resend both series, with this problem fixed, merged
into one bigger series?

--Andy

>
>
> --
> Jim



-- 
Andy Lutomirski
AMA Capital Management, LLC
