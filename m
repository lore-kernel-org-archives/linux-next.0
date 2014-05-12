From: Christoph Lameter <cl@linux.com>
Subject: Re: randconfig build error with next-20140512, in mm/slub.c
Date: Mon, 12 May 2014 13:47:32 -0500 (CDT)
Message-ID: <alpine.DEB.2.10.1405121346370.30318@gentwo.org>
References: <CA+r1Zhg4JzViQt=J0XBu4dRwFUZGwi52QLefkzwcwn4NUfk8Sw@mail.gmail.com>
Content-Type: MULTIPART/MIXED; BOUNDARY=e89a8f2354fd63895304f937d53f
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <CA+r1Zhg4JzViQt=J0XBu4dRwFUZGwi52QLefkzwcwn4NUfk8Sw@mail.gmail.com>
Content-ID: <alpine.DEB.2.10.1405121346371.30318@gentwo.org>
Sender: owner-linux-mm@kvack.org
To: Jim Davis <jim.epost@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, penberg@kernel.org, mpm@selenic.com, linux-mm@kvack.org
List-Id: linux-next.vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--e89a8f2354fd63895304f937d53f
Content-Type: TEXT/PLAIN; CHARSET=ISO-8859-7
Content-ID: <alpine.DEB.2.10.1405121346372.30318@gentwo.org>
Content-Transfer-Encoding: quoted-printable

A patch was posted today for this issue.

Date: Mon, 12 May 2014 09:36:30 -0300
From: Fabio Estevam <fabio.estevam@freescale.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org, festevam@gmail.com, Fabio Estevam
<fabio.estevam@freescale.com>,    Christoph Lameter <cl@linux.com>, David=
 Rientjes <rientjes@google.com>, Pekka Enberg <penberg@kernel.org>
Subject: [PATCH] mm: slub: Place count_partial() outside CONFIG_SLUB_DEBU=
G if block


On Mon, 12 May 2014, Jim Davis wrote:

> Building with the attached random configuration file,
>
> mm/slub.c: In function =A1show_slab_objects=A2:
> mm/slub.c:4361:5: error: implicit declaration of function =A1count_part=
ial=A2 [-Werr
> or=3Dimplicit-function-declaration]
>      x =3D count_partial(n, count_total);
>      ^
> cc1: some warnings being treated as errors
> make[1]: *** [mm/slub.o] Error 1
>
--e89a8f2354fd63895304f937d53f--

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
