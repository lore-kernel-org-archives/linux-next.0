From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 15/17] libata: update gfp/slab.h includes
Date: Tue, 30 Mar 2010 09:19:03 +0900
Message-ID: <4BB14377.5040607@kernel.org>
References: <1269885165-18617-1-git-send-email-tj@kernel.org> <1269885165-18617-16-git-send-email-tj@kernel.org> <4BB10A21.9080602@pobox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:34318 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752742Ab0C3ATe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Mar 2010 20:19:34 -0400
In-Reply-To: <4BB10A21.9080602@pobox.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jeff Garzik <jgarzik@pobox.com>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 03/30/2010 05:14 AM, Jeff Garzik wrote:
> On 03/29/2010 01:52 PM, Tejun Heo wrote:
>> Implicit slab.h inclusion via percpu.h is about to go away.  Make sure
>> gfp.h or slab.h is included as necessary.
> 
> Unless you object, I'll go ahead and apply this to #upstream...

Yes, please.

Thank you.

-- 
tejun
