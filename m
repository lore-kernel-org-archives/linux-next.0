From: Stewart Smith <stewart@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Date: Tue, 18 Mar 2014 11:07:32 +1100
Message-ID: <87pplkgyij.fsf@river.i-did-not-set--mail-host-address--so-tickle-me>
References: <20140312005152.9ac4063f65dbd233f5d50b4d@kernel.org> <20140312015021.GC10106@kroah.com> <20140317101611.d043a90e1cb72dcfb8bc767a@canb.auug.org.au> <20140317183333.GE10565@kroah.com> <1395088410.15098.175.camel@pasglop> <20140317215619.GA25228@kroah.com> <20140317220554.GG17373@mtj.dyndns.org> <20140317222107.GH17373@mtj.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp09.au.ibm.com ([202.81.31.142]:60087 "EHLO
	e23smtp09.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751038AbaCRAHi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 17 Mar 2014 20:07:38 -0400
Received: from /spool/local
	by e23smtp09.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <stewart@linux.vnet.ibm.com>;
	Tue, 18 Mar 2014 10:07:36 +1000
In-Reply-To: <20140317222107.GH17373@mtj.dyndns.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>, Greg KH <greg@kroah.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Tejun Heo <tj@kernel.org> writes:
> On Mon, Mar 17, 2014 at 06:05:54PM -0400, Tejun Heo wrote:
>> I think this is being blown out of proportion.  It was a rarely used
>> API and converting to the new one is mostly trivial which can be
>
> So, looked at the failed code.  The only necessary change seems to be
> calling device_remove_file_self() in dump_ack_store() and then doing
> kobject_put() directly afterwards, which would have been completely
> fine as a merge fix patch.

I had a quick look too and this seems correct (at least if my reading on
howto use sysfs APIs is correct).

I'm happy to post a patch somewhere - I guess it's easiest if the
removal waits for one linus merge things cycle and then I can get fix
and removal in? I'm not too fussed.

> Just to be clear, I'm not necessarily against reverting the removal of
> the API.  The removal was based on the speculation that this isn't
> likely to cause trouble.  The speculation was perfectly reasonable but
> being a speculation it failed, so we take actions to remedy that and
> we *do* want to do things that way.  Reverting the removal can sure be
> one choice but the way that choice is being made here seems completely
> wrong to me.  There's no technical evaluation whatsoever.  I'd really
> hate to work in an environment where taking active trade off is
> discouraged replaced with blind policy enforcement.

I use an API and it changes/disappears - it's a gift I have :)
