From: Siarhei Liakh <sliakh.lkml@gmail.com>
Subject: Re: [PATCH 1/4] [tip:x86/mm] Correcting improper large page
	preservation
Date: Tue, 6 Apr 2010 10:51:44 -0400
Message-ID: <g2g817ecb6f1004060751s1fd3d42bqc19b5c36b33c3c13@mail.gmail.com>
References: <v2o817ecb6f1003311859nb14bab83y80f743a0accc5028@mail.gmail.com>
	 <1270277000.2686.20.camel@sbs-t61>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <1270277000.2686.20.camel@sbs-t61>
Sender: linux-security-module-owner@vger.kernel.org
To: Suresh Siddha <suresh.b.siddha@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Arjan van de Ven <arjan@infradead.org>, James Morris <jmorris@namei.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@muc.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@elte.hu>, Rusty Russell <rusty@rustcorp.com.au>, Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>
List-Id: linux-next.vger.kernel.org

On Sat, Apr 3, 2010 at 2:43 AM, Suresh Siddha <suresh.b.siddha@intel.co=
m> wrote:
> On Wed, 2010-03-31 at 18:59 -0700, Siarhei Liakh wrote:
>> + =A0 =A0 /*
>> + =A0 =A0 =A0* .data and .bss should always be writable.
>> + =A0 =A0 =A0*/
>> + =A0 =A0 if ((within(pfn, __pa((unsigned long)_sdata) >> PAGE_SHIFT=
,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__pa((unsigned long)_edata) >> PAGE=
_SHIFT)) ||
>> + =A0 =A0 =A0 =A0 (within(pfn, __pa((unsigned long)__bss_start) >> P=
AGE_SHIFT,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__pa((unsigned long)__bss_stop) >> =
PAGE_SHIFT))) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 pgprot_val(required) |=3D _PAGE_RW;
>> + =A0 =A0 }
>
> I have reviewed this patch and the only comment I have is:
>
> On 64bit kernels, kernel text/data mapping and kernel identity mappin=
gs
> are different virtual addresses mapping to same pfn ranges. For the
> data/bss pages, does it help (in identifying certain data corruptions
> more easily) in making the kernel identity mapping to be set to
> read-only and enforce the need of RW only for the kernel data mapping=
s.
>
> Or is there some obscure code that uses something like
> __va(__pa(data_symbol)) and writes to it?
>
> If not, we can remove the __pa() constructs above and use the addr fo=
r
> comparisons.

Done.
Patch V2 have been posted.
--
To unsubscribe from this list: send the line "unsubscribe linux-securit=
y-module" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
