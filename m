From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: linux-next not booting on snowball
Date: Thu, 01 Dec 2011 16:34:55 +0100
Message-ID: <4ED79E9F.7060103@linaro.org>
References: <4ED79454.1090304@linaro.org> <20111201145801.GB2103@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:33023 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755100Ab1LAPfB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 1 Dec 2011 10:35:01 -0500
Received: by bkas6 with SMTP id s6so2562279bka.19
        for <linux-next@vger.kernel.org>; Thu, 01 Dec 2011 07:35:00 -0800 (PST)
In-Reply-To: <20111201145801.GB2103@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Lists Linaro-dev <linaro-dev@lists.linaro.org>, Stephen Warren <swarren@nvidia.com>, Kevin Hilman <khilman@ti.com>, Jamie Iles <jamie@jamieiles.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 12/01/2011 03:58 PM, Mark Brown wrote:
> On Thu, Dec 01, 2011 at 03:51:00PM +0100, Daniel Lezcano wrote:
> 
>> commit 549158d2ab01e8370d2773044fe09738a26f7086
>> Author: Nicolas Pitre <nicolas.pitre@linaro.org>
>> Date:   Thu Aug 25 00:35:59 2011 -0400
> 
>>     ARM: move iotable mappings within the vmalloc region
>>    
>>     In order to remove the build time variation between different SOCs
>> with
>>     regards to VMALLOC_END, the iotable mappings are now allocated inside
>>     the vmalloc region.  This allows for VMALLOC_END to be identical
>> across
>>     all machines.
> 
> I recently reported an issue with this patch on s3c64xx which I'm
> avoiding with the below change, I believe Nicolas folded this in to his
> code but it's not propagated into -next yet.
> 
> From d53e2ce3fb18e097678b324932591044eb80c0f1 Mon Sep 17 00:00:00 2001
> From: Mark Brown <broonie@opensource.wolfsonmicro.com>
> Date: Thu, 24 Nov 2011 12:46:04 +0000
> Subject: [PATCH] ARM: Handle empty maps in iotable_init()
> 
> Some CPUs (such as the S3C6410) have been relying on being able to call
> iotable_init() with no io_descs in order to simplify passing through
> machine-specific io_descs. The changes in "ARM: move iotable mappings
> within the vmalloc region" broke this by adding an early_alloc_aligned()
> for an array of vm_structs. Fix this by returning early if no descriptors
> have been passed.
> 
> I'm not sure if this is the most tasteful fix but it preserves existing
> behaviour and allows boot to proceed on my system.
> 
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
>  arch/arm/mm/mmu.c |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mm/mmu.c b/arch/arm/mm/mmu.c
> index 06e2aef..94c5a0c 100644
> --- a/arch/arm/mm/mmu.c
> +++ b/arch/arm/mm/mmu.c
> @@ -763,6 +763,9 @@ void __init iotable_init(struct map_desc *io_desc, int nr)
>  	struct map_desc *md;
>  	struct vm_struct *vm;
>  
> +	if (!nr)
> +		return;
> +
>  	vm = early_alloc_aligned(sizeof(*vm) * nr, __alignof__(*vm));
>  
>  	for (md = io_desc; nr; md++, nr--) {

Thanks for the patch Mark. I applied it and tried to boot but the kernel
is still stuck on the same place :(


- -- 
 <http://www.linaro.org/> Linaro.org ? Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJO156fAAoJEAKBbMCpUGYAZK4H/iCGIqc7pYPllJbO4b4JU6FB
iTIXCeNrLZIxoqgugTQTru/6ISX/Rc3jjXIXrmu7NRjN5V+C0IzpJzRj5x4X/ysJ
xOU+65pKZ2z9D+BnkXADKYZCM6Zlqnf4qtMFLGHC1Ki1QK6HwMmReYUDEJc/7V3z
b1jXlql88Lgex9iFo73VKHn+ww8E/8OWyeutyTUIw9kvrlVaXQy6mF87rOPtS3gP
HCENMMwtEKUlHPrVBDA/MRQDF0iWKQl0aDKlmJBL3HivoAVlmhr1H6m260dkWo1w
dQUfTG7XbBWN3xg2JQ9Bp2KpTl4VvCyEJl9k0ymlcim00+l+dQySpaeC+LCKkG0=
=x1Qh
-----END PGP SIGNATURE-----
