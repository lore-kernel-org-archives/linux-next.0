From: Chris Wedgwood <cw@f00f.org>
Subject: Re: linux-next: Tree for May 1 (devtmpfs)
Date: Fri, 1 May 2009 09:55:52 -0700
Message-ID: <20090501165551.GA1889@puku.stupidest.org>
References: <20090501163405.973f9088.sfr@canb.auug.org.au> <49FB1521.5050500@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1761318AbZEAQ4F@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <49FB1521.5050500@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Kay Sievers <kay.sievers@vrfy.org>
List-Id: linux-next.vger.kernel.org

On Fri, May 01, 2009 at 08:28:33AM -0700, Randy Dunlap wrote:

> drivers/base/devtmpfs.c:41: error: implicit declaration of function 'vfs_mkdir'
> drivers/base/devtmpfs.c:46: error: dereferencing pointer to incomplete type

[...]

Why is devtmpfs in linux-next?  My read of the thread so far seems to
indicate there is considerable uncertainty that this is necessary or
desirable.

Without going into the meris of devtmpfs, I think if nothing else it's
still too early to make a decision on whether to merge this or not.
