From: David Brownell <david-b@pacbell.net>
Subject: Re: linux-next: Tree for December 15 (mfd)
Date: Thu, 18 Dec 2008 03:02:12 -0800
Message-ID: <200812180302.12412.david-b@pacbell.net>
References: <20081216020642.fc1007d9.sfr@canb.auug.org.au> <20081217114300.9476f8da.randy.dunlap@oracle.com> <20081218105700.GC2517@sortiz.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752702AbYLRLCY@vger.kernel.org>
In-Reply-To: <20081218105700.GC2517@sortiz.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Samuel Ortiz <sameo@openedhand.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thursday 18 December 2008, Samuel Ortiz wrote:
> David, are you ok with this fix:
> http://git.o-hand.com/cgit.cgi/linux-mfd/commit/?h=for-next&id=1e6b6a411fd4f6f99e4d9f003946823007e3c34f

I'd rather remove that "if (can't happen) { pr_err, return }"
code myself ... otherwise, sure.

- Dave
