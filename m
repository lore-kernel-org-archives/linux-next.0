From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the drm tree
Date: Thu, 21 Dec 2017 13:40:28 +0200
Message-ID: <eb09f263-0097-9041-0a6b-74b1033e0648@ti.com>
References: <20171221161243.22a1b5ce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from lelnx193.ext.ti.com ([198.47.27.77]:65355 "EHLO
        lelnx193.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751403AbdLULkk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Dec 2017 06:40:40 -0500
In-Reply-To: <20171221161243.22a1b5ce@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi,

On 21/12/17 07:12, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>    bb5cdf8d1c76 ("drm: omapdrm: Remove filename from header and fix copyright tag")
>    d66c36a3ee79 ("drm: omapdrm: Simplify platform registration")
> 
> are missing a Signed-off-by from their committer.

Sorry about that, I missed those.

I think I need to create a script to verify my pull requests for things 
like this...

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. 
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
