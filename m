From: David Rientjes <rientjes@google.com>
Subject: Re: [PATCH] block: fix part_pack_uuid() build error
Date: Sun, 24 Feb 2013 10:29:19 -0800 (PST)
Message-ID: <alpine.DEB.2.02.1302241029050.19612@chino.kir.corp.google.com>
References: <1361718944.2908.49.camel@falcor1.watson.ibm.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <1361718944.2908.49.camel@falcor1.watson.ibm.com>
Sender: linux-security-module-owner@vger.kernel.org
To: Mimi Zohar <zohar@linux.vnet.ibm.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, James Morris <jmorris@namei.org>, axboe <axboe@kernel.dk>, Dmitry Kasatkin <dmitry.kasatkin@intel.com>, linux-security-module <linux-security-module@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Sun, 24 Feb 2013, Mimi Zohar wrote:

> Fix a build error when CONFIG_BLOCK is not enabled, by defining
> a wrapper called blk_part_pack_uuid().  The wrapper returns
> -EINVAL, when CONFIG_BLOCK is not defined.
> 
> security/integrity/ima/ima_policy.c:538:4: error: implicit declaration
> of function 'part_pack_uuid' [-Werror=implicit-function-declaration]
> 
> Changleog v1:
> - rename ima_part_pack_uuid() to blk_part_pack_uuid()
> - resolve scripts/checkpatch.pl warnings
> Changelog v0:
> - fix UUID scripts/Lindent msgs
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: David Rientjes <rientjes@google.com>
> Signed-off-by: Mimi Zohar <zohar@linux.vnet.ibm.com>

Acked-by: David Rientjes <rientjes@google.com>
