From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Update for drm-intel.git branches
Date: Tue, 3 Feb 2015 10:28:16 +0100
Message-ID: <CAKMK7uHhCVaODBoi_uSWt7eXe6P04YvwT9XboobaWUQ9VxPBVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ie0-f173.google.com ([209.85.223.173]:53619 "EHLO
	mail-ie0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751202AbbBCJ2R (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Feb 2015 04:28:17 -0500
Received: by mail-ie0-f173.google.com with SMTP id tr6so23798874ieb.4
        for <linux-next@vger.kernel.org>; Tue, 03 Feb 2015 01:28:16 -0800 (PST)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next <linux-next@vger.kernel.org>, "Nikula, Jani" <jani.nikula@linux.intel.com>

Hi Stephen,

I've renamed the topic/core-stuff branch to topic/drm-misc in the
drm-intel.git. I'll leave the old branch around until you've updated
your scripts, please reply when you've done that.

Another thing: Nowadays I have 2-3 special-purpose topic branches per
kernel release, and at least with some of them I think it would be
good to include them into linux-next. Would it be possible for your
scripts to pick up the list of -next branches to pick up dynamically
from some file? That would also simplify things with the
for-linux-next branch, which is an alias to different branches
depending upon where in the release cycle we are.

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
