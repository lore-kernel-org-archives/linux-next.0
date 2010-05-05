From: Siarhei Liakh <sliakh.lkml@gmail.com>
Subject: Re: [PATCH 1/4] [tip:x86/mm] Correcting improper large page
	preservation
Date: Wed, 5 May 2010 14:14:13 -0400
Message-ID: <g2s817ecb6f1005051114kfbf4f33dwf473e0a30e00d614__29805.5723695599$1273083270$gmane$org@mail.gmail.com>
References: <v2o817ecb6f1003311859nb14bab83y80f743a0accc5028@mail.gmail.com>
	 <1270277000.2686.20.camel@sbs-t61>
	 <g2g817ecb6f1004060751s1fd3d42bqc19b5c36b33c3c13@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:44651 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757352Ab0EESOP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 5 May 2010 14:14:15 -0400
In-Reply-To: <g2g817ecb6f1004060751s1fd3d42bqc19b5c36b33c3c13@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-ne>
Cc: Arjan van de Ven <arjan@infradead.org>, James Morris <jmorris@namei.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@muc.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@elte.hu>, Rusty Russell <rusty@rustcorp.com.au>, Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>, Suresh Siddha <suresh.b.siddha@intel.com>

On Tue, Apr 6, 2010 at 10:51 AM, Siarhei Liakh <sliakh.lkml@gmail.com> =
wrote:
> On Sat, Apr 3, 2010 at 2:43 AM, Suresh Siddha <suresh.b.siddha@intel.=
com> wrote:
>> On Wed, 2010-03-31 at 18:59 -0700, Siarhei Liakh wrote:
>>> + =A0 =A0 /*
>>> + =A0 =A0 =A0* .data and .bss should always be writable.
>>> + =A0 =A0 =A0*/
>>> + =A0 =A0 if ((within(pfn, __pa((unsigned long)_sdata) >> PAGE_SHIF=
T,
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__pa((unsigned long)_edata) >> PAG=
E_SHIFT)) ||
>>> + =A0 =A0 =A0 =A0 (within(pfn, __pa((unsigned long)__bss_start) >> =
PAGE_SHIFT,
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__pa((unsigned long)__bss_stop) >>=
 PAGE_SHIFT))) {
>>> + =A0 =A0 =A0 =A0 =A0 =A0 pgprot_val(required) |=3D _PAGE_RW;
>>> + =A0 =A0 }
>>
>> I have reviewed this patch and the only comment I have is:
>>
>> On 64bit kernels, kernel text/data mapping and kernel identity mappi=
ngs
>> are different virtual addresses mapping to same pfn ranges. For the
>> data/bss pages, does it help (in identifying certain data corruption=
s
>> more easily) in making the kernel identity mapping to be set to
>> read-only and enforce the need of RW only for the kernel data mappin=
gs.
>>
>> Or is there some obscure code that uses something like
>> __va(__pa(data_symbol)) and writes to it?
>>
>> If not, we can remove the __pa() constructs above and use the addr f=
or
>> comparisons.
>
> Done.
> Patch V2 have been posted.

Does anyone have  any feedback on the whole kernel RO/NX patch set?
Or should I re-post all 4 patches one more time?

Thank you.
