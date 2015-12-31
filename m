From: Petko Manolov <petkan@mip-labs.com>
Subject: Re: linux-next: manual merge of the security tree with the vfs tree
Date: Thu, 31 Dec 2015 12:45:35 +0200
Message-ID: <20151231104535.GA5555@localhost>
References: <20151231152453.08cfae79@canb.auug.org.au>
 <20151231043019.GD9938@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151231043019.GD9938@ZenIV.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

On 15-12-31 04:30:19, Al Viro wrote:
> On Thu, Dec 31, 2015 at 03:24:53PM +1100, Stephen Rothwell wrote:
> > Hi James,
> > 
> > Today's linux-next merge of the security tree got a conflict in:
> > 
> >   security/integrity/ima/ima_fs.c
> > 
> > between commit:
> > 
> >   3bc8f29b149e ("new helper: memdup_user_nul()")
> > 
> > from the vfs tree and commit:
> > 
> >   38d859f991f3 ("IMA: policy can now be updated multiple times")
> > 
> > from the security tree.
> > 
> > I fixed it up (hopefully, see below) and can carry the fix as necessary
> > (no action is required).
>  
> > + 	res = mutex_lock_interruptible(&ima_write_mutex);
> > + 	if (res)
> > + 		return res;
> >   
> >   	if (datalen >= PAGE_SIZE)
> >   		datalen = PAGE_SIZE - 1;
> >   
> >   	/* No partial writes. */
> > + 	result = -EINVAL;
> >   	if (*ppos != 0)
> > - 		return -EINVAL;
> > + 		goto out;
> >   
> >  -	result = -ENOMEM;
> >  -	data = kmalloc(datalen + 1, GFP_KERNEL);
> >  -	if (!data)
> >  -		goto out;
> >  -
> >  -	*(data + datalen) = '\0';
> >  -
> >  -	result = -EFAULT;
> >  -	if (copy_from_user(data, buf, datalen))
> >  +	data = memdup_user_nul(buf, datalen);
> > - 	if (IS_ERR(data))
> > - 		return PTR_ERR(data);
> > ++	if (IS_ERR(data)) {
> > ++		result = PTR_ERR(data);
> > + 		goto out;
> > ++	}
> 
> Why do it in this order?  With or without opencoding memdup_user_nul(),
> what's the point of taking the mutex before copying the data from
> userland?  All it achieves is holding it longer, over the area that
> needs no exclusion whatsoever.

I introduced the write mutex when ima_write_policy() stopped being serialized by 
other means.  Come to think about it the semaphore could be taken right before 
copy_from_user() so it is my fault, not Stephen's.

The patch, however, leaves out a bug where free without allocation can occur.  
Look at *ppos evaluation.  Instead of "goto out" it should be "return -EINVAL;".  
This requires the mutex lock to be moved down, though.


cheers,
Petko
