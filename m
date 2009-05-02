From: Christoph Hellwig <hch@infradead.org>
Subject: Re: linux-next: Tree for May 1 (devtmpfs)
Date: Sat, 2 May 2009 03:01:44 -0400
Message-ID: <20090502070144.GA19849@infradead.org>
References: <20090501163405.973f9088.sfr@canb.auug.org.au> <49FB1521.5050500@oracle.com> <20090501165551.GA1889@puku.stupidest.org> <20090501225616.GA18064@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753939AbZEBHCE@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090501225616.GA18064@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Chris Wedgwood <cw@f00f.org>, Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Kay Sievers <kay.sievers@vrfy.org>
List-Id: linux-next.vger.kernel.org

On Fri, May 01, 2009 at 03:56:16PM -0700, Greg KH wrote:
> As we discussed on irc, I think you no longer object to this, and see
> how it solves a real problem, and can probably help out your initramfs
> tools.

I defintively objet to the implementation, I'm in the process of writing
up the objections.  I must say I'm generally disappointed how fast
controversial stuff ends up in linux-next.  At least your tree
traditionally was quilt series so it can be dropped, unlike some other
people sucking stuff into gigantic git trees that never get rebased :P
