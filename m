Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91431347FC8;
	Thu,  2 Jul 2026 18:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017602; cv=none; b=MCVhI3sBEf8yDkhKM15J5ETfGSerbKUvgAaV91YMaCiGAklwbkOZ2Nosn70XwHWKefuFJlguqlQtlqdXMm1HAxJgJkn6gVkh3Ic1JMGlOK6T9iTOcUldeEGatMMWXG9UP8uW55FB+u9U+H/njMSquJwMdXy0d68F29fwZzsB1es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017602; c=relaxed/simple;
	bh=A01a/RRvZqgvC9zbYX00bopybQTy5RMyQN9ZcQrD1pc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xeeyjdapw1PSBwcqA6ggvNDTv+AkiL9mzbNEpWF+LKnAe2LJiYNPQy29bS4g3Ic6KuEf3n9akgg6YBKIVP+1sSw3cWZHIUmUw83h6kII2nlEQly3szfUjDI/k9sAAEnN53e1fwUP2lokoCteJAc5PUXqU5xD7yomAyCdy0pl3Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=klEXNbsW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="klEXNbsW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C2271F000E9;
	Thu,  2 Jul 2026 18:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783017601;
	bh=J07DTfETXQvZZW8HLomqDHP3S2T9bymPoMv0xsdOpZY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=klEXNbsWX98EtdFJgGTnvepPjPMFPSQ4Vxy72j0L3fI9HFeAoWY6Je7Wkaz4EGSmm
	 bF528LCcnybygyea8Hu/PNw+VDx2HA0y3synC+3phbFvnrwN+M7ZS8FfUijgZKVdKQ
	 g5LcuATZbwvOdIXY2DeoHMDOJj7fZynTEuQClP10ERxv93AaWLYe4lOJ+c1VT+sjHa
	 kQDnl7gwIahKd/Lv98ZclGCdbfvVq+r3TumUT6l+iHrIrW1oW+II9c5OOIfVISVQDR
	 tMB2CE/GXcfnQcKmQ+0qVimzdyIR2a5VeA3LxKNUJVABsg5tWRT41MWdmsvJhspgoC
	 Wy6jNtwBKgffQ==
Date: Thu, 2 Jul 2026 19:39:56 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Miao Li <limiao@kylinos.cn>, Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>
Subject: Re: linux-next: manual merge of the device-id tree with the iio
 tree
Message-ID: <20260702193956.614504d1@jic23-huawei>
In-Reply-To: <akajRDPG1mkYFL9K@sirena.org.uk>
References: <akajRDPG1mkYFL9K@sirena.org.uk>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 2 Jul 2026 18:43:32 +0100
Mark Brown <broonie@kernel.org> wrote:

> Hi all,
> 
> Today's linux-next merge of the device-id tree got a conflict in:
> 
>   drivers/iio/accel/stk8ba50.c
> 
> between commit:
> 
>   e8de771d80a3a ("iio: accel: stk8ba50: Update includes to match IWYU")
> 
> from the iio tree and commit:
> 
>   80f98bb4f07ea ("Replace <linux/mod_devicetable.h> by more specific <linux/device-id/*.h> (c files)")
> 
> from the device-id tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks.  That header drop patch is likely to cause quite a lot of context
and minor merge conflicts. I guess that'll resolve if anyone affected
merges in rc2 once available.

Jonathan

> 
> diff --cc drivers/iio/accel/stk8ba50.c
> index 4bacc007897ae,d0c53b8ac850a..0000000000000
> --- a/drivers/iio/accel/stk8ba50.c
> +++ b/drivers/iio/accel/stk8ba50.c
> @@@ -7,19 -7,11 +7,18 @@@
>    * STK8BA50 7-bit I2C address: 0x18.
>    */
>   
>  +#include <linux/array_size.h>
>  +#include <linux/bitops.h>
>  +#include <linux/dev_printk.h>
>  +#include <linux/errno.h>
>   #include <linux/i2c.h>
>   #include <linux/interrupt.h>
>  -#include <linux/kernel.h>
>   #include <linux/module.h>
> - #include <linux/mod_devicetable.h>
>  +#include <linux/mutex.h>
>  +#include <linux/pm.h>
>  +#include <linux/sysfs.h>
>   #include <linux/types.h>
>  +
>   #include <linux/iio/buffer.h>
>   #include <linux/iio/iio.h>
>   #include <linux/iio/sysfs.h>

