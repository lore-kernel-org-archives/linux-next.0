From: Kay Sievers <kay.sievers@vrfy.org>
Subject: Re: linux-next: driver-core tree build failure
Date: Mon, 26 Jan 2009 13:19:42 +0100
Message-ID: <ac3eb2510901260419v66c329e6rbe16fca4752fa688@mail.gmail.com>
References: <20090126115044.0b2e3936.sfr@canb.auug.org.au>
	 <20090126011007.GA24070@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nf-out-0910.google.com ([64.233.182.189]:24103 "EHLO
	nf-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751305AbZAZMTn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 26 Jan 2009 07:19:43 -0500
Received: by nf-out-0910.google.com with SMTP id d3so1010454nfc.21
        for <linux-next@vger.kernel.org>; Mon, 26 Jan 2009 04:19:42 -0800 (PST)
In-Reply-To: <20090126011007.GA24070@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Mon, Jan 26, 2009 at 02:10, Greg KH <greg@kroah.com> wrote:
> On Mon, Jan 26, 2009 at 11:50:44AM +1100, Stephen Rothwell wrote:

>> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
>>
>> arch/powerpc/platforms/ps3/system-bus.c: In function 'ps3_system_bus_probe':
>> arch/powerpc/platforms/ps3/system-bus.c:379: error: 'struct device' has no member named 'bus_id'
>> arch/powerpc/platforms/ps3/system-bus.c: In function 'ps3_system_bus_remove':
>> arch/powerpc/platforms/ps3/system-bus.c:401: error: 'struct device' has no member named 'bus_id'
>>
>> Caused by commit aab0d375e01d8c16e7e5b9bd915dfaa0a815418f ("powerpc:
>> struct device - replace bus_id with dev_name(), dev_set_name()") not
>> being thorough enough before commit
>> 73babb2d89a71d2110b65aab658e6309748827c2 ("driver core: get rid of struct
>> device's bus_id string array") was applied.
>>
>> I have reverted the latter commit.
>
> Gotta love the ps3 platform code, there is about 3 different fields
> called "bus_id" in that file :(

Yeah, that's "fun", especially if you don't have the environment to
compile it. :)

> Anyway, here's a patch that should fix this, Kay, look sane?

Looks fine, yes.

Thanks,
Kay
