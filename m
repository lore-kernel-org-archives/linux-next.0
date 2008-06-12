From: "Will Newton" <will.newton@gmail.com>
Subject: Re: [ANNOUNCE] linux-staging tree created
Date: Thu, 12 Jun 2008 12:37:56 +0100
Message-ID: <87a5b0800806120437n23602ba5raae500f5bd3d179f@mail.gmail.com>
References: <20080610190540.GA25066@kroah.com>
	 <87a5b0800806110345v77529fc8r591f2fb4c95b5bdf@mail.gmail.com>
	 <20080611162639.GE22134@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from yw-out-2324.google.com ([74.125.46.30]:56454 "EHLO
	yw-out-2324.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751757AbYFLLh5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 Jun 2008 07:37:57 -0400
Received: by yw-out-2324.google.com with SMTP id 9so2181908ywe.1
        for <linux-next@vger.kernel.org>; Thu, 12 Jun 2008 04:37:57 -0700 (PDT)
In-Reply-To: <20080611162639.GE22134@kroah.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-kernel@vger.kernel.org, devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Wed, Jun 11, 2008 at 5:26 PM, Greg KH <greg@kroah.com> wrote:
> On Wed, Jun 11, 2008 at 11:45:55AM +0100, Will Newton wrote:
>>
>> Would the linux-staging tree be an appropriate place to merge a new
>> architecture? Or would that be too large a change and should go via
>> its own tree?
>
> That is probably too big to go into -staging and should deserve its own
> tree based on the size of patches that have gone into creating a new
> architecture in the past.

Our tree is about 26000 lines of diff, including a few drivers.

> Do you have an example of one that is currently not included in the main
> kernel tree right now?

I have a tree that is currently about half way to public consumption,
although I don't think there's any point pushing it until we have a
publically available toolchain.

> thanks,
>
> greg k-h
>
