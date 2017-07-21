From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Date: Fri, 21 Jul 2017 21:01:59 +0200
Message-ID: <0e9187d2-7c7c-d531-0df6-839be9410eb9@redhat.com>
References: <20170719114657.245537cd@canb.auug.org.au>
 <20170721100833.48c8fa9d@canb.auug.org.au>
 <CAKMK7uHLY7jriTrZpxRFbjVf2mbdHymMw6HpW0NS0azf7Ea4Yw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:47594 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751504AbdGUTCC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 21 Jul 2017 15:02:02 -0400
In-Reply-To: <CAKMK7uHLY7jriTrZpxRFbjVf2mbdHymMw6HpW0NS0azf7Ea4Yw@mail.gmail.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Greg KH <greg@kroah.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi,

On 21-07-17 09:24, Daniel Vetter wrote:
> Hi Greg&Hans,
> 
> How are we going to handle this now? The refactor is deeply burried in
> drm-misc, I guess you could cherry-pick the relevant patches over. But
> that'll probably lead to more conflicts because git will get confused.
> 
> Or you could just delete the set_busid hook in -staging, which renders
> the driver unbisectable since it'll only work when merged together
> with the drm trees.

Removing the set_busid hook in staging (but only for -next, not
for -linus) is fine with me.

Regards,

Hans
