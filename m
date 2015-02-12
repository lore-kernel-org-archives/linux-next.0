From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: randconfig build error with next-20150209, in fs/nfs/client.c
Date: Thu, 12 Feb 2015 13:33:38 +0100
Message-ID: <CAMuHMdU2GzcOSm4NR9=vf6jmTFLmyPvVFaKHHe5QAwcoqDLYrQ@mail.gmail.com>
References: <CA+r1ZhinMg425ecr4F_XqhRUyCs1FOMDBjvVvf0jV_O-WmpcgA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+r1ZhinMg425ecr4F_XqhRUyCs1FOMDBjvVvf0jV_O-WmpcgA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jim Davis <jim.epost@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, trond.myklebust@primarydata.com, anna.schumaker@netapp.com, "open list:NFS, SUNRPC, AND..." <linux-nfs@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Feb 9, 2015 at 7:00 PM, Jim Davis <jim.epost@gmail.com> wrote:
> Building with the attached random configuration file,
>
> In file included from fs/nfs/client.c:25:0:
> include/linux/sunrpc/metrics.h: In function =E2=80=98rpc_count_iostat=
s_metrics=E2=80=99:
> include/linux/sunrpc/metrics.h:92:59: error: parameter name omitted
>  static inline void rpc_count_iostats_metrics(const struct rpc_task *=
,
>                                                            ^
> include/linux/sunrpc/metrics.h:93:18: error: parameter name omitted
>            struct rpc_iostats *) {}
>                   ^
>   CC      net/ipv4/ip_vti.o
>   CC      net/ipv6/addrconf_core.o
> make[2]: *** [fs/nfs/client.o] Error 1

Yep, fails now in mainline too with CONFIG_PROC_FS=3Dn.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
