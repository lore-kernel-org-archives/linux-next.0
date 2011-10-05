From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: Changed location for arm-lpae/for-next
Date: Wed, 5 Oct 2011 18:04:56 +0100
Message-ID: <CAHkRjk7YBJJO9HW3JC0AUT2-JTyMwj=4=zd==dSG=pfBvCiFNg@mail.gmail.com>
References: <20111004132614.GA13865@e102109-lin.cambridge.arm.com> <20111005120621.46c24fe4b8f83ac78944b777@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20111005120621.46c24fe4b8f83ac78944b777@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Russell King <rmk@arm.linux.org.uk>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On 5 October 2011 02:06, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> On Tue, 4 Oct 2011 14:26:14 +0100 Catalin Marinas <catalin.marinas@ar=
m.com> wrote:
>>
>> Since I don't know when I'll get my account back on kernel.org, I
>> re-instated my tree on linux-arm.org. Could you please pull this tre=
e
>> instead of arm-lpae/for-next:
>>
>> =A0 git://linux-arm.org/linux-2.6.git for-next
>
> OK, I have switched to that from today. =A0However, that site is also
> inaccessible today :-(

Ah, sorry about that, some IT issues again (looks fine internally). If
you don't mind to change them again, I created two branches on github,
the first one for LPAE and the other for kmemleak:

git://github.com/cmarinas/linux.git for-next
git://github.com/cmarinas/linux.git kmemleak

Thanks.

--=20
Catalin
