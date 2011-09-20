From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH -next] bcma: needs export.h
Date: Tue, 20 Sep 2011 20:45:57 +0200
Message-ID: <CACna6rxGrd-ORWZrc0xsAOKptU_Xj3eGh9qSfX9vJYCPTZrCRg@mail.gmail.com>
References: <20110920173102.d38155c7defbbc29beaae7c0@canb.auug.org.au>
	<4E78CFC0.4020003@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4E78CFC0.4020003@xenotime.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>, Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

2011/9/20 Randy Dunlap <rdunlap@xenotime.net>:
> From: Randy Dunlap <rdunlap@xenotime.net>
>
> bcma/driver_chipcommon_pmu.c needs to include <linux/export.h>,
> so add it to the headers that are included by bcma_private.h.

Please take a look at discussion in:
[PATCH -next] bcma: main.c needs to include <linux/slab.h>
thread (by Andrew).

I believe that according to the discussion, such a includes should be
done in .c files.

Andrew: can you comment? Am I right?

--=20
Rafa=C5=82
