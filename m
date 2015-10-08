From: Olof Johansson <olof@lixom.net>
Subject: Re: linux-next: build failure after merge of the chrome-platform tree
Date: Thu, 8 Oct 2015 16:43:55 -0700
Message-ID: <CAOesGMg6fFdYZTebdZq7Rb873064GT65_B+TWesw+HD1_63aVA@mail.gmail.com>
References: <20151008133443.1fde8318@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yk0-f171.google.com ([209.85.160.171]:33548 "EHLO
	mail-yk0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754852AbbJHXn4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Oct 2015 19:43:56 -0400
Received: by ykft14 with SMTP id t14so64361748ykf.0
        for <linux-next@vger.kernel.org>; Thu, 08 Oct 2015 16:43:55 -0700 (PDT)
In-Reply-To: <20151008133443.1fde8318@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio.lopez@collabora.co.uk>, Javier Martinez Canillas <javier@osg.samsung.com>

Stephen,

On Wed, Oct 7, 2015 at 7:34 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Olof,
>
> After merging the chrome-platform tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> drivers/platform/chrome/cros_ec_vbc.c:136:2: error: unknown field 'is_bin_visible' specified in initializer
>   .is_bin_visible = cros_ec_vbc_is_visible,
>   ^
>
> Caused by commit
>
>   01e7e432df74 ("platform/chrome: Support reading/writing the vboot context")
>
> I have used the chrome-platform tree from next-20151007 for today.

Yeah, sorry about that. I got notified by the 0-day builder but by the
time I had sorted it out you must already have pulled the tree.

Should be fine today.


-Olof
