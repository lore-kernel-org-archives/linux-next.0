From: Pekka Enberg <penberg@kernel.org>
Subject: Re: linux-next: Tree for March 1 (staging/winbond)
Date: Tue, 1 Mar 2011 21:10:23 +0200
Message-ID: <AANLkTimX0zvBEMxedXnhXiaxwEKHmm_Tu6fiZQkahZrC@mail.gmail.com>
References: <20110301181119.f1c7a9c3.sfr@canb.auug.org.au>
	<20110301104924.071044ef.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yi0-f46.google.com ([209.85.218.46]:44483 "EHLO
	mail-yi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752651Ab1CATKY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Mar 2011 14:10:24 -0500
In-Reply-To: <20110301104924.071044ef.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, gregkh@suse.de

On Tue, Mar 1, 2011 at 8:49 PM, Randy Dunlap <randy.dunlap@oracle.com> =
wrote:
> On Tue, 1 Mar 2011 18:11:19 +1100 Stephen Rothwell wrote:
>
>> Hi all,
>>
>> Changes since 20110228:
>
>
> commit ddee7e28e7d5e4ba2b8537c6a59b035745c250bb
> Author: Pekka Enberg <penberg@kernel.org>
> Date: =A0 Sun Nov 28 23:00:01 2010 +0200
> =A0 =A0Staging: w35und: Remove empty sysdef.h header
>
>
> This header should not have been empty, since in
>
> commit 412dc7f368bf10a8049a8a4c41abbfd0108742e7
> Author: Randy Dunlap <randy.dunlap@oracle.com>
> Date: =A0 Fri Nov 19 09:30:18 2010 -0800
> =A0 =A0staging: fix winbond build, needs delay.h
>
> I added delay.h to it. =A0And now we have the same build
> errors that I fixed last November:
>
> drivers/staging/winbond/phy_calibration.c:986: error: implicit declar=
ation of function 'msleep'
> drivers/staging/winbond/phy_calibration.c:1555: error: implicit decla=
ration of function 'udelay'
> drivers/staging/winbond/reg.c:893: error: implicit declaration of fun=
ction 'msleep'
> drivers/staging/winbond/reg.c:1169: error: implicit declaration of fu=
nction 'udelay'

Strange. I didn't see the problem. We should add delay.h to
phy_calibration.c and reg.c instead. Care to make a patch?
