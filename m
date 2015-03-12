From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: linux-next: Tree for Mar 11 (arm build failure, ASoC)
Date: Thu, 12 Mar 2015 08:53:19 +0200
Message-ID: <550137DF.2050503@ti.com>
References: <20150311163558.6a09cfcc@canb.auug.org.au> <20150311155154.GA22446@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150311155154.GA22446@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
List-Id: linux-next.vger.kernel.org

Hi,

On 03/11/2015 05:51 PM, Guenter Roeck wrote:
> On Wed, Mar 11, 2015 at 04:35:58PM +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20150310:
>>
>> New tree: drm-exynos
>>
>> The sound-asoc tree still had its build failure so I used the versio=
n from
>> next-20150306.
>>
>> The regulator tree lost its build failure.
>>
>> The tip tree gained a conflict against the usb-gadget-fixes tree.
>>
>> The staging tree lost its build failure.
>>
>> Non-merge commits (relative to Linus' tree): 3446
>>  3448 files changed, 138744 insertions(+), 73083 deletions(-)
>>
>> --------------------------------------------------------------------=
--------
>>
> Building arm:omap2plus_defconfig ... failed
> --------------
> Error log:
> sound/soc/davinci/davinci-mcasp.c: In function 'davinci_mcasp_suspend=
':
> sound/soc/davinci/davinci-mcasp.c:1062:2: error: expected ';' before =
'if'
>=20
> Caused by 6afda7f507 ("ASoC: davinci-mcasp: Allow complete shutdown o=
f McASP
> when not in use"). Yes, there is a missing ';' in that code.

The fix for this should have been already in linux-next since Mark has =
it in
his for-next branch:
http://git.kernel.org/cgit/linux/kernel/git/broonie/sound.git/commit/?h=
=3Dfor-next&id=3D66e618857ca46433741bf97ceca1b425387400b1

The patch has been sent on 6th of March and applied:
http://mailman.alsa-project.org/pipermail/alsa-devel/2015-March/088726.=
html

--=20
P=E9ter
