From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: triage for April 19, 2012
Date: Mon, 28 May 2012 17:04:21 +0200
Message-ID: <CAMuHMdXf6O249NttPgeQzWkGfLu_Ocod80ecXaaFy+SqZQNmcg@mail.gmail.com>
References: <20120420020013.GA19964@windriver.com>
	<CAMuHMdUUgysVqz226jhK42nvYNaX7yvexpqRjOPx0QpvzUwVXg@mail.gmail.com>
	<4FC38DBD.4070406@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:61127 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750802Ab2E1PEW convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 28 May 2012 11:04:22 -0400
In-Reply-To: <4FC38DBD.4070406@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@redhat.com>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Avi,

On Mon, May 28, 2012 at 4:37 PM, Avi Kivity <avi@redhat.com> wrote:
> On 05/25/2012 11:59 PM, Geert Uytterhoeven wrote:
>> On Fri, Apr 20, 2012 at 4:00 AM, Paul Gortmaker
>> <paul.gortmaker@windriver.com> wrote:
>>> The parisc got borked by some kvm header shuffle it seems?
>>> Now complaining about "file 'asm-generic/kvm_para.h' is not exporte=
d"
>>> [ http://kisskb.ellerman.id.au/kisskb/buildresult/6137786/ ]
>>
>> Not only parisc.
>>
>> This breakage has now entered mainline:
>>
>> parisc deconfig http://kisskb.ellerman.id.au/kisskb/buildresult/6365=
677/
>> m68k allmodconfig: http://kisskb.ellerman.id.au/kisskb/buildresult/6=
365681/
>
>
> Does the following patch help?

Thanks, that fixes it!

Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

> From: Avi Kivity <avi@redhat.com>
> Date: Mon, 28 May 2012 17:35:22 +0300
> Subject: [PATCH] KVM: Export asm-generic/kvm_para.h
>
> Prevents build failures on non-KVM archs.
>
> Signed-off-by: Avi Kivity <avi@redhat.com>
> ---
> =C2=A0include/asm-generic/Kbuild | =C2=A0 =C2=A01 +
> =C2=A01 file changed, 1 insertion(+)
>
> diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
> index 53f91b1..2c85a0f 100644
> --- a/include/asm-generic/Kbuild
> +++ b/include/asm-generic/Kbuild
> @@ -8,6 +8,7 @@ header-y +=3D int-ll64.h
> =C2=A0header-y +=3D ioctl.h
> =C2=A0header-y +=3D ioctls.h
> =C2=A0header-y +=3D ipcbuf.h
> +header-y +=3D kvm_para.h
> =C2=A0header-y +=3D mman-common.h
> =C2=A0header-y +=3D mman.h
> =C2=A0header-y +=3D msgbuf.h
>

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
