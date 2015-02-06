From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: Update for drm-intel.git branches
Date: Fri, 6 Feb 2015 08:27:34 +0100
Message-ID: <CAKMK7uGDzks5o7+2z4ZH=gs0CgfJ5uuQ=o6bzTvNciDOaRXoPw@mail.gmail.com>
References: <CAKMK7uHhCVaODBoi_uSWt7eXe6P04YvwT9XboobaWUQ9VxPBVQ@mail.gmail.com>
	<20150204231211.56a8d446@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ig0-f173.google.com ([209.85.213.173]:65521 "EHLO
	mail-ig0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751143AbbBFH1f (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Feb 2015 02:27:35 -0500
Received: by mail-ig0-f173.google.com with SMTP id a13so551133igq.0
        for <linux-next@vger.kernel.org>; Thu, 05 Feb 2015 23:27:34 -0800 (PST)
In-Reply-To: <20150204231211.56a8d446@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next <linux-next@vger.kernel.org>, "Nikula, Jani" <jani.nikula@linux.intel.com>

On Wed, Feb 4, 2015 at 1:12 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> On Tue, 3 Feb 2015 10:28:16 +0100 Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>>
>> I've renamed the topic/core-stuff branch to topic/drm-misc in the
>> drm-intel.git. I'll leave the old branch around until you've updated
>> your scripts, please reply when you've done that.
>>
>> Another thing: Nowadays I have 2-3 special-purpose topic branches per
>> kernel release, and at least with some of them I think it would be
>> good to include them into linux-next. Would it be possible for your
>> scripts to pick up the list of -next branches to pick up dynamically
>> from some file? That would also simplify things with the
>> for-linux-next branch, which is an alias to different branches
>> depending upon where in the release cycle we are.
>
> I'll get back to you next week about this, OK?

Yeah, no problem.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
