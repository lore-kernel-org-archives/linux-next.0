From: James Morris <jmorris@namei.org>
Subject: Re: [PATCH] block: fix part_pack_uuid() build error
Date: Mon, 25 Feb 2013 13:59:31 +1100 (EST)
Message-ID: <alpine.LRH.2.02.1302251358200.25664@tundra.namei.org>
References: <1361718944.2908.49.camel@falcor1.watson.ibm.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tundra.namei.org ([65.99.196.166]:57907 "EHLO tundra.namei.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759464Ab3BYC7n (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 24 Feb 2013 21:59:43 -0500
In-Reply-To: <1361718944.2908.49.camel@falcor1.watson.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mimi Zohar <zohar@linux.vnet.ibm.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, David Rientjes <rientjes@google.com>, axboe <axboe@kernel.dk>, Dmitry Kasatkin <dmitry.kasatkin@intel.com>, linux-security-module <linux-security-module@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

On Sun, 24 Feb 2013, Mimi Zohar wrote:

> Fix a build error when CONFIG_BLOCK is not enabled, by defining
> a wrapper called blk_part_pack_uuid().  The wrapper returns
> -EINVAL, when CONFIG_BLOCK is not defined.

Please indicate which tree your patches are intended for, also noting 
specific regression details if any (e.g. which commit introduced it).


-- 
James Morris
<jmorris@namei.org>
