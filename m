From: Arnaud Lacombe <lacombar@gmail.com>
Subject: Re: [PATCH] Revert "kconfig: Temporarily disable dependency warnings"
Date: Thu, 25 Nov 2010 12:16:13 -0500
Message-ID: <AANLkTi=io3tsuL8Hd2a0y8PyBYYAzb-gkJo1GfmpcF+L@mail.gmail.com>
References: <20101011145930.11fe570c.randy.dunlap@oracle.com>
	<1286889586-13483-1-git-send-email-mmarek@suse.cz>
	<20101029113731.5c7c54b9.sfr@canb.auug.org.au>
	<20101122114801.2eee4c4d.sfr@canb.auug.org.au>
	<AANLkTikwxBZUupGNA-gsrxWYpyCKK7wiVZu82WaUST-K@mail.gmail.com>
	<20101122135715.121b5eb7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <20101122135715.121b5eb7.sfr@canb.auug.org.au>
Sender: linux-kbuild-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michal Marek <mmarek@suse.cz>, randy.dunlap@oracle.com, catalin.marinas@arm.com, linux-kbuild@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, xiyou.wangcong@gmail.com, Mauro Carvalho Chehab <mchehab@infradead.org>
List-Id: linux-next.vger.kernel.org

Hi,

On Sun, Nov 21, 2010 at 9:57 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi,
>
> On Sun, 21 Nov 2010 20:58:54 -0500 Arnaud Lacombe <lacombar@gmail.com=
> wrote:
>>
>> There is 2 patches which fixes that by adding to the kconfig languag=
e
>> a "visible" property to menus, 1 revert of "another" solution (which
>> works but does not scale) and 2 patch which makes usage of the new
>> property. Ack-ed and complemented by Mauro, but still waiting
>> review/blessing by Michal.
>>
>> The core change is available here: https://patchwork.kernel.org/patc=
h/306412/
>>
>> Alternatively, if you don't care about the menu structure, Randy
>> proposed a one-liner.
>
> OK, good to know it is being worked on. =A0Thanks.
>
=46YI, I withdrawn the patches and ask for them not to be merged[0], as
there is a clear lack of interest to see this issue resolved.

Mauro, may I ask you to remove my patches from:

git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-next.git
kconfig_fixes

please ?

Thanks,
 - Arnaud

[0]: cf. Message-id
<AANLkTi=3DWS6cveqzxVmwC2wucaCpEJJLHXx0A8XbAChRb@mail.gmail.com> on
linux-kbuild@
--
To unsubscribe from this list: send the line "unsubscribe linux-kbuild"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
