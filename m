From: Thomas Hellstrom <thellstrom@vmware.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the
 drm-misc-fixes tree
Date: Thu, 18 Jan 2018 22:18:48 +0100
Message-ID: <8151428f-6e14-4e2b-096f-e258bfb9c9b9@vmware.com>
References: <20180119072334.35583121@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-dm3nam03on0080.outbound.protection.outlook.com ([104.47.41.80]:34304
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753153AbeARVTK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 18 Jan 2018 16:19:10 -0500
In-Reply-To: <20180119072334.35583121@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi, Stephen,

That would be me.
I've historically only added my signed-off-by:s on commits I've (co-) 
authored myself, as the committer info is already registered,

But I take it that's not the correct approach?
/Thomas



On 01/18/2018 09:23 PM, Stephen Rothwell wrote:
> Hi all,
>
> Commit
>
>    8a510a5c7526 ("drm/vmwgfx: fix memory corruption with legacy/sou connectors")
>
> is missing a Signed-off-by from its committer.
>
