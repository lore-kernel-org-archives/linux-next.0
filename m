From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH 07/11] sh: fix several build failures from system.h fallout
Date: Wed, 4 Apr 2012 22:49:30 -0400
Message-ID: <CAP=VYLpxEvcQv=AOZCU46PQrVn04MC7_Jhodba9z-mmj9XamSw@mail.gmail.com>
References: <1333312727-11428-1-git-send-email-paul.gortmaker@windriver.com>
	<1333312727-11428-8-git-send-email-paul.gortmaker@windriver.com>
	<20120402010048.GA21647@linux-sh.org>
	<4F79ECD9.6000108@windriver.com>
	<20120403095754.a70f38eb70766580843debc7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:46287 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752488Ab2DECtc convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Apr 2012 22:49:32 -0400
In-Reply-To: <20120403095754.a70f38eb70766580843debc7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Mundt <lethal@linux-sh.org>, dhowells@redhat.com, torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

[sorry for empty mail, pilot error]

On Mon, Apr 2, 2012 at 7:57 PM, Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:

>
> I used to have sh-current and sh trees (and rmobile-current and rmobi=
le)
> trees in linux-next, but they have not been resurrected since the
> kernel.org problems last year ...
>
> They were all branches of
> git://git.kernel.org/pub/scm/linux/kernel/git/lethal/sh-2.6.git which=
 is
> still listed in MAINTAINERS but does not exist :-(
>
> Paul M, to you have an alternate place I can fetch from?

Hi Paul M.

Is this the tree Stephen should be using in linux-next?

        git://github.com/pmundt/linux-sh.git sh-latest

Thanks,
Paul G.


> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
