From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the arm-soc tree
Date: Mon, 16 Jul 2018 02:13:55 -0700
Message-ID: <6a9fa6f3-7aef-a83b-72a6-dc9492964b5e@gmail.com>
References: <20180716075718.4e5ef491@canb.auug.org.au>
 <CAOesGMhVeo6Wc=nMcEnusa+FfwQBWJnxs0LY-zXm4HMau+SMhg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOesGMhVeo6Wc=nMcEnusa+FfwQBWJnxs0LY-zXm4HMau+SMhg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eric Anholt <eric@anholt.net>
List-Id: linux-next.vger.kernel.org



On 07/15/2018 03:50 PM, Olof Johansson wrote:
> Thanks Stephen, I keep saying every time you catch these that I need
> to run the same script. :(
> 
> Florian, I wonder if this happened when you rebased to squash in the fix?

Humm, could be, all I did (and it was not the first time) was to do an
interactive rebase with --preserve-merges. AFAICT, all of these commits
came from Eric's pull request, so what I typically do is just sign off
on the merge commit, but do not apply my SoB to all commits coming from
that pull request if that makes sense?

> 
> I'll figure out where to get this into my workflow so we catch it
> before I merge from now on.
> 
> 
> -Olof
> 
> On Sun, Jul 15, 2018 at 2:57 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Hi all,
>>
>> Commits
>>
>>   b8ccf02a5014 ("ARM: dts: bcm283x: Add the PMU to the devicetree.")
>>   b7dd29b401f5 ("ARM: dts: bcm283x: Add Transposer block")
>>   74d1e007915f ("hwmon: Add support for RPi voltage sensor")
>>   70eea1bbb556 ("firmware: raspberrypi: Register hwmon driver")
>>   a1547e0bca51 ("firmware: raspberrypi: Remove VLA usage")
>>
>> are missing a Signed-off-by from their committer.
>>
>> --
>> Cheers,
>> Stephen Rothwell

-- 
Florian
