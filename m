From: Paul Moore <pmoore@redhat.com>
Subject: Re: linux-next: Tree for Jan 20 -- Kernel panic - Unable to mount root fs
Date: Tue, 20 Jan 2015 12:39:08 -0500
Message-ID: <4237741.ePaG0Gba6D@sifl>
References: <20150120185308.53f4af4e@canb.auug.org.au> <20150120165655.GA10904@kria>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150120165655.GA10904@kria>
Sender: linux-kernel-owner@vger.kernel.org
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-audit@redhat.com, viro@zeniv.linux.org.uk, Richard Guy Briggs <rgb@redhat.com>
List-Id: linux-next.vger.kernel.org

On Tuesday, January 20, 2015 05:56:55 PM Sabrina Dubroca wrote:
> Hello,
> 
> Today's linux-next doesn't boot on my qemu VM:

...
 
> I bisected it down to:
> 
> 5dc5218840e1  fs: create proper filename objects using getname_kernel()
> 
> I reverted then reapplied each part of that patch.  It works if I
> leave out the hunk for do_path_lookup:
> 
> diff --git a/fs/namei.c b/fs/namei.c
> index eeb3b83661f8..c3d21b79090e 100644
> --- a/fs/namei.c
> +++ b/fs/namei.c
> @@ -2001,9 +2001,15 @@ static int filename_lookup(int dfd, struct filename
> *name, static int do_path_lookup(int dfd, const char *name,
>  				unsigned int flags, struct nameidata *nd)
>  {
> -	struct filename filename = { .name = name };
> +	int retval;
> +	struct filename *filename;
> 
> -	return filename_lookup(dfd, &filename, flags, nd);
> +	filename = getname_kernel(name);
> +	if (unlikely(IS_ERR(filename)))
> +		return PTR_ERR(filename);
> +	retval = filename_lookup(dfd, filename, flags, nd);
> +	putname(filename);
> +	return retval;
>  }
> 
> I don't know what other info you may need.
> Full dmesg for the failed boot included below.

Thanks for testing this and reporting the problem, especially such a small 
bisection.  Unfortunately nothing is immediately obvious to me, would you mind 
sharing your kernel config so I can try to reproduce and debug the problem?

-Paul

-- 
paul moore
security @ redhat
