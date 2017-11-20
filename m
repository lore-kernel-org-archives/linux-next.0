From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] mm: fix nodemask printing
Date: Mon, 20 Nov 2017 12:33:20 +0100
Message-ID: <CAK8P3a2uUF1oR0c2+9v_RSTiepE7Ber2QfxJK-SuXV9ES41CTw@mail.gmail.com>
References: <CAK8P3a39FmdV+8dpGZ2ZDM_NWWmUwn9wGW53omLFibfnCfaHOQ@mail.gmail.com>
 <20171117101545.119689-1-arnd@arndb.de> <20171120082239.irwzcrxkfu3qggbh@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171120082239.irwzcrxkfu3qggbh@dhcp22.suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Hocko <mhocko@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Zhangshaokun <zhangshaokun@hisilicon.com>
List-Id: linux-next.vger.kernel.org

On Mon, Nov 20, 2017 at 9:22 AM, Michal Hocko <mhocko@kernel.org> wrote:
> On Fri 17-11-17 11:15:45, Arnd Bergmann wrote:
>> The cleanup caused build warnings for constant mask pointers:
>>
>> mm/mempolicy.c: In function =E2=80=98mpol_to_str=E2=80=99:
>> ./include/linux/nodemask.h:108:11: warning: the comparison will always e=
valuate as =E2=80=98true=E2=80=99 for the address of =E2=80=98nodes=E2=80=
=99 will never be NULL [-Waddress]
>>
>> An earlier workaround I suggested was incorporated in the version that
>> got merged, but that only solved the problem for gcc-7 and higher, while
>> gcc-4.6 through gcc-6.x still warn.
>>
>> This changes the printing again to use inline functions that make it
>> clear to the compiler that the line that does the NULL check has no
>> idea whether the argument is a constant NULL.
>>
>> Fixes: 0205f75571e3 ("mm: simplify nodemask printing")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Thanks for the fixup. It is sad how a questionable warning makes the
> code worse... Does it make sense to have the warning enabled?
> Gcc bug  [1] suggests there is no great interest into fixing it.
>
> Anyway to the patch
> Acked-by: Michal Hocko <mhocko@suse.com>
>
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D82963

I think I found some real bugs when I started seeing that warning elsewhere=
,
so I'd rather keep it enabled in general. I'd still agree that the gcc beha=
vior
in macros is questionable though, in particular since they decided to
stop warning for the "!=3D NULL" case. I've found the commit that changed
gcc-7 behavior and commented again in the bugzilla, but did not reopen.

The inline function was mentioned in bugzilla there[2] as the preferred
workaround.

       Arnd

[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D48778
