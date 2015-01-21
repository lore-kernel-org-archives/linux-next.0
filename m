From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: linux-next: manual merge of the mmc-uh tree with the sunxi tree
Date: Wed, 21 Jan 2015 14:42:44 +0100
Message-ID: <CAPDyKFqSVMRSGr09HbmjCqe8v=0jx=eJzEjmPVxQHJ=PekmvEg@mail.gmail.com>
References: <20150120141750.3dcade27@canb.auug.org.au>
	<CAPDyKFq4TyiadznYCM-dGmeu799vWevBt1XVZ4DALhv-3bP=AA@mail.gmail.com>
	<20150121121202.GF4367@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qa0-f45.google.com ([209.85.216.45]:33942 "EHLO
	mail-qa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752456AbbAUNmp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 21 Jan 2015 08:42:45 -0500
Received: by mail-qa0-f45.google.com with SMTP id n8so32875125qaq.4
        for <linux-next@vger.kernel.org>; Wed, 21 Jan 2015 05:42:44 -0800 (PST)
In-Reply-To: <20150121121202.GF4367@lukather>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?Q?David_Lanzend=C3=B6rfer?= <david.lanzendoerfer@o2s.ch>

On 21 January 2015 at 13:12, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> Hi,
>
> On Wed, Jan 21, 2015 at 12:27:09PM +0100, Ulf Hansson wrote:
>> On 20 January 2015 at 04:17, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> > Hi Ulf,
>> >
>> > Today's linux-next merge of the mmc-uh tree got a conflict in
>> > drivers/mmc/host/sunxi-mmc.c between commit 6c09bb851e57 ("mmc: sunxi:
>> > Convert MMC driver to the standard clock phase API") from the sunxi
>> > tree and commit 776e24c502da ("mmc: sunxi: Removing unused code") from
>> > the mmc-uh tree.
>> >
>> > I fixed it up (the former includes the latter change) and can carry the
>> > fix as necessary (no action is required).
>>
>> Maxime,
>>
>> I can't find the sunxi tree, is it listed in MAINTAINERS?
>
> No, it's not, I should probably add it :)
>
> It is here: https://git.kernel.org/cgit/linux/kernel/git/mripard/linux.git/
>
>> I know I have acked below patch, but that was quite a I while ago. Is
>> there any reason to why I can't take it through my mmc tree at this
>> point?
>> "mmc: sunxi: Convert MMC driver to the standard clock phase API".
>
> It still is needed to preserve bisectability, which is why you acked
> it in the first place. Otherwise, you would end up with a build
> breakage in the clock tree, because the mmc driver would still use the
> removed custom phase functions, and a failing MMC driver in your tree
> because the MMC clocks would not have the phase callbacks implemented.
>
> It's a pretty wide window of failure, and especially for the build
> breakage, I don't think it would be wise to split these patches.

Okay, I am fine with you taking the patch.

Kind regards
Uffe
