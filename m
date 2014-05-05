From: Michele CURTI <michele.curti@gmail.com>
Subject: [PATCH v2 0/2] drm/radeon: use NULL instead of zero
Date: Mon, 5 May 2014 22:26:31 +0200
Message-ID: <20140505202631.GA404@ativ>
References: <20140503135512.GA17068@ativ>
 <A3397C8B8B789E45844E7EC5DEAD89D040EEF93D@satlexdag05.amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ee0-f42.google.com ([74.125.83.42]:59761 "EHLO
	mail-ee0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752411AbaEEU0f (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 5 May 2014 16:26:35 -0400
Received: by mail-ee0-f42.google.com with SMTP id d49so1711722eek.15
        for <linux-next@vger.kernel.org>; Mon, 05 May 2014 13:26:34 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <A3397C8B8B789E45844E7EC5DEAD89D040EEF93D@satlexdag05.amd.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>, "airlied@linux.ie" <airlied@linux.ie>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

This patches replace 0 with NULL when NULL pointers in radeon driver.
The first in object functions.
the second in clearstate headers.

Changes from v1:
- splitted in two separated patches

On Mon, May 05, 2014 at 12:53:58PM +0000, Deucher, Alexander wrote:
> > -----Original Message-----
> > From: Michele CURTI [mailto:michele.curti@gmail.com]
> > Sent: Saturday, May 03, 2014 9:55 AM
> > To: Deucher, Alexander; Koenig, Christian; airlied@linux.ie
> > Cc: linux-next@vger.kernel.org
> > Subject: [PATCH] drm/radeon: use NULL instead of zero
> > 
> > 
> > Use NULL instead of zero for NULL pointers
> > 
> > Signed-off-by: Michele Curti <michele.curti@gmail.com>
> 
> Can you break this into two patches?  One that changes that clearstate headers and one that changes object functions?
> 
> Thanks,
> 
> Alex
>

Sure!
Or at least, I'm going to try..
Michele
