From: Arnaud Lacombe <lacombar@gmail.com>
Subject: Re: [PATCH] mm: add config NUMA stub to all architectures
Date: Sun, 19 Feb 2012 18:21:26 -0500
Message-ID: <CACqU3MUOojw0pwzOpPFB9YvA=BLODe+idWkqwA7NUAm-9114Rw@mail.gmail.com>
References: <4F3E42E0.4030108@openvz.org>
	<20120217120815.25909.15632.stgit@zurg>
	<20120217123037.ecfc5dd9.akpm@linux-foundation.org>
	<CAMuHMdUYCGoZoUHWMtMCwAJ2ofweaeLF3U89P5EvrNGcn=6apw@mail.gmail.com>
	<4F413B8D.5080307@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <4F413B8D.5080307@xenotime.net>
Sender: linux-kbuild-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, Konstantin Khlebnikov <khlebnikov@openvz.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi,

On Sun, Feb 19, 2012 at 1:12 PM, Randy Dunlap <rdunlap@xenotime.net> wr=
ote:
> On 02/19/2012 09:01 AM, Geert Uytterhoeven wrote:
>>
>> On Fri, Feb 17, 2012 at 21:30, Andrew Morton<akpm@linux-foundation.o=
rg>
>> =A0wrote:
>>>
>>> On Fri, 17 Feb 2012 16:08:15 +0400
>>> Konstantin Khlebnikov<khlebnikov@openvz.org> =A0wrote:
>>>
>>>> Config NUMA must be defined for all architectures,
>>>> otherwise IS_ENABLED(CONFIG_NUMA) does not work.
>>>> Some arch-specific Kconfig already has this stub.
>>>> This patch adds it to all remaining.
>>>
>>>
>>> It would be better to teach IS_ENABLED() to handle this situation. =
=A0I
>>> don't think there's a way of doing this with cpp :(
>>>
>>> This limitation makes IS_ENABLED pretty dangerous, doesn't it? =A0I=
t
>>> makes it very easy to introduce build breakage with unexpected Kcon=
fig
>>> combinations.
>>
>>
>> Indeed. Recently I discovered IS_ENABLED() and started recommending =
it
>> to people for new code. But now I've seen the CONFIG_NUMA breakage,
>> I no longer think this is a good recommendation.
>
> adding Michal & linux-kbuild to cc: list.
>
I do not really see any way to fix this, beside having a unique
architecture-wide configuration namespace :/

 - Arnaud
--
To unsubscribe from this list: send the line "unsubscribe linux-kbuild"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
