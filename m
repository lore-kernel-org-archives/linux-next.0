From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commit in the
 drm-misc-fixes tree
Date: Fri, 19 Jan 2018 10:17:44 +1100
Message-ID: <20180119101744.56515cbf@canb.auug.org.au>
References: <20180119072334.35583121@canb.auug.org.au>
        <8151428f-6e14-4e2b-096f-e258bfb9c9b9@vmware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48307 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753881AbeARXRr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 18 Jan 2018 18:17:47 -0500
In-Reply-To: <8151428f-6e14-4e2b-096f-e258bfb9c9b9@vmware.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Hellstrom <thellstrom@vmware.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Thomas,

On Thu, 18 Jan 2018 22:18:48 +0100 Thomas Hellstrom <thellstrom@vmware.com> wrote:
>
> That would be me.
> I've historically only added my signed-off-by:s on commits I've (co-) 
> authored myself, as the committer info is already registered,
> 
> But I take it that's not the correct approach?

Please read "Developer's Certificate of Origin 1.1" in
Documentation/process/submitting-patches.rst.  Basically, if you handle
the patch on its way to Linus (e.g. commit it to a branch of a git tree
that Linus (or someone else along the path) merges) then you need to
add a Signed-off-by tag.

-- 
Cheers,
Stephen Rothwell
