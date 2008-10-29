From: Mark Fasheh <mfasheh-IBi9RG/b67k@public.gmane.org>
Subject: Re: linux-next: Tree for October 28
Date: Wed, 29 Oct 2008 14:39:02 -0700
Message-ID: <20081029213902.GF15154@wotan.suse.de>
References: <20081028183055.fbcf5420.sfr@canb.auug.org.au> <20081028220741.f5d331ba.akpm@linux-foundation.org>
Reply-To: Mark Fasheh <mfasheh-IBi9RG/b67k@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20081028220741.f5d331ba.akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-ia64-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joel Becker <Joel.Becker-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Tue, Oct 28, 2008 at 10:07:41PM -0700, Andrew Morton wrote:
> plus of course enough compile warnings to start a small war.   ocfs2 is
> prominent.
> 
> fs/ocfs2/xattr.c: In function `ocfs2_xattr_index_block_find':
> fs/ocfs2/xattr.c:2338: warning: long long unsigned int format, u64 arg (arg 7)
> fs/ocfs2/xattr.c:2338: warning: long long unsigned int format, u64 arg (arg 7)
> fs/ocfs2/xattr.c:2338: warning: long long unsigned int format, u64 arg (arg 7)

Thanks for pointing these out Andrew. They slipped by me. I'll get them
fixed up before the conflict escalates  ;)
	--Mark

--
Mark Fasheh
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
