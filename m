From: Mauro Carvalho Chehab <mchehab@redhat.com>
Subject: Re: linux-next: manual merge of the staging-next tree with the v4l-dvb
 tree
Date: Thu, 21 Oct 2010 08:58:16 -0200
Message-ID: <4CC01CC8.9030503@redhat.com>
References: <20101019171233.9f3e1dad.sfr@canb.auug.org.au> <20101019172331.89476ae0.sfr@canb.auug.org.au> <20101019155324.GJ4589@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:23977 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757030Ab0JUK61 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 21 Oct 2010 06:58:27 -0400
In-Reply-To: <20101019155324.GJ4589@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ruslan Pisarev <ruslanpisarev@gmail.com>, Gorskin Ilya <revent82@gmail.com>

Em 19-10-2010 13:53, Greg KH escreveu:
> On Tue, Oct 19, 2010 at 05:23:31PM +1100, Stephen Rothwell wrote:
>> Hi Greg,
>>
>> On Tue, 19 Oct 2010 17:12:33 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>
>>> Today's linux-next merge of the staging-next tree got a conflict in
>>> drivers/staging/cx25821/cx25821-audio-upstream.c between commit
>>> d6a0215fc954bd16a21bad94a3292f080d9f6f04 ("[media] Staging: cx25821: fix
>>> braces and space coding style issues") from the v4l-dvb tree and commit
>>> bb59a4c539140592723e806e852ee171da0eb3eb ("Staging: cx25821: clenup
>>> warnings found by checkpatch.pl tool in cx25821-audio-upstream.c and
>>> cx25821-audio.h") from the staging-next tree.
>>>
>>> Basically different versions of the same patch.  I fixed it up.
>>
>> Fixed conflicts in drivers/staging/cx25821/cx25821-audio.h as well.
> 
> Thanks for doing this, I appreciate it.

Thanks, Stephen. I had to rebase my tree, in order to fix a merge conflict, and
remove two broken patches. You'll likely need to preserve this patch until both me
and Greg send our trees upstream.

Cheers,
Mauro
