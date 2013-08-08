From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2] drm: provide agp dummies for CONFIG_AGP=n
Date: Thu, 08 Aug 2013 15:15:25 -0600
Message-ID: <52040A6D.5020606@wwwdotorg.org>
References: <1375883595-10847-1-git-send-email-dh.herrmann@gmail.com> <1375993152-2143-1-git-send-email-dh.herrmann@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:41810 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966555Ab3HHVP2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 8 Aug 2013 17:15:28 -0400
In-Reply-To: <1375993152-2143-1-git-send-email-dh.herrmann@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Herrmann <dh.herrmann@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>, linux-next@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel@ffwll.ch>

On 08/08/2013 02:19 PM, David Herrmann wrote:
> We currently rely on gcc dead-code elimination so the drm_agp_* helpers
> are not called if drm_core_has_AGP() is false. That's ugly as hell so
> provide "static inline" dummies for the case that AGP is disabled.
> 
> Fixes a build-regression introduced by:
> 
>   commit 28ec711cd427f8b61f73712a43b8100ba8ca933b
>   Author: David Herrmann <dh.herrmann@gmail.com>
>   Date:   Sat Jul 27 16:37:00 2013 +0200
> 
>       drm/agp: move AGP cleanup paths to drm_agpsupport.c

Tested-by: Stephen Warren <swarren@nvidia.com>
