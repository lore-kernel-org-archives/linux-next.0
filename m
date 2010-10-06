From: Zimny Lech <napohybelskurwysynom2010@gmail.com>
Subject: Re: linux-next: Tree for October 6
Date: Wed, 6 Oct 2010 20:16:11 +0200
Message-ID: <AANLkTin8hb8JfDWkWXpnxkBZCD3nj-krpf7GSViarxqJ@mail.gmail.com>
References: <20101006163632.c1943a38.sfr@canb.auug.org.au>
	<AANLkTikxMdXrm1jRztZM1BUAoCbBtAs6A39v1cAgRnDY@mail.gmail.com>
	<20101006174831.02cf1691.sfr@canb.auug.org.au>
	<AANLkTikv4Y3gxCEFXg8SQdgmb2Gqk7OniUT7gBvLf14p@mail.gmail.com>
	<alpine.DEB.2.00.1010061311430.31538@router.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:51190 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759521Ab0JFSQO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 6 Oct 2010 14:16:14 -0400
In-Reply-To: <alpine.DEB.2.00.1010061311430.31538@router.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Lameter <cl@linux.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Pekka Enberg <penberg@cs.helsinki.fi>

2010/10/6 Christoph Lameter <cl@linux.com>:
> On Wed, 6 Oct 2010, Zimny Lech wrote:
>
>> >> It seems that you forgot to push to repo
>> >> http://git.kernel.org/?p=3Dlinux/kernel/git/next/linux-next.git;a=
=3Dsummary
>> >
>> > No, its just that the mirroring was slow/blocked :-(
>>
>> Ok, I pulled latest tree. Thanks.
>>
>> I already reported this before.
>>
>> /home/test/linux-2.6/mm/slub.c: In function 'kmem_cache_init':
>> /home/test/linux-2.6/mm/slub.c:3031:2: error: 'slab_memory_callback'
>> undeclared (first use in this function)
>> /home/test/linux-2.6/mm/slub.c:3031:2: note: each undeclared
>> identifier is reported only once for each function it appears in
>> make[2]: *** [mm/slub.o] Error 1
>> make[1]: *** [mm] Error 2
>> make: *** [sub-make] Error 2
>>
>> any thoughts?
>
>
> Subject: slub: hotplug_memory_notifier not useable for !CONFIG_MEMORY=
_HOTPLUG
>
> Add #ifdef to resolve the situation.
>
> Signed-off-by: Christoph Lameter <cl@linux.com>

Thanks for the quick reply :)

I'll check it later or in next -next

>
> ---
> =A0mm/slub.c | =A0 =A02 ++
> =A01 file changed, 2 insertions(+)
>
> Index: linux-2.6/mm/slub.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6.orig/mm/slub.c =A0 =A02010-10-06 13:10:00.000000000 -05=
00
> +++ linux-2.6/mm/slub.c 2010-10-06 13:10:25.000000000 -0500
> @@ -3028,7 +3028,9 @@ void __init kmem_cache_init(void)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sizeof(struct kmem_cache_node),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00, SLAB_HWCACHE_ALIGN | SLAB_PANIC, NU=
LL);
>
> +#ifdef CONFIG_MEMORY_HOTPLUG
> =A0 =A0 =A0 =A0hotplug_memory_notifier(slab_memory_callback, SLAB_CAL=
LBACK_PRI);
> +#endif
>
> =A0 =A0 =A0 =A0/* Able to allocate the per node structures */
> =A0 =A0 =A0 =A0slab_state =3D PARTIAL;
>



--=20
Slawa!
N.P.S.

Les fleurs du mal unfold
Comme les fleurs du mal
Dark demons of my soul
Un amour fatal
