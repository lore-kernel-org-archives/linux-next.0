From: Thomas Hellstrom <thellstrom@vmware.com>
Subject: Re: linux-next: manual merge of the drm-misc tree with Linus' tree
Date: Mon, 14 Dec 2015 08:09:23 +0100
Message-ID: <566E6B23.8090306@vmware.com>
References: <20151214121205.7323fbd7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp-outbound-2.vmware.com ([208.91.2.13]:37584 "EHLO
	smtp-outbound-2.vmware.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752517AbbLNHJ2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Dec 2015 02:09:28 -0500
In-Reply-To: <20151214121205.7323fbd7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 12/14/2015 02:12 AM, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the drm-misc tree got conflicts in:
>
>   drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
>   drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
>   drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
>
> between commit:
>
>   8fbf9d92a7bc ("drm/vmwgfx: Implement the cursor_set2 callback v2")
>
> from Linus' tree and commit:
>
>   f80de66eca65 ("drm/vmwgfx: Drop dummy save/restore hooks")
>
> from the drm-misc tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
>
FWIW, the fix looks correct to me.

/Thomas
