From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the mali-dp tree with the drm-misc
 tree
Date: Sat, 5 Nov 2016 03:55:03 +1100
Message-ID: <20161105035503.4e7f39a6@canb.auug.org.au>
References: <20161025112044.1a866eaa@canb.auug.org.au>
        <20161103171958.GA17265@e106497-lin.cambridge.arm.com>
        <20161104163854.2c416e21@canb.auug.org.au>
        <20161104154802.GC17265@e106497-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42941 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S964922AbcKDQzX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 4 Nov 2016 12:55:23 -0400
In-Reply-To: <20161104154802.GC17265@e106497-lin.cambridge.arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Brian Starkey <brian.starkey@arm.com>

Hi Liviu,

On Fri, 4 Nov 2016 15:48:02 +0000 Liviu Dudau <Liviu.Dudau@arm.com> wrote:
>
> Brian Starkey is a co-maintainer for the Mali DP tree, so his Signed-off-by
> alone should be good. Baoyou's patch is in my tree to stop him repeatedly
> send me the same patch over and over again :) But yes, I will add my
> Signed-off-by for that one.

Sorry, but this is not sufficient.  Please read section 11 of
Documentation/SubmittingPatches (or
Documentation/process/submitting-patches.rst where it has been moved
recently).  If you are in the path of a patch to Linus, you must add a
Signed-off-by line, and as the person who committed those patches to
the tree, you are in the path.
-- 
Cheers,
Stephen Rothwell
