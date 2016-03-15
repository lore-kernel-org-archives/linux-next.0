From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: manual merge of the aio tree with the vfs tree
Date: Tue, 15 Mar 2016 05:19:39 +0000
Message-ID: <20160315051939.GG17997@ZenIV.linux.org.uk>
References: <20160315150640.02a4db30@canb.auug.org.au>
 <20160315043448.GE17997@ZenIV.linux.org.uk>
 <20160315050712.GF17997@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160315050712.GF17997@ZenIV.linux.org.uk>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Benjamin LaHaise <bcrl@kvack.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, Mar 15, 2016 at 05:07:12AM +0000, Al Viro wrote:

> There *is* a reason for code review.  Or, at least, asking somebody familiar
> with the code you are working with whether some assumption you are making
> is true or false.  Me, for example, in our conversation regarding earlier parts
> of aio.git queue about a week ago.  Or at any other point.

While we are at it, 150a0b49 ("aio: add support for async openat()") is also
crap.  fs_struct and files_struct is nowhere near enough.  And yes, I realize
that your application probably doesn't step into it.  Which means that these
patches are just fine for your private kernel.  _Not_ for mainline.

Reviewed-and-NAKed-by: Al Viro <viro@zeniv.linux.org.uk>
