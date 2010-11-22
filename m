From: Arnaud Lacombe <lacombar@gmail.com>
Subject: Re: [PATCH] Revert "kconfig: Temporarily disable dependency warnings"
Date: Sun, 21 Nov 2010 20:58:54 -0500
Message-ID: <AANLkTikwxBZUupGNA-gsrxWYpyCKK7wiVZu82WaUST-K@mail.gmail.com>
References: <20101011145930.11fe570c.randy.dunlap@oracle.com>
	<1286889586-13483-1-git-send-email-mmarek@suse.cz>
	<20101029113731.5c7c54b9.sfr@canb.auug.org.au>
	<20101122114801.2eee4c4d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <20101122114801.2eee4c4d.sfr@canb.auug.org.au>
Sender: linux-kbuild-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michal Marek <mmarek@suse.cz>, randy.dunlap@oracle.com, catalin.marinas@arm.com, linux-kbuild@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, xiyou.wangcong@gmail.com, Mauro Carvalho Chehab <mchehab@infradead.org>
List-Id: linux-next.vger.kernel.org

Hi,

On Sun, Nov 21, 2010 at 7:48 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> On Fri, 29 Oct 2010 11:37:31 +1100 Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>>
>> On Tue, 12 Oct 2010 15:19:46 +0200 Michal Marek <mmarek@suse.cz> wro=
te:
>> >
>> > This reverts commit 71ebc01, which was a 2.6.36-only stopgap solut=
ion.
>>
>> I was hoping that we would have the number of these warnings down to
>> something reasonable before this revert made it into Linus' tree ...
>>
>> I guess fixing the V4L stuff will become a bit more urgent, now :-)
>
> Is there any chance that the V4L kconfig warnings will be fixed? =A0I=
t is
> quite irritating for those of us who do allmodconfig (and allyesconfi=
g)
> builds ...
>
There is 2 patches which fixes that by adding to the kconfig language
a "visible" property to menus, 1 revert of "another" solution (which
works but does not scale) and 2 patch which makes usage of the new
property. Ack-ed and complemented by Mauro, but still waiting
review/blessing by Michal.

The core change is available here: https://patchwork.kernel.org/patch/3=
06412/

Alternatively, if you don't care about the menu structure, Randy
proposed a one-liner.

 - Arnaud
--
To unsubscribe from this list: send the line "unsubscribe linux-kbuild"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
