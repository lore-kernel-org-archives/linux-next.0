From: Gleb Natapov <gleb@redhat.com>
Subject: Re: S3 sleep no longer works on x86_64 in 2.6.27
Date: Thu, 23 Oct 2008 15:08:36 +0200
Message-ID: <20081023130836.GD14838@redhat.com>
References: <20081023122405.GC14838@redhat.com> <20081023125104.GA9506@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from il.qumranet.com ([212.179.150.194]:25134 "EHLO il.qumranet.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752607AbYJWNIj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Oct 2008 09:08:39 -0400
Content-Disposition: inline
In-Reply-To: <20081023125104.GA9506@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: gcosta@redhat.com, linux-next@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>

> could you check whether the (post-v2.6.27) upstream fix below does the 
> trick for you?
> 
The fix works. Thanks.

--
			Gleb.
