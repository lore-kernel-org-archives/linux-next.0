From: Jonathan Cameron <jic23@jic23.retrosnub.co.uk>
Subject: Re: linux-next: manual merge of the staging tree with the devicetree tree
Date: Fri, 20 Jan 2017 17:24:30 +0000
Message-ID: <5A9BB933-9031-45AF-BB92-BE94D30EF83D@jic23.retrosnub.co.uk>
References: <20170120135501.635768a2@canb.auug.org.au> <CAL_JsqJAzyk3JNwdf0Q8hQ3q29xa3S5YHAUyph7qHKaPpOGWEQ@mail.gmail.com> <20170120083022.GA28854@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from saturn.retrosnub.co.uk ([178.18.118.26]:58586 "EHLO
        saturn.retrosnub.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751217AbdATRZs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Jan 2017 12:25:48 -0500
In-Reply-To: <20170120083022.GA28854@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Rob Herring <robherring2@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Matt Ranostay <matt@ranostay.consulting>, Jonathan Cameron <jic23@kernel.org>



On 20 January 2017 08:30:22 GMT+00:00, Greg KH <greg@kroah.com> wrote:
>On Thu, Jan 19, 2017 at 09:17:01PM -0600, Rob Herring wrote:
>> On Thu, Jan 19, 2017 at 8:55 PM, Stephen Rothwell
><sfr@canb.auug.org.au> wrote:
>> > Hi Greg,
>> >
>> > Today's linux-next merge of the staging tree got a conflict in:
>> >
>> >   Documentation/devicetree/bindings/vendor-prefixes.txt
>> >
>> > between commit:
>> >
>> >   566088d1d2a0 ("devicetree: Add Fujitsu Ltd. vendor prefix")
>> >
>> > from the devicetree tree and commit:
>> >
>> >   9b27c270d403 ("devicetree: add Garmin vendor prefix")
>> >
>> > from the staging tree.
>> >
>> > I fixed it up (see below) and can carry the fix as necessary. This
>> > is now fixed as far as linux-next is concerned, but any non trivial
>> > conflicts should be mentioned to your upstream maintainer when your
>tree
>> > is submitted for merging.  You may also want to consider
>cooperating
>> > with the maintainer of the conflicting tree to minimise any
>particularly
>> > complex conflicts.
>> >
>> > --
>> > Cheers,
>> > Stephen Rothwell
>> >
>> > diff --cc Documentation/devicetree/bindings/vendor-prefixes.txt
>> > index 14fd1c24e1f0,b34463b12382..000000000000
>> > --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
>> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
>> > @@@ -107,7 -108,7 +108,8 @@@ firefly    Firefl
>> >   focaltech     FocalTech Systems Co.,Ltd
>> >   friendlyarm   Guangzhou FriendlyARM Computer Tech Co., Ltd
>> >   fsl   Freescale Semiconductor
>> >  +fujitsu       Fujitsu Ltd.
>> > + grmn  Garmin Limited
>> 
>> Ugg. This didn't get sorted correctly when changed from garmin to
>grmn...
>
>Ick, sorry I missed that, I'll go queue up a patch to fix it in the
>staging tree.
>
>greg k-h

Me too. Thanks for sorting!

-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.
