From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: linux-next: build failure after merge of the wireless-drivers-next
 tree
Date: Tue, 19 Jul 2016 08:51:48 +0200
Message-ID: <CACna6rxVFD1MpAEYP_Zd4W8CvgnxSQpa0wJs83jwDJ5v11gZ=Q@mail.gmail.com>
References: <20160719160831.79c0303f@canb.auug.org.au> <8760s2w369.fsf@kamboji.qca.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8760s2w369.fsf@kamboji.qca.qualcomm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kalle Valo <kvalo@codeaurora.org>, Brian Norris <computersforpeace@gmail.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 19 July 2016 at 08:30, Kalle Valo <kvalo@codeaurora.org> wrote:
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
>
>> After merging the wireless-drivers-next tree, today's linux-next bui=
ld
>> (powerpc allyesconfig) failed like this:
>>
>> drivers/mtd/devices/bcm47xxsflash.c: In function 'bcm47xxsflash_bcma=
_probe':
>> drivers/mtd/devices/bcm47xxsflash.c:299:17: error: implicit declarat=
ion of function 'ioremap_cache' [-Werror=3Dimplicit-function-declaratio=
n]
>>   b47s->window =3D ioremap_cache(res->start, resource_size(res));
>>                  ^
>> drivers/mtd/devices/bcm47xxsflash.c:299:15: warning: assignment make=
s pointer from integer without a cast [-Wint-conversion]
>>   b47s->window =3D ioremap_cache(res->start, resource_size(res));
>>                ^
>>
>> Caused by commit
>>
>>   57d8f7dd2132 ("bcma: allow enabling serial flash support on non-MI=
PS SoCs")
>>
>> I have reverted that commit for today.
>
> Thanks, kbuild bot also notified about this.
>
> Rafa=C5=82, as the merge window is getting really close I would like =
to
> revert this for now and we can reapply it once we the problem is full=
y
> solved. And we can use my pending branch for build testing the patch
> with kbuild bot. What do you think?

The simplest fix sounds pretty much as simple as the revert. In the
seconds thread I was considering two fixes: switching to memremap and
adding depends on.

What about trying a simple "depends on"?

--=20
Rafa=C5=82
