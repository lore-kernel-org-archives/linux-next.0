From: "Theodore Y. Ts'o" <tytso@mit.edu>
Subject: Re: linux-next: build warnings from Linus' tree
Date: Sun, 19 Aug 2018 20:02:18 -0400
Message-ID: <20180820000218.GE19200@thunk.org>
References: <20180820081323.23a47af3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180820081323.23a47af3@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Aug 20, 2018 at 08:13:23AM +1000, Stephen Rothwell wrote:
> fs/ext4/super.c: In function '__save_error_info':
> fs/ext4/super.c:344:2: warning: 'strncpy' specified bound 32 equals destination size [-Wstringop-truncation]
>   strncpy(es->s_last_error_func, func, sizeof(es->s_last_error_func));
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> fs/ext4/super.c:349:3: warning: 'strncpy' specified bound 32 equals destination size [-Wstringop-truncation]
>    strncpy(es->s_first_error_func, func,
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     sizeof(es->s_first_error_func));
>     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

All of ext4 superblock char[] fields are not necessarily null
terminated, so this is a false positive.  I suppose we could do
something like this:

inline char *
strncpy_I_solemnly_swear_I_know_what_I_am_doing(char *dest,
			const char *src, size_t n)
{
#if __GNUC_PREREQ (8, 2)
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wstringop-truncate"
#endif
	return strncpy(dest, src, n);
#if __GNUC_PREREQ (8, 2)
#pragma GCC diagnostic pop
#endif
}

(if we really think this warning is worthwhile enough that we don't
just want to globally disable it, of course)

       		      	       - Ted

P.S.  It's really, really too bad there isn't a simpler way to shut up
gcc.  You need the #ifdef __GNUC_PREREQ nonsense because otherwise
older versions of gcc that don't understand the particular warning
you're trying to suppress will complain loudly.  (Ask me how I
know....)
