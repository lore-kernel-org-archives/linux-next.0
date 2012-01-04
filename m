From: Kay Sievers <kay.sievers@vrfy.org>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Date: Wed, 4 Jan 2012 01:07:52 +0100
Message-ID: <CAPXgP11yiS5hF9q3+A1tyORmtp=z2T6CWBUDFh3FhcL19jADpw@mail.gmail.com>
References: <20111228174518.721624fad9d048f9f85b3d50@canb.auug.org.au> <20120103162108.GC25909@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:51164 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755043Ab2ADAIN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Jan 2012 19:08:13 -0500
In-Reply-To: <20120103162108.GC25909@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>

On Tue, Jan 3, 2012 at 17:21, Greg KH <greg@kroah.com> wrote:
> On Wed, Dec 28, 2011 at 05:45:18PM +1100, Stephen Rothwell wrote:
>> Because of the powerpc problems above, I have used the driver-core tree
>> from next-20111222 for today.
>
> Sorry about all of the problems, we tried to fix everything we could,
> but your merges and cross-builds found stuff we missed :(
>
> Kay, care to send me patches to fix this, and all of the other
> linux-next-reported problems to me so we can get this resolved this
> week?

I rather don't want to add error checking to stuff that doesn't do it
today. The sysdev stuff never had that forced checks, but the normal
device stuff has.

I think the force return value check is really a pretty misguided idea
in general, and it's up to the caller to do these checks and handle
rollbacks, not the driver core, I think.

Can't we just remove that forced check?

Kay
