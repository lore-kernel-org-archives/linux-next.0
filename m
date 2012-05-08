From: Dave Airlie <airlied@gmail.com>
Subject: Re: linux-next: Tree for May 8 (gpu/drm/gma500)
Date: Tue, 8 May 2012 17:30:07 +0100
Message-ID: <CAPM=9tyNwWw+RfJ7e+XFTjQpN+xABB5ZJ0AqH5W8zfJ_L4e8-w@mail.gmail.com>
References: <20120508181531.072fdc5fefa60d852e784587@canb.auug.org.au>
	<4FA9496D.604@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:47805 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754628Ab2EHQaI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 8 May 2012 12:30:08 -0400
In-Reply-To: <4FA9496D.604@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>, Alan Cox <alan@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org

Adding Alan.

On Tue, May 8, 2012 at 5:27 PM, Randy Dunlap <rdunlap@xenotime.net> wro=
te:
> On 05/08/2012 01:15 AM, Stephen Rothwell wrote:
>
>> Hi all,
>>
>> There will be no linux-next tomorrow.
>>
>> Changes since 20120507:
>
>
>
> When CONFIG_ACPI is not enabled:
>
> drivers/gpu/drm/gma500/opregion.c:269:3: error: implicit declaration =
of function 'register_acpi_notifier'
> drivers/gpu/drm/gma500/opregion.c:288:3: error: implicit declaration =
of function 'unregister_acpi_notifier'
>
> --
> ~Randy
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
