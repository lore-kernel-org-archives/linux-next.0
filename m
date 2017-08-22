From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: linux-next: manual merge of the l2-mtd tree with the
 kbuild-current tree
Date: Tue, 22 Aug 2017 14:44:39 +0900
Message-ID: <CAK7LNATSmXg=6TycpQGZf0NEj64pBx0hUCc1v7p+0ShpWmzUXw@mail.gmail.com>
References: <20170822115614.1590b368@canb.auug.org.au> <20170822073701.34d77cc8@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170822073701.34d77cc8@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Brian Norris <computersforpeace@gmail.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org

Hi Boris,


2017-08-22 14:37 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.=
com>:
> Le Tue, 22 Aug 2017 11:56:14 +1000,
> Stephen Rothwell <sfr@canb.auug.org.au> a =C3=A9crit :
>
>> Hi Brian,
>>
>> Today's linux-next merge of the l2-mtd tree got a conflict in:
>>
>>   include/asm-generic/vmlinux.lds.h
>>
>> between commit:
>>
>>   cb87481ee89d ("kbuild: linker script do not match C names unless LD_DE=
AD_CODE_DATA_ELIMINATION is configured")
>
> Masahiro, according to this message [1], you queued the above patch to
> your fixes branch. Do you plan to send a fixes PR to Linus before
> -rc7?


Yes.  I am planning to do so.




> If that's the case I'll merge -rc7 in l2-mtd/master, otherwise
> I'll need an immutable branch.
>

--=20
Best Regards
Masahiro Yamada
