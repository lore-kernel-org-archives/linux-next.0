From: Cong Wang <amwang@redhat.com>
Subject: Re: Please add my tree to linux-next
Date: Mon, 05 Dec 2011 14:52:50 +0800
Message-ID: <4EDC6A42.1090806@redhat.com>
References: <4ED8529E.5070608@redhat.com>	<20111205100930.1bedc458a5e78b85c563465d@canb.auug.org.au>	<4EDC594D.5040008@redhat.com> <20111205171207.3b3bc1ad6d99ad7d7c9c0792@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:41337 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751398Ab1LEGxF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 5 Dec 2011 01:53:05 -0500
In-Reply-To: <20111205171207.3b3bc1ad6d99ad7d7c9c0792@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

=E4=BA=8E 2011=E5=B9=B412=E6=9C=8805=E6=97=A5 14:12, Stephen Rothwell =E5=
=86=99=E9=81=93:
> Hi,
> On Mon, 05 Dec 2011 13:40:29 +0800 Cong Wang<amwang@redhat.com>  wrot=
e:
>>
>>>        * submitted under GPL v2 (or later) and include the Contribu=
tor's
>>> 	Signed-off-by,
>>
>> When I sent the patches out, they all have my Signed-off-by, but not=
 in the
>> commit logs in my tree. Is this a problem?
>
> Yes, you must have a signed-off-by line for each person who handles t=
he
> patches (in this case just you, since you are also the author).
> Linus (in theory) would not merge your tree if you asked him to if it
> lacked signed-off-by lines (and I will have to drop it if they are no=
t
> added - this will mean rebasing your tree, of course).
>

Ok, I will re-commit those patches with my S-o-b and rebase my tree.

Thanks!
