From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Adding drm-intel-fixes branch to linux-next
Date: Tue, 9 Jul 2013 16:48:43 +0200
Message-ID: <CAKMK7uGTqticutONZqSoU4+tFS5q76HjFVrP-NteENLAYL4CVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ie0-f172.google.com ([209.85.223.172]:37985 "EHLO
	mail-ie0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753681Ab3GIOso (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Jul 2013 10:48:44 -0400
Received: by mail-ie0-f172.google.com with SMTP id 16so13052812iea.17
        for <linux-next@vger.kernel.org>; Tue, 09 Jul 2013 07:48:44 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next <linux-next@vger.kernel.org>, intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>

Hi Stephen

Can you please add the drm-intel-fixes branch to your linux-next tree
on top of the for-linux-next branch you've already included from my
drm-intel repo at git://people.freedesktop.org/~danvet/drm-intel ?

I'm asking since I've merged a patch to -fixes late in the 3.10 cycle
and despite that I've let it soak for almost two week in my -fixes
branch it readily blew up once 3.10 shipped. I think that the added
tester populace of linux-next could have prevented this gaffle. The
bug report for reference:

https://bugzilla.kernel.org/show_bug.cgi?id=60530

Note that atm for-linux-next points at the same commit as
drm-intel-fixes (since we're in the merge window), so adding this
branch shouldn't add new conflicts. I just want to be ready after -rc1
is tagged, since then I'll push our feature branch for 3.12 onto
for-linux-next, which will kick the patches on -fixes out of
linux-next.

Thanks, Daniel
--
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
