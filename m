From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: Re: linux-next: build warning after merge of the drm tree
Date: Wed, 20 May 2015 20:49:34 +0900
Message-ID: <20150520114934.GA1346@swordfish>
References: <20150520165408.79369e40@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:35813 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752045AbbETLt7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 20 May 2015 07:49:59 -0400
Content-Disposition: inline
In-Reply-To: <20150520165408.79369e40@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

On (05/20/15 16:54), Stephen Rothwell wrote:
> After merging the drm tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/gpu/drm/drm_crtc.c:4324:13: warning: 'drm_property_unreference_blob_locked' defined but not used [-Wunused-function]
>  static void drm_property_unreference_blob_locked(struct drm_property_blob *blob)
>              ^
> 
> Introduced by commit 6bcacf51d050 ("drm: Add reference counting to blob
> properties").
> 
> This has been happening for a while.  I assumed a user for this new API
> would come along, but it hasn't ...

Hello Stephen,

http://mid.gmane.org/CAPj87rMPtafeYNzgXoP+fx0dAqhwaD7kdnJgqb_vdbPtiOrXPg@mail.gmail.com

	-ss
