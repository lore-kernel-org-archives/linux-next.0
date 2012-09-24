From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: linux-next: build failure after merge of the sound and sound-asoc
 trees
Date: Mon, 24 Sep 2012 10:52:17 +0300
Message-ID: <50601131.10602@ti.com>
References: <20120924133923.130c4db72aa8105cb5647d7a@canb.auug.org.au> <s5hy5jzoo8d.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from na3sys009aog105.obsmtp.com ([74.125.149.75]:53812 "EHLO
	na3sys009aog105.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754946Ab2IXHvN (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Sep 2012 03:51:13 -0400
Received: by oago6 with SMTP id o6so5125137oag.19
        for <linux-next@vger.kernel.org>; Mon, 24 Sep 2012 00:51:12 -0700 (PDT)
In-Reply-To: <s5hy5jzoo8d.wl%tiwai@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@ti.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 09/24/2012 10:48 AM, Takashi Iwai wrote:
> At Mon, 24 Sep 2012 13:39:23 +1000,
> Stephen Rothwell wrote:
>>
>> Hi all,
>>
>> After merging the sound tree, today's linux-next build (powerpc
>> ppc64_defconfig) failed like this:
>>
>> In file included from include/linux/skbuff.h:31:0,
>>                  from include/linux/if_ether.h:135,
>>                  from include/linux/netdevice.h:29,
>>                  from arch/powerpc/net/bpf_jit_comp.c:14:
>> include/linux/dmaengine.h: In function 'dmaengine_prep_dma_cyclic':
>> include/linux/dmaengine.h:659:24: error: 'flags' undeclared (first u=
se in this function)
>>
>> and lots more similar.
>>
>> Caused by commit ec8b5e48c037 ("dmaengine: Pass flags via
>> device_prep_dma_cyclic() callback").  Was this version of this patch
>> build tested at all?
>>
>> I have used the sound and sound-asoc trees from next-20120921 for to=
day.
>=20
> Ugh, sorry.  I skipped the ppc and arm build tests at the previous
> merge due to the remote work.
>=20
> I can fix up but it'd be better to get a proper fix from Peter.
> Peter, could you submit the fix ASAP?

I already have the series to fix it.
The reason for the build breakage is that the following commit from my =
series
got lost somewhere:
dmaengine: Add flags parameter to dmaengine_prep_dma_cyclic()

I also noticed that arch/arm/plat-samsung/dma-ops.c calls
dmaengine_prep_dma_cyclic(), which was unexpected for me. So I have two=
 patch
for linux-next/sound to fix the issue.

Will send them in a minute.

--=20
P=E9ter
