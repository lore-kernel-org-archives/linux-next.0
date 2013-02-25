From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] block: fix part_pack_uuid() build error
Date: Mon, 25 Feb 2013 15:18:27 -0800
Message-ID: <20130225151827.36ecb447.akpm@linux-foundation.org>
References: <1361718944.2908.49.camel@falcor1.watson.ibm.com>
	<20130225151638.bd40807c.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <20130225151638.bd40807c.akpm@linux-foundation.org>
Sender: linux-security-module-owner@vger.kernel.org
To: Mimi Zohar <zohar@linux.vnet.ibm.com>, Randy Dunlap <rdunlap@infradead.org>, David Rientjes <rientjes@google.com>, James Morris <jmorris@namei.org>, axboe <axboe@kernel.dk>, Dmitry Kasatkin <dmitry.kasatkin@intel.com>, linux-security-module <linux-security-module@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, 25 Feb 2013 15:16:38 -0800
Andrew Morton <akpm@linux-foundation.org> wrote:

> On Sun, 24 Feb 2013 10:15:44 -0500
> Mimi Zohar <zohar@linux.vnet.ibm.com> wrote:
> 
> > Fix a build error when CONFIG_BLOCK is not enabled, by defining
> > a wrapper called blk_part_pack_uuid().  The wrapper returns
> > -EINVAL, when CONFIG_BLOCK is not defined.
> > 
> > security/integrity/ima/ima_policy.c:538:4: error: implicit declaration
> > of function 'part_pack_uuid' [-Werror=implicit-function-declaration]
> > 
> > ...
> >
> > diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/ima_policy.c
> > index b27535a..399433a 100644
> > --- a/security/integrity/ima/ima_policy.c
> > +++ b/security/integrity/ima/ima_policy.c
> >  			ima_log_string(ab, "fsuuid", args[0].from);
> >  
> >  			if (memchr_inv(entry->fsuuid, 0x00,
> > -			    sizeof(entry->fsuuid))) {
> > +				       sizeof(entry->fsuuid))) {
> >  				result = -EINVAL;
> >  				break;
> >  			}
> >  
> > -			part_pack_uuid(args[0].from, entry->fsuuid);
> > -			entry->flags |= IMA_FSUUID;
> > -			result = 0;
> > +			result = blk_part_pack_uuid(args[0].from,
> > +						    entry->fsuuid);
> > +			if (!result)
> > +				entry->flags |= IMA_FSUUID;
> 
> This will cause ima_parse_rule() to newly return -EINVAL if the fsuuid=
> option is used when CONFIG_BLOCK=n.
> 
> This functional change was not changelogged, forcing me to ask: was it
> deliberate or was it accidental?
> 
> And it is a non-back-compatible change, introducing some potential to
> break existing userspace code.  Is the risk considered acceptable?  If
> so, why?

ah, I see that the fsuuid stuff is new in 3.9, so there are no issues.
