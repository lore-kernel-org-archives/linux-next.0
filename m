From: Zimny Lech <napohybelskurwysynom2010@gmail.com>
Subject: Re: linux-next: Tree for October 6
Date: Wed, 6 Oct 2010 20:07:18 +0200
Message-ID: <AANLkTikv4Y3gxCEFXg8SQdgmb2Gqk7OniUT7gBvLf14p@mail.gmail.com>
References: <20101006163632.c1943a38.sfr@canb.auug.org.au>
	<AANLkTikxMdXrm1jRztZM1BUAoCbBtAs6A39v1cAgRnDY@mail.gmail.com>
	<20101006174831.02cf1691.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20101006174831.02cf1691.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Christoph Lameter <cl@linux-foundation.org>, Pekka Enberg <penberg@cs.helsinki.fi>
List-Id: linux-next.vger.kernel.org

2010/10/6 Stephen Rothwell <sfr@canb.auug.org.au>:
> On Wed, 6 Oct 2010 08:25:24 +0200 Zimny Lech <napohybelskurwysynom201=
0@gmail.com> wrote:
>>
>> 2010/10/6 Stephen Rothwell <sfr@canb.auug.org.au>:
>> > Hi all,
>> >
>> > Changes since 20101005:
>>
>> It seems that you forgot to push to repo
>> http://git.kernel.org/?p=3Dlinux/kernel/git/next/linux-next.git;a=3D=
summary
>
> No, its just that the mirroring was slow/blocked :-(

Ok, I pulled latest tree. Thanks.

I already reported this before.

/home/test/linux-2.6/mm/slub.c: In function 'kmem_cache_init':
/home/test/linux-2.6/mm/slub.c:3031:2: error: 'slab_memory_callback'
undeclared (first use in this function)
/home/test/linux-2.6/mm/slub.c:3031:2: note: each undeclared
identifier is reported only once for each function it appears in
make[2]: *** [mm/slub.o] Error 1
make[1]: *** [mm] Error 2
make: *** [sub-make] Error 2

any thoughts?
>
> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
> http://www.canb.auug.org.au/~sfr/
>



--=20
Slawa!
N.P.S.

Les fleurs du mal unfold
Comme les fleurs du mal
Dark demons of my soul
Un amour fatal
