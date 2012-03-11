From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: fix for "error: implicit declaration of function 'devres_alloc'"
 in Mar9 tree
Date: Sun, 11 Mar 2012 12:09:39 -0400
Message-ID: <CAP=VYLoSgAdL6VzJE_gG0mFbb+cAjsEiHGp6gbhMo6Zx4=3dbA@mail.gmail.com>
References: <4F5A1DBC.3090701@windriver.com>
	<20120311124846.GA6081@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:61633 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752914Ab2CKQJl convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 11 Mar 2012 12:09:41 -0400
Received: by lbbgm6 with SMTP id gm6so729969lbb.19
        for <linux-next@vger.kernel.org>; Sun, 11 Mar 2012 09:09:39 -0700 (PDT)
In-Reply-To: <20120311124846.GA6081@opensource.wolfsonmicro.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-next@vger.kernel.org

On Sun, Mar 11, 2012 at 8:48 AM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Fri, Mar 09, 2012 at 10:11:56AM -0500, Paul Gortmaker wrote:
>
>> drivers/base/regmap/regmap.c:421: error: implicit declaration of fun=
ction 'dev_err'
>> make[4]: *** [drivers/base/regmap/regmap.o] Error 1
>
>> This is caused by commit 19694b5ea1d3 which just appeared in today's=
 next
>> tree exposing another implicit device.h user. =A0Just a quick note t=
hat I'll
>> take care of it by adding regmap.c to the below commit.
>
> No, it's not caused by that - in the subsystem tree there's an explic=
it
> inclusion of linux/device.h in the public header which is what is bei=
ng
> relied on here. =A0You've gone and deleted that inclusion without CCi=
ng
> the patch to the subsystem and now you're sending a fix again without=
 a
> CC to either me or the relevant list, and without even a mention in t=
he
> subject line.

We are talking about a trivial fix here, and the deletion was one of ab=
out
fifty similar one-line deletions in include/linux, of which many files =
don't
even have clear owners.  So, while I can appreciate you wanting a CC,
it just wasn't practical in this case in my opinion.

>
> In order to avoid bisection breakage I've applied one of the several
> fixes for this that were sent to me today, please drop your change.

I don't see how this avoids any bisection breakage -- you've now introd=
uced
a dependency that wasn't there before -- i.e. I would have to make sure
your change is present before my changes get pulled.  In any case I can
just ensure I have the exact same change as you and it will make sure
my series remains bisectable.

>
> This stuff would go a lot more smoothly if you were to at least let
> people know when you make changes, especially when issues introduced =
by
> your changes get noticed.

I've worked to get at least three different regulator regression fixes =
in,
None of those were related to any changes I made.  You were on the
to/CC of those fixes, and I even made changes as you requested.  My
point is that I do my best to follow implicit and explicit processes.  =
If
you've somehow come to conclude otherwise, I'm sorry to hear that.

Paul.
