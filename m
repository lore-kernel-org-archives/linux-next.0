From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [BUG, linux-next] spawn PID 1 without CLONE_FS, wireless inop
Date: Tue, 16 Dec 2014 14:25:42 +0000
Message-ID: <20141216142542.GC22149@ZenIV.linux.org.uk>
References: <20141216115537.GA1259@hudson.localdomain>
 <20141216125615.GZ22149@ZenIV.linux.org.uk>
 <20141216132821.GA22149@ZenIV.linux.org.uk>
 <20141216140952.GA1224@hudson.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20141216140952.GA1224@hudson.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeremiah Mahler <jmmahler@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, Dec 16, 2014 at 06:09:52AM -0800, Jeremiah Mahler wrote:
> >  		ramdisk_execute_command = NULL;
> >  		prepare_namespace();
> > +		{
> > +		/* HACK */
> > +			struct path old, new;
> > +			get_fs_root(current->fs, &new);
> > +			get_fs_root(&init_fs, &old);
> > +			chroot_fs_refs(&old, &new);
> > +			path_put(&old);
> > +			path_put(&new);
> > +		}
> >  	}
> >  
> >  	/*
> 
> I tested the bad commit with your patch applied but it made no
> difference, the wireless is still down.

Interesting...  What happens if you move that added piece (i.e. call of
chroot_fs_refs()) just after that if, instead of the end of the body of
the if?

> Not sure if it helps, but the dmesg is included below.  There are errors
> about not being able to load the firmware that look interesting.

Errors about not being able to load the firmware clearly indicate that we
have an attempt to load it (from a kernel thread of some sort, e.g.
workqueue worker) getting failing with ENOENT.  So we have init_fs stuck
behind, presumably still on initramfs under the overmounting rootfs.
