From: Mimi Zohar <zohar@linux.vnet.ibm.com>
Subject: Re: [PATCH] ima: fix part_pack_uuid() build error
Date: Sun, 24 Feb 2013 10:15:06 -0500
Message-ID: <1361718906.2908.48.camel@falcor1.watson.ibm.com>
References: <1361562413.2908.22.camel@falcor1.watson.ibm.com>
	 <5127E111.6030605@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <5127E111.6030605@infradead.org>
Sender: linux-security-module-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: David Rientjes <rientjes@google.com>, James Morris <jmorris@namei.org>, linux-security-module <linux-security-module@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, Dmitry Kasatkin <dmitry.kasatkin@intel.com>, axboe <axboe@kernel.dk>
List-Id: linux-next.vger.kernel.org

On Fri, 2013-02-22 at 13:20 -0800, Randy Dunlap wrote:
> On 02/22/13 11:46, Mimi Zohar wrote:
> > Fix a build error when CONFIG_BLOCK is not enabled by defining
> > a wrapper called ima_part_pack_uuid().  The wrapper returns
> > -EINVAL, when CONFIG_BLOCK is not defined.
> 
> Some function wrapper for the case of BLOCK not enabled should be handled
> where the function is defined, not where it is called.
> That's how it is usually done in Linux.

Ok, I've renamed the wrapper from ima_part_pack_uuid() to
blk_part_pack_uuid() and moved it to linux/genhd.h

thanks,

Mimi





