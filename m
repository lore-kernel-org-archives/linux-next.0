From: Siarhei Liakh <sliakh.lkml@gmail.com>
Subject: Re: [PATCH V9] RO/NX protection for loadable kernel modules
Date: Mon, 1 Feb 2010 17:48:16 -0500
Message-ID: <817ecb6f1002011448l7a9d5de4m47bd37f5e8503877@mail.gmail.com>
References: <817ecb6f1002010829m712ffff4hfb64ff3ea236e1f1@mail.gmail.com>
	 <201002020819.55499.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <201002020819.55499.rusty@rustcorp.com.au>
Sender: linux-security-module-owner@vger.kernel.org
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, Arjan van de Ven <arjan@infradead.org>, James Morris <jmorris@namei.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@muc.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@elte.hu>, Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>
List-Id: linux-next.vger.kernel.org

> But not compile tested:
[...]
> The casts here should cause a warning.

I did compile it prior to submission and the resulting kernel boots.
However, you are right about the warnings as they scrolled off the
screen when I did not pay attention.
Will fix.

>> + =A0 =A0 if (total_size > text_size) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 begin_pfn =3D PFN_UP((unsigned long)base +=
 text_size);
>> + =A0 =A0 =A0 =A0 =A0 =A0 end_pfn =3D PFN_UP((unsigned long)base + t=
otal_size);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (end_pfn > begin_pfn)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 set_memory_nx(begin_pfn <<=
 PAGE_SHIFT,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 end_pfn - begin_pfn);
>
> Use the helper here too?

No, not really. The helper uses PFN_DUWN, and we need PFN_UP here.
This is the only place where I use PFN_UP, so another helper would not
make much sense.

Thanks.
--
To unsubscribe from this list: send the line "unsubscribe linux-securit=
y-module" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
