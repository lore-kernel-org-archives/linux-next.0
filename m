From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: + drivers-mfd-twl-corec-wtf-isnt-this-fixed-yet.patch added to
 -mm tree
Date: Mon, 27 Feb 2012 15:09:18 -0700
Message-ID: <CACxGe6uA65Lgsk3nEzkhxDZPMLamaieykmwo6LcWp_o7DFeSBw@mail.gmail.com>
References: <20120224231044.753EC10004D@wpzn3.hot.corp.google.com>
 <20120224233124.GM25293@ponder.secretlab.ca> <4F4BC170.7060804@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-tul01m020-f174.google.com ([209.85.214.174]:63059 "EHLO
	mail-tul01m020-f174.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755783Ab2B0WJv convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Feb 2012 17:09:51 -0500
Received: by obcva7 with SMTP id va7so6021649obc.19
        for <linux-next@vger.kernel.org>; Mon, 27 Feb 2012 14:09:50 -0800 (PST)
In-Reply-To: <4F4BC170.7060804@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: akpm@linux-foundation.org, mm-commits@vger.kernel.org, b-cousson@ti.com, balajitk@ti.com, gg@slimlogic.co.uk, rob.herring@calxeda.com, sameo@linux.intel.com, linux-next@vger.kernel.org

On Mon, Feb 27, 2012 at 10:46 AM, Randy Dunlap <rdunlap@xenotime.net> w=
rote:
> On 02/24/2012 03:31 PM, Grant Likely wrote:
>
>> On Fri, Feb 24, 2012 at 02:27:28PM -0800, akpm@linux-foundation.org =
wrote:
>>>
>>> The patch titled
>>> =A0 =A0 =A0Subject: drivers/mfd/twl-core.c: wtf isn't this fixed ye=
t??
>>> has been added to the -mm tree. =A0Its filename is
>>> =A0 =A0 =A0drivers-mfd-twl-corec-wtf-isnt-this-fixed-yet.patch
>>>
>>> Before you just go and hit "reply", please:
>>> =A0 =A0a) Consider who else should be cc'ed
>>> =A0 =A0b) Prefer to cc a suitable mailing list as well
>>> =A0 =A0c) Ideally: find the original patch on the mailing list and =
do a
>>> =A0 =A0 =A0 reply-to-all to that, adding suitable additional cc's
>>>
>>> *** Remember to use Documentation/SubmitChecklist when testing your=
 code ***
>>>
>>> The -mm tree is included into linux-next and is updated
>>> there every 3-4 working days
>>
>> Hi Andrew,
>>
>> I've posted patchs to fix this today, and I'll push it out to my tre=
e
>> on the weekend so that Monday's linux-next will have this finally so=
lved.
>
>
> Did these patches get pushed??
>
> linux-next of 20120227 still has build errors in twl-core.c:
>
> drivers/mfd/twl-core.c:1237:2: error: implicit declaration of functio=
n 'irq_alloc_descs'
> drivers/mfd/twl-core.c:1332:3: error: implicit declaration of functio=
n 'of_platform_populate'
>
> on both i386 and x86_64.

I pushed it out, it is in linux-next, and next-20120227 built fine for
me.  Can you send me your .config?

g.
