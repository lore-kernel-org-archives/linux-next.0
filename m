From: Dave Airlie <airlied@gmail.com>
Subject: Re: currently missing kernel devel trees
Date: Thu, 13 Oct 2011 14:53:27 +0100
Message-ID: <CAPM=9tyWaL=ySxs=Zgfdde8Um4JbsB2Nem8Rsfaq7voLBv+Pqg@mail.gmail.com>
References: <20111013174358.b20fedb97c7b53db2ba82ff6@canb.auug.org.au>
	<CAPM=9tyuHeKgrh6iyJVUKF3rdy8-izwSJuJRBwCOSsz4DDsccQ@mail.gmail.com>
	<20111014003341.36bd655d41bf31804d720174@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:63273 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752635Ab1JMNx2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 13 Oct 2011 09:53:28 -0400
In-Reply-To: <20111014003341.36bd655d41bf31804d720174@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, Linus <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>

On Thu, Oct 13, 2011 at 2:33 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Dave,
>
> On Thu, 13 Oct 2011 13:36:01 +0100 Dave Airlie <airlied@gmail.com> wr=
ote:
>>
>> > drm
>> > agp
>>
>> git://people.freedesktop.org/~airlied/linux.git drm-next
>
> OK, I will switch to that. =A0 What should I do about the agp tree. I=
t just
> has three commits that are also in Linus' tree (as different commits)=
=2E
>

drop it, I've pretty much pushed agp via drm tree now.

Dave.
