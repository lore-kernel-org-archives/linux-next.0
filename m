From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: manual merge of the moduleh tree with Linus' tree
Date: Tue, 2 Aug 2011 13:17:49 -0400
Message-ID: <CAP=VYLq5p0KD5QW-Ae3=MQojcBSGdngbVwbCC_iyh_VzkPkxGA@mail.gmail.com>
References: <20110802145237.e8b90cff7f6954f6a12d8b3b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:45451 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754262Ab1HBRRu convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Aug 2011 13:17:50 -0400
In-Reply-To: <20110802145237.e8b90cff7f6954f6a12d8b3b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>

On Tue, Aug 2, 2011 at 12:52 AM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Paul,
>
> Today's linux-next merge of the moduleh tree got a conflict in
> drivers/video/omap2/dss/rfbi.c between commit 24e6289c029b ("OMAP: DS=
S2:
> remove extra includes from include/video/omapdss.h") from Linus' tree=
 and
> commit 06e632e042aa ("video: Add export.h for THIS_MODULE/EXPORT_SYMB=
OL
> to drivers/video") from the moduleh tree.
>
> Just overlapping additions. =A0I fixed it up (see below) and can carr=
y the
> fix as necessary.

I was making some cosmetic changes to commit logs (such as adding Acked=
-by
etc) and so took the opportunity to just relocate the export.h
addition up higher
and out of the way, which should make this go away for you/Linus.

Thanks for the heads up,
Paul.

> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
>
> diff --cc drivers/video/omap2/dss/rfbi.c
> index 39f4c59,5dbd229..0000000
> --- a/drivers/video/omap2/dss/rfbi.c
> +++ b/drivers/video/omap2/dss/rfbi.c
> @@@ -33,8 -33,7 +33,9 @@@
> =A0#include <linux/hrtimer.h>
> =A0#include <linux/seq_file.h>
> =A0#include <linux/semaphore.h>
> =A0+#include <linux/platform_device.h>
> =A0+#include <linux/pm_runtime.h>
> + #include <linux/export.h>
>
> =A0#include <video/omapdss.h>
> =A0#include "dss.h"
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
>
