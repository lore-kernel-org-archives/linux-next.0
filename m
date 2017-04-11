From: Paul Moore <paul@paul-moore.com>
Subject: Rebasing the audit/next tree
Date: Tue, 11 Apr 2017 14:14:00 -0400
Message-ID: <CAHC9VhSjMwOAHWk5nfegw_4NnA5LgX9W8jHOwc0jQZ4uJ5XqQA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vk0-f43.google.com ([209.85.213.43]:36134 "EHLO
        mail-vk0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752650AbdDKSOB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 11 Apr 2017 14:14:01 -0400
Received: by mail-vk0-f43.google.com with SMTP id s68so2708633vke.3
        for <linux-next@vger.kernel.org>; Tue, 11 Apr 2017 11:14:01 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-audit@redhat.com
Cc: linux-next@vger.kernel.org

Hello all,

This is notice that I'm going to be rebasing the audit/next tree.  I
don't like doing this outside the normal process, but we've got a few
patches in the queue which require it, and we've already had to rebase
the audit/stable-4.11 tree to deal with some locking/namespace issues.

The plan is to rebase the current audit/next branch on top of
audit/stable-4.11 (which is currently based on v4.11-rc3), and once
v4.11 is released, do a final audit/next rebase on top of v4.11 before
sending the patches to Linus.  I realize this will likely mess up the
linux-next commit tracking, but this is a rare event for the
linux-audit tree so I'll ask for some forgiveness here.

The normal weekly testing should be unaffected since I normally test
the audit/next and audit/stable branches on top of the latest -rcX
release.  In some way, this rebasing actually brings the branches
closer to what we actually test.

For those of you who have submitted patches that are still in the
queue, there is no need to resubmit your patches, I'll take care of
any merge conflicts that may arise.  If something proves to be
problematic, I may reach out to you for help in rebasing your patch,
but I don't think it will come to that.

Thanks for your understanding,
-Paul

-- 
paul moore
www.paul-moore.com
