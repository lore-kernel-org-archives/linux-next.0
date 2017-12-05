From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the drm tree
Date: Tue, 05 Dec 2017 11:36:07 +0200
Message-ID: <4577922.FDR3KI3HOI@avalon>
References: <20171205134550.58e1f217@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:47493 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753165AbdLEJfx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Dec 2017 04:35:53 -0500
In-Reply-To: <20171205134550.58e1f217@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Biju Das <biju.das@bp.renesas.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Hi Stephen,

On Tuesday, 5 December 2017 04:45:50 EET Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   36a46da90212 ("drm: rcar-du: Add R8A7743 support")
>   cdd907001572 ("drm: rcar-du: Add R8A7745 support")
>   7912dee7775e ("drm: rcar-du: Implement system suspend/resume support")
>   cf05f74ef40e ("drm: rcar-du: Remove unused CRTC suspend/resume functions")
> 
> are missing a Signed-off-by from their committer.

I've sent lots of pull requests to maintainers in the past where I have picked 
patches signed off by the original author without any further modification and 
only added my Acked-by or Reviewed-by line. I thought this was an accepted 
practice as nobody ever complained, but I'll make sure to always include my 
SoB for any patch that goes through my tree in the future. I'm sorry about 
this, it's all my fault.

-- 
Regards,

Laurent Pinchart
