From: Siarhei Liakh <sliakh.lkml@gmail.com>
Subject: Re: [PATCH v8] RO/NX protection for loadable kernel modules
Date: Mon, 1 Feb 2010 11:22:45 -0500
Message-ID: <817ecb6f1002010822j769ccda6wfc39c0dbd42420cd@mail.gmail.com>
References: <817ecb6f1001311522q52bf4eebmb748c486dcd5ad35@mail.gmail.com>
	 <201002011209.13540.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f223.google.com ([209.85.218.223]:34707 "EHLO
	mail-bw0-f223.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753157Ab0BAQWr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 1 Feb 2010 11:22:47 -0500
In-Reply-To: <201002011209.13540.rusty@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, Arjan van de Ven <arjan@infradead.org>, James Morris <jmorris@namei.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@muc.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@elte.hu>, Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>

> Needs more brackets around arguments, otherwise someone calling it wi=
th
> a complex expression will get very upset.
[...]

Done.

> The core_text_size test should be enough here.

Done.

>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 begin_pfn =3D PFN_DOWN((un=
signed long)mod->module_core);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 end_pfn =3D PFN_DOWN((unsi=
gned long)mod->module_core +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 mod->core_text_size);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (end_pfn > begin_pfn)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 set_memory=
_rw(begin_pfn << PAGE_SHIFT,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 end_pfn - begin_pfn);
>
> Much of this code might be neater if you created a helper:

Done.

> But these are minor: patch looks good!

Thanks for your feedback!
