From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: build failure after merge of the vfs tree
Date: Mon, 19 Dec 2011 01:12:48 +0000
Message-ID: <20111219011248.GF2203@ZenIV.linux.org.uk>
References: <20111219120613.2da854bacb6d6686248bb945@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20111219120613.2da854bacb6d6686248bb945@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, Dec 19, 2011 at 12:06:13PM +1100, Stephen Rothwell wrote:

> And many more similar.
> 
> Probably caused by commit 3073cb2e813c ("trim security.h") which
> presumably removed an include file that was including err.h :-(
> 
> I have used the vfs tree from next-20111216 for today.

Fixed and pushed...
